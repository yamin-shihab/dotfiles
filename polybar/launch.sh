#!/usr/bin/sh
killall polybar
for m in $(polybar --list-monitors | cut -d":" -f1); do
	if [ $XDG_CURRENT_DESKTOP = "dwm" ]; then
		wt="dwm"
	else
		wt="xworkspaces"
	fi
	echo $m $wt
	MONITOR=$m WT=$wt polybar --config=$XDG_CONFIG_HOME/polybar/config.ini --reload mybar &
done
echo "Bars launched"
