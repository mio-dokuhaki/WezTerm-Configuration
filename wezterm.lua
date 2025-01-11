require("status")

local wezterm = require("wezterm")

return {
	color_scheme = "SynthwaveAlpha",
	window_background_opacity = 0.85,
	font = wezterm.font("Mononoki Nerd Font Mono", { weight = "Bold", italic = true }),
	font_size = 24.0,
	status_update_interval = 1000,
	enable_scroll_bar = true,
	min_scroll_bar_height = "2cell",
	window_close_confirmation = "NeverPrompt",
	window_background_image = wezterm.home_dir .. "kali-linux.jpg",
	default_cursor_style = "BlinkingBar",
	hide_mouse_cursor_when_typing = true,
	background = {
		{
			source = {
				File = "/Users/mio-dokuhaki/kali-linux.jpg",
			},
			opacity = 0.40,
		},
	},
}
