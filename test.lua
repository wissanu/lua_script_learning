COOP = {}
COOP.Member = {}

COOP.Member[1] = {}

COOP.Member[1]["member"] = {}
COOP.Member[1]["leader"] = {}
COOP.Member[1]["group_type"] = {}
COOP.ServerCallbacks = {}

COOP.ShowTable = function (arg, nb)
    if nb == nil then
		nb = 0
	end

	if type(arg) == 'table' then
		local s = ''

		s = '{\n'
		for k,v in pairs(arg) do
			if type(k) ~= 'number' then k = '"'..k..'"' end
			for i = 1, nb, 1 do
				s = s .. "    "
			end
			s = s .. '['..k..'] = ' .. COOP.ShowTable(v, nb + 1) .. ',\n'
		end

		for i = 1, nb, 1 do
			s = s .. "    "
		end

		return s .. '}'
	else
		return tostring(arg)
	end
end

COOP.findMember = function(iden)
    for k, v in pairs(COOP.Member) do
        for ki, vi in pairs(v) do
            if iden == vi then
                return k
            end
        end
    end
    return -1
end

COOP.Length = function (arg)
    local count = 0
    for key, value in pairs(arg) do
        count = count + 1
    end
    return count
end

COOP.test = function (arg)
    return arg
end

-- print(COOP.test(2))
-- print(COOP.Length(COOP.Member[1]))

COOP.ServerCallbacks["noob"] = function (cb)
	cb("call work")
end


COOP.ServerCallbacks["noob"](function(a)
	print(a)
end)

time_elapsed = {
	[3000] = "11"
}

print(time_elapsed[3000])