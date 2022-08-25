#!/usr/bin/sh
killall polybar
for m in $(polybar --list-monitors | cut -d":" -f1); do
	echo $m
	MONITOR=$m polybar --config=$XDG_CONFIG_HOME/polybar/config.ini --reload mybar &
done
echo "Bars launched"
