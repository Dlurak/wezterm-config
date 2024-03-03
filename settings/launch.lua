local config = {}

-- config.command_palette_rows = 21
config.launch_menu = {
    {
        label = "Raspberry Pi",
        args = {"mosh", "dlurak@10.0.0.50"}
    },
}

return config
