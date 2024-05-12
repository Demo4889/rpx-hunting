local RPX = exports["rpx-core"]:GetObject()

RegisterServerEvent('rpx-hunting:server:AddItem', function(item, qty)
    local src = source
    local Player = RPX.GetPlayer(src)
    if Player then
        exports['rpx-inventory']:AddItem(src, item, tonumber(qty))
    end
end)