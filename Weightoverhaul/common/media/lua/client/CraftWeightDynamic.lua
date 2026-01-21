--------------------------------------------
-- Weight Overhaul - Dynamic Weights
-- B41.78 & B42.13 (SP & MP Safe)
--------------------------------------------

print("[WeightOverhaul] CraftWeightDynamic loaded")

------------------------------------------------
-- Tiered skill curve (GLOBAL for tooltip)
------------------------------------------------
function getTieredSkillFactor(level)
    local reduction = 0

    if level > 0 then
        reduction = reduction + math.min(level, 5) * 0.05
    end

    if level > 5 then
        reduction = reduction + (level - 5) * 0.07
    end

    return math.max(0.05, 1.0 - reduction)
end

------------------------------------------------
-- Get weight factor for an item
------------------------------------------------
local function getWeightFactor(player, fullType)
    if not CraftWeight then return 1.0 end

    if CraftWeight.WOOD_ITEMS and CraftWeight.WOOD_ITEMS[fullType] then
        return getTieredSkillFactor(player:getPerkLevel(Perks.Woodwork))
    end

    if CraftWeight.METAL_ITEMS and CraftWeight.METAL_ITEMS[fullType] then
        return getTieredSkillFactor(player:getPerkLevel(Perks.MetalWelding))
    end

    if CraftWeight.NEUTRAL_ITEMS and CraftWeight.NEUTRAL_ITEMS[fullType] then
        return 0.5
    end

    return 1.0
end

------------------------------------------------
-- Apply dynamic weights to inventory (SAFE)
------------------------------------------------
local function UpdateDynamicWeights(player)
    if not player then return end
    if not CraftWeight then return end

    local inv = player:getInventory()
    if not inv then return end

    local items = inv:getItems()
    if not items then return end

    for i = 0, items:size() - 1 do
        local item = items:get(i)
        if item then
            local fullType = item:getFullType()

            if (CraftWeight.WOOD_ITEMS and CraftWeight.WOOD_ITEMS[fullType])
            or (CraftWeight.METAL_ITEMS and CraftWeight.METAL_ITEMS[fullType])
            or (CraftWeight.NEUTRAL_ITEMS and CraftWeight.NEUTRAL_ITEMS[fullType]) then

                local script = item:getScriptItem()
                if script then
                    local base = script:getActualWeight()
                    if base then
                        local factor = getWeightFactor(player, fullType)
                        item:setActualWeight(base * factor)
                    end
                end
            end
        end
    end
end

Events.OnPlayerUpdate.Add(UpdateDynamicWeights)

------------------------------------------------
-- Sanity Check (no crash)
------------------------------------------------
local function SanityCheck()
    print("====== Weight Overhaul Sanity Check ======")

    if not CraftWeight then
        print("[ERROR] CraftWeight table missing!")
        return
    end

    local function checkTable(name, tbl)
        if type(tbl) ~= "table" then
            print("[WARN] " .. name .. " not present")
            return
        end

        local sm = getScriptManager()
        if not sm then
            print("[WARN] ScriptManager missing")
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
    checkTable("NEUTRAL_ITEMS", CraftWeight.NEUTRAL_ITEMS)

    print("=========================================")
end

Events.OnGameTimeLoaded.Add(SanityCheck)
