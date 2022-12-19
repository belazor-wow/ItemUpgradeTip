local _, ItemUpgradeTip = ...

ItemUpgradeTip.currencyIds = {
	Anima = 1813,
	Valor = 1191,
	Honor = 1792
}

ItemUpgradeTip.weaponUpgradeIndexes = {
    [Enum.ItemWeaponSubclass.Axe1H] = 3,
    [Enum.ItemWeaponSubclass.Mace1H] = 3,
    [Enum.ItemWeaponSubclass.Sword1H] = 3,
    [Enum.ItemWeaponSubclass.Warglaive] = 3,
    [Enum.ItemWeaponSubclass.Unarmed] = 3,
    [Enum.ItemWeaponSubclass.Dagger] = 3,
    [Enum.ItemWeaponSubclass.Wand] = 3,
    [Enum.ItemWeaponSubclass.Crossbow] = 4,
    [Enum.ItemWeaponSubclass.Staff] = 4,
    [Enum.ItemWeaponSubclass.Sword2H] = 4,
    [Enum.ItemWeaponSubclass.Mace2H] = 4,
    [Enum.ItemWeaponSubclass.Polearm] = 4,
    [Enum.ItemWeaponSubclass.Axe2H] = 4,
    [Enum.ItemWeaponSubclass.Bows] = 4,
    [Enum.ItemWeaponSubclass.Guns] = 4
}

ItemUpgradeTip.armorUpgradeIndexes = {
    ["INVTYPE_NECK"] = 0,
    ["INVTYPE_SHIELD"] = 0,
    ["INVTYPE_WRIST"] = 0,
    ["INVTYPE_FINGER"] = 0,
    ["INVTYPE_CLOAK"] = 0,
    ["INVTYPE_SHOULDER"] = 1,
    ["INVTYPE_WAIST"] = 1,
    ["INVTYPE_FEET"] = 1,
    ["INVTYPE_HAND"] = 1,
    ["INVTYPE_TRINKET"] = 1,
    ["INVTYPE_CHEST"] = 2,
    ["INVTYPE_LEGS"] = 2,
    ["INVTYPE_HEAD"] = 2
}

ItemUpgradeTip.honorUpgradeIndexes = {
    [201093] = 9,
    [201094] = 9,
    [201095] = 9,
    [201096] = 9,
    [201097] = 9,
    [201098] = 8,
    [201099] = 8,
    [201100] = 8,
    [201101] = 8,
    [201102] = 8,
    [201103] = 8,
    [201104] = 8,
    [201105] = 8,
    [201106] = 9,
    [201107] = 9,
    [201108] = 9,
    [201109] = 9,
    [201110] = 9,
    [201111] = 9,
    [201112] = 9,
    [201113] = 8,
    [201114] = 8,
    [201115] = 8,
    [201116] = 8,
    [201117] = 8,
    [201118] = 8,
    [201119] = 8,
    [201120] = 8,
    [201121] = 7,
    [201122] = 7,
    [201123] = 7,
    [201124] = 7,
    [201125] = 9,
    [201126] = 9,
    [201127] = 9,
    [201128] = 9,
    [201129] = 9,
    [201130] = 8,
    [201132] = 8,
    [201133] = 8,
    [201135] = 8,
    [201136] = 8,
    [201137] = 8,
    [201138] = 8,
    [201139] = 9,
    [201140] = 9,
    [201141] = 9,
    [201142] = 9,
    [201143] = 9,
    [201144] = 9,
    [201145] = 9,
    [201146] = 8,
    [201147] = 8,
    [201148] = 8,
    [201149] = 8,
    [201150] = 8,
    [201151] = 8,
    [201152] = 8,
    [201153] = 8,
    [201154] = 7,
    [201155] = 7,
    [201156] = 7,
    [201157] = 7,
    [201449] = 8,
    [201450] = 6,
    [201451] = 6,
    [201452] = 6,
    [201453] = 6,
    [201744] = 7,
    [201745] = 7,
    [201746] = 7,
    [201747] = 7,
    [201748] = 7,
    [201749] = 7,
    [201750] = 7,
    [201751] = 7,
    [201752] = 7,
    [201753] = 7,
    [201762] = 9,
    [201760] = 9,
    [201764] = 11,
    [201765] = 11,
    [201768] = 10,
    [201769] = 6,
    [201770] = 9,
    [201771] = 11,
    [201772] = 11,
    [201774] = 9,
    [201963] = 9,
    [201964] = 11,
}

-- TODO
ItemUpgradeTip.conquestUpgradeIndexes = {}
ItemUpgradeTip.valorUpgradeIndexes = {}

ItemUpgradeTip.animaUpgradeIndex = 18



ItemUpgradeTip.bonusIds = {

    --[[ Valor ]]

    -- Shield, Offhand, Ring, Cloak, Bracer, Neck
    [0] = {
        [8961] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 250, toMax = 3000},
        [8962] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 250, toMax = 2750},
        [8963] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 250, toMax = 2500},
        [8964] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 250, toMax = 2250},
        [8965] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 250, toMax = 2000},
        [8966] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 250, toMax = 1750},
        [8967] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 250, toMax = 1500},
        [8968] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 250, toMax = 1250},
        [8969] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 250, toMax = 1000},
        [8970] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 250, toMax = 750},
        [8971] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 250, toMax = 500},
        [8972] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 250, toMax = 250},
        [8973] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 250, toMax = 0},
    },

    -- Trinket, Belt, Shoulders, Gloves, Boots
    [1] = {
        [8961] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 400, toMax = 4800},
        [8962] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 400, toMax = 4400},
        [8963] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 400, toMax = 4000},
        [8964] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 400, toMax = 3600},
        [8965] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 400, toMax = 3200},
        [8966] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 400, toMax = 2800},
        [8967] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 400, toMax = 2400},
        [8968] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 400, toMax = 2000},
        [8969] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 400, toMax = 1600},
        [8970] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 400, toMax = 1200},
        [8971] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 400, toMax = 800},
        [8972] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 400, toMax = 400},
        [8973] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 400, toMax = 0},
    },

    -- Helm, Legs, Chest
    [2] = {
        [8961] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 475, toMax = 5700},
        [8962] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 475, toMax = 5225},
        [8963] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 475, toMax = 4750},
        [8964] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 475, toMax = 4275},
        [8965] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 475, toMax = 3800},
        [8966] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 475, toMax = 3325},
        [8967] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 475, toMax = 2850},
        [8968] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 475, toMax = 2375},
        [8969] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 475, toMax = 1900},
        [8970] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 475, toMax = 1425},
        [8971] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 475, toMax = 950},
        [8972] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 475, toMax = 475},
        [8973] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 475, toMax = 0},
    },

    -- One-Handed Agility / Strength Weapon
    [3] = {
        [8961] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 500, toMax = 6000},
        [8962] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 500, toMax = 5500},
        [8963] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 500, toMax = 5000},
        [8964] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 500, toMax = 4500},
        [8965] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 500, toMax = 4000},
        [8966] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 500, toMax = 3500},
        [8967] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 500, toMax = 3000},
        [8968] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 500, toMax = 2500},
        [8969] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 500, toMax = 2000},
        [8970] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 500, toMax = 1500},
        [8971] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 500, toMax = 1000},
        [8972] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 500, toMax = 500},
        [8973] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 500, toMax = 0},
    },

    -- One-Handed Intellect Weapon
    [4] = {
        [8961] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 750, toMax = 9000},
        [8962] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 750, toMax = 8250},
        [8963] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 750, toMax = 7500},
        [8964] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 750, toMax = 6750},
        [8965] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 750, toMax = 6000},
        [8966] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 750, toMax = 5250},
        [8967] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 750, toMax = 4500},
        [8968] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 750, toMax = 3750},
        [8969] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 750, toMax = 3000},
        [8970] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 750, toMax = 2250},
        [8971] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 750, toMax = 1500},
        [8972] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 750, toMax = 750},
        [8973] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 750, toMax = 0},
    },

    -- Two-Handed Weapon
    [5] = {
        [8961] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 1000, toMax = 12000},
        [8962] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 1000, toMax = 11000},
        [8963] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 1000, toMax = 10000},
        [8964] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 1000, toMax = 9000},
        [8965] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 1000, toMax = 8000},
        [8966] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 1000, toMax = 7000},
        [8967] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 1000, toMax = 6000},
        [8968] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 1000, toMax = 5000},
        [8969] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 1000, toMax = 4000},
        [8970] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 1000, toMax = 3000},
        [8971] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 1000, toMax = 2000},
        [8972] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 1000, toMax = 1000},
        [8973] = {currencyId = ItemUpgradeTip.currencyIds.Valor, amount = 1000, toMax = 0},
    },



    --[[ Honor ]]

    -- Off-Hands
    [6] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 250, toMax = 1625},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 300, toMax = 1375},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 500, toMax = 1125},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 625, toMax = 625},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 625, toMax = 0},
    },

    -- Gladiator Trinkets, Wrists, Cloaks, Rings, Necks
    [7] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 300, toMax = 2025},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 375, toMax = 1725},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 600, toMax = 1350},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 750, toMax = 750},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 750, toMax = 0},
    },

    -- Damage Trinkets, Boots, Gloves, Shoulder, Belt
    [8] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 400,  toMax = 2700},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 500,  toMax = 2300},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 800,  toMax = 1800},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1000, toMax = 1000},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1000, toMax = 0},
    },

    -- Melee One Handed Weapons, Shields, Chest, Helms, Legs
    [9] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 500,  toMax = 3375},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 625,  toMax = 2875},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1000, toMax = 2250},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1250, toMax = 1250},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1250, toMax = 0},
    },

    -- Intellect One-Handed Weapons
    [10] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 750,  toMax = 5075},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 950,  toMax = 4325},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1500, toMax = 3375},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1875, toMax = 1875},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1875, toMax = 0},
    },

    -- Two-Handed Weapons
    [11] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1000, toMax = 7750},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1250, toMax = 6750},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 2000, toMax = 5500},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 2500, toMax = 2500},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 2500, toMax = 0},
    },



    --[[ Conquest ]]

    -- Off-Hands
    [12] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
    },

    -- Gladiator Trinkets, Wrists, Cloaks, Rings, Necks
    [13] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
    },

    -- Damage Trinkets, Boots, Gloves, Shoulder, Belt
    [14] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
    },

    -- Melee One Handed Weapons, Shields, Chest, Helms, Legs
    [15] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
    },

    -- Intellect One-Handed Weapons
    [16] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
    },

    -- Two-Handed Weapons
    [17] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0, toMax = 0},
    },



    --[[ Anima ]]

    [18] = {
        [7195] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 50,  toMax = 1050},
        [7196] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 100, toMax = 1000},
        [7197] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 150, toMax = 900},
        [7198] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 200, toMax = 750},
        [7199] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 250, toMax = 550},
        [7200] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 300, toMax = 300},
        [7201] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 0,   toMax = 0},
    }    
}