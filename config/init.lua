local module = {}

module.username = "dlurak"
module.shells = {"bash", "zsh"}
-- battery, hyprland_workspace, time, name, date, backlight, i3_workspace, music
module.status_modules = { "battery", "i3_workspace", "time", "date", "music" }

-- tmux mode will optimise wezterm for the use with tmux
-- the tab bar can be disabled and the keyboard shortcuts are non conflicting
module.tmux_mode = false

return module
