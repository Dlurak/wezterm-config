local wezterm = require "wezterm"

local config = {max_fps = 60}

config.enable_wayland = false

local utils = require "utils"
local tab_bar = require "settings/tabbar"
local status = require "settings/status"

local cursor_settings = require "settings/cursor"
local color_settings = require "settings/colors"
local key_settings = require "settings/keys"
local launch_settings = require "settings/launch"
local font_settings = require "settings/fonts"

utils.merge_tables(config, color_settings)
utils.merge_tables(config, cursor_settings)
utils.merge_tables(config, key_settings)
utils.merge_tables(config, launch_settings)
utils.merge_tables(config, font_settings)
utils.merge_tables(config, tab_bar.config)

wezterm.on("format-tab-title", tab_bar.on_format_tab_title)

wezterm.on("update-right-status", status.on_right_status)

return config
