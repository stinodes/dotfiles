---------------------
--- LOOK AND FEEL ---
---------------------

hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 4,
		resize_on_border = false,
		allow_tearing = true,
		layout = "dwindle",
	},
	decoration = {
		rounding = 6,

		rounding_power = 6,

		active_opacity = 1.0,
		inactive_opacity = 0.8,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			size = 2,
			passes = 4,

			vibrancy = 0.1696,
		},
	},
})
