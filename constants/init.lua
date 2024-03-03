local wezterm = require 'wezterm'
local nerdfonts = wezterm.nerdfonts
local module = {}

module.TRANSPARENT_BG = "rgba(0 0 0 0)" -- tokyo night specific
module.BG = "rgba(26, 27, 38)"

-- The filled in variant of the < symbol
module.SOLID_LEFT_ARROW = nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
module.SOLID_RIGHT_ARROW = nerdfonts.pl_left_hard_divider

return module
