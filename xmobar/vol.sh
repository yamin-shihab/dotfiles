#!/usr/bin/sh

# Script for XMobar that prints volume from pulsemixer, colored accordingly using <fc>.I hate shell scripting.

VERY_LOW=50
LOW=75
HIGH=125
VERY_HIGH=150

EXTREME_COLOR="#ff5555"
MUCH_COLOR="#ffb86c" # very doge
MID_COLOR="#50fa7b"

vol=$(pulsemixer --get-vol)
inc=0
for iter in $vol; do
	inc=$((inc+1))
	if [ $iter -lt $VERY_LOW ] || [ $iter -gt $VERY_HIGH ]; then
		printf "<fc=$EXTREME_COLOR>$iter</fc>"
	elif [ $iter -lt $LOW ] || [ $iter -gt $HIGH ]; then
		printf "<fc=$MUCH_COLOR>$iter</fc>"
	else
		printf "<fc=$MID_COLOR>$iter</fc>"
	fi

	if [ $inc -ne $(printf "$vol" | wc -w) ]; then
 		printf " "
	fi
done
