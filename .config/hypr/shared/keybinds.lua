return function(options)
    local mainMod = "SUPER"

    local function bind_exec(keys, command, flags)
        hl.bind(keys, hl.dsp.exec_cmd(command), flags)
    end

    -- Apps, launcher, and clipboard.
    bind_exec(mainMod .. " + E", "nautilus")
    bind_exec(mainMod .. " + SHIFT + E", "kitty -e ranger")
    bind_exec(mainMod .. " + R", "wofi --show drun")
    bind_exec(mainMod .. " + CONTROL + R", "dunstctl context")
    bind_exec(mainMod .. " + SHIFT + R", "wofi-emoji")
    bind_exec(mainMod .. " + T", "kitty")
    bind_exec(mainMod .. " + A", "cliphist list | wofi --dmenu --allow-images | cliphist decode | wl-copy")
    bind_exec(mainMod .. " + SHIFT + A", "cliphist wipe")
    bind_exec(mainMod .. " + F", "firefox")
    bind_exec(mainMod .. " + SHIFT + G", "thunderbird")
    bind_exec(mainMod .. " + N", "dunstctl history-pop")
    bind_exec(mainMod .. " + SHIFT + N", "dunstctl close-all")
    bind_exec(mainMod .. " + COMMA", "killall telegram-desktop; telegram-desktop")
    bind_exec(mainMod .. " + SHIFT + COMMA", "killall telegram-desktop")
    bind_exec(mainMod .. " + SHIFT + PERIOD", "killall spotify; spotify-launcher")

    bind_exec(mainMod .. " + M", "wlogout -b 5")
    hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit())

    -- Media and volume controls.
    bind_exec("XF86AudioPrev", "playerctl -p spotify previous")
    bind_exec("CONTROL + XF86AudioPrev", "playerctl -p spotify position 5-", { repeating = true })
    bind_exec("SHIFT + XF86AudioPrev", "playerctl previous")
    bind_exec("XF86AudioNext", "playerctl -p spotify next")
    bind_exec("CONTROL + XF86AudioNext", "playerctl -p spotify position 5+", { repeating = true })
    bind_exec("SHIFT + XF86AudioNext", "playerctl next")
    bind_exec("XF86AudioPlay", "playerctl -p spotify play-pause")
    bind_exec("SHIFT + XF86AudioPlay", "playerctl play-pause")
    bind_exec("SHIFT + XF86AudioLowerVolume", "playerctl -p spotify volume 0.02-", { repeating = true })
    bind_exec("XF86AudioLowerVolume", "pamixer -d 2", { repeating = true })
    bind_exec("SHIFT + XF86AudioRaiseVolume", "playerctl -p spotify volume 0.02+", { repeating = true })
    bind_exec("XF86AudioRaiseVolume", "pamixer -i 2", { repeating = true })
    bind_exec("XF86AudioMute", "pamixer -t")

    if options.brightness then
        bind_exec("XF86MonBrightnessDown", "brightnessctl set 5%-")
        bind_exec("XF86MonBrightnessUp", "brightnessctl set +5%")
    end

    -- Window focus, movement, and resize.
    local directions = {
        H = "left",
        J = "down",
        K = "up",
        L = "right",
    }

    for key, direction in pairs(directions) do
        hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = direction }))
        hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = direction }))
    end

    local resize = {
        H = { -25, 0 },
        J = { 0, 25 },
        K = { 0, -25 },
        L = { 25, 0 },
    }

    for key, delta in pairs(resize) do
        hl.bind(mainMod .. " + CONTROL + " .. key, hl.dsp.window.resize({
            x = delta[1],
            y = delta[2],
            relative = true,
        }), { repeating = true })
    end

    hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
    hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

    hl.bind(mainMod .. " + W", hl.dsp.window.close())
    hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
    hl.bind(mainMod .. " + Q", hl.dsp.window.float())

    hl.bind(mainMod .. " + Y", function()
        hl.config({ general = { layout = "dwindle" } })
    end)
    hl.bind(mainMod .. " + U", function()
        hl.config({ general = { layout = "master" } })
    end)

    -- Master and Dwindle layout messages.
    hl.bind(mainMod .. " + SHIFT + U", hl.dsp.layout("orientationcycle"))
    hl.bind(mainMod .. " + I", hl.dsp.layout("cyclenext"))
    hl.bind(mainMod .. " + SHIFT + I", hl.dsp.layout("cycleprev"))
    hl.bind(mainMod .. " + O", hl.dsp.layout("swapwithmaster master"))
    hl.bind(mainMod .. " + SHIFT + O", hl.dsp.layout("focusmaster auto"))
    hl.bind(mainMod .. " + BRACKETLEFT", hl.dsp.layout("rollnext"))
    hl.bind(mainMod .. " + BRACKETRIGHT", hl.dsp.layout("rollprev"))
    hl.bind(mainMod .. " + SEMICOLON", hl.dsp.layout("addmaster"))
    hl.bind(mainMod .. " + SHIFT + SEMICOLON", hl.dsp.layout("removemaster"))
    hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
    hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit"))

    for workspace = 1, 10 do
        local key = workspace % 10
        hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
        hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
        hl.bind(mainMod .. " + CONTROL + " .. key, hl.dsp.window.move({
            workspace = workspace,
            follow = false,
        }))
    end

    hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
    hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
    hl.bind(mainMod .. " + MINUS", hl.dsp.focus({ workspace = "e-1" }))
    hl.bind(mainMod .. " + EQUAL", hl.dsp.focus({ workspace = "e+1" }))

    bind_exec(mainMod .. " + S", [[bash -lc 'grim -g "$(slurp)" - | wl-copy -t image/png && notify-send "📋 Screenshot copied"']])
    bind_exec(mainMod .. " + SHIFT + S", [[bash -lc 'grim -g "$(slurp)" - | swappy -f -']])
end
