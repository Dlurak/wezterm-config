local wezterm = require "wezterm"

local config = require "config/init"
local status_modules = require "../utils/modules"

local module = {}

local function on_right_status(window)
	local parts = {}

	for _, mod in ipairs(config.status_modules) do
		local fn = status_modules[mod]
		local str = fn()
		if str == "" then goto continue end
		table.insert(parts, str .. "  ")

	    ::continue::
	end

    local text = table.concat(parts)

    window:set_right_status(wezterm.format {{Text = text}})
end

module.on_right_status = on_right_status

return module
