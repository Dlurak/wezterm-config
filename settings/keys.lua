local wezterm = require "wezterm"
local act = wezterm.action

local names = require "../constants/names"

local config = {}

config.leader = {key = "f", mods = "CTRL", timeout_milliseconds = 1000}
config.keys = {
    {key = "f", mods = "LEADER|CTRL", action = wezterm.action.SendKey {key = "f", mods = "CTRL"}},

    {key = "h", mods = "LEADER", action = act.ActivateTabRelative(-1)},
    {key = "j", mods = "LEADER", action = act.ActivateTabRelative(-1)},
    {key = "k", mods = "LEADER", action = act.ActivateTabRelative(1)},
    {key = "l", mods = "LEADER", action = act.ActivateTabRelative(1)},

    {key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain")},
    {key = "w", mods = "LEADER", action = act.CloseCurrentTab {confirm = true}},

    {key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette},

    {key = "H", mods = "CTRL|SHIFT", action = act.DisableDefaultAssignment},
    {key = "J", mods = "CTRL|SHIFT", action = act.DisableDefaultAssignment},
    {key = "K", mods = "CTRL|SHIFT", action = act.DisableDefaultAssignment},
    {key = "L", mods = "CTRL|SHIFT", action = act.DisableDefaultAssignment},

	{key = "s", mods = "LEADER", action = wezterm.action_callback(function ()
		names.use_names = not names.use_names
	end)},

	{
		key = 'K',
		mods = 'CTRL|SHIFT|LEADER',
		action = act.Multiple {
		  act.ClearScrollback 'ScrollbackAndViewport',
		  act.SendKey { key = 'L', mods = 'CTRL' },
		},
  },
}

return config
