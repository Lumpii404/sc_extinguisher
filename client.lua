ESX = exports["es_extended"]:getSharedObject()

local modelex = Config.EX

local optionsex = {
    {
        name = 'fire_menu',
        onSelect = function()
            lib.showContext('fire_menu')
        end,
        icon = 'fa-solid fa-fire-extinguisher',
        iconColor = '#e06666',
        label = Translation[Config.Locale]['target_1'],
        distance = 2.5,
    },
}

exports.ox_target:addModel(modelex, optionsex)

exports.ox_target:addModel("firetruk", {
    icon = 'fas fa-screwdriver-wrench',
    label = Translation[Config.Locale]['target_2'],
    distance = 2.5,
    canInteract = function(entity, distance, coords, name)
      return true
    end,
    onSelect = function(data)
        lib.showContext('fire_truk')
    end
  })

---

  lib.registerContext({
    id = 'fire_truk',
    title = Translation[Config.Locale]['truk_menu'],
    options = {
      {
        title = Translation[Config.Locale]['menu_header'],
        icon = 'fire-extinguisher',
        iconColor = '#e06666',
        menu = 'truk_menu',
      }
    }
})

lib.registerContext({
    id = 'truk_menu',
    title = Translation[Config.Locale]['menu_header'],
    menu = 'fire_truk',
    options = {
        {
            title = Translation[Config.Locale]['menu_1'],
            icon = 'plus',
            iconColor = '#e06666',
            onSelect = function()
                TriggerServerEvent('sc:getfire')
            end,
          },
          {
            title = Translation[Config.Locale]['menu_2'],
            icon = 'right-left',
            iconColor = '#e06666',
            onSelect = function()
                TriggerServerEvent('sc:change')
            end,
          },
          {
            title = Translation[Config.Locale]['remfire'],
            icon = 'minus',
            iconColor = '#e06666',
            onSelect = function()
                TriggerServerEvent('sc:remove')
            end,
          },
    }
  })


lib.registerContext({
    id = 'fire_menu',
    title = Translation[Config.Locale]['menu_header'],
    options = {
      {
        title = Translation[Config.Locale]['menu_1'],
        icon = 'plus',
        iconColor = '#e06666',
        onSelect = function()
            TriggerServerEvent('sc:getfire')
        end,
      },
      {
        title = Translation[Config.Locale]['menu_2'],
        icon = 'right-left',
        iconColor = '#e06666',
        onSelect = function()
            TriggerServerEvent('sc:change')
        end,
      },
    }
})

---

RegisterNetEvent('getnewex')
AddEventHandler('getnewex', function()
    lib.progressBar({
        duration = Config.Delay,
        label = Translation[Config.Locale]['menu_2'],
        useWhileDead = false,
        canCancel = false,
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
    if lib.progressBar({
        duration = Config.Delay,
        label = Translation[Config.Locale]['menu_1'],
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = true,
        },
        anim = {
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer'
        },
    }) then
        lib.notify({
            title = Translation[Config.Locale]['success1'],
            description = Translation[Config.Locale]['success2'],
            type = 'success'
        })
    end
end)

RegisterNetEvent('remex')
AddEventHandler('remex', function()
    lib.progressBar({
        duration = Config.Delay,
        label = Translation[Config.Locale]['remfire'],
        useWhileDead = false,
        canCancel = false,
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

