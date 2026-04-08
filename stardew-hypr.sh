#!/bin/bash

# Disable "disable while typing" for touchpad
hyprctl keyword input:touchpad:disable_while_typing false

# Launch the game (replace with your actual command if needed)
~/'GOG Games'/'Stardew Valley'/game/StardewModdingAPI
# ~/'GOG Games'/'Stardew Valley'/game/'Stardew Valley'

# Restore normal touchpad behavior after exit
hyprctl keyword input:touchpad:disable_while_typing true
