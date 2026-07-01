
require ("circuit-connector-sprites")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local ent_size = 4

--require ("__space-age__.prototypes.entity.crusher-pictures"),

data:extend({
  {
    type = "item-group",
    name = "panglia_crushing_group",
    order = "z-panglia_crushing_group",
    icon = techicons .. "panglia_crusher.png",
    icon_size = 256,
  },
  {
    type = "item-subgroup",
    name = "panglia_crushing",
    group = "panglia_crushing_group",
    order = "a",
  },
  {
    type = "recipe-category",
    name = "panglia_crushing"
  },

  {
    type = "item",
    name = "panglia_crusher",
    icon = icons .. "panglia_crusher.png",
    icon_size = 64,
    subgroup = "panglia-production-machine",
    order = "b[panglia_crusher]",
    place_result = "panglia_crusher",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    stack_size = 20,
    weight = 100 * kg
  },




  {
    type = "recipe",
    name = "panglia_crusher",
    energy_required = 10,
    categories = {"crafting"},
    ingredients =
    {
      {type = "item", name = "panglia_panglite_fiber", amount = 10},
      {type = "item", name = "advanced-circuit", amount = 5},
      {type = "item", name = "steel-furnace", amount = 1},
      {type = "item", name = "crusher", amount = 1},
      {type = "item", name = "chemical-plant", amount = 1},
    },
    --surface_conditions = {{ property = "moshine-exclusive", min = 1, max = 1}},
    results = {{type = "item", name = "panglia_crusher", amount = 1}},
    allow_productivity = false,
    enabled = false,
    auto_recycle = false,
    surface_conditions = panglia_only,
    sort_item_ingredients = false,
  },






  {
    type = "furnace",
    name = "panglia_crusher",
    icon = icons .. "panglia_crusher.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "panglia_crusher"},
    subgroup = "panglia-production-machine",
    order = "b[panglia_crusher]",
    fast_replaceable_group = "panglia_crusher",
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["electric-furnace"],
    max_health = 350,
    corpse = "electric-furnace-remnants",
    dying_explosion = "electric-furnace-explosion",
    impact_category = "metal",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    icon_draw_specification = {shift = {0, -0.1}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.crafter_modules, shift = {0, 0.8}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    effect_receiver = {uses_module_effects = false, uses_beacon_effects = true, uses_surface_effects = true},
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-(ent_size/2 -0.3), -(ent_size/2 -0.3)}, {(ent_size/2 -0.3), (ent_size/2 -0.3)}},
    selection_box = {{-ent_size/2, -ent_size/2}, {ent_size/2, ent_size/2}},
    damaged_trigger_effect = hit_effects.entity(),
    crafting_categories = {"panglia_crushing"},
    result_inventory_size = 1,
    energy_usage = "190kW", --90
    crafting_speed = 2,
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 1 }
    },
    working_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/crusher/crusher-loop.ogg",
        volume = 0.8,
        audible_distance_modifier = 0.6,
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20,
      max_sounds_per_prototype = 3
    },
    graphics_set = {
      idle_animation = {
        layers = {
          {
            filename = entity .. "crusher/crusher-base.png",
            width = 320,
            height = 320,
            animation_speed = 0.5,
            repeat_count = 48,
            scale = 0.5,
            --shift = util.by_pixel(2.5 -3, -5.0 +0.5),
            --tint = {120,190,100}, --TEMPORARY
          },
          {
            filename = entity .. "crusher/crusher-base-shadow.png",
            width = 320,
            height = 320,
            animation_speed = 0.5,
            repeat_count = 48,
            scale = 0.5,
            draw_as_shadow = true,
            --shift = util.by_pixel(2.5 -3, -5.0 +0.5),
            --tint = {120,190,100}, --TEMPORARY
          },
          {
            filename = "__space-age__/graphics/entity/crusher/crusher-horizontal.png",
            width = 200,
            height = 162,
            animation_speed = 0.5,
            repeat_count = 48,
            scale = 0.5,
            shift = util.by_pixel(2.5 +3, -5.0 -4.5),
            --tint = {120,190,100}, --TEMPORARY
          },
          {
            filename = entity .. "crusher/crusher-base-top.png",
            width = 320,
            height = 320,
            animation_speed = 0.5,
            repeat_count = 48,
            scale = 0.5,
            --shift = util.by_pixel(2.5 -3, -5.0 +0.5),
            --tint = {120,190,100}, --TEMPORARY
          },
        }
      },
      animation = {
        layers = {
          {
            filename = entity .. "crusher/crusher-base.png",
            width = 320,
            height = 320,
            animation_speed = 0.5,
            repeat_count = 48,
            scale = 0.5,
            --shift = util.by_pixel(2.5 -3, -5.0 +0.5),
            --tint = {120,190,100}, --TEMPORARY
          },
          {
            filename = entity .. "crusher/crusher-base-shadow.png",
            width = 320,
            height = 320,
            animation_speed = 0.5,
            repeat_count = 48,
            scale = 0.5,
            draw_as_shadow = true,
            --shift = util.by_pixel(2.5 -3, -5.0 +0.5),
            --tint = {120,190,100}, --TEMPORARY
          },
          {
            filename = "__space-age__/graphics/entity/crusher/crusher-horizontal.png",
            width = 200,
            height = 162,
            line_length = 8,
            animation_speed = 0.5,
            frame_count = 48,
            scale = 0.5,
            shift = util.by_pixel(2.5 +3, -5.0 -4.5),
            --tint = {120,190,100}, --TEMPORARY
          },
          {
            filename = entity .. "crusher/crusher-base-top.png",
            width = 320,
            height = 320,
            animation_speed = 0.5,
            repeat_count = 48,
            scale = 0.5,
            --shift = util.by_pixel(2.5 -3, -5.0 +0.5),
            --tint = {120,190,100}, --TEMPORARY
          },
        }
      }
    }
    --[[graphics_set = 
    {
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace.png",
            priority = "high",
            width = 239,
            height = 219,
            shift = util.by_pixel(0.75, 5.75),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-shadow.png",
            priority = "high",
            width = 227,
            height = 171,
            draw_as_shadow = true,
            shift = util.by_pixel(11.25, 7.75),
            scale = 0.5
          }
        }
      },
      working_visualisations =
      {
        {
          fadeout = true,
          animation =
          {
            layers =
            {
              {
                filename = "__base__/graphics/entity/electric-furnace/electric-furnace-heater.png",
                priority = "high",
                width = 60,
                height = 56,
                frame_count = 12,
                animation_speed = 0.5,
                draw_as_glow = true,
                shift = util.by_pixel(1.75, 32.75),
                scale = 0.5
              },
              {
                filename = "__base__/graphics/entity/electric-furnace/electric-furnace-light.png",
                blend_mode = "additive",
                width = 202,
                height = 202,
                repeat_count = 12,
                draw_as_glow = true,
                shift = util.by_pixel(1, 0),
                scale = 0.5,
              },
            }
          },
        },
        {
          fadeout = true,
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-ground-light.png",
            blend_mode = "additive",
            width = 166,
            height = 124,
            draw_as_light = true,
            shift = util.by_pixel(3, 69),
            scale = 0.5,
          },
        },
        {
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-1.png",
            priority = "high",
            width = 37,
            height = 25,
            frame_count = 4,
            animation_speed = 0.5,
            shift = util.by_pixel(-20.5, -18.5),
            scale = 0.5
          }
        },
        {
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-2.png",
            priority = "high",
            width = 23,
            height = 15,
            frame_count = 4,
            animation_speed = 0.5,
            shift = util.by_pixel(3.5, -38),
            scale = 0.5
          }
        }
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-reflection.png",
          priority = "extra-high",
          width = 24,
          height = 24,
          shift = util.by_pixel(5, 40),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }]]
  },
})