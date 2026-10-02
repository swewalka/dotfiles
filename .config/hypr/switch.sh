#!/usr/bin/env bash

if grep open /proc/acpi/button/lid/LID0/state; then
    hyprctl eval 'hl.monitor({ output = "eDP-1", mode = "highres", position = "0x0", scale = 1 })'
else
    if [[ $(hyprctl monitors | grep -c '^Monitor') != 1 ]]; then
        hyprctl eval 'hl.monitor({ output = "eDP-1", disabled = true })'
    fi
fi
