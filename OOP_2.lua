-- main class
Shape = {area = 0}

-- constructor of main class
function Shape:new (o,side)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   side = side or 0
   self.area = side*side;
   return o
end

-- method of this class
function Shape:printArea ()
   print("The area is ",self.area)
end

-- inheritant class
Square = Shape:new()    -- inherit shape class

function Square:new (o,side)
   o = o or Shape:new(o,side)
   setmetatable(o, self)
   self.__index = self
   return o
end

-- overwrite main class from child class
function Square:printArea ()
   print("The area of square is ",self.area)
end


-- สร้าง object จาก main class
myshape = Shape:new(nil,10)
myshape:printArea()

-- สร้าง object จาก child class
mysquare = Square:new(nil,10)
mysquare:printArea()

