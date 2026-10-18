-- Shared entrypoint; yadm selects the machine.lua profile.
local machine = require("machine")

machine.configure_hardware()
require("shared.settings")
require("shared.animations")
require("shared.windowrules")
require("shared.autostart")(machine)
require("shared.keybinds")(machine)

-- Monitor setup must precede the lid-switch binding.
if machine.lid_switch then
    hl.bind("switch:Lid Switch", hl.dsp.exec_cmd("~/.config/hypr/scripts/lid-switch.sh"), { locked = true })
end
