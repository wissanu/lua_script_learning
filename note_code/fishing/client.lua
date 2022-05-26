
-- local fonts
-- local autofish = false
-- local position

ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()

	RegisterFontFile(Config['font'])
	fonts = RegisterFontId(Config['font'])

  local a = Config['fishing']

  for i=1,#a do
		for b=1,#a[i]['blip'] do
	    a[i]['blip'][b].blips = AddBlipForCoord(a[i]['blip'][b].x, a[i]['blip'][b].y, a[i]['blip'][b].z)
	    SetBlipSprite(a[i]['blip'][b].blips, a[i]['blip'][b].sprite)
	    SetBlipDisplay(a[i]['blip'][b].blips, 4)
	    SetBlipScale(a[i]['blip'][b].blips, 0.7)
	    SetBlipColour(a[i]['blip'][b].blips, 0)
	    SetBlipAsShortRange(a[i]['blip'][b].blips, true)
		  BeginTextCommandSetBlipName("STRING")
	    AddTextComponentString("<font face='font4thai'>"..a[i]['blip'][b].title.."</font>")
	    EndTextCommandSetBlipName(a[i]['blip'][b].blips)
		end
  end

  while true do
    Citizen.Wait(0)

    if not autofish then
      local sleep = true
      local ped = PlayerPedId()
      local pPos = GetEntityCoords(ped)
      for i=1,#a do
        for b=1,#a[i].locations do
          local lPos = a[i].locations[b]
          local near = #(pPos - vector3(lPos.x,lPos.y,lPos.z))
          if near <= 15 then
            sleep = false
            DrawMarker(27, lPos.x, lPos.y, lPos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)
            if near <= 1.5 then
              DrawText3D(lPos.x, lPos.y, lPos.z+0.9, 'กด~g~[ E ]~w~ เริ่มตกปลา', 0.5)
              if IsControlJustReleased(0, 38) and not autofish then
                position = lPos
                start(ped,lPos)
              end
            end
          end
        end
      end

      if sleep then
        Citizen.Wait(1000)
      end
    end

  end

end)

local fishingRod

function start(ped,lPos)
  autofish = true
	Citizen.CreateThread(function()

		while true do
			Citizen.Wait(0)
			DrawText3D(position.x, position.y, position.z+0.9, 'กด  ~r~[ X ] ~w~ยกเลิกตกปลาออโต้', 0.5)
			if IsControlJustReleased(0, 73) then
				autofish = false
				break
			end

			if not autofish then
				break
			end

		end

	end)
  ClearPedTasks(ped)
  while true do
    local pPos = GetEntityCoords(ped)
    if not autofish or IsEntityDead(ped) or IsPedInAnyVehicle(ped,false) or #(pPos - vector3(lPos.x,lPos.y,lPos.z)) > 1.5 then
      stop()
      break
    end
    Citizen.Wait(0)
		fishingRod = GetClosestObjectOfType(pPos, 10.0, GetHashKey("prop_fishing_rod_01"), false, false, false)
		if fishingRod then
			ESX.Game.DeleteObject(fishingRod)
		end
		ClearAreaOfObjects(GetEntityCoords(ped), 20.0, 0)
    SetEntityHeading(ped,lPos.h)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_FISHING", 0, false)
		local time = 0
		local randomtime = math.random(15000,20000)
  	-- local randomtime = 1000
		while true do
			Citizen.Wait(1000)
			if time >= randomtime or not autofish then
				break
			end
			time = time + 1000
		end
		if autofish then
    	TriggerServerEvent('fishing:trade')
		end
  end
end

function stop()
  autofish = false
  ClearPedTasks(PlayerPedId())
	fishingRod = GetClosestObjectOfType(pPos, 10.0, GetHashKey("prop_fishing_rod_01"), false, false, false)
	if fishingRod then
		ESX.Game.DeleteObject(fishingRod)
	end
	fishingRod = nil
end

RegisterNetEvent('fishing:forcestop')
AddEventHandler('fishing:forcestop',function()

  autofish = false

end)

function DrawText3D(x, y, z, text, scale)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)

    SetTextScale(scale, scale)
    SetTextFont(fonts)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 215)

    AddTextComponentString(text)
    DrawText(_x, _y)
end
