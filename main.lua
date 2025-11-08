-- ArcanaQOL - Quality of Life improvements for Arcana cards
-- Currently: Relaxes The Queen arcana card's activation requirement
-- Changes from 2 to 3 maximum cards with same cost
-- Author: shadowofdoom
-- Version: 1.0.0

local mods = rom.mods

-- Setup environment isolation
mods['SGG_Modding-ENVY'].auto()

-- Setup game and utility references
game = rom.game
modutil = mods['SGG_Modding-ModUtil']
chalk = mods["SGG_Modding-Chalk"]
reload = mods['SGG_Modding-ReLoad']

-- Load configuration
config = chalk.auto('config.lua')
public.config = config

local function on_ready()
    if config.enabled == false then return end

    if config.debug then
        print("[ArcanaQOL] Mod loaded successfully")
        print("[ArcanaQOL] Original MaxDuplicateCount: " .. tostring(game.MetaUpgradeCardData.BonusRarity.AutoEquipRequirements.MaxDuplicateCount))
    end

    -- Modify The Queen's activation requirement
    -- Change from 2 to configurable value (default: 3)
    modutil.mod.Path.Set("MetaUpgradeCardData.BonusRarity.AutoEquipRequirements.MaxDuplicateCount", config.max_duplicate_count)

    -- Update the in-game description text to show the new number
    local customAutoEquipText = "Auto-equips when no more than " .. config.max_duplicate_count .. " of the same {#DialogueItalicFormat}Cost{#PreviousFormat}."
    modutil.mod.Path.Set("MetaUpgradeCardData.BonusRarity.AutoEquipText", customAutoEquipText)

    if config.debug then
        print("[ArcanaQOL] New MaxDuplicateCount: " .. tostring(game.MetaUpgradeCardData.BonusRarity.AutoEquipRequirements.MaxDuplicateCount))
        print("[ArcanaQOL] New AutoEquipText: " .. customAutoEquipText)
        print("[ArcanaQOL] The Queen will now allow up to " .. config.max_duplicate_count .. " cards with the same cost")
    end
end

local function on_reload()
    if config.enabled == false then return end

    if config.debug then
        print("[ArcanaQOL] Mod reloaded")
    end
end

-- Setup reload system and register with ModUtil
local loader = reload.auto_single()

modutil.once_loaded.game(function()
    loader.load(on_ready, on_reload)
end)
