# Hyprland configuration

`hyprland.lua` loads the yadm-selected `machine.lua`, applies hardware settings,
then loads the shared modules. It is the actual entrypoint, with no wrapper or
`hyprland.lua##default` indirection.

## Where to edit

- `shared/settings.lua`: input, appearance, layouts, and common environment.
- `shared/animations.lua`: curves and animation rules.
- `shared/windowrules.lua`: window and layer rules.
- `shared/keybinds.lua`: shared QWERTY keybindings. Colemak has been retired.
- `shared/autostart.lua`: common startup commands.
- `machine.lua##h.Ahch-To`: laptop monitors, brightness keys, and lid handling.
- `machine.lua##h.Toydaria`: desktop monitors, workspace placement, NVIDIA
  settings, and the HDMI startup workspace fix.
- `machine.lua##default`: fallback for other hosts, without host-specific hardware
  rules. Missing `brightness` and `lid_switch` options mean disabled; missing
  `startup_workspace` leaves initial workspace selection to Hyprland.
- `hyprpaper.conf##template`: common wallpaper settings and hostname conditions.
- `scripts/`: executable portal startup and laptop lid scripts.

## yadm

Track shared files, scripts, and files with `##` suffixes. `machine.lua` is a
selected symlink; `hyprpaper.conf` is rendered output. These two generated paths
and `backups/` are ignored. Do not edit the generated paths directly.

After changing the wallpaper template or switching machines, run `yadm alt`.
This installation currently has `yadm.auto-alt = false`, so regeneration is
explicit. Hyprpaper uses its own Hyprlang config; it does not read Lua profiles.

Validate from this directory with:

```sh
Hyprland --verify-config
bash -n scripts/lid-switch.sh scripts/xdg-portal-hyprland
```

Backups preserve the previous configuration, host variants, wallpapers, and
symlinks. Existing legacy Hyprlang archives also remain under `backups/`.
