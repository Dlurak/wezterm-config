local wezterm = require "wezterm"
local nerdfonts = wezterm.nerdfonts

local config = require "config/init"
local status_modules = require "../utils/modules"

local module = {}

local function on_right_status(window)
	local parts = {}
	
	for index, mod in ipairs(config.status_modules) do
		local fn = status_modules[mod]
		table.insert(parts, fn() .. "  ")
	end

    local text = table.concat(parts)

    window:set_right_status(wezterm.format {{Text = text}})
end

module.on_right_status = on_right_status

return module
