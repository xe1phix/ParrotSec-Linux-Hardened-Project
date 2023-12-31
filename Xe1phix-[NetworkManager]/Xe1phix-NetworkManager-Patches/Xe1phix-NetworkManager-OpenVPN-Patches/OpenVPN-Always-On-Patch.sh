#!/usr/bin/sh
## ---------------------------------------- ##
## This patch wasnt written by Xe1phix.
## Source - Unknown.
## ---------------------------------------- ##

set -euo pipefail

source "${BASH_SOURCE[0]}.conf"

function write_log() {
    echo "$(basename "${0}"): ${@}" >&2
}

function list_connections() {

    function f() {
        nmcli -t -c no -f name,state,device c
    }

    [ -n "${LIST_CONNECTIONS:-}" ] || LIST_CONNECTIONS="$(f "${@}")"

    echo "${LIST_CONNECTIONS}"
}

function list_devices() {

    function f() {
        nmcli -t -c no -f device,state d
    }

    [ -n "${LIST_DEVICES:-}" ] || LIST_DEVICES="$(f "${@}")"

    echo "${LIST_DEVICES}"
}

function is_selectable_connection() {
    for SELECTABLE_CONNECTION in "${SELECTABLE_CONNECTIONS[@]}"
    do
        [ "${1}" == "${SELECTABLE_CONNECTION}" ] && return 0
    done
    
    return 1
}

function selected_connection() {

    function f() {
        if [ -e "${CONNECTION_FILE}" ]
        then
            cat "${CONNECTION_FILE}"
        else
            echo "${SELECTABLE_CONNECTIONS[0]}"
        fi
    }

    [ -n "${SELECTED_CONNECTION:-}" ] || SELECTED_CONNECTION="$(f "${@}")"

    echo "${SELECTED_CONNECTION}"
}

function unselected_connections() {
    for SELECTABLE_CONNECTION in "${SELECTABLE_CONNECTIONS[@]}"
    do
        if [ "${SELECTABLE_CONNECTION}" != "$(selected_connection)" ]
        then
            echo "${SELECTABLE_CONNECTION}"
        fi
    done
}

function select_connection() {
    [ ! "$(selected_connection)" == "${1}" ] || return 0
    write_log "Change connection from '$(selected_connection)' to '${1}'"

    SELECTED_CONNECTION="${1}"

    mkdir -p "${RUN_DIR}"
    echo "${SELECTED_CONNECTION}" > "${CONNECTION_FILE}"
}

function lock_connection() {
    [ ! -e "${CONNECTION_LOCK_FILE}" ] || return 0
    mkdir -p "${RUN_DIR}"
    touch "${CONNECTION_LOCK_FILE}"
    write_log "$(selected_connection): Locked"
}

function unlock_connection() {
    [ -e "${CONNECTION_LOCK_FILE}" ] || return 0
    rm "${CONNECTION_LOCK_FILE}"
    write_log "$(selected_connection): Unlocked"
}

function is_connection_locked() {
    [ -e "${CONNECTION_LOCK_FILE}" ]
}

function connected_device() {
    list_connections | grep "^${1}:" | cut -d ':' -f 3
}

function is_preferable_device() {
    for PREFERABLE_DEVICE_PATTERN in "${PREFERABLE_DEVICE_PATTERNS[@]}"
    do
        [[ ${1} =~ ${PREFERABLE_DEVICE_PATTERN} ]] && return 0
    done

    return 1
}

function preferred_device() {

    function f() {
        for PREFERABLE_DEVICE_PATTERN in "${PREFERABLE_DEVICE_PATTERNS[@]}"
        do
            while IFS= read -r DEVICE
            do
                if [[ ${DEVICE} =~ ${PREFERABLE_DEVICE_PATTERN} ]]
                then
                    echo "${DEVICE}"
                    return 0
                fi
            done <<< "$(list_devices | grep ':connected$' | cut -d ':' -f 1)"
        done
    }

    [ -n "${PREFERRED_DEVICE:-}" ] || PREFERRED_DEVICE="$(f "${@}")"

    echo "${PREFERRED_DEVICE}"
}

function connect() {
    write_log "${1}: Connecting on ${2}..."
    nmcli c up id "${1}" ifname "${2}" >&2 &
}

function connect_or_switch_to_preferred_device() {
    if [ -z "$(selected_connection)" ]
    then
        write_log "No selected connection"
        return 0
    fi

    if [ -z "$(preferred_device)" ]
    then
        write_log "No preferred device"
        return 0
    fi

    if [ -z "$(connected_device "$(selected_connection)")" ]
    then
        connect "$(selected_connection)" "$(preferred_device)"
    elif [ "$(connected_device "$(selected_connection)")" != "$(preferred_device)" ]
    then
        write_log "Switching from $(connected_device "$(selected_connection)") to $(preferred_device)..."
        lock_connection
        disconnect "$(selected_connection)"
    else
        write_log "OK"
    fi
}

function disconnect() {
    write_log "${1}: Disconnecting..."
    nmcli c down id "${1}" >&2 &
}

function disconnect_unselected_connections() {
    list_connections | while read LINE
    do
        unselected_connections | while read UNSELECTED_CONNECTION
        do
            if [[ ${LINE} =~ ^${UNSELECTED_CONNECTION}:activated: ]]
            then
                disconnect "${UNSELECTED_CONNECTION}"
            fi
        done
    done
}

STATUS="${2}"

case "${STATUS}" in
    up)
        if is_preferable_device "${DEVICE_IFACE}"
        then
            connect_or_switch_to_preferred_device
        fi
        ;;
    vpn-down)
        if is_selectable_connection "${CONNECTION_ID}"
        then
            write_log "${CONNECTION_ID}: Disconnected"
            
            if [ "${CONNECTION_ID}" == "$(selected_connection)" ]
            then
                connect_or_switch_to_preferred_device
            fi
        fi
        ;;
    vpn-pre-down)
        if [ "${CONNECTION_ID}" == "$(selected_connection)" ] &&
            ! is_connection_locked
        then
            write_log "${CONNECTION_ID}: Disconnecting on purpose..."
            select_connection ""
        fi
        ;;
    vpn-up)
        if is_selectable_connection "${CONNECTION_ID}"
        then
            write_log "${CONNECTION_ID}: Connected on $(connected_device "${CONNECTION_ID}")"
            unlock_connection
            select_connection "${CONNECTION_ID}"
            connect_or_switch_to_preferred_device
            disconnect_unselected_connections
        fi
        ;;
esac
