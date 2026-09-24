local mod = "SUPER"

--- apps
hl.bind(mod .. " + t", hl.dsp.exec_cmd("stn-launch-terminal"))
hl.bind(mod .. " + s", hl.dsp.exec_cmd("stn-launch-tui spotify_player"))
hl.bind(mod .. " + SHIFT + T", hl.dsp.exec_cmd("uwsm-app -- xdg-terminal-exec"))
hl.bind(mod .. " + b", hl.dsp.exec_cmd("uwsm-app -- " .. browser))
hl.bind(mod .. " + e", hl.dsp.exec_cmd("uwsm-app -- " .. fileManager))
hl.bind(mod .. " + space", hl.dsp.exec_cmd("stn-dmenu"))
hl.bind(mod .. " + print", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only --freeze"))

--- window control
hl.bind(mod .. " + q", hl.dsp.window.close())
hl.bind(mod .. " + g", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + f", hl.dsp.window.fullscreen({ action = "toggle" }))

--- focus & window management
hl.bind(mod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + j", hl.dsp.focus({ direction = "d" }))

hl.bind(mod .. " + SHIFT + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + l", hl.dsp.window.move({ direction = "r" }))
hl.bind(mod .. " + SHIFT + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + j", hl.dsp.window.move({ direction = "d" }))

local workspacebinds = {
	"y",
	"u",
	"i",
	"o",
	"p",
	"m",
}

for ws, key in ipairs(workspacebinds) do
	hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = ws }))
	hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ follow = true, workspace = ws }))
end

hl.bind(mod .. " +  CTRL + h", hl.dsp.focus({ workspace = 8 }))
hl.bind(mod .. " + SHIFT + CTRL + h", hl.dsp.window.move({ workspace = 8 }))

hl.bind(mod .. " +  CTRL + l", hl.dsp.focus({ workspace = 9 }))
hl.bind(mod .. " + SHIFT + CTRL + l", hl.dsp.window.move({ workspace = 9 }))

hl.bind(mod .. " + x", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + SHIFT + x", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- misc media controls
-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
