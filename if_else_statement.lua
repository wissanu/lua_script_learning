local status = true

if status then
print("yes, it true")
end

status = false

if status ~= true then
print("check statement with negation")
end

if status == false then
print("check statement with without negation")
end


-- if else if and else statement
if status == true then
    print("A case")
elseif status == false then
    print("B case")
end


