#!/usr/bin/env bash
###############################################################################
#
# yt2mp3
# --------------
# youtube to mp3 from the command line like wut.
#
# @author Isis Agora Lovecruft, 0x2cdb8b35
# @date 22 June 2012
# @version 0.0.3
#______________________________________________________________________________
# Changelog:
###############################################################################

YOUTUBEDL_IS_INSTALLED=$(dpkg -l | awk '/^ii/{print $2}' | grep youtube-dl)
AVCONV_IS_INSTALLED=$(dpkg -l | awk '/^ii/{print $2}' | grep libav-tools)

function usage () {
    echo -e "\033[40m\033[1;32m  Usage: ./yt2mp3 \"<youtube.com/songlink>\" \"</path/to/store/song>\" \033[0m"; echo;
    echo -e "\033[40m\033[0;32m  Download into a temporary file the video from the youtube link and \033[0m"
    echo -e "\033[40m\033[0;32m  extracts the audio to an 128kb/s mp3 with the given name. \033[0m"; echo;
    echo -e "Dependencies: youtube-dl avconv \033[0m"; echo;
}

function dependency_check () {
    MISSING=""
    if [[ "$YOUTUBEDL_IS_INSTALLED" == "" ]]; then
        MISSING+="youtube-dl "
    fi

    if [[ "$AVCONV_IS_INSTALLED" == "" ]]; then
        MISSING+="avconv "
    fi

    if [[ "$MISSING" != "" ]]; then
        echo -e "\033[40m\033[1;32m  Missing dependencies: ${MISSING} \033[0m"
        exit 1
    fi
    unset MISSING
}

## $1: filename of song
function store_song () {
    where=$1
    avconv -i $YOUTUBE_FILE -acodec libmp3lame -ac 2 -ab 128k \
        -vn -y $HOME/music/${where}
}

function cleanup () {
    if test -w $YOUTUBE_FILE ; then
        rm $YOUTUBE_FILE
    fi
}

if [[ "$#" == "0" ]] || [[ "$#" == "1" ]] ; then
    usage
    exit 1
elif [[ "$#" == 2 ]]; then

    dependency_check

    YOUTUBE_URL=$1
    YOUTUBE_FILE=${HOME}/.youtube-dl-${RANDOM}-${RANDOM}.flv
    SONG_FILE=$2

    youtube-dl --output=$YOUTUBE_FILE --format=18 "$YOUTUBE_URL"

    if ! test -r $HOME/music/${SONG_FILE} ; then
        #ffmpeg -i $YTFILE -acodec libmp3lame -ac 2 -ab 128k -vn -y $HOME/music/"$2"
        ## XXX we're supposed to switch to using avconv from libav-tools
        store_song $SONG_FILE
    else
        read -ep"Please choose a different location:  \033[0m" where

        if ! test -r $HOME/music/${where} ; then
            store_song $where
        else
            read -ep"File exists, overwrite? (Y/n)  \033[0m" choice
            case $choice in
                n | N )
                    echo "Exiting..."
                    cleanup
                    exit 0
                    ;;
                * )
                    echo "Overwriting ${where}..."
                    store_song $where
                    ;;
            esac
        fi
    fi

    cleanup
    exit 0

else
    usage
    exit 1
fi
