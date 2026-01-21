--------------------------------------------
-- Craft Weight Overhaul - Config
-- Build 41 ONLY
--------------------------------------------

CraftWeight = CraftWeight or {}

------------------------------------------------
-- 🪵 WOOD (Carpentry, max −45%)
------------------------------------------------
CraftWeight.WOOD_ITEMS = {

    -- Core wood
    ["Base.Log"] = true,
    ["Base.LogStacks2"] = true,
    ["Base.LogStacks3"] = true,
    ["Base.LogStacks4"] = true,
    ["Base.Plank"] = true,
    ["Base.LongStick"] = true,
    ["Base.WoodenStick2"] = true,
    ["Base.TreeBranch2"] = true,
    ["Base.LargeBranch"] = true,
    ["Base.Sapling"] = true,
    ["Base.Twigs"] = true,

    -- Firewood & scrap
    ["Base.Firewood"] = true,
    ["Base.FirewoodBundle"] = true,
    ["Base.WoodPieces"] = true,
    ["Base.ScrapWood"] = true,
    ["Base.SturdyStick"] = true,

    -- Construction & furniture
    ["Base.WoodenChair"] = true,
    ["Base.WoodenTable"] = true,
    ["Base.WoodenBed"] = true,
    ["Base.WoodenFence"] = true,
    ["Base.WoodenDoor"] = true,
    ["Base.WoodenWindowFrame"] = true,
}

------------------------------------------------
-- ⚙️ METAL (Metalworking, max −45%)
------------------------------------------------
CraftWeight.METAL_ITEMS = {

    -- Sheets & pipes
    ["Base.MetalPipe"] = true,
    ["Base.SmallSheetMetal"] = true,
    ["Base.SheetMetal"] = true,

    -- Scrap & chunks
    ["Base.ScrapMetal"] = true,
    ["Base.UnusableMetal"] = true,
    ["Base.SteelChunk"] = true,
    ["Base.SteelPiece"] = true,
    ["Base.IronChunk"] = true,

    -- Bars & ingots
    ["Base.MetalBar"] = true,
    ["Base.SteelBar"] = true,
    ["Base.SteelBarHalf"] = true,
    ["Base.SteelBarQuarter"] = true,
    ["Base.IronBar"] = true,
    ["Base.IronBarHalf"] = true,
    ["Base.IronBarQuarter"] = true,
    ["Base.IronIngot"] = true,

    -- Structures & furniture
    ["Base.MetalChair"] = true,
    ["Base.MetalTable"] = true,
    ["Base.MetalDoor"] = true,
    ["Base.MetalFence"] = true,
    ["Base.WireFence"] = true,
    ["Base.BarbedWire"] = true,
}

------------------------------------------------
-- 🧰 TOOLS (Maintenance, max −25%)
------------------------------------------------
CraftWeight.TOOL_ITEMS = {
    ["Base.Hammer"] = true,
    ["Base.Saw"] = true,
    ["Base.Axe"] = true,
    ["Base.HandAxe"] = true,
    ["Base.Sledgehammer"] = true,
    ["Base.Wrench"] = true,
    ["Base.PipeWrench"] = true,
    ["Base.Crowbar"] = true,
    ["Base.Screwdriver"] = true,
    ["Base.TirePump"] = true,
}

------------------------------------------------
-- 🔩 FASTENERS (Maintenance, max −25%)
------------------------------------------------
CraftWeight.FASTENER_ITEMS = {

    ["Base.Nails"] = true,
    ["Base.NailsBox"] = true,
    ["Base.NailsCarton"] = true,
    ["Base.Screws"] = true,
    ["Base.ScrewsBox"] = true,
    ["Base.ScrewsCarton"] = true,
    ["Base.Wire"] = true,
    ["Base.ElectricWire"] = true,
    ["Base.WeldingRods"] = true,
    ["Base.Glue"] = true,
    ["Base.WoodGlue"] = true,
    ["Base.DuctTape"] = true,
    ["Base.Twine"] = true,
    ["Base.Rope"] = true,
    ["Base.SteelWool"] = true,
    ["Base.RubberHose"] = true,
}

------------------------------------------------
-- 🩺 MEDICAL (First Aid, max −15%)
------------------------------------------------
CraftWeight.MEDICAL_ITEMS = {
    ["Base.Bandage"] = true,
    ["Base.AlcoholWipes"] = true,
    ["Base.SutureNeedle"] = true,
    ["Base.Disinfectant"] = true,
    ["Base.Splint"] = true,
    ["Base.MedicalBag"] = true,
    ["Base.BandageDirty"] = true,
}

------------------------------------------------
-- 🔫 GUNS & AMMO (Aiming, max −15%)
------------------------------------------------
CraftWeight.GUN_ITEMS = {
    ["Base.Pistol"] = true,
    ["Base.Revolver"] = true,
    ["Base.Shotgun"] = true,
    ["Base.AssaultRifle"] = true,
    ["Base.9mmClip"] = true,
    ["Base.308Clip"] = true,
    ["Base.ShotgunShellsBox"] = true,
}

------------------------------------------------
-- 🗡️ MELEE (Fitness, max −15%)
------------------------------------------------
CraftWeight.MELEE_ITEMS = {
    ["Base.BaseballBat"] = true,
    ["Base.Axe"] = true,
    ["Base.HandAxe"] = true,
    ["Base.Machete"] = true,
    ["Base.Katana"] = true,
    ["Base.Spear"] = true,
}
