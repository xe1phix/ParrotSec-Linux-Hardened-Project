#!/bin/sh
##-=======================================-##
##   [+] Xe1phix-[IOStat]-Cheatsheet.sh
##-=======================================-##


## ---------------------------------------------------------------------------------------------------------------------------- ##
	iostat -d 2				## Display a continuous device report at two second intervals.
## ---------------------------------------------------------------------------------------------------------------------------- ##
	iostat -d 2 6			## Display six reports at two second intervals for all devices.
## ---------------------------------------------------------------------------------------------------------------------------- ##
	iostat -x sda sdb 2 6	## Display six reports of extended statistics at two second intervals for devices sda and sdb.
## ---------------------------------------------------------------------------------------------------------------------------- ##
	iostat -p sda 2 6		## Display six reports at two second intervals for device sda and all its partitions (sda1, etc.)
## ---------------------------------------------------------------------------------------------------------------------------- ##
	iostat -dx 1 5			## Print a detailed report for all devices every second, for 5 times
## ---------------------------------------------------------------------------------------------------------------------------- ##
