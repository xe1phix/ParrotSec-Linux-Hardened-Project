#!/bin/sh
##-=========================================-##
## [+] Xe1phix-[Exiftool]-Get-[EXIF]-Data-From-[Image]-Using-[Zenity]-[v2.4.58].sh
##-=========================================-##
## ------------------------------------------------------------------ ##
##  [?] Get EXIF data from image with zenity
## ------------------------------------------------------------------ ##
ans=$(zenity --title "Choose image:" --file-selection); exiftool -s ${ans} | zenity --width 800 --height 600 --text-info;
