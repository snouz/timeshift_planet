local icons = "__panglia_planet__/graphics/icons/"
local entity = "__panglia_planet_assets__/graphics/entity/"
local techicons = "__panglia_planet_assets__/graphics/technology/"
local tssounds = "__panglia_planet_assets__/sounds/"

local beacon_multiplier = 50
local panglia_only = {{property = "pressure", min = 1401, max = 1401}}

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
          },
          {
            filename = entity .. "crusher/crusher-base-shadow.png",
            width = 320,
            height = 320,
            animation_speed = 0.5,
            repeat_count = 48,
            scale = 0.5,
            draw_as_shadow = true,
          },
          {
            filename = "__space-age__/graphics/entity/crusher/crusher-horizontal.png",
            width = 200,
            height = 162,
            animation_speed = 0.5,
            repeat_count = 48,
            scale = 0.5,
            shift = util.by_pixel(2.5 +3, -5.0 -4.5),
          },
          {
            filename = entity .. "crusher/crusher-base-top.png",
            width = 320,
            height = 320,
            animation_speed = 0.5,
            repeat_count = 48,
            scale = 0.5,
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
          },
          {
            filename = entity .. "crusher/crusher-base-shadow.png",
            width = 320,
            height = 320,
            animation_speed = 0.5,
            repeat_count = 48,
            scale = 0.5,
            draw_as_shadow = true,
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
          },
          {
            filename = entity .. "crusher/crusher-base-top.png",
            width = 320,
            height = 320,
            animation_speed = 0.5,
            repeat_count = 48,
            scale = 0.5,
          },
        }
      }
    }
  },
})