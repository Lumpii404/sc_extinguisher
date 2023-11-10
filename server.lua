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
        TriggerClientEvent('giveex', -1)
        Citizen.Wait(5000)
        xPlayer.addInventoryItem(item, count)
        playerItems[source][item] = true

        TriggerClientEvent('ox_lib:notify', source, {
            title = Translation[Config.Locale]['success1'],
            description = Translation[Config.Locale]['success2'],
            type = 'success'
        })
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
        TriggerClientEvent('getnewex', -1)
        Citizen.Wait(5000)
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






