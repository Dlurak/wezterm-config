local wezterm = require "wezterm"
local nerdfonts = wezterm.nerdfonts

local utils = require "../utils"
local commands = require "../utils/command"

local names = require "../constants/names"

local module = {}

local name = utils.get_random_item(names.names)

local function on_right_status(window)
    local workspace =
        nerdfonts.linux_hyprland .. " " .. commands.run_command("hyprctl -j activeworkspace | jq -r '.name'")
    local battery = commands.battery_display()
    local date = nerdfonts.fa_clock_o .. " " .. wezterm.strftime "%H:%M:%S"

    local update = tonumber(wezterm.strftime("%M")) % 5 == 0
    local min_begins = tonumber(wezterm.strftime("%S")) == 0
    update = update and min_begins

    if update then
        name = utils.get_random_item(names.names)
    end

    local text = battery .. "  " .. workspace .. "  " .. date .. " "

    if names.use_names then
        text = text .. " " .. name .. " <3 "
    end

    window:set_right_status(wezterm.format {{Text = text}})
end

module.on_right_status = on_right_status

return module
