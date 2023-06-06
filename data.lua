
-- Speed Boost Capsule
-- All content (except image) pulled from Rampant Arsenal by Veden 
--- https://mods.factorio.com/mod/RampantArsenal

local DataUtils = require( "prototypes.data_utils" )

  local name = "sbc-speed-capsule"
  DataUtils.AddBoostersTechnology()
  DataUtils.MakeSticker( name .. "-sticker" )
  DataUtils.MakeCapsule( name )
  DataUtils.MakeRecipe( name )
  DataUtils.AddEffectToTech( "boosters", {type = "unlock-recipe", recipe = name} )
