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
    ngrok = nerdfonts.md_ethernet.. " ngrok",
    nix = nerdfonts.linux_nixos .. " NixOS",
    -- Doesn't need to be correct as for me it is nearly always Asciiquarium
    perl = nerdfonts.md_fishbowl .. " Asciiquarium",
    ["wezterm-gui"] = nerdfonts.dev_terminal .. " Wezterm GUI",
    bash = nerdfonts.cod_terminal_bash .. " ",
    zsh = nerdfonts.cod_terminal_bash .. " ",
    git = nerdfonts.dev_git .. " Git",
    ["python3.11"] = nerdfonts.dev_python .. " Python 3.11",
    peaclock = nerdfonts.fa_clock_o .. " Peaclock",
    gh = nerdfonts.cod_github_inverted .. " GitHub CLI",

    rustlings = nerdfonts.md_language_rust .. " Rustlings",
    cargo = nerdfonts.md_language_rust .. " Cargo",

    man = nerdfonts.cod_book .. " Manual",
    yay = nerdfonts.cod_package .. " Yay"
}

local paths = {}
local username = config.username
paths.mappings = {
	["/home/" .. username .. "/"] = "Home",

	["/home/" .. username .. "/Downloads/"] = nerdfonts.md_download .. " Downloads",

	["/home/" .. username .. "/.config/"] = "Config",
	["/home/" .. username .. "/.config/nvim/"] = "NeoVim Config",
	["/home/" .. username .. "/.config/wezterm/"] = "Wezterm Config",
	["/home/" .. username .. "/.config/hypr/"] = "Hyprland Config",
	["/home/" .. username .. "/.config/i3/"] = "i3 Config",
	["/home/" .. username .. "/SoftwareDevelopment/web/Dlool/"] = "Dlool",
	["/home/" .. username .. "/SoftwareDevelopment/web/copykana/"] = "Copykana",
	["/home/" .. username .. "/SoftwareDevelopment/web/Dlool/frontend/"] = "Dlool - Frontend",
	["/home/" .. username .. "/SoftwareDevelopment/web/Dlool/backend/"] = "Dlool - Backend",
	["/home/" .. username .. "/SoftwareDevelopment/web/LibreVox/"] = "LibreVox",

	["/etc/nixos"] = nerdfonts.linux_nixos .. "  NixOS"
}

module.paths = paths

local remotes = {}

remotes.mappings = {
    raspberrypi = nerdfonts.linux_raspberry_pi
}

module.remotes = remotes

return module
