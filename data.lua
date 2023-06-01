
-- Speed Boost Capsule
-- All content (except image) pulled from Rampant Arsenal by Veden 
--- https://mods.factorio.com/mod/RampantArsenal


local Utils = require( "prototypes.utils" )
  local name = "sbc-speed-capsule"
  Utils.addBoostersTechnology()
  Utils.MakeSticker( name .. "-sticker" )
  local name = name
  Utils.MakeCapsule( name )
  Utils.MakeRecipe( name )
  Utils.addEffectToTech( "boosters", {type = "unlock-recipe", recipe = name} )
