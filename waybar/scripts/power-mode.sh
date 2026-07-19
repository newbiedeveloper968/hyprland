#!/bin/bash

current=$(powerprofilesctl get)

case "$1" in
    toggle)
        if [ "$current" = "power-saver" ]; then
            powerprofilesctl set performance
        elif [ "$current" = "performance" ]; then
            powerprofilesctl set balanced
        else
            powerprofilesctl set power-saver
        fi
        ;;
    cycle)
        if [ "$current" = "balanced" ]; then
            powerprofilesctl set performance
        elif [ "$current" = "performance" ]; then
            powerprofilesctl set power-saver
        else
            powerprofilesctl set balanced
        fi
        ;;
esac

case "$current" in
    performance) echo "Performance" ;;
    balanced) echo "Balanced" ;;
    power-saver) echo "Eco" ;;
    *) echo "$current" ;;
esac
