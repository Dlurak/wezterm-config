local wezterm = require "wezterm"
local nerdfonts = wezterm.nerdfonts

---@diagnostic disable: need-check-nil
local module = {}

local function run_command(command)
    local file = io.popen(command)

    local output = file:read()
    file:close()

    return output
end

local function battery_percentage()
    local input = 
        run_command("upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E 'percentage:' | awk '{print $2}'")
    input = input:gsub("%%", "")

    -- Convert input to a number
    local number = tonumber(input)

    if not number then
        return input .. "%"
    end

    local group = math.floor(number / 10) * 10
	local icon = nerdfonts.md_battery

	if group < 100 then icon = nerdfonts["md_battery_" .. group] end

    return icon .. " " .. input .. "%"
end

module.run_command = run_command
module.battery_display = battery_percentage

return module
