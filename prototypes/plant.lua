local icons = "__panglia_planet__/graphics/icons/"
local entity = "__panglia_planet_assets__/graphics/entity/"
local techicons = "__panglia_planet_assets__/graphics/technology/"
local sounds = "__panglia_planet_assets__/sounds/"
local tssounds = "__panglia_planet_assets__/sounds/"

local beacon_multiplier = 50
local panglia_only = {{property = "pressure", min = 1401, max = 1401}}
require("__base__.prototypes.particles")

local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

local seconds = 60
local minutes = 60 * seconds


local particle_animations = require("__base__.prototypes.particle-animations")

local function gleba_tree_variations(name, variation_count, per_row, scale_multiplier, width, height, shift, reflection_shift)
  variation_count = variation_count or 5
  per_row = per_row or 5
  scale_multiplier = scale_multiplier or 1
  local width = width or 640
  local height = height or 560
  local variations = {}
  local reflection_shift = reflection_shift or util.by_pixel(52, 80)
  local shift = shift or util.by_pixel(52, -40)
 -- local reflection_shift = {shift[0], shift[1]} --or util.by_pixel(52, 40)
  for i = 1, variation_count do
    local x = ((i - 1) % per_row) * width
    local y = math.floor((i-1)/per_row) * height
    local variation = {
      trunk = {
        layers = {
          {

            filename = entity .. "plant/"..name.."/"..name.."-trunk.png",
            flags = { "mipmap" },
            --surface = "panglia",
            width = width,
            height = height,
            x = x,
            y = y,
            frame_count = 1,
            shift = shift,
            scale = 0.33 * scale_multiplier
          },
          {
            filename = entity .. "plant/"..name.."/"..name.."-harvest.png",
            flags = { "mipmap" },
            --surface = "panglia",
            width = width,
            height = height,
            x = x,
            y = y,
            frame_count = 1,
            shift = shift,
            scale = 0.33 * scale_multiplier,
            draw_as_light = true,
            tint = {255,255,255,64}
          }
        }
      },
      leaves = {
        layers = {
          {

            filename = entity .. "plant/"..name.."/"..name.."-harvest.png",
            flags = { "mipmap" },
            --surface = "panglia",
            width = width,
            height = height,
            x = x,
            y = y,
            frame_count = 1,
            shift = shift,
            scale = 0.33 * scale_multiplier,
          },
          {
            filename = entity .. "plant/"..name.."/"..name.."-harvest.png",
            flags = { "mipmap" },
            --surface = "panglia",
            width = width,
            height = height,
            x = x,
            y = y,
            frame_count = 1,
            shift = shift,
            scale = 0.33 * scale_multiplier,
            draw_as_light = true,
            tint = {255,255,255,64}
          }
        }
      },
      normal = {
        layers = {
          {
            filename = entity .. "plant/"..name.."/"..name.."-normal.png",
            --surface = "panglia",
            width = width,
            height = height,
            x = x,
            y = y,
            frame_count = 1,
            shift = shift,
            scale = 0.33 * scale_multiplier
          },
          {
            filename = entity .. "plant/"..name.."/"..name.."-harvest.png",
            flags = { "mipmap" },
            --surface = "panglia",
            width = width,
            height = height,
            x = x,
            y = y,
            frame_count = 1,
            shift = shift,
            scale = 0.33 * scale_multiplier,
            draw_as_light = true,
            tint = {255,255,255,64}
          }
        }
      },
      shadow = {
        frame_count = 2,
        lines_per_file = 1,
        line_length = 1,
        flags = { "mipmap", "shadow" },
        --surface = "panglia",
        filenames =
        {
          entity .. "plant/"..name.."/"..name.."-harvest-shadow.png",
          entity .. "plant/"..name.."/"..name.."-shadow.png"
        },
        width = width,
        height = height,
        x = x,
        y = y,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },

      underwater       = nil,
      --water_reflection = gleba_tree_underwater_things[name] and gleba_tree_underwater_things[name].water_reflection or nil,

      water_reflection = {
        pictures = {
        filename = entity .. "plant/"..name.."/"..name.."-effect-map.png",
        --flags = { "mipmap" },
        --surface = "panglia",
        width = width,
        height = height,
        x = x,
        y = y,
        --frame_count = 1,
        shift = reflection_shift,
        scale = 0.33 * scale_multiplier
        }
      } or nil,

      leaf_generation = {},
      branch_generation = {},

      leaves_when_damaged = 100,
      leaves_when_destroyed = 35,
      leaves_when_mined_manually = 40,
      leaves_when_mined_automatically = 16,
      branches_when_damaged = 20,
      branches_when_destroyed = 16,
      branches_when_mined_manually = 15,
      branches_when_mined_automatically = 8
    }

    variation.leaf_generation = {
      type = "create-particle",
      particle_name = "panglia-branbalite-leaf-particle",
      offset_deviation =
      {
        {-0.8, -1.2},
        {0.8, 1.2}
      },
      initial_height = 1.5,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.06 ,
      initial_vertical_speed_deviation = 0.15,
      speed_from_center = 0.025 ,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0.5,
      tail_length = 10,
      tail_length_deviation = 5,
      tail_width = 5,
      rotate_offsets = false,
      only_when_visible = true
    }
    variation.leaves_when_damaged = 50
    variation.leaves_when_destroyed = 35
    variation.leaves_when_mined_manually = 40
    variation.leaves_when_mined_automatically = 16

    variation.branch_generation = {
      type = "create-particle",
      particle_name = "panglia-branbalite-branch-particle",
      offset_deviation = {{-0.65, -1}, {0.65, 1}},
      initial_height = 1.7,
      initial_height_deviation = 0.8,
      initial_vertical_speed = 0.025,
      initial_vertical_speed_deviation = 0.15,
      speed_from_center = 0.035,
      speed_from_center_deviation = 0.02,
      frame_speed = 0.8,
      only_when_visible = true
    }
    variation.branches_when_damaged = 30
    variation.branches_when_destroyed = 40
    variation.branches_when_mined_manually = 35
    variation.branches_when_mined_automatically = 8
  

    table.insert(variations, variation)
  end
  return variations
end


local make_particle = function(params)

  if not params then error("No params given to make_particle function") end
  local name = params.name or error("No name given")

  local ended_in_water_trigger_effect = params.ended_in_water_trigger_effect
  if params.ended_in_water_trigger_effect == false then
    ended_in_water_trigger_effect = nil
  end

  local particle =
  {

    type = "optimized-particle",
    name = name,

    life_time = params.life_time or (60 * 15),
    fade_away_duration = params.fade_away_duration,

    render_layer = params.render_layer or "projectile",
    render_layer_when_on_ground = params.render_layer_when_on_ground or "corpse",

    regular_trigger_effect_frequency = params.regular_trigger_effect_frequency or 2,
    regular_trigger_effect = params.regular_trigger_effect,
    ended_in_water_trigger_effect = ended_in_water_trigger_effect,

    pictures = params.pictures,
    shadows = params.shadows,
    draw_shadow_when_on_ground = params.draw_shadow_when_on_ground,

    movement_modifier_when_on_ground = params.movement_modifier_when_on_ground,
    movement_modifier = params.movement_modifier,
    vertical_acceleration = params.vertical_acceleration,

    mining_particle_frame_speed = params.mining_particle_frame_speed,

  }

  return particle

end

local get_panglia_tree_crop_particle_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename =  "__space-age__/graphics/particle/gleba-tree-particle/gleba-crop-particle.png",
      priority = "extra-high",
      width = 38,
      height = 38,
      frame_count = 16,
      animation_speed = 0.5,
      variation_count = 10,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      shift = {0.0, 0.0},
      --shift = util.add_shift(util.by_pixel( 0.0, 0.0), options.shift),
      scale = 0.5 * (options.scale or 1),
      draw_as_glow = true,
    }
  }
end

local get_panglia_tree_sap_particle_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/gleba-tree-particle/gleba-tree-sap-particle.png",
      line_length = 12,
      width = 32,
      height = 24,
      frame_count = 12,
      variation_count = 7,
      tint = options.tint,
      tint_as_overlay = options.tint_as_overlay,
      draw_as_glow = true,
      shift = util.add_shift(util.by_pixel(0,0.5), options.shift),
      scale = 0.3 * (options.scale or 1),
    }
  }
end


local particle_ended_in_water_trigger_effect = function()
  return
  {
    type = "create-particle",
    repeat_count = 5,
    repeat_count_deviation = 4,
    probability = 0.2,
    affects_target = false,
    show_in_tooltip = false,
    particle_name = "tintable-water-particle",
    apply_tile_tint = "secondary",
    offsets = { { 0, 0 } },
    offset_deviation = { { -0.2969, -0.2969 }, { 0.2969, 0.2969 } },
    initial_height = 0.1,
    initial_height_deviation = 0.5,
    initial_vertical_speed = 0.06,
    initial_vertical_speed_deviation = 0.069,
    speed_from_center = 0.02,
    speed_from_center_deviation = 0.05,
    frame_speed = 1,
    frame_speed_deviation = 0,
    tail_length = 9,
    tail_length_deviation = 8,
    tail_width = 1
  }
end

local gleba_tree_red_sap_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      probability = 0.5,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "panglia-gleba-tree-sap-particle-trigger-red",
      offset_deviation = { { -0.02, -0.02 }, { 0.02, 0.02 } },
      initial_height = 0,
      initial_height_deviation = 0.01,
      initial_vertical_speed = 0,
      initial_vertical_speed_deviation = 0.00,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.02,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 2,
      tail_length_deviation = 1,
      tail_width = 4,
      only_when_visible = true
    }
  }
end


data:extend({
  make_particle
  {
    name = "panglia-branbalite-leaf-particle",
    life_time = 120,
    --pictures = get_panglia_tree_sap_particle_pictures({tint = {162,45,72,255}, tint_as_overlay = true, scale = 0.95}), --#a22d48
    --pictures = get_panglia_tree_sap_particle_pictures({tint = {46,163,134,255}, tint_as_overlay = true, scale = 0.95}), --#2ea386
    pictures = get_panglia_tree_sap_particle_pictures({tint = {46, 145, 163,255}, tint_as_overlay = true, scale = 0.95}), --#2ea386
    shadows =  get_panglia_tree_sap_particle_pictures({tint = {0,0,0}, shift = util.by_pixel (1,0), scale = 0.95}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = particle_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    render_layer = "higher-object-under"
  },

  make_particle
  {
    name = "panglia-branbalite-branch-particle",
    life_time = 120,
    --pictures = get_panglia_tree_crop_particle_pictures({tint = {161,100,120,255}, tint_as_overlay = true, scale = 1.2}), --#a16478
    --pictures = get_panglia_tree_crop_particle_pictures({tint = {100,161,145,255}, tint_as_overlay = true, scale = 1.2}), --#64a191
    pictures = get_panglia_tree_crop_particle_pictures({tint = {100, 151, 161,255}, tint_as_overlay = true, scale = 1.2}), --#64a191
    shadows =  get_panglia_tree_crop_particle_pictures({tint = {0,0,0}, shift = util.by_pixel (1,0), scale = 1.2}),
    regular_trigger_effect_frequency = 4,
    regular_trigger_effect = gleba_tree_red_sap_trigger_effect(),
    ended_in_water_trigger_effect = particle_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow",
    render_layer = "higher-object-above"
  },

  make_particle
  {
    name = "panglia-branbalite-mining-particle",
    life_time = 120,
    --pictures = get_panglia_tree_crop_particle_pictures({tint = {161,100,120,255}, tint_as_overlay = true, scale = 0.5}), --#a16478
    --pictures = get_panglia_tree_crop_particle_pictures({tint = {100,161,145,255}, tint_as_overlay = true, scale = 0.5}), --#64a191
    pictures = get_panglia_tree_crop_particle_pictures({tint = {100, 151, 161,255}, tint_as_overlay = true, scale = 0.5}), --#64a191
    shadows =  get_panglia_tree_crop_particle_pictures({tint = {0,0,0}, shift = util.by_pixel (1,0), scale = 0.5}),
    regular_trigger_effect = nil,
    ended_in_water_trigger_effect = particle_ended_in_water_trigger_effect(),
    render_layer_when_on_ground = "lower-object-above-shadow"
  },

  make_particle
  {
    name = "panglia-gleba-tree-sap-particle-trigger-red",
    life_time = 60,
    --pictures = get_panglia_tree_sap_particle_pictures({tint = {107,36,31,255}, tint_as_overlay = true, scale = 0.8}), --#6b241f
    --pictures = get_panglia_tree_sap_particle_pictures({tint = {31,07,88,255}, tint_as_overlay = true, scale = 0.8}), --#1f6b58
    pictures = get_panglia_tree_sap_particle_pictures({tint = {7, 77, 89,255}, tint_as_overlay = true, scale = 0.8}), --#1f6b58
    shadows =  get_panglia_tree_sap_particle_pictures({tint = {0,0,0}, shift = util.by_pixel (1,0), scale = 0.8}),
    draw_shadow_when_on_ground = false,
    ended_in_water_trigger_effect = particle_ended_in_water_trigger_effect(),
    movement_modifier_when_on_ground = 0,
    render_layer = "higher-object-under"
  },
})

local plant = table.deepcopy(data.raw["plant"]["jellystem"])
plant.name = "panglia_branbalite_plant"
plant.icon = icons .. "panglia_branbalite_plant.png"
plant.minable =
{
  mining_particle = "panglia-branbalite-mining-particle",
  mining_time = 0.5,
  results = {{type = "item", name = "panglia_branbalite", amount_min = 1, amount_max = 4}},
}
plant.autoplace = 
{
  --probability_expression = "min(0.2, 0.3 * (2 - gleba_plants_noise) * control:gleba_plants:size)", -- way too common
  --probability_expression = "gleba_select(gleba_copper_stromatolite - clamp(gleba_decorative_knockout, 0, 1), 1.3, 2, 0.2, 0, 1)", -- too common
  probability_expression = "min(place_every_n(15,15,1,1), 0.1 * fulgora_artificial_mask + 0.2 * (fulgora_decorative_machine_density - 1.5)) + max(0, 10 * (1.5 - distance))", -- lightning attractor
  tile_restriction = { --all ground looking tiles
    "panglia-midland-turquoise-bark",
    "panglia-midland-turquoise-bark-2",
    "panglia-midland-cracked-lichen-dark",
    "panglia-volcanic-ash-dark",
    "panglia-volcanic-ash-cracks",
    "panglia-volcanic-cracks",
    "panglia-volcanic-jagged-ground",
    "panglia-volcanic-soil-dark",
    "panglia-volcanic-soil-light",
  }
}
plant.variations = gleba_tree_variations("branbalite", 8, 4, 1.3, 640, 560, util.by_pixel(52, -73))
plant.surface_conditions = nil
plant.order = "zaaaa"

plant.colors = {
  {r = 255, g = 255, b =  255},
  {r = 240, g = 240, b =  255},
  {r = 220, g = 240, b =  255},
  {r = 220, g = 245, b =  240},
  {r = 235, g = 230, b =  255},
  {r = 230, g = 225, b =  240},
  {r = 225, g = 230, b =  235}
}

plant.agricultural_tower_tint =
{
  primary = {122, 226, 245, 255}, -- #eac1f5ff
  secondary = {109, 169, 181,255}, -- #885289ff
}
plant.growth_ticks = 2 * minutes
plant.map_color = {45,207,235,230}

plant.factoriopedia_simulation = 
{
  planet = "panglia",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 1.4
    game.simulation.camera_position = {-0.5, 0}
    for x = -10, 9, 1 do
      for y = -4, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "panglia-volcanic-cracks"}}
      end
    end

    game.surfaces[1].create_entity{name = "panglia_branbalite_plant", position = {x=-2.54, y=-0.76}, tick_grown = 1}
    game.surfaces[1].create_entity{name = "panglia_branbalite_plant", position = {x=-4.68, y=1.83}, tick_grown = 1000}
    game.surfaces[1].create_entity{name = "panglia_branbalite_plant", position = {x=-0.10, y=0.67}, tick_grown = 10000}
    game.surfaces[1].create_entity{name = "panglia_branbalite_plant", position = {x=4.80, y=1.69}, tick_grown = 1}
  ]]
}

data:extend({plant})







data:extend({
  {
    type = "plant",
    name = "processing-grid-process-dna",
    icon = icons .. "processing-grid-process-dna.png",
    flags = {"placeable-neutral"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.2,
      results = {{type = "item", name = "datacell-dna-sequenced", amount = 1}},
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = {
                {
                  type = "play-sound",
                  sound = sound_variations("__panglia_planet_assets__/sounds/entity/agricultural-tower/cervo", 13, 0.9),
                  damage_type_filters = "fire"
                }
              }
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__panglia_planet_assets__/sounds/entity/agricultural-tower/cervo", 13, 0.9), --sound_variations("__space-age__/sound/mining/axe-mining-yumako-tree", 5, 0.6),
    mined_sound = sound_variations("__panglia_planet_assets__/sounds/entity/agricultural-tower/cervo", 13, 0.9), --sound_variations("__space-age__/sound/mining/mined-yumako-tree", 6, 0.3),
    growth_ticks = 10 * minutes,
    max_health = 50,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-1, -1}, {1, 1}},
    sticker_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    impact_category = "tree",
    autoplace =
    {
      probability_expression = 0,
      tile_restriction = {"webbed_processor_tile"},
    },
    tile_buildability_rules = {
      {
        area = {{-0.5, -0.5}, {0.5, 0.5}},
        required_tiles = {layers = {ground_tile = true}},
      }
    },
    stateless_visualisation_variations =
    {
      {
        animation = {
          sheets = {
            {
              variation_count = 1,
              filenames = {"__panglia_planet_assets__/graphics/entity/plant/processing-grid-process-dna/processing-grid-process-dna.png"},
              width = 128,
              height = 128,
              lines_per_file = 25,
              frame_count = 100,
              animation_speed = 0.15,
              scale = 0.5,
              draw_as_glow = true,
              shift = {0,0},
              frame_sequence = { 1, 2, 3, 1, 4, 5, 6, 1, 7, 8, 9, 10, 10, 11, 12, 1, 1, 13, 14, 15, 15, 13, 16, 17, 1, 18, 1, 19, 19, 20, 21, 22, 1, 22, 23, 1, 24, 25, 1, 12, 5, 6, 1, 15, 11, 7, 1, 8, 5, 4 ,
                1, 1, 3, 1, 11, 5, 6, 1, 22, 8, 9, 1, 10, 1, 12, 1, 1, 3, 4, 1, 1, 13, 16, 17, 1, 16, 1, 1, 1, 1, 1, 22, 1, 22, 7, 1, 24, 6, 1, 1, 1, 1, 1, 1, 7, 7, 1, 11, 5, 1
              }
            },
          }
        }
      }
    },
    pictures =
    {
      layers =
      {
        {
          filename = "__core__/graphics/empty.png",
          width = 1,
          height = 1,
        }
      }
    },
    map_color = {255, 255, 255},
  },
})