local wezterm = require 'wezterm'

local constants = require '../constants'
local tab_bar = require '../utils/tabbar'
local nerdfonts = wezterm.nerdfonts

local module = {}

local config = {}

config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.tab_max_width = 160
config.tab_bar_style = {
    new_tab = wezterm.format {
        {Background = {Color = constants.BG}},
        {Foreground = {Color = constants.BG}},
        {Text = constants.SOLID_LEFT_ARROW},
        {Background = {Color = constants.BG}},
        {Foreground = {Color = "hsl(89, 51%, 61%)"}},
        {Text = " + "},
        {Background = {Color = constants.BG}},
        {Foreground = {Color = constants.BG}},
        {Text = constants.SOLID_RIGHT_ARROW}
    },
    new_tab_hover = wezterm.format {
        {Background = {Color = constants.BG}},
        {Foreground = {Color = "hsl(89, 51%, 61%)"}},
        {Text = constants.SOLID_LEFT_ARROW},
        {Background = {Color = "hsl(89, 51%, 61%)"}},
        {Foreground = {Color = constants.BG}},
        {Text = " + "},
        {Background = {Color = constants.BG}},
        {Foreground = {Color = "hsl(89, 51%, 61%)"}},
        {Text = constants.SOLID_RIGHT_ARROW}
    }
}
config.colors = {
    tab_bar = {
        background = constants.TRANSPARENT_BG
    }
}

function module.on_format_tab_title(tab, tabs)
        local background = "hsl(89, 31%, 61%)"
        local title = tab_bar.tab_title(tab)
		local is_only_tab = #tabs == 1

        if (tab.is_active) then
            background = "hsl(89, 51%, 61%)"
            title = (is_only_tab and "" or nerdfonts.cod_eye .. "  ") .. title
        end

        return {
            {Background = {Color = constants.BG}},
            {Foreground = {Color = background}},
            {Text = " " .. constants.SOLID_LEFT_ARROW},
            {Background = {Color = background}},
            {Foreground = {Color = constants.BG}},
            {Text = " " .. title .. " "},
            {Background = {Color = constants.BG}},
            {Foreground = {Color = background}},
            {Text = constants.SOLID_RIGHT_ARROW .. " "}
        }
end

module.config = config

return module
