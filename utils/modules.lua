local wezterm = require "wezterm"
local nerdfonts = wezterm.nerdfonts
local commands = require "utils/command"
local utils = require "utils"
local names = require "constants/names"

local last_name = utils.get_random_item(names.names) .. " <3 "

local module = {
	hyprland_workspace = function()
		return nerdfonts.linux_hyprland .. " " .. commands.run_command("hyprctl -j activeworkspace | jq -r '.name'")
	end,
	battery = function()
		return commands.battery_display()
	end,
	time = function()
		return nerdfonts.fa_clock_o .. " " .. wezterm.strftime "%H:%M:%S"
	end,
	name = function()
		local update = tonumber(wezterm.strftime("%M")) % 5 == 0
		local min_begins = tonumber(wezterm.strftime("%S")) == 0
		update = update and min_begins
		if update then
			last_name = utils.get_random_item(names.names) .. " <3"
		end

		return last_name
	end,
	date = function()
		return nerdfonts.md_calendar .. " " .. wezterm.strftime "%a %d %b"
	end
}

return module
