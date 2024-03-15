local wezterm = require "wezterm"
local act = wezterm.action

local global_config = require "config/"

local config = {}

if not global_config.tmux_mode then
	config.leader = {key = "f", mods = "CTRL", timeout_milliseconds = 1000}
end

config.keys = {
    {key = "f", mods = "LEADER|CTRL", action = wezterm.action.SendKey {key = "f", mods = "CTRL"}},

    {key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain")},
    {key = "w", mods = "LEADER", action = act.CloseCurrentTab {confirm = true}},

    {key = "h", mods = "LEADER", action = act.ActivatePaneDirection 'Left'},
    {key = "j", mods = "LEADER", action = act.ActivatePaneDirection 'Down'},
    {key = "k", mods = "LEADER", action = act.ActivatePaneDirection 'Up'},
    {key = "l", mods = "LEADER", action = act.ActivatePaneDirection 'Right'},

    {key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette},

	{
		key = 'r',
		mods = 'LEADER',
		action = act.ActivateKeyTable {
		  name = 'resize_pane',
		  one_shot = false,
		},
	},
	{
		key = 'm',
		mods = 'LEADER',
		action = act.ActivateKeyTable {
		  name = 'move_pane',
		  one_shot = true,
		},
	},

	{key = 's', mods = 'LEADER', action = wezterm.action.SplitHorizontal},
	{key = 'v', mods = 'LEADER', action = wezterm.action.SplitVertical},

	-- I have these in my NeoVim so I don't want them here
    {key = "H", mods = "CTRL|SHIFT", action = act.DisableDefaultAssignment},
    {key = "J", mods = "CTRL|SHIFT", action = act.DisableDefaultAssignment},
    {key = "K", mods = "CTRL|SHIFT", action = act.DisableDefaultAssignment},
    {key = "L", mods = "CTRL|SHIFT", action = act.DisableDefaultAssignment},

	{
		key = 'c',
		mods = 'LEADER',
		action = act.Multiple {
		  act.ClearScrollback 'ScrollbackAndViewport',
		  act.SendKey { key = 'L', mods = 'CTRL' },
		},
  },
}

config.key_tables = {
	resize_pane = {
		{ key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 1 } },
		{ key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },

		{ key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
		{ key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },

		{ key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 1 } },
		{ key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },

		{ key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 1 } },
		{ key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },

		{ key = 'Escape', action = 'PopKeyTable' },
	},
	move_pane = {
		{ key = 'h', action = act.RotatePanes 'CounterClockwise' },
		{ key = 'j', action = act.RotatePanes 'Clockwise' },
		{ key = 'k', action = act.RotatePanes 'CounterClockwise' },
		{ key = 'l', action = act.RotatePanes 'Clockwise' },

		{ key = 'Escape', action = 'PopKeyTable' },
	}
}

return config
