#!/bin/bash

# Get current profile
current=$(powerprofilesctl get)

# Cycle through modes on click
if [[ $1 == "click" ]]; then
    case "$current" in
        performance)
            powerprofilesctl set balanced
            ;;
        balanced)
            powerprofilesctl set power-saver
            ;;
        power-saver)
            powerprofilesctl set performance
            ;;
    esac
    current=$(powerprofilesctl get)
fi

# Set icons (optional customization)
case "$current" in
    performance)
        icon="🔥"
        ;;
    balanced)
        icon="🌓"
        ;;
    power-saver)
        icon="⏾"
        ;;
    *)
        icon="❓"
        ;;
esac

echo "{\"text\": \"$icon \", \"tooltip\": \"Power Profile: $current\"}"

