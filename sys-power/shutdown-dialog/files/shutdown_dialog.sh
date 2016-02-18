#!/bin/sh
# Script verbatim from https://awesome.naquadah.org/wiki/ShutdownDialog
# 
# This work is licensed under the Creative Commons Attribution 3.0 Unported License. 
# To view a copy of this license, visit http://creativecommons.org/licenses/by/3.0/ 
# or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

ACTION=`zenity --width=90 --height=200 --list --radiolist --text="Select logout action" --title="Logout" --column "Choice" --column "Action" TRUE Shutdown FALSE Reboot FALSE LockScreen FALSE Suspend`

if [ -n "${ACTION}" ];then
  case $ACTION in
  Shutdown)
    zenity --question --text "Are you sure you want to halt?" 
    ## Via ConsoleKit
    dbus-send --system --dest=org.freedesktop.ConsoleKit \
    /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop
    ;;
  Reboot)
    zenity --question --text "Are you sure you want to reboot?"
    ## Via ConsoleKit
    dbus-send --system --dest=org.freedesktop.ConsoleKit \
    /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart
    ;;
  Suspend)
    ## Via UPower
    dbus-send --system --print-reply --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Suspend
    ;;
  LockScreen)
    i3lock
    ;;
  esac
fi
