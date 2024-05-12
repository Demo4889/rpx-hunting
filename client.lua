local ButcherBlips = {}
local ButcherPeds = {}

CreateThread(function()
    for _,butcher in pairs(Config.Butchers) do
        -- Blips
        local ButcherBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, butcher.coords.x, butcher.coords.y, butcher.coords.z)
        SetBlipSprite(ButcherBlip, -1665418949, 1)
        SetBlipScale(ButcherBlip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, ButcherBlip, lang[Language].butcher)
        Citizen.InvokeNative(0x662D364ABF16DE2F, blip, GetHashKey("BLIP_MODIFIER_MP_COLOR_26"))
        ButcherBlips[#ButcherBlips+1] = ButcherBlip

        -- Peds
        local model = GetHashKey(Config.ButcherNPC)
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(0)
        end

        local ped = CreatePed(model, butcher.coords.x, butcher.coords.y, butcher.coords.z - 0.98, butcher.coords.w, false, true)
        Wait(1)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetPedCanPlayAmbientAnims(ped, true)
        SetPedCanRagdollFromPlayerImpact(ped, false)
        SetEntityInvincible(ped, true)
        SetPedFleeAttributes(ped, 0, false)
        FreezeEntityPosition(ped, true)
        SetRandomOutfitVariation(ped, true)

        if Config.ThirdEye then
            exports["meta_target"]:addLocalEnt('rpx_butcher_target_'..ped, lang[Language].butcher, 'fas fa-paw', ped, 2.0, false, butcher.menuItems,{})
        end

        table.insert(ButcherPeds, ped)
    end
end)

AddEventHandler('onResourceStop', function(resName)
    if GetCurrentResourceName() ~= resName then
        return
    end

    for k,v in pairs(ButcherBlips) do
        RemoveBlip(ButcherBlips[k])
    end

    for _,peds in pairs(ButcherPeds) do
        SetEntityAsMissionEntity(peds, true, true)
        DeleteEntity(peds)
    end
end)

local Holding = function(holding)
    local holdingAnimal = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
    local holdingFur = Citizen.InvokeNative(0x31FEF6A20F00B963, holding)
    if (not holdingAnimal and not holdingFur) then
        lib.notify({title = lang[Language].butcher, description = lang[Language].notHolding, type = "error"})
        return
    end

    if holdingAnimal ~= false then
        local animalModel = GetEntityModel(holdingAnimal)
        for k,v in ipairs(Animals.BigGame) do
            if animalModel == GetHashKey(v.model) then
                holding = Animals.BigGame[k]
            end
        end
    else
        holding = holdingFur
    end
    return holding
end

ButcherAnimal = function()
    local animal = Holding(holding)
    Wait(100)
    if animal ~= nil then
        if animal.meat ~= nil then
            local meat = animal.meat
            local qty = animal.meatqty
            TriggerServerEvent('rpx-hunting:server:AddItem', meat, qty)
        end

        if animal.pelt ~= nil then
            local pelt = animal.pelt
            local qty = animal.peltqty
            TriggerServerEvent('rpx-hunting:server:AddItem', pelt, qty)
        end

        local holdingAnimal = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
        DeleteEntity(holdingAnimal)
    else
        lib.notify({title = lang[Language].butcher, description = lang[Language].issueButcher, type = "error"})
        return
    end
end

SellAnimal = function()
    local animal = Holding(holding)
    Wait(100)


    print("returned animal to sell: "..json.encode(animal))
end

SellFur = function()
    local fur = Holding(holding)
    Wait(100)

    print('player is choosing to sell the fur they are holding')
end