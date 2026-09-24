local stntheme = os.getenv("STN_THEME_CURRENT")

mainmonitor = ""
terminal = "ghostty"
fileManager = "nemo"
menu = "walker"
browser = "brave-origin"

require("hyprland.monitors")
require("hyprland.autostart")
require("hyprland.looknfeel")
require("hyprland.animations")
require("hyprland.bindings")
require("hyprland.input")
require("hyprland.workspaces")

local f, err = loadfile(stntheme .. "/hyprland.lua")

if err == nil and f ~= nil then
	f()
end

hl.config({
	general = { layout = "dwindle" },
	misc = {
		disable_hyprland_logo = true,
	},
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})
