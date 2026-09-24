local theme_color = "rgba(2E6F40ff)"
local highlight_color = "rgba(429E5Cff)"
local theme_color_dimmed = "rgba(162022ff)"

hl.config({
	general = {
		border_size = 4,
		col = {
			active_border = { colors = { highlight_color, theme_color }, angle = 45 },
			inactive_border = theme_color_dimmed,
		},
	},

	decoration = {
		rounding = 2,
		rounding_power = 5,
	},
})
