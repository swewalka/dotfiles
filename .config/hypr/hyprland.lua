-- Keep this entrypoint as a regular .lua file. Hyprland resolves entrypoint
-- symlinks before choosing its parser, so a yadm target ending in ##default
-- would otherwise be mistaken for a legacy Hyprlang file.
local configHome = os.getenv("XDG_CONFIG_HOME") or (os.getenv("HOME") .. "/.config")
dofile(configHome .. "/hypr/hyprland.lua##default")
