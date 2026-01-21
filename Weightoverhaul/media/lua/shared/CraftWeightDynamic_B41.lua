--------------------------------------------
-- Weight Overhaul - Dynamic Weights
-- Build 41 ONLY (SP & MP Safe)
--------------------------------------------

print("[WeightOverhaul] CraftWeightDynamic_B41 loaded")

------------------------------------------------
-- Tiered skill curves
------------------------------------------------

-- Heavy materials (Wood & Metal) – max −45%
local function heavyFactor(level)
    local reduction = 0

    if level > 0 then
        reduction = reduction + math.min(level, 5) * 0.04   -- 20%
    end

    if level > 5 then
        reduction = reduction + (level - 5) * 0.05         -- 25%
    end

    return 1.0 - reduction
end

-- Tools & Fasteners (Maintenance) – max −25%
local function toolFactor(level)
    local reduction = 0

    if level > 0 then
        reduction = reduction + math.min(level, 5) * 0.02   -- 10%
    end

    if level > 5 then
        reduction = reduction + (level - 5) * 0.03         -- 15%
    end

    return 1.0 - reduction
end

-- Light handling (Medical, Guns, Melee) – max −15%
local function lightFactor(level)
    return 1.0 - (level * 0.015)
end

------------------------------------------------
-- Get weight factor for an item
------------------------------------------------
local function getWeightFactor(player, fullType)
    if not CraftWeight then return 1.0 end

    if CraftWeight.WOOD_ITEMS and CraftWeight.WOOD_ITEMS[fullType] then
        return heavyFactor(player:getPerkLevel(Perks.Woodwork))
    end

    if CraftWeight.METAL_ITEMS and CraftWeight.METAL_ITEMS[fullType] then
        return heavyFactor(player:getPerkLevel(Perks.MetalWelding))
    end

    if CraftWeight.TOOL_ITEMS and CraftWeight.TOOL_ITEMS[fullType] then
        return toolFactor(player:getPerkLevel(Perks.Maintenance))
    end

    if CraftWeight.FASTENER_ITEMS and CraftWeight.FASTENER_ITEMS[fullType] then
        return toolFactor(player:getPerkLevel(Perks.Maintenance))
    end

    if CraftWeight.MEDICAL_ITEMS and CraftWeight.MEDICAL_ITEMS[fullType] then
        return lightFactor(player:getPerkLevel(Perks.FirstAid))
    end

    if CraftWeight.GUN_ITEMS and CraftWeight.GUN_ITEMS[fullType] then
        return lightFactor(player:getPerkLevel(Perks.Aiming))
    end

    if CraftWeight.MELEE_ITEMS and CraftWeight.MELEE_ITEMS[fullType] then
        return lightFactor(player:getPerkLevel(Perks.Fitness))
    end

    return 1.0
end

------------------------------------------------
-- Apply dynamic weights to inventory
------------------------------------------------
local function UpdateDynamicWeights(player)
    if not player or not CraftWeight then return end

    local inv = player:getInventory()
    if not inv then return end

    local items = inv:getItems()
    if not items then return end

    for i = 0, items:size() - 1 do
        local item = items:get(i)
        if item then
            local script = item:getScriptItem()
            if script then
                local fullType = item:getFullType()
                local factor = getWeightFactor(player, fullType)

                if factor ~= 1.0 then
                    local base = script:getActualWeight()
                    if base then
                        item:setActualWeight(base * factor)
                    end
                end
            end
        end
    end
end

Events.OnPlayerUpdate.Add(UpdateDynamicWeights)

------------------------------------------------
-- Sanity Check (Build 41 safe)
------------------------------------------------
local function SanityCheck()
    print("====== Weight Overhaul B41 Sanity Check ======")

    if not CraftWeight then
        print("[ERROR] CraftWeight table missing!")
        return
    end

    local sm = ScriptManager.instance

    local function checkTable(name, tbl)
        if type(tbl) ~= "table" then
            print("[WARN] " .. name .. " missing")
            return
        end

        local count = 0
        for fullType, _ in pairs(tbl) do
            if sm:getItem(fullType) then
                count = count + 1
            else
                print("[MISSING ITEM] " .. name .. ": " .. fullType)
            end
        end

        print(name .. ": " .. tostring(count) .. " items loaded")
    end

    checkTable("WOOD_ITEMS", CraftWeight.WOOD_ITEMS)
    checkTable("METAL_ITEMS", CraftWeight.METAL_ITEMS)
    checkTable("TOOL_ITEMS", CraftWeight.TOOL_ITEMS)
    checkTable("FASTENER_ITEMS", CraftWeight.FASTENER_ITEMS)
    checkTable("MEDICAL_ITEMS", CraftWeight.MEDICAL_ITEMS)
    checkTable("GUN_ITEMS", CraftWeight.GUN_ITEMS)
    checkTable("MELEE_ITEMS", CraftWeight.MELEE_ITEMS)

    print("===========================================")
end

Events.OnGameTimeLoaded.Add(SanityCheck)
