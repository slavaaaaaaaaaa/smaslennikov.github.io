#!/bin/bash
while true; do
    DWM_RENEW_INT=3
	# Keyboard layout
	if [ "`xset -q | awk -F \" \" '/Group 2/ {print($4)}'`" = "on" ]; then
			  DWM_LAYOUT="ru";
	else
			  DWM_LAYOUT="en";
	fi;

	# Volume Level
	DWM_VOL=$( amixer -c0 sget Master | awk -vORS=' ' '/Mono:/ {print($6$4)}' );

	# Date and Time
	DWM_CLOCK=$( date '+%e %b %Y %a | %k:%M' );

    uptime=$( uptime -p );
    kernel=$( uname -r );
    cpuusage=$( grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}' );

	# Overall output command
	DWM_STATUS="$cpuusage | $kernel | $uptime | Lang: [$DWM_LAYOUT] | Vol: $DWM_VOL | $DWM_CLOCK";
	xsetroot -name "$DWM_STATUS";
	sleep $DWM_RENEW_INT;
done &
