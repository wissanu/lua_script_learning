
--[[
    Define the class attribute
]]

Fighter = {
    name = "",
    health = 0.0,
    speed = 0
}

--[[
    Define class method
]]

function Fighter:light_punch()
    print("Fighter "..self.name.." perform a light punch !")
end
function Fighter:heavy_punch()
    print("Fighter "..self.name.." perform a heavy punch !")
end
function Fighter:light_kick()
    print("Fighter "..self.name.." perform a light kick !")
end
function Fighter:heavy_kick()
    print("Fighter "..self.name.." perform a heavy kick !")
end
function Fighter:get_speed()
    return self.speed
end
function Fighter:set_speed(t)
    self.speed = t
end

--[[
    Define the class constructor
]]

function Fighter:new(t)
    t = t or {}
    setmetatable(t, self)
    self.__index = self
    return t
end

--[[
    Create two fighter object
]]

blandon = Fighter:new({
    name = "blandon",
    health = 100,
    speed = 60
})

ryuji = Fighter:new({
    name = "ryuji",
    health = 100,
    speed = 85
})

--[[
    Call object method
]]

print(blandon:get_speed())

if blandon:get_speed() == 60 then
    blandon:set_speed(90)
end

print(blandon:get_speed())

blandon:light_kick()
ryuji:heavy_kick()