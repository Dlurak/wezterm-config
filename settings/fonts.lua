local config = {}
local wezterm = require "wezterm"

config.font_size = 11
config. font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"Symbols Nerd Font",
})

return config
