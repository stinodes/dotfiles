local theme_color = "rgba(CD1C18ff)"
local theme_color_dimmed = "rgba(162022ff)"

hl.config({
	general = {
		border_size = 2,
		col = {
			active_border = { colors = { theme_color, theme_color_dimmed, theme_color }, angle = 45 },
			inactive_border = theme_color_dimmed,
		},
	},
})
