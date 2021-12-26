#!/bin/sh

# author: abdul2926

BARS=( "left" "right" )
CONFIG_PATH="~/.config/polybar/config.ini"

killall -q polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
	for bar in "${BARS[@]}"; do
		echo $bar
		MONITOR=$m polybar --reload $bar --config=$CONFIG_PATH &
	done
done

