ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('fishing:trade')
AddEventHandler('fishing:trade',function()

  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.getInventoryItem(Config['rod']).count > 0 then
    if xPlayer.getInventoryItem(Config['bait']).count > 0 then
      local xItem = xPlayer.getInventoryItem(Config['reward'])
      if xItem.limit ~= -1 and xItem.count >= xItem.limit then
        TriggerClientEvent("pNotify:SendNotification",source, {
    			text =
    			'ไม่สามารถเก็บของเข้ากระเป๋าได้ เพราะ '..xItem.label..' ของคุณเต็ม',
    			layout = "centerRight",
    			queue = "alert",
    			type = "error",
    			theme = "gta",
    			timeout = 5000,
    		})
        TriggerClientEvent('fishing:forcestop',source)
      else
        xPlayer.removeInventoryItem(Config['bait'], 1)
        xPlayer.addInventoryItem(Config['reward'], math.random(1,1))

        -- if isLucky(math.random()) then
        --   if xPlayer.canCarryItem("ball_7",1) then
        --     xPlayer.addInventoryItem("ball_7",1)
        --   end
        -- end

      end
    else
      TriggerClientEvent("pNotify:SendNotification",source, {
        text =
        'คุณไม่มีเหยื่อ',
        layout = "centerRight",
        queue = "alert",
        type = "error",
        theme = "gta",
        timeout = 5000,
      })
      TriggerClientEvent('fishing:forcestop',source)
    end
  else
    TriggerClientEvent("pNotify:SendNotification",source, {
      text =
      'คุณไม่มีเบ็ตตกปลา',
      layout = "centerRight",
      queue = "alert",
      type = "error",
      theme = "gta",
      timeout = 5000,
    })
    TriggerClientEvent('fishing:forcestop',source)
  end

end)

function isLucky(percentChance)
  if percentChance <= 0 or percentChance >= 100 then

    local result = percentChance >= 100 and true or false
    if result then
      return true
    end

  end

  math.randomseed(os.time() + math.random(1,10000))
  local randomNumber = 100 * math.random()
  local result       = randomNumber <= percentChance
  return result
end
