hl.workspace_rule({
	workspace = "8",
	default_name = "monitor-left",
	monitor = leftmonitor,
	default = true,
	persistent = true,
})
hl.workspace_rule({
	workspace = "9",
	default_name = "monitor-right",
	monitor = rightmonitor,
	default = true,
	persistent = true,
})

local nworkspaces = 5

for i = 1, nworkspaces do
	hl.workspace_rule({
		workspace = "" .. i,
		monitor = mainmonitor,
		default = i == 1,
		persistent = i == 1,
	})
end

hl.workspace_rule({
	workspace = "6",
	default_name = "game",
	monitor = mainmonitor,
	persistent = true,
	no_rounding = true,
	no_border = true,
})

---@param matches string[]
local function multimatch(matches)
	local match = ""
	for _, name in ipairs(matches) do
		match = match .. "(?:" .. name .. ")?"
	end
	return "^" .. match .. "$"
end

--- Messengers
hl.window_rule({
	match = { class = multimatch({ "signal", "discord" }) },
	tag = "+messenger",
})
hl.window_rule({
	match = { tag = "messenger" },
	workspace = "special:magic",
})

--- Games
hl.window_rule({
	match = { class = multimatch({ "steam_app_%d+", "wow.exe", "heroesofthestorm_x64.exe" }) },
	tag = "+game",
})
hl.window_rule({
	match = { tag = "game" },
	workspace = "6",
	immediate = true,
	fullscreen = true,
})

--- Terminal
hl.window_rule({
	match = { class = "^com.mitchellh.ghostty" },
	tag = "+term",
})
hl.window_rule({
	match = { tag = "term" },
	opacity = "0.92 0.8 override",
})

-- misc
hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})
