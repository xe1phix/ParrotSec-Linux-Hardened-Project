#!/bin/sh
##  modprobe --verbose --force 
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
install ecryptfs
options ecryptfs_verbosity 1                ## Initial verbosity level (0 or 1; defaults to 0, which is Quiet) (int)
options ecryptfs_number_of_users 1			## An estimate of the number of concurrent users of eCryptfs (uint)
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
install overlay
alias fs-overlay
options permit_mounts_in_userns 1       ## Permit mounts in user namespaces (bool)
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
## options metacopy 1
## options check_copy_up			        		## bool
## options ovl_check_copy_up			    	## Warn on copy-up when causing process also has a R/O fd open
## options redirect_max			        			## ushort
## options ovl_redirect_max			    		## Maximum length of absolute redirect xattr value
## options redirect_dir			        				## bool
## options ovl_redirect_dir_def					## Default to on or off for the redirect_dir feature
## options redirect_always_follow				## bool
## options ovl_redirect_always_follow		## Follow redirects even if redirect_dir feature is turned off
## options index											## bool
## options ovl_index_def			        			## Default to on or off for the inodes index feature
## options nfs_export			            			## bool
## options ovl_nfs_export_def			    		## Default to on or off for the NFS export feature
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
## 
## 
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
install nf_conntrack
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
options tstamp									## Enable connection tracking flow timestamping. (bool)
options acct										## Enable connection tracking flow accounting. (bool)
options nf_conntrack_helper			## Enable automatic conntrack helper assignment (default 0) (bool)
options expect_hashsize					## uint
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
## 
## 
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
install nf_conntrack_irc
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
options ports									## port numbers of IRC servers (array of ushort)
options max_dcc_channels			## max number of expected DCC channels per IRC session (uint)
options dcc_timeout						## timeout on for unestablished DCC channels (uint)
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
## 
## 

nf_conntrack_netbios_ns					## NetBIOS name service broadcast connection tracking helper


## ------------------------------------------------------------------------------------------------------------------------------------ ##
install wireguard                               ## WireGuard secure network tunnel
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
## alias net-pf-16-proto-16-family-wireguard
## alias rtnl-link-wireguard
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
install tun                             				## Universal TUN device driver
install tap                             				## Universal TAP device driver
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
macvlan
macvtap
ipvlan
ipvtap
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
iptable_filter
ip_tables
iptable_security
ipt_rpfilter
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
install x_tables                        						## {ip,ip6,arp,eb}_tables backend module
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
install nf_conntrack
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
options tstamp true
options acct true
options nf_conntrack_helper true
options expect_hashsize sha256
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
install nf_tables
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
install bridge
alias rtnl-link-bridge
install br_netfilter                        				## Linux ethernet netfilter firewall bridge
install nf_log_bridge                       			## Netfilter bridge packet logging
## alias nf-logger-7-0
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
install ebtables
install ebtable_filter
install ebt_log                             				## Ebtables: Packet logging to syslog
install ebt_nflog                           				## ebtables NFLOG netfilter logging module
install ebt_pkttype                         			## Ebtables: Link layer packet type match
install ebt_snat
install ebt_dnat
install ebt_vlan                            				## Ebtables: 802.1Q VLAN tag match


nf_flow_table												## Netfilter flow table module


## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
install virtio_blk
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
install pktcdvd
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
install loop
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##




## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
install cdrom
option debug 1
option check_media_type 1
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
ip_set															## core IP set support
ip_set_hash_ip											## hash:ip type of IP sets
ip_set_hash_net											## hash:net type of IP sets
ip_set_hash_ipmark									## hash:ip,mark type of IP sets



## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
tcrypt

## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
kvm
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
##  option vector_hashing 1
##  option enable_vmware_backdoor 0
##  option force_emulation_prefix $Bool
## ------------------------------------------------------------------------------------------------------------------------------------------------ ##
kvm_amd
kvm-intel

## ------------------------------------------------------------------------------------------------------------------------------------------------ ##


## ------------------------------------------------------------------------------------------------------------------------------------------------ ##


## ------------------------------------------------------------------------------------------------------------------------------------------------ ##


## ------------------------------------------------------------------------------------------------------------------------------------------------ ##


## ------------------------------------------------------------------------------------------------------------------------------------------------ ##


## ------------------------------------------------------------------------------------------------------------------------------------------------ ##


## ------------------------------------------------------------------------------------------------------------------------------------------------ ##


## ------------------------------------------------------------------------------------------------------------------------------------------------ ##


## ------------------------------------------------------------------------------------------------------------------------------------------------ ##


## ------------------------------------------------------------------------------------------------------------------------------------------------ ##


## ------------------------------------------------------------------------------------------------------------------------------------------------ ##


## ------------------------------------------------------------------------------------------------------------------------------------------------ ##


## ------------------------------------------------------------------------------------------------------------------------------------------------ ##


## ------------------------------------------------------------------------------------------------------------------------------------------------ ##


## ------------------------------------------------------------------------------------------------------------------------------------------------ ##


## ------------------------------------------------------------------------------------------------------------------------------------------------ ##


