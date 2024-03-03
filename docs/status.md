# Statusbar

In the top right there is this "statusbar". It can replace a dedicated bar like waybar or polybar for some users.

To define which modules arae shown in this bar edit `config/init.lua`, just store the names of the modules in `status_modules`

These modules are available:

## battery

Show the current battery status, requires `jq` and `upower`.

## hyprland_workspace

Shows your current hyprland workspace, this only works for hyprland, modules for other window managers aren't available but feel free to open a pr

## time

Show the current time

## date

Show the current date

## backlight

Show how bright the monitor is.

## name

This is a insider joke with a friend, it will display `${software} <3`.
Which software is randomly changed every 5 minuites, you can change the list of available software in `constants/names.lua`
