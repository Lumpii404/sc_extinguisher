ESX = exports["es_extended"]:getSharedObject()

local modelex = Config.EX

local optionsex = {
    {
        name = 'fire_menu',
        onSelect = function()
            lib.showContext('fire_menu')
        end,
        icon = 'fa-solid fa-fire-extinguisher',
        label = "Take / Replace Extinguisher",
        distance = 2.5,
    },
}

exports.ox_target:addModel(modelex, optionsex)


lib.registerContext({
    id = 'fire_menu',
    title = 'Fire Extinguisher',
    options = {
      {
        title = 'Take Extinguisher',
        description = '',
        icon = 'fire-extinguisher',
        onSelect = function()
            TriggerServerEvent('sc:getfire')
        end,
      },
      {
        title = 'Replace Extinguisher',
        description = '',
        icon = 'fire-extinguisher',
        onSelect = function()
            TriggerServerEvent('sc:change')
        end,
      },
    }
})

RegisterNetEvent('startProgressCircleEvent')
AddEventHandler('startProgressCircleEvent', function()
    lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
        },
    })
end)

