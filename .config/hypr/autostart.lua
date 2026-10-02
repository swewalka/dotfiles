hl.on("hyprland.start", function()
    -- The HDMI mirror can transfer its temporary workspace to DP-1 during startup.
    hl.dispatch(hl.dsp.focus({ workspace = 1 }))

    local commands = {
        "wl-clipboard-history -t",
        "wl-paste --type text --watch cliphist store",
        "wl-paste --type image --watch cliphist store",
        "xrdb -merge ~/.Xresources",
        "~/.config/hypr/xdg-portal-hyprland",
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
        "hyprpaper",
        "dunst",
        "waybar",
        "blueman-applet",
        "nm-applet",
        "gammastep",
        "swayidle -w",
        "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
        [[gsettings set org.gnome.desktop.interface cursor-theme "Capitaine Cursors (Gruvbox) - White"]],
        [[gsettings set org.gnome.desktop.interface icon-theme "Gruvbox-Plus-Dark"]],
        [[gsettings set org.gnome.desktop.interface gtk-theme "Gruvbox-Dark"]],
        "protonvpn-app",
    }

    for _, command in ipairs(commands) do
        hl.exec_cmd(command)
    end

    hl.exec_cmd("proton-mail", { workspace = "8 silent" })
end)
