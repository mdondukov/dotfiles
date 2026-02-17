local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Theme
config.color_scheme = "GitHub Dark (Gogh)"

-- Font
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	"SF Mono",
})
config.font_size = 18.0
config.line_height = 1.1
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }

-- Rendering
config.front_end = "WebGpu"
config.max_fps = 120
config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"

-- Cursor
config.default_cursor_style = "SteadyBar"

-- Window
config.macos_window_background_blur = 10
config.window_padding = {
	left = 0,
	right = 0,
	top = 8,
	bottom = 0,
}
config.window_decorations = "TITLE|RESIZE"
config.adjust_window_size_when_changing_font_size = false

-- Tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- Misc
config.scrollback_lines = 10000
config.audible_bell = "Disabled"
config.window_close_confirmation = "NeverPrompt"

return config
