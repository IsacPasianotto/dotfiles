#!/bin/bash

# Define the brightness levels
LEVELS=(0 50 100)

# Get the current brightness
CURRENT=$(brightnessctl -d '*::kbd_backlight' g)
TOTAL=$(brightnessctl -d '*::kbd_backlight' m)

# Calculate the current percentage
CURRENT_PERCENTAGE=$((CURRENT * 100 / TOTAL))

# Find the next level
NEXT_LEVEL=0
for i in "${!LEVELS[@]}"; do
    if [ "${LEVELS[i]}" -gt "$CURRENT_PERCENTAGE" ]; then
        NEXT_LEVEL=${LEVELS[i]}
        break
    fi
done

# If we've reached the end, go back to 0
if [ "$NEXT_LEVEL" -eq 0 ]; then
    NEXT_LEVEL=0
fi

# Set the brightness
brightnessctl -q -d '*::kbd_backlight' set "${NEXT_LEVEL}%"
