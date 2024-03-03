local wezterm = require "wezterm"
local nerdfonts = wezterm.nerdfonts
local config = require "../config/init"

local module = {}

module.ignored = config.shells
module.remote = {"mosh-client", "ssh"}

module.mappings = {
    nvim = nerdfonts.custom_neovim .. " NeoVim",
    vim = nerdfonts.custom_vim .. " Vim",
    node = nerdfonts.dev_nodejs_small .. " NodeJS",
	nix = nerdfonts.linux_nixos .. " NixOS",
	-- Doesn't need to be correct as for me it is nearly always correct
    perl = nerdfonts.md_fishbowl .. " Asciiquarium",
	["wezterm-gui"] = nerdfonts.dev_terminal .. " Wezterm GUI",
    v = nerdfonts.custom_v_lang .. " Compiling",
    bash = nerdfonts.cod_terminal_bash .. " ",
	zsh = nerdfonts.cod_terminal_bash .. " ",
	git = nerdfonts.dev_git .. " Git",
	["python3.11"] = nerdfonts.dev_python .. " Python 3.11"
}

local paths = {}
local username = config.username
paths.mappings = {
    ["/home/" .. username] = "Home",
    ["/home/" .. username .. "/.config"] = "Config",
    ["/home/" .. username .. "/.config/nvim"] = "NeoVim Config",
    ["/home/" .. username .. "/.config/wezterm"] = "Wezterm Config",
    ["/home/" .. username .. "/.config/waybar"] = "Waybar Config",
    ["/home/" .. username .. "/.config/hypr"] = "Hyprland Config",
    ["/home/" .. username .. "/SoftwareDevelopment/web/Dlool"] = "Dlool",
    ["/home/" .. username .. "/SoftwareDevelopment/web/copykana"] = "Copykana",
    ["/home/" .. username .. "/SoftwareDevelopment/web/Dlool/frontend"] = "Dlool - Frontend",
    ["/home/" .. username .. "/SoftwareDevelopment/web/Dlool/backend"] = "Dlool - Backend",
    ["/home/" .. username .. "/SoftwareDevelopment/web/LibreVox"] = "LibreVox"
}

module.paths = paths

local remotes = {}

remotes.mappings = {
    raspberrypi = nerdfonts.linux_raspberry_pi
}

module.remotes = remotes

return module
