--------------------------------------------
-- Weight Overhaul Log Filter
-- Filters vanilla debug spam (B41 & B42)
--------------------------------------------

local oldPrint = print

local blacklist = {
    "CraftRecipeManager.isValidRecipeForCharacter",
    "Player doesn't have required skill",
    "PZXmlUtil.resolve",
    "Skipping node",
    "TRACE: Xml",
    "AnimState.Parse",
}

function print(...)
    local msg = tostring(...)

    for _, pattern in ipairs(blacklist) do
        if string.find(msg, pattern, 1, true) then
            return -- swallow spam
        end
    end

    oldPrint(...)
end
