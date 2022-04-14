-- convert string to number
local str = "22"
print(type(tonumber(str)))

-- math library

ary = {10,4,5,2,6,7}
print(math.pi)
print(math.random()) -- random range 0.0 - 1.0
print(math.random(10)) -- random range 0 - 10
print(math.random(10, 50)) -- randome range 10 - 50
math.randomseed(os.time()) -- set the randomness of the current times.
print(math.min(5,3,6,7,1,2)) -- get min from array
print(math.max(ary))
-- os function

print(os.time())


-- finding max value of array
local t = {1, 3, 7, 6, 4, 0}

local key, max = 1, t[1]
for k, v in ipairs(t) do
    if t[k] > max then
        key, max = k, v
    end
end

print(key, max)

-- finding min value of array
local t = {1, 3, 7, 6, 4, 0}

local key, min = 1, t[1]
for k, v in ipairs(t) do
    if t[k] < min then
        key, min = k, v
    end
end

print(key, min)