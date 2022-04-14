--[[
nil
number
string
boolean
table
]]

-- nil
local a
print(a)

-- number (รวมทั้ง ทศนิยม)
local b = 5.5
print(b)

-- concatenate number as string
local x = 5.4
print(x..b)

-- summation
local y = b + x
print(y)

-- string
local c = "wissanu"
local d = "thungrut"
print(c .. " " .. d)

-- concatenate string
local e = c .. " " .. d
print(e)

-- boolean
local f = true
print(f)

-- boolean สามารถนำมาใช้ ในการเช็คเปรียบเทียบ บน if .. else แบบนี้ได้ด้วย
if f then
print("the statement is true")
end

-- table
local g = {} -- สร้าง table โดยมันจะมีโครงสร้างเป็น array แต่ index มีความพิเศษ ซึ่งมีความเหมือน dict
print(g)
print(type(g))

g[1] = "first" -- สามารถกำหนด index เป็นตัวเลข ได้
g["edit"] = "second" -- สามารถกำหนด index เป็น string ได้

print(g[1] .. " " .. g["edit"])

-- table สามารถอ้างอิง memory ไปยังตัวแปรอื่นได้ ด้วยการทำแบบนี้
h = g

-- โดยจะสังเกตุว่า เมื่อกำหนดค่าให้ h เท่ากับ g ตัว g ที่เป็น table จะส่ง reference ไปยัง h โดยอัตโนมัติ
print(g)
print(h)

-- แสดงข้อความ จาก table โดยใช้คำสั่ง table.concat()
fruits = {"banana","orange","apple"}

-- ส่งคืนค่า concatenated string ของ table
print("นำข้อความใน table เป็น string",table.concat(fruits))

--ส่งคืนค่า concatenated string ของ table โดยมีตัวคั่นในแต่ละ index เมื่อมีการส่งคืนค่ากลับมา
print("นำข้อความใน table เป็น string",table.concat(fruits,", "))

-- ส่งคืนค่า concatenated string ของ table ด้วย การกำหนด ตำแหน่งของ ข้อมูล
print("นำข้อความใน table เป็น string",table.concat(fruits,", ", 2,3))


-- insert ข้อมูลลง table โดย
table.insert(fruits,"mango")
print("Fruit at index 4 is ",fruits[4])

--insert fruit at index 2
table.insert(fruits,2,"grapes")
print("Fruit at index 2 is ",fruits[2])

print("The last element is",fruits[5])

-- คำสั่ง remove จะนำข้อมูลตัวท้ายออก
table.remove(fruits)
print("The previous last element is",fruits[5])

-- วนลูป table ด้วย ipairs()
for k,v in ipairs(fruits) do
print(k,v)
end

-- sorting table
table.sort(fruits)
print("sorted table")

for k,v in ipairs(fruits) do
print(k,v)
end

-- ว่าด้วยเรื่อง global variable และ block

j = 10 -- global variable
do -- new block
    local j = j -- new 'j', with value 10
    print(j) --> 10
    j = j+1
    do -- another block
        local j = j+1 -- another 'j'
        print(j) --> 12
        _G.j = 20 -- หรือ จะ setting ค่าผ่าน global โดยตรงด้วย _G.x , _ENV.x
    end
    print(j) --> 11
end
print(j)