local mainMod = "SUPER"

local function bind_exec(keys, command, flags)
    hl.bind(keys, hl.dsp.exec_cmd(command), flags)
end

-- Apps, launcher, and clipboard.
bind_exec(mainMod .. " + F", "thunar")
bind_exec(mainMod .. " + SHIFT + F", "kitty -e ranger")
bind_exec(mainMod .. " + P", "wofi --show drun")
bind_exec(mainMod .. " + CONTROL + P", "dunstctl context")
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("emote", { float = true }))
bind_exec(mainMod .. " + B", "kitty")
bind_exec(mainMod .. " + A", "cliphist list | wofi --dmenu --allow-images | cliphist decode | wl-copy")
bind_exec(mainMod .. " + SHIFT + A", "cliphist wipe")
bind_exec(mainMod .. " + S", "emacsclient -c -a 'emacs'")
bind_exec(mainMod .. " + SHIFT + S", "killall emacs; emacs --daemon && emacsclient -c -a 'emacs'")
bind_exec(mainMod .. " + G", "vivaldi")
bind_exec(mainMod .. " + SHIFT + G", "thunderbird")
bind_exec(mainMod .. " + K", "dunstctl history-pop")
bind_exec(mainMod .. " + SHIFT + K", "dunstctl close-all")
bind_exec(mainMod .. " + COMMA", "telegram-desktop")
bind_exec(mainMod .. " + SHIFT + COMMA", "killall telegram-desktop")
bind_exec(mainMod .. " + PERIOD", "vesktop")
bind_exec(mainMod .. " + SHIFT + PERIOD", "killall spotify && spotify-launcher")

bind_exec(mainMod .. " + H", "wlogout -b 5")
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.exit())

-- Media and volume controls.
bind_exec(mainMod .. " + X", "playerctl -p spotify previous")
bind_exec(mainMod .. " + CONTROL + X", "playerctl -p spotify position 5-", { repeating = true })
bind_exec(mainMod .. " + SHIFT + X", "playerctl previous")
bind_exec(mainMod .. " + C", "playerctl -p spotify next")
bind_exec(mainMod .. " + CONTROL + C", "playerctl -p spotify position 5+", { repeating = true })
bind_exec(mainMod .. " + SHIFT + C", "playerctl next")
bind_exec(mainMod .. " + D", "playerctl -p spotify play-pause")
bind_exec(mainMod .. " + SHIFT + D", "playerctl play-pause")
bind_exec(mainMod .. " + V", "playerctl -p spotify volume 0.02-", { repeating = true })
bind_exec(mainMod .. " + SHIFT + V", "pamixer -d 2", { repeating = true })
bind_exec(mainMod .. " + Z", "playerctl -p spotify volume 0.02+", { repeating = true })
bind_exec(mainMod .. " + SHIFT + Z", "pamixer -i 2", { repeating = true })
bind_exec(mainMod .. " + SLASH", "pamixer -t")

hl.bind(mainMod .. " + R", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.window.move({ workspace = "special:magic" }))

local directions = {
    M = "left",
    N = "down",
    E = "up",
    I = "right",
}

for key, direction in pairs(directions) do
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = direction }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = direction }))
end

local resize = {
    M = { -25, 0 },
    N = { 0, 25 },
    E = { 0, -25 },
    I = { 25, 0 },
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
hl.bind(mainMod .. " + T", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mainMod .. " + CONTROL + T", hl.dsp.window.fullscreen_state({ internal = 2, client = 0 }))
hl.bind(mainMod .. " + Q", hl.dsp.window.float())

hl.bind(mainMod .. " + J", function()
    hl.config({ general = { layout = "dwindle" } })
end)
hl.bind(mainMod .. " + L", function()
    hl.config({ general = { layout = "master" } })
end)

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.layout("orientationcycle"))
hl.bind(mainMod .. " + U", hl.dsp.layout("cyclenext"))
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.layout("cycleprev"))
hl.bind(mainMod .. " + Y", hl.dsp.layout("swapwithmaster master"))
hl.bind(mainMod .. " + SHIFT + Y", hl.dsp.layout("focusmaster auto"))
hl.bind(mainMod .. " + BRACKETLEFT", hl.dsp.layout("rollnext"))
hl.bind(mainMod .. " + BRACKETRIGHT", hl.dsp.layout("rollprev"))
hl.bind(mainMod .. " + O", hl.dsp.layout("addmaster"))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.layout("removemaster"))
hl.bind(mainMod .. " + SEMICOLON", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + Y", hl.dsp.layout("togglesplit"))

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

bind_exec("PRINT", "grimshot --notify copy screen")
bind_exec("SHIFT + PRINT", "grimshot --notify copy area && grimshot --notify save area")
bind_exec("CONTROL + PRINT", "grimshot --notify save screen")
