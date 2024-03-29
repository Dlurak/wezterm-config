local module = {}

function module.merge_tables(t1, t2)
    for k, v in pairs(t2) do
        if (type(v) == "table") and (type(t1[k] or false) == "table") then
            module.merge_tables(t1[k], t2[k])
        else
            t1[k] = v
        end
    end
end

--- @param table table
--- @param search any
--- @return boolean
function module.table_includes(table, search)
    for _, value in pairs(table) do
        if (value == search) then
            return true
        end
    end
    return false
end

function module.get_random_item(table)
    return table[math.random(1, #table)]
end

function module.shorten_string(str, max_len)
	local shortend = string.sub(str, 1, max_len - 3)
	local is_shortend = shortend ~=  str

	if is_shortend then
		shortend = shortend .. "..."
	end

	return shortend
end

return module
