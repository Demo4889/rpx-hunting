ButcherBlips = {}
ButcherPeds = {}

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
            exports["meta_target"]:addLocalEnt('rpx_butcher_target_'..ped, lang[Language].butcher, 'fas fa-paw', ped, 5.0, false, butcher.menuItems,{})
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

local Holding = function(holding, quality)
    local holdingAnimal = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
    local holdingFur = Citizen.InvokeNative(0x31FEF6A20F00B963, holding)
    local qual = Citizen.InvokeNative(0x88EFFED5FE8B0B4A, holdingAnimal)

    if (not holdingAnimal and not holdingFur) then
        lib.notify({title = lang[Language].butcher, description = lang[Language].notHolding, type = "error"})
        for _,ped in pairs(ButcherPeds) do
            exports['rpx-smallresources']:AmbientSpeech(ped, '1025_U_M_M_VALBUTCHER_01', 'FAREWELL_NO_SALE', 'speech_params_force', 0)
        end
        return
    end

    if holdingAnimal ~= false then
        local animalModel = GetEntityModel(holdingAnimal)

        if not qual then
            quality = 0
        else
            for k,v in pairs(Config.CarcassQuality) do
                if qual == k then
                    quality = v.multi
                end
            end
        end

        for k,v in ipairs(Animals.BigGame) do
            if animalModel == GetHashKey(v.model) then
                holding = Animals.BigGame[k]
            end
        end
    else
        holding = holdingFur
    end
    return holding, quality
end

ButcherAnimal = function()
    local animal, quality = Holding()
    Wait(100)

    if animal ~= nil then
        for _,ped in pairs(ButcherPeds) do
            exports['rpx-smallresources']:AmbientSpeech(ped, '1025_U_M_M_VALBUTCHER_01', 'BUY_INSPECT_ITEM', 'speech_params_force', 0)
        end
        if animal.meat ~= nil then
            TriggerServerEvent('rpx-hunting:server:AddItem', animal.meat, quality)
        end

        if animal.pelt ~= nil then
            TriggerServerEvent('rpx-hunting:server:AddItem', animal.pelt, 1)
        end

        local holdingAnimal = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
        -- DeleteEntity(holdingAnimal)
    end
end

SellAnimal = function()
    local animal = Holding(holding)
    if animal ~= nil then
        for _,ped in pairs(ButcherPeds) do
            exports['rpx-smallresources']:AmbientSpeech(ped, '1025_U_M_M_VALBUTCHER_01', 'GREET_POINT_OUT_CARCASS', 'speech_params_force', 0)
        end
        Wait(100)
    end
end

SellFur = function()
    local fur = Holding(holding)
    if fur ~= nil then
        for _,ped in pairs(ButcherPeds) do
            exports['rpx-smallresources']:AmbientSpeech(ped, '1025_U_M_M_VALBUTCHER_01', 'GREET_POINT_OUT_PELT', 'speech_params_force', 0)
        end
        Wait(100)
    end
end