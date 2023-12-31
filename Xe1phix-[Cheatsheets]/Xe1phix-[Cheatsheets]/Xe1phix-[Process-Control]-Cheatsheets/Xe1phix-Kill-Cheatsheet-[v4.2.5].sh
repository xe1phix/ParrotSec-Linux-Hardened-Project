#!/bin/sh

## -------------------------------------------------------------------------------------------------- ##
	killall $Service								## Kill all processes using service
## -------------------------------------------------------------------------------------------------- ##
	kill -9 $PID                             		## Kill PID
## -------------------------------------------------------------------------------------------------- ##
	kill -s SIGHUP $(cat /run/named/named.pid)		## Reload $PID
## -------------------------------------------------------------------------------------------------- ##
	kill -s SIGHUP $PID								## Reload $PID
## -------------------------------------------------------------------------------------------------- ##
	kill -s SIGINT $PID								## Signal Interupt
## -------------------------------------------------------------------------------------------------- ##
	kill -s SIGTERM $PID							## Signal Terminate
## -------------------------------------------------------------------------------------------------- ##
	pkill -U $User									## Kill all process of a user
## -------------------------------------------------------------------------------------------------- ##


## ---------------------------------------------- ##
##  [+] Kill all process of a program
## ---------------------------------------------- ##
kill -9 $(ps aux | grep 'program_name' | awk '{print $2}')

