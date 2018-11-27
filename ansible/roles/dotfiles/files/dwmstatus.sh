#!/bin/bash
while true; do
	DWM_RENEW_INT=3

	# Volume Level
	DWM_VOL=$( amixer -c0 sget Master | awk -vORS=' ' '/Mono:/ {print($6$4)}' );

	# Date and Time
	DWM_CLOCK=$( date '+%e %b %Y %a | %k:%M' );

	uptime=$( uptime -p );
	kernel=$( uname -r );
	cpuusage=$( grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}' );

        cputemp=$(sensors coretemp-isa-0000 | grep Package | awk '{print $4;}')
        nvidiatemp=$(nvidia-smi -q -d temperature | grep "GPU Current" | cut -d':' -f2)

        buttery=$(acpi | cut -d',' -f2,3)

	# Overall output command
	DWM_STATUS="cpu $cputemp | gpu$nvidiatemp | $cpuusage | $uptime | Vol: $DWM_VOL | buttery$buttery | $DWM_CLOCK";
	xsetroot -name "$DWM_STATUS";
	sleep $DWM_RENEW_INT;
done &
