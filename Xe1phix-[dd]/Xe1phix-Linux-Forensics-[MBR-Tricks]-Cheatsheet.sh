#!/bin/sh

## ---------------------------------------------------------------------------------- ##
##     [?] The MBR contains the boot loader and the partition table  (512 bytes)
##     [?] The first 446 are for the boot loader, 
##     [?] Bytes 446 to 512 are for the partition table.
## ---------------------------------------------------------------------------------- ##


## ---------------------------------------------------------------------------------------------------------- ##
    	dd if=/dev/sda of=/mbr_sda.bak bs=512 count=1				## Backup the full MBR
## ---------------------------------------------------------------------------------------------------------- ##
    	dd if=/dev/zero of=/dev/sda bs=512 count=1					## Delete MBR and Partition table
## ---------------------------------------------------------------------------------------------------------- ##
    	dd if=/mbr_sda.bak of=/dev/sda bs=512 count=1				## Restore the full MBR
## ---------------------------------------------------------------------------------------------------------- ##
    	dd if=/mbr_sda.bak of=/dev/sda bs=446 count=1				## Restore only the boot loader
## ---------------------------------------------------------------------------------------------------------- ##
    	dd if=/mbr_sda.bak of=/dev/sda bs=1 count=64 skip=446		## Restore partition table
## ---------------------------------------------------------------------------------------------------------- ##



