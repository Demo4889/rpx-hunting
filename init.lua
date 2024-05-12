Config = {
    ButcherNPC = "S_M_M_UNIBUTCHERS_01", -- NPC model for butcher
    ThirdEye = true, -- Set to false if you are not using third eye (meta_target) https://github.com/Demo4889/meta_target

    Butchers = { -- Butcher locations
        Rhodes = {
            coords = vec4(1297.385, -1277.616, 75.878, 149.676),
            menuItems = {
                {
                    name = 'Open Shop',
                    label = 'Open Shop',
                    onSelect = function(targetData,itemData)
                        for id, shop in pairs(Config.Butchers) do
                            exports['rpx-inventory']:openInventory('shop', { type = 'Butcher' })
                        end
                    end,
                },
                {
                    name = lang[Language].butcherAnimal,
                    label = lang[Language].butcherAnimal,
                    onSelect = function()
                        ButcherAnimal()
                    end,
                },
                {
                    name = lang[Language].sellAnimal,
                    label = lang[Language].sellAnimal,
                    onSelect = function()
                        SellAnimal()
                    end,
                },
                {
                    name = lang[Language].sellFur,
                    label = lang[Language].sellFur,
                    onSelect = function()
                        SellFur()
                    end,
                }
            }
        },
        Valentine = {
            coords = vec4(-339.207, 767.497, 116.578, 98.504),
            menuItems = {
                {
                    name = 'Open Shop',
                    label = 'Open Shop',
                    onSelect = function(targetData,itemData)
                        exports['rpx-inventory']:openInventory('shop', { type = 'Butcher' })
                    end,
                },
                {
                    name = lang[Language].butcherAnimal,
                    label = lang[Language].butcherAnimal,
                    onSelect = function()
                        ButcherAnimal()
                    end,
                },
                {
                    name = lang[Language].sellAnimal,
                    label = lang[Language].sellAnimal,
                    onSelect = function()
                        SellAnimal()
                    end,
                },
                {
                    name = lang[Language].sellFur,
                    label = lang[Language].sellFur,
                    onSelect = function()
                        SellFur()
                    end,
                }
            }
        },
        SaintDenis = {
            coords = vec4(2817.640, -1324.337, 46.590, 141.736),
            menuItems = {
                {
                    name = 'Open Shop',
                    label = 'Open Shop',
                    onSelect = function()
                        exports['rpx-inventory']:openInventory('shop', { type = 'Butcher' })
                    end,
                },
                {
                    name = lang[Language].butcherAnimal,
                    label = lang[Language].butcherAnimal,
                    onSelect = function()
                        ButcherAnimal()
                    end,
                },
                {
                    name = lang[Language].sellAnimal,
                    label = lang[Language].sellAnimal,
                    onSelect = function()
                        SellAnimal()
                    end,
                },
                {
                    name = lang[Language].sellFur,
                    label = lang[Language].sellFur,
                    onSelect = function()
                        SellFur()
                    end,
                }
            }
        },
        Blackwater = {
            coords = vec4(-753.060, -1284.846, 43.474, 267.937),
            menuItems = {
                {
                    name = 'Open Shop',
                    label = 'Open Shop',
                    onSelect = function()
                        exports['rpx-inventory']:openInventory('shop', { type = 'Butcher' })
                    end,
                },
                {
                    name = lang[Language].butcherAnimal,
                    label = lang[Language].butcherAnimal,
                    onSelect = function()
                        ButcherAnimal()
                    end,
                },
                {
                    name = lang[Language].sellAnimal,
                    label = lang[Language].sellAnimal,
                    onSelect = function()
                        SellAnimal()
                    end,
                },
                {
                    name = lang[Language].sellFur,
                    label = lang[Language].sellFur,
                    onSelect = function()
                        SellFur()
                    end,
                }
            }
        },
        Strawberry = {
            coords = vec4(-1753.099, -392.834, 156.244, 182.505),
            menuItems = {
                {
                    name = 'Open Shop',
                    label = 'Open Shop',
                    onSelect = function(targetData,itemData)
                        exports['rpx-inventory']:openInventory('shop', { type = 'Butcher' })
                    end,
                },
                {
                    name = lang[Language].butcherAnimal,
                    label = lang[Language].butcherAnimal,
                    onSelect = function()
                        ButcherAnimal()
                    end,
                },
                {
                    name = lang[Language].sellAnimal,
                    label = lang[Language].sellAnimal,
                    onSelect = function()
                        SellAnimal()
                    end,
                },
                {
                    name = lang[Language].sellFur,
                    label = lang[Language].sellFur,
                    onSelect = function()
                        SellFur()
                    end,
                }
            }
        },
        Tumbleweed = {
            coords = vec4(-5509.896, -2947.076, -1.894, 252.672),
            menuItems = {
                {
                    name = 'Open Shop',
                    label = 'Open Shop',
                    onSelect = function(targetData,itemData)
                        exports['rpx-inventory']:openInventory('shop', { type = 'Butcher' })
                    end,
                },
                {
                    name = lang[Language].butcherAnimal,
                    label = lang[Language].butcherAnimal,
                    onSelect = function()
                        ButcherAnimal()
                    end,
                },
                {
                    name = lang[Language].sellAnimal,
                    label = lang[Language].sellAnimal,
                    onSelect = function()
                        SellAnimal()
                    end,
                },
                {
                    name = lang[Language].sellFur,
                    label = lang[Language].sellFur,
                    onSelect = function()
                        SellFur()
                    end,
                }
            }
        }
    }
}