hl.layer_rule({
    name = "layerrule-1",
    match = { namespace = "waybar" },
    blur = true,
    ignore_alpha = 0,
})

hl.layer_rule({
    name = "layerrule-2",
    match = { namespace = "notifications" },
    blur = true,
    ignore_alpha = 0,
})

hl.layer_rule({
    name = "layerrule-3",
    match = { namespace = "logout_dialog" },
    blur = true,
})

hl.window_rule({
    name = "windowrule-1",
    match = { class = "^(wofi)$" },
    stay_focused = true,
    animation = "popin 75%",
})

hl.window_rule({
    name = "windowrule-2",
    match = { class = "^(emote)$" },
    stay_focused = true,
    animation = "popin 95%",
})

hl.window_rule({
    name = "windowrule-3",
    match = { class = "^(polkit-gnome)$" },
    stay_focused = true,
})

hl.window_rule({
    name = "windowrule-4",
    match = { class = "^(Spotify)$" },
    workspace = "4",
})

hl.window_rule({
    name = "windowrule-5",
    match = { class = "^(org.telegram.desktop)$" },
    workspace = "5",
})

hl.window_rule({
    name = "windowrule-6",
    match = { class = "^(vesktop)$" },
    workspace = "5",
})

hl.window_rule({
    name = "windowrule-7",
    match = { class = "^(VirtualBox Manager)$" },
    workspace = "6",
})

hl.window_rule({
    name = "windowrule-8",
    match = { class = "^(xdg-desktop-portal-gtk)$" },
    stay_focused = true,
    size = { "monitor_w * 0.5", "monitor_h * 0.7" },
    animation = "popin 75%",
    center = true,
})

hl.window_rule({
    name = "windowrule-9",
    match = { class = "^(VirtualBoxVM)$" },
    stay_focused = true,
    animation = "popin 75%",
    center = true,
})

hl.window_rule({
    name = "windowrule-10",
    match = { class = "^(VirtualBox)$" },
    stay_focused = true,
    animation = "popin 75%",
    center = true,
})

hl.window_rule({
    name = "windowrule-11",
    match = { class = ".*" },
    suppress_event = "maximize",
})
