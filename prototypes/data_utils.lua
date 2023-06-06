
local DataUtils = {}

-- =============================================================================

local function roundToFloor( number, multiple )
  return math.floor( number / multiple ) * multiple
end

-- =============================================================================

function DataUtils.AddBoostersTechnology( attributes )  -- local name = "sbc-technology-boosters" .. attributes.name
  data:extend({
  {
    type = "technology",
    name = "sbc-technology-boosters",
    icon_size = 128,
    icon_mipmaps = 1,
    icon = "__SpeedBoostCapsule__/graphics/technology/boosters.png",
    prerequisites = {"military-2"},
    effects = {},
    unit = {
        count = 35,
        ingredients = {
          {"automation-science-pack", 10},
          {"logistic-science-pack", 10},
          {"military-science-pack", 10}
        },
        time = 30
    },
    order = "a-j-a"
  }
  })
end

-------------------------------------------------------------------------------

function DataUtils.AddEffectToTech( newTech, recipe )
  local techData = data.raw["technology"]["sbc-technology-" .. newTech]
  if not techData then
    techData = data.raw["technology"][newTech]
  end
  if techData then
    if recipe.type == nil then
        for _, effect in pairs( recipe ) do
            techData.effects[#techData.effects+1] = effect
        end
    else
        techData.effects[#techData.effects+1] = recipe
    end
  else
    error( "Requested Technology not found: " .. newTech )
  end
end

-------------------------------------------------------------------------------

function DataUtils.MakeCapsule( name )
  data:extend({
  {
    type = "capsule",
    name = name,
    icon = "__SpeedBoostCapsule__/graphics/icons/speed-capsule.png",
    icon_size = 32,
    flags = {},
    capsule_action = {
      type = "use-on-self",
      attack_parameters = {
        type = "projectile",
        activation_type = "consume",
        ammo_category = "grenade",
        cooldown = 30,
        range = 0,
        ammo_type = {
          category = "capsule",
          target_type = "position",
          action = {
            type = "direct",
            action_delivery = {
              type = "instant",
              target_effects = {
                type = "create-sticker",
                sticker = "sbc-speed-capsule-sticker",
                show_in_tooltip = true
              }
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "c[slowdown-capsule]-d[speed]",
    stack_size = 100
  }
  })
end

-------------------------------------------------------------------------------

function DataUtils.MakeRecipe( name )
  data:extend({
  {
    type = "recipe",
    name = name,
    icons = {{icon = "__SpeedBoostCapsule__/graphics/icons/speed-capsule.png"}},
    icon_size = 32,
    icon_mipmaps = 1,
    category = "crafting-with-fluid",
    normal = {
      enabled = false,
      energy_required = 8,		
      ingredients = {
        {"steel-plate", 20},
        {"electronic-circuit", 20}
      },
      result = name
    },
    expensive = {
      enabled = false,
      energy_required = 8 * 2,
      ingredients = {
        {"steel-plate", roundToFloor(20 * 1.5, 1)},
        {"electronic-circuit", roundToFloor(20 * 1.5, 1)}
      },
      result = name
    }
  }
  })
end

-------------------------------------------------------------------------------

function DataUtils.MakeSticker( name )
  data:extend({
    {
      type = "sticker",
      name = name,
      duration_in_ticks = 60 * 60 * 1,
      fire_spread_cooldown = 30,
      fire_spread_radius = 0,
      flags = {"not-on-map"},
      animation = {
        filename = "__base__/graphics/entity/fire-flame/fire-flame-13.png",
        line_length = 8,
        width = 60,
        height = 118,
        frame_count = 25,
        axially_symmetrical = false,
        direction_count = 1,
        blend_mode = "normal",
        animation_speed = 1,
        scale = 0.2,
        tint = {r = 0.5, g = 0.5, b = 0.7, a = 0.8},
        shift = {-0.078125, -0.18125},
      },
      spreadRadius = 0,
      target_movement_modifier = 1.4
    }
    })
end

-- =============================================================================

return DataUtils
