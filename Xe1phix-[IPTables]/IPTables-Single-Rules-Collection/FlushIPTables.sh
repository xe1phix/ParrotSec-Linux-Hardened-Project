#!/bin/sh
## ------------------ ##
## FlushIPTables.sh
## ------------------ ##


## Flush And Reset IPTables
/sbin/iptables -F
/sbin/iptables -t nat -F
/sbin/iptables -t mangle -F
/sbin/iptables -t nat -X
/sbin/iptables -t mangle -X
/sbin/iptables -Z
/sbin/iptables -X

## Flush All IPv6 Rules:
/sbin/ip6tables -F
/sbin/ip6tables -X
/sbin/ip6tables -t mangle -F
/sbin/ip6tables -t mangle -X


## Policy DROP for all traffic as fallback.
/sbin/iptables -P INPUT DROP
/sbin/iptables -P FORWARD DROP
/sbin/iptables -P OUTPUT DROP

## Drop/reject all IPv6 Traffic:
/sbin/ip6tables -A INPUT -j DROP
/sbin/ip6tables -A OUTPUT -j REJECT
/sbin/ip6tables -A FORWARD -j REJECT