local str = "22"
local cha = "what is this?"
print("length of str :",#str)
print("convert string to number :",tostring(str))
print("type of str after converted :",type(tostring(str)))
print("upper string :",string.upper(cha))
print("lower string :",string.lower(cha))
print("lenght of string using string function:",string.len(cha))
print("slice string:",string.sub(cha,1,5))
print("string charactor from decimal:", string.char(99))
print("string decimal from string:", string.byte("A"))
print("repeat string :",string.rep(cha,5,","))
print("find matching string location:",string.find(cha,"is"))
print("find matching match:",string.match(cha,"what is"))
print("find matching string and replace:",string.gsub(cha, "is", "duck"))
print("string format:",string.format("pi: %.2f || num : %i", math.pi,10))

-- format of print
print("hello\nWhat can i do for you?\tmiss .....")


