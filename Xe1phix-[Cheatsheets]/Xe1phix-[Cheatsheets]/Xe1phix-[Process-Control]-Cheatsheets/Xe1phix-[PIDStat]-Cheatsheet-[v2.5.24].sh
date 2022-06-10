#!/bin/sh


## -------------------------------------------------------------------- ##
      pidstat -r              ## Report page faults
## -------------------------------------------------------------------- ##
      pidstat -s              ## Stack utilization
## -------------------------------------------------------------------- ##
      pidstat -d              ## Report  I/O statistics
## -------------------------------------------------------------------- ##
      pidstat -p $PID         ## Resource consumption details
## -------------------------------------------------------------------- ##
      pidstat -p ALL          ## Resource consumption of all processes
## -------------------------------------------------------------------- ##
      pidstat -u              ## Report CPU utilization
## -------------------------------------------------------------------- ##
      pidstat -l              ## Display the process command
## -------------------------------------------------------------------- ##


##-==========================================================-##
##  [+] Display global page faults and memory statistics
##      for processes firefox & chrome
##-==========================================================-##
pidstat -C "firefox|chrome" -r -p ALL

