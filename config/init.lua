local module = {}

module.username = "dlurak"
module.shells = {"bash", "zsh"}
-- battery, hyprland_workspace, time, name, date, backlight, i3_workspace, music
module.status_modules = { "battery", "i3_workspace", "time", "date", "music" }

return module
