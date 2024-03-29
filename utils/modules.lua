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
	i3_workspace = function()
		return nerdfonts.linux_i3 .. " " .. commands.run_command("i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name'")
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
	end,
	backlight = function()
		local max_string = lines_from('/sys/class/backlight/intel_backlight/max_brightness')[1]
		local max = tonumber(max_string)

		local brightness_string = lines_from('/sys/class/backlight/intel_backlight/brightness')[1]
		local brightness = tonumber(brightness_string)

		local percent = math.floor(( (brightness / max) * 100 ) + 0.5)

		local icon = nerdfonts.md_lightbulb

		local group = math.floor(percent / 10) * 10

		if group < 100 then icon = nerdfonts["md_lightbulb_on_" .. group] end
		if group == 0 then icon = nerdfonts.md_lightbulb_off end

		return icon .. " " .. percent .. "%"
	end,
	music = function()
		local title = commands.run_command("playerctl metadata title")
		if not title then return "" end

		local is_playing = commands.run_command('playerctl status') == 'Playing'
		local icon = nerdfonts.md_pause
		if is_playing then icon = nerdfonts.md_play end

		return nerdfonts.fa_music .. " " .. icon .. " " .. utils.shorten_string(title, 12)
	end
}

return module
