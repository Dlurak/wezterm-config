local bins = require("../constants/processes")
local utils = require("../utils")
local command = require("../utils/command")

local module = {}

-- Current working directory
local basename = function(s)
    return string.match(s, ":(.*)$")
end

local hostname = function (s)
	return string.match(s, "^.*@(.*):")
end

function module.tab_title(tab_info)
    local title = tab_info.tab_title
    -- if the tab title is explicitly set, take that
    if title and #title > 0 then
        return title
    end

    local pane = tab_info.active_pane

    title = pane.title

    local process_path = pane.foreground_process_name
    --- @type string
    local process_name = process_path:match(".+/([^/]+)$") or "unrecognized"

    local is_ignored = utils.table_includes(bins.ignored, process_name) or (process_name == "")
    local is_remote = utils.table_includes(bins.remote, process_name)

    if is_remote then
		local icon = bins.remotes.mappings[hostname(title)] or ''
        return icon .. ' ' .. title
    end

    --- @type string
    local mapped_name = bins.mappings[process_name] or process_name

    if (is_ignored) then
        local cwd = pane.current_working_dir.file_path
        local mapped_cwd = bins.paths.mappings[cwd] or cwd
        return mapped_name .. mapped_cwd
    end
    return mapped_name
end

return module
