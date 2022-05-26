
local function Sizeof(arg)
  local count = 0
  for ik, iv in pairs(arg) do
    count = count + 1
  end
  return count
end

local function InxValue(arg)
  local nTable = {}
  for ik, iv in pairs(arg) do
    table.insert(nTable,ik)
  end
  return nTable
end


Config = {}
Config.Test = {}


Config["fishing"] = {
  [1] = {
    ["locations"] = {
      { x = 32.18, y = 856.47, z = 196.83, h = 226.39},
      { x = 28.28, y = 852.8, z = 196.83, h = 226.39},
      { x = 36.34, y = 860.47, z = 196.83, h = 226.39},
        { x = -192.55, y = 790.62, z = 197.21, h = 147.39},
      { x = -188.23, y = 787.67, z = 197.21, h = 147.39},
      { x = -197.3, y = 794.0, z = 197.21, h = 147.39},
    },
    ["blip"] = {
      {title = 'จุดตกปลา', sprite = 68, x = 32.18, y = 856.47, z = 196.73},
      {title = 'จุดตกปลา', sprite = 68, x = -192.55, y = 790.62, z = 197.21}
    }
  },
  [2] = {
    locations = {
      { x = 1301.42, y = 4218.1, z = 33.01, h = 255.79},
      { x = 1297.92, y = 4218.65, z = 33.01, h = 80.53},
      { x = 1309.73, y = 4230.32, z = 33.01, h = 169.14},
      { x = 1323.58, y = 4227.93, z = 33.01, h = 169.14},
      { x = 1330.77, y = 4226.32, z = 33.01, h = 169.14},
      { x = 1337.88, y = 4225.07, z = 33.01, h = 169.14},
      { x = 1316.6, y = 4229.02, z = 33.01, h = 169.14}
    },
    blip = {
      {title = 'จุดตกปลา', sprite = 68, x = 1303.25, y = 4233.22, z = 33.91}
    }
  }
}

local tTable = InxValue(Config.fishing[1])

for i=1, #tTable do
  local innerTable = Config["fishing"][i][tTable[i]]
  for j=1, #innerTable do
    local innerMostTable = innerTable[j]
    print("x : "..innerMostTable["x"])
    print("y : "..innerMostTable["y"])
    print("z : "..innerMostTable["z"])
  end
end