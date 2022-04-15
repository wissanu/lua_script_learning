function Pet(name)
    name = name or ""
    return {
        name = name,
        status = "",
        feed = function(self)
                print("Feeding :", name)
                self.status = "full" 
        end

    }
end

local dog = Pet("peter")

print(dog:feed())
