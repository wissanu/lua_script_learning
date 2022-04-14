--[[
    ใช้ local กำหนด จะหมายถึงใช้ได้แค่ไฟล์นี้ สำหรับ function
    ถ้า จะใช้เป็น global function ให้เอา local ออก หรือ เปลี่ยน local เป็น _G.function sum()
    เป็นต้น
]]
local function sum(arr)
    local temp = 0
    for i = 1, #arr do
        temp = arr[i] + temp
    end
    return temp
end

local a = {1,2,3,4,5}
print(sum(a))
print("----------------")
-- สร้าง function ซ้อน เหมาะสำหรับนำไปใช้เรียกหลายๆ ครั้ง

local function counter()
    local count = 0

    return function()
        count = count + 1
        return count
    end
end

local ans = counter()

for i = 1, 10 do
    print(ans())
end

print("----------------")

-- function with multiple param
local function read_char(...)
    for k, v in pairs(...) do
        print(k,v)
    end
end

read_char({"a","b","c","d"}) -- using pairs can do with table (array) for safety