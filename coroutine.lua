
threads = {}    -- list of all live threads

function cthread (arg)
    -- create coroutine
    local co = coroutine.create(function ()
        local x = arg
        for key, value in pairs(x) do
            print(value)
        end
    end)
    -- insert it in the list
    table.insert(threads, co)
end

cthread({1,2,3,4,5})
cthread({11,12,13,14,15})
cthread({21,22,23,24,25})


while true do
    local n = #threads
    if n == 0 then break end   -- no more threads to run
    for i=1,n do
        local status, res = coroutine.resume(threads[i])
        print(status)
        if not res then    -- thread finished its task?
            table.remove(threads, i)
            break
        end
    end
end
