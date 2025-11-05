local wezterm = require("wezterm")

return {
	color_scheme = "GitHub Dark (Gogh)",
	font = wezterm.font_with_fallback({
		"JetBrainsMono Nerd Font",
		"SF Mono",
	}),
	font_size = 17.0,
	line_height = 1.1,
	harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
	front_end = "WebGpu",
	macos_window_background_blur = 10,
	enable_tab_bar = true,
	adjust_window_size_when_changing_font_size = false,
}
