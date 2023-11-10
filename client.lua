ESX = exports["es_extended"]:getSharedObject()

local modelex = Config.EX

local optionsex = {
    {
        name = 'fire_menu',
        onSelect = function()
            lib.showContext('fire_menu')
        end,
        icon = 'fa-solid fa-fire-extinguisher',
        label = Translation[Config.Locale]['target_1'],
        distance = 2.5,
    },
}

exports.ox_target:addModel(modelex, optionsex)


lib.registerContext({
    id = 'fire_menu',
    title = Translation[Config.Locale]['menu_header'],
    options = {
      {
        title = Translation[Config.Locale]['menu_1'],
        description = '',
        icon = 'fire-extinguisher',
        onSelect = function()
            TriggerServerEvent('sc:getfire')
        end,
      },
      {
        title = Translation[Config.Locale]['menu_2'],
        description = '',
        icon = 'fire-extinguisher',
        onSelect = function()
            TriggerServerEvent('sc:change')
        end,
      },
    }
})

RegisterNetEvent('getnewex')
AddEventHandler('getnewex', function()
    lib.progressBar({
        duration = Config.Delay,
        label = Translation[Config.Locale]['menu_2'],
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
        },
        anim = {
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer'
        },
    })
end)

RegisterNetEvent('giveex')
AddEventHandler('giveex', function()
    lib.progressBar({
        duration = Config.Delay,
        label = Translation[Config.Locale]['menu_1'],
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
        },
        anim = {
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer'
        },
    })
end)

