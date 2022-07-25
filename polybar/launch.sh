#!/usr/bin/sh
killall polybar
for m in $(polybar --list-monitors | cut -d":" -f1); do
	echo $m
	MONITOR=$m polybar --reload mybar &
done
echo "Bars launched"
