ESX = exports["es_extended"]:getSharedObject()

local playerItems = {}

RegisterNetEvent('sc:getfire')

AddEventHandler('sc:getfire', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = 'WEAPON_FIREEXTINGUISHER'
    local count = 1

    if not playerItems[source] then
        playerItems[source] = {}
    end

    if xPlayer.getInventoryItem(item).count > 0 then
        TriggerClientEvent('ox_lib:notify', source, {
            title = Translation[Config.Locale]['error1'],
            description = Translation[Config.Locale]['error2'],
            type = 'error'
        })
    else
        playerItems[source][item] = true
        TriggerClientEvent('giveex', source)
        Citizen.Wait(Config.Delay)

        xPlayer.addInventoryItem(item, count)
    end
end)



RegisterNetEvent('sc:change')
AddEventHandler('sc:change', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local item = 'WEAPON_FIREEXTINGUISHER'
    local count = 1

    if xPlayer.getInventoryItem(item).count > 0 then
        xPlayer.removeInventoryItem(item, xPlayer.getInventoryItem(item).count)
        TriggerClientEvent('getnewex', source)
        Citizen.Wait(Config.Delay)
        xPlayer.addInventoryItem(item, count)
        TriggerClientEvent('ox_lib:notify', _source, {
            title = Translation[Config.Locale]['inform1'],
            description = Translation[Config.Locale]['success3'],
            type = 'inform'
        })
    else
        TriggerClientEvent('ox_lib:notify', _source, {
            title = Translation[Config.Locale]['inform1'],
            description = Translation[Config.Locale]['inform2'],
            type = 'inform'
        })
    end
end)

RegisterNetEvent('sc:remove')
AddEventHandler('sc:remove', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local item = 'WEAPON_FIREEXTINGUISHER'
    local count = 1

    if xPlayer.getInventoryItem(item).count > 0 then
        TriggerClientEvent('remex', source)
        Citizen.Wait(Config.Delay)
        xPlayer.removeInventoryItem(item, xPlayer.getInventoryItem(item).count)
        TriggerClientEvent('ox_lib:notify', _source, {
            title = Translation[Config.Locale]['inform1'],
            description = Translation[Config.Locale]['remfire1'],
            type = 'inform'
        })
    else
        TriggerClientEvent('ox_lib:notify', _source, {
            title = Translation[Config.Locale]['inform1'],
            description = Translation[Config.Locale]['inform2'],
            type = 'inform'
        })
    end
end)






