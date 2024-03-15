# Installation

Copy either the entire repository or these files and directories into `~/.config/wezterm`:

- `wezterm.lua`
- `config/`
- `constants/`
- `settings/`
- `utils/`

The following fields are available in the `~/.config/wezterm/config/init.lua` file:

| Key            | Description                                                      |
| -------------- | ---------------------------------------------------------------- |
| username       | Your username, this is needed to map directories to pretty names |
| shells         | Define shells you use here                                       |
| status_modules | This is documented in [status](/status)                          |
| tmux_mode      | This optimizes wezterm for the use with tmux                     |
