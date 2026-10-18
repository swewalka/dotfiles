return function(machine)
    hl.on("hyprland.start", function()
        -- Some monitor layouts need an explicit initial workspace after startup.
        if machine.startup_workspace then
            hl.dispatch(hl.dsp.focus({ workspace = machine.startup_workspace }))
        end

        local commands = {
            "wl-clipboard-history -t",
            "wl-paste --type text --watch cliphist store",
            "wl-paste --type image --watch cliphist store",
            "xrdb -merge ~/.Xresources",
            "~/.config/hypr/scripts/xdg-portal-hyprland",
            "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
            "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
            "gnome-keyring-daemon --start --components=secrets",
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
end
