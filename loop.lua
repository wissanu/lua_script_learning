local a = {"a", "b","c","d","e"}

-- for loop with range (index)
for i = 1, 10, 2 do
    print(i)
end

print("------------")

-- for loop with length of array ASC
for i = 1, #a, 1 do
    print(a[i])
end

-- or you can do this
for k, v in ipairs(a) do
   print(k,v) 
end

print("------------")

-- for loop with length of array DESC
for i=#a, 1, -1 do
    print(i,a[i])
end

print("------------")

-- while loop ASC
local count = 1

while count <= #a do
    print(count, a[count])
    count = count + 1 -- increment
end

print("------------")

-- while loop DESC
local count = #a

while count > 0 do
    print(count, a[count])
    count = count - 1 -- increment with nagative value
end