--------------------------------------------
-- Weight Overhaul Tooltip (B41 & B42 safe)
--------------------------------------------

local function OnTooltipRender(tooltip)
    if not tooltip or not tooltip.item then return end
    if not CraftWeight then return end
    if not getTieredSkillFactor then return end   -- <<< WICHTIG

    local player = getPlayer()
    if not player then return end

    local item = tooltip.item
    local fullType = item:getFullType()
    if not fullType then return end

    local factor = nil

    if CraftWeight.WOOD_ITEMS and CraftWeight.WOOD_ITEMS[fullType] then
        factor = getTieredSkillFactor(player:getPerkLevel(Perks.Woodwork))

    elseif CraftWeight.METAL_ITEMS and CraftWeight.METAL_ITEMS[fullType] then
        factor = getTieredSkillFactor(player:getPerkLevel(Perks.MetalWelding))

    elseif CraftWeight.NEUTRAL_ITEMS and CraftWeight.NEUTRAL_ITEMS[fullType] then
        factor = 0.5
    else
        return
    end

    local script = item:getScriptItem()
    if not script then return end

    local base = script:getActualWeight()
    if not base then return end

    local realWeight = base * factor

    tooltip:DrawText(
        "Effective Weight: " .. string.format("%.2f", realWeight),
        10,
        tooltip:getHeight() - 18,
        1, 1, 1, 1
    )
end

-- Delayed hook so UI exists (B42 safe)
local function HookTooltip()
    if not ISToolTipInv or not ISToolTipInv.onRender then return end
    ISToolTipInv.onRender.Add(OnTooltipRender)
    Events.OnTick.Remove(HookTooltip)
end

Events.OnTick.Add(HookTooltip)
