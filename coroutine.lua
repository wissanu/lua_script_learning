local route_1 = coroutine.create( 
    function()
        for i = 1, 10 do
            print("Route 1 : ["..i.."]")
            if i == 5 then
                coroutine.yield()
            end
        end
    end
)

local route_2 = coroutine.create(
    function()
        for i = 20, 15, -1 do
            print("Route 2 : ["..i.."]")
        end
    end
)

print(coroutine.status(route_1))
coroutine.resume(route_1)
print(coroutine.status(route_1))
coroutine.resume(route_2)
print(coroutine.status(route_2))
coroutine.resume(route_1)
print(coroutine.status(route_1))