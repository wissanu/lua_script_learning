
--[[
    นี่คือการคอมเม้นแบบ หลายบรรทัด
]]

-- ปริ๊นข้อความ
print("hello world")

-- ปริ้นข้อความและต่อคำ
print("my name" .. " is" .. " tor")

hour = os.date("*t").hour
min = os.date("*t").min
sec = os.date("*t").sec

local current_time = (hour + 1)..":"..min..":"..sec

for i = 1, 4 do
    local x = i
    print(x)
end

print("current time : ",current_time)

