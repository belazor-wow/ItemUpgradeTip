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
    [201769] = 5
}

ItemUpgradeTip.valorUpgradeIndexes = {
}

ItemUpgradeTip.animaUpgradeIndex = 17



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

    -- One-Handed Weapon
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

    -- Two-Handed Weapon
    [4] = {
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
    [5] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 250,  toMax = 1625},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 300,  toMax = 1375},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 500,  toMax = 1125},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 625,  toMax = 625},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 625,  toMax = 0},
    },

    -- Gladiator Trinkets, Wrists, Cloaks, Rings, Necks
    [6] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
    },

    -- Damage Trinkets, Boots, Gloves, Shoulder, Belt
    [7] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
    },

    -- Melee One Handed Weapons, Shields, Chest, Helms, Legs
    [8] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 500,   toMax = 3375},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 625,   toMax = 2875},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1000,  toMax = 2250},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1250,  toMax = 1250},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 1250,  toMax = 0},
    },

    -- Intellect One-Handed Weapons
    [9] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
    },

    -- Two-Handed Weapons
    [10] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
    },



    --[[ Conquest ]]

    -- Off-Hands
    [11] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
    },

    -- Gladiator Trinkets, Wrists, Cloaks, Rings, Necks
    [12] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
    },

    -- Damage Trinkets, Boots, Gloves, Shoulder, Belt
    [13] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
    },

    -- Melee One Handed Weapons, Shields, Chest, Helms, Legs
    [14] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,   toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,   toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
    },

    -- Intellect One-Handed Weapons
    [15] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
    },

    -- Two-Handed Weapons
    [16] = {
        [8985] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8986] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8987] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8988] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
        [8989] = {currencyId = ItemUpgradeTip.currencyIds.Honor, amount = 0,  toMax = 0},
    },



    --[[ Anima ]]

    [17] = {
        [7195] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 50,   toMax = 1050},
        [7196] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 100,  toMax = 1000},
        [7197] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 150,  toMax = 900},
        [7198] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 200,  toMax = 750},
        [7199] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 250,  toMax = 550},
        [7200] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 300,  toMax = 300},
        [7201] = {currencyId = ItemUpgradeTip.currencyIds.Anima, amount = 0,    toMax = 0},
    }    
}