local entity = "__panglia_planet_assets__/graphics/entity/"
local sounds = "__panglia_planet_assets__/sounds/"

local beacon_multiplier = 50

local resource_autoplace = require("resource-autoplace")
resource_autoplace.initialize_patch_set("panglia_hidden_beacon", true)
local icons = "__panglia_planet__/graphics/icons/"
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    type = "beacon",
    name = "panglia_hidden_beacon",
    icon = icons .. "panglia_hidden_beacon.png",
    flags = {"placeable-neutral", "not-upgradable", "not-blueprintable", "hide-alt-info", "not-flammable", "no-automated-item-removal", "no-automated-item-insertion", "no-copy-paste", "not-selectable-in-game"},
    is_military_target = false,
    --minable = {},
    --fast_replaceable_group = "beacon",
    max_health = 200000,
    corpse = "beacon-remnants",
    dying_explosion = "beacon-explosion",
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{0, 0}, {0, 0}},
    collision_mask = {layers={}, not_colliding_with_itself=true},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.7,
    allowed_effects = {"speed"},
    graphics_set = {
      module_icons_suppressed = true,
      animation_progress = 1,
      module_tint_mode = "mix", -- "single-module"
      no_modules_tint = {1, 0, 0},
      random_animation_offset = true,
      apply_module_tint = "secondary",
      -- light = { shift = {0, 0}, color = {1, 1, 1}, intensity = 1, size = 3 },
      animation_list =
      {
        {
          render_layer = "smoke",
          always_draw = true,
          animation =
          {
            layers =
            {
              {
                filename = entity .. "hidden_beacon/hidden_beacon.png",
                width = 180,
                height = 202,
                scale = 0.5,
                line_length = 4,
                frame_count = 16,
                animation_speed = 0.1,
                shift = util.by_pixel(0, 0),
                draw_as_glow = true,
                blend_mode = "additive",
              },
              --[[{
                filename = "__base__/graphics/entity/beacon/beacon-shadow.png",
                width = 244,
                height = 176,
                scale = 0.1,
                draw_as_shadow = true,
                shift = util.by_pixel(12.5, 0.5)
              }]]
            }
          }
        },
        --[[{
          render_layer = "object",
          apply_tint = false, -- light doesn't get tinted
          always_draw = false,
          animation =
          {
            filename = "__base__/graphics/entity/beacon/beacon-light.png",
            line_length = 9,
            width = 110,
            height = 186,
            frame_count = 45,
            animation_speed = 0.5,
            scale = 0.1,
            shift = util.by_pixel(0.5, -18),
            draw_as_light = true,
            blend_mode = "additive"
          }
        }]]
      },
    },
    autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "panglia_hidden_beacon",
      order = "a",
      base_density = 38,
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = 3.10,
      starting_rq_factor_multiplier = 1.5,
      candidate_spot_count = 60,
      --tile_restriction = autoplace_parameters.tile_restriction
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
      priority = "extra-high-no-scale",
      width = 10,
      height = 10
    },
    supply_area_distance = 0,
    energy_source =
    {
      type = "void",
    },
    energy_usage = "1W",
    impact_category = "metal",
    open_sound = {filename = "__base__/sound/open-close/beacon-open.ogg", volume = 0.25},
    close_sound = {filename = "__base__/sound/open-close/beacon-close.ogg", volume = 0.25},
    working_sound =
    {
      sound =
      {
        filename = sounds .. "fast_forward1.ogg",
        volume = 0.3,
        --variations = sound_variations("__base__/sound/beacon", 1, 0.1),
        audible_distance_modifier = 0.8,
        persistent = true,
      },
      max_sounds_per_prototype = 1
    },
    distribution_effectivity = 1,
    distribution_effectivity_bonus_per_quality_level = 0.2,
    profile = {1.000000, 0.500000, 0.333333, 0.250000, 0.200000, 0.166667, 0.142857, 0.125000, 0.111111, 0.100000, 0.090909, 0.083333, 0.076923, 0.071429, 0.066667, 0.062500, 0.058824, 0.055556, 0.052632, 0.050000, 0.047619, 0.045455, 0.043478, 0.041667, 0.040000, 0.038462, 0.037037, 0.035714, 0.034483, 0.033333, 0.032258, 0.031250, 0.030303, 0.029412, 0.028571, 0.027778, 0.027027, 0.026316, 0.025641, 0.025000, 0.024390, 0.023810, 0.023256, 0.022727, 0.022222, 0.021739, 0.021277, 0.020833, 0.020408, 0.020000, 0.019608, 0.019231, 0.018868, 0.018519, 0.018182, 0.017857, 0.017544, 0.017241, 0.016949, 0.016667, 0.016393, 0.016129, 0.015873, 0.015625, 0.015385, 0.015152, 0.014925, 0.014706, 0.014493, 0.014286, 0.014085, 0.013889, 0.013699, 0.013514, 0.013333, 0.013158, 0.012987, 0.012821, 0.012658, 0.012500, 0.012346, 0.012195, 0.012048, 0.011905, 0.011765, 0.011628, 0.011494, 0.011364, 0.011236, 0.011111, 0.010989, 0.010870, 0.010753, 0.010638, 0.010526, 0.010417, 0.010309, 0.010204, 0.010101, 0.010000, 0.009901, 0.009804, 0.009709, 0.009616, 0.009524, 0.009434, 0.009346, 0.009259, 0.009174, 0.009091, 0.009009, 0.008929, 0.008850, 0.008772, 0.008696, 0.008621, 0.008547, 0.008475, 0.008403, 0.008333, 0.008264, 0.008197, 0.008130, 0.008065, 0.008000, 0.007937, 0.007874, 0.007813, 0.007752, 0.007692, 0.007634, 0.007576, 0.007519, 0.007463, 0.007407, 0.007353, 0.007299, 0.007246, 0.007194, 0.007143, 0.007092, 0.007042, 0.006993, 0.006944, 0.006897, 0.006849, 0.006803, 0.006757, 0.006712, 0.006667, 0.006623, 0.006579, 0.006536, 0.006494, 0.006452, 0.006410, 0.006369, 0.006329, 0.006289, 0.006250, 0.006211, 0.006173, 0.006135, 0.006098, 0.006061, 0.006024, 0.005988, 0.005952, 0.005917, 0.005882, 0.005848, 0.005814, 0.005780, 0.005747, 0.005714, 0.005682, 0.005649, 0.005618, 0.005586, 0.005556, 0.005525, 0.005495, 0.005464, 0.005435, 0.005405, 0.005376, 0.005348, 0.005319, 0.005291, 0.005263, 0.005236, 0.005208, 0.005181, 0.005155, 0.005128, 0.005102, 0.005076, 0.005051, 0.005025, 0.005000},
    --{1,0.7071,0.5773,0.5,0.4472,0.4082,0.3779,0.3535,0.3333,0.3162,0.3015,0.2886,0.2773,0.2672,0.2581,0.25,0.2425,0.2357,0.2294,0.2236,0.2182,0.2132,0.2085,0.2041,0.2,0.1961,0.1924,0.1889,0.1856,0.1825,0.1796,0.1767,0.174,0.1714,0.169,0.1666,0.1643,0.1622,0.1601,0.1581,0.1561,0.1543,0.1524,0.1507,0.149,0.1474,0.1458,0.1443,0.1428,0.1414,0.14,0.1386,0.1373,0.136,0.1348,0.1336,0.1324,0.1313,0.1301,0.129,0.128,0.127,0.1259,0.125,0.124,0.123,0.1221,0.1212,0.1203,0.1195,0.1186,0.1178,0.117,0.1162,0.1154,0.1147,0.1139,0.1132,0.1125,0.1118,0.1111,0.1104,0.1097,0.1091,0.1084,0.1078,0.1072,0.1066,0.1059,0.1054,0.1048,0.1042,0.1036,0.1031,0.1025,0.102,0.1015,0.101,0.1005,0.1},
     --{1}, --{1,0.7071,0.5773,0.5,0.4472,0.4082,0.3779,0.3535,0.3333,0.3162,0.3015,0.2886,0.2773,0.2672,0.2581,0.25,0.2425,0.2357,0.2294,0.2236,0.2182,0.2132,0.2085,0.2041,0.2,0.1961,0.1924,0.1889,0.1856,0.1825,0.1796,0.1767,0.174,0.1714,0.169,0.1666,0.1643,0.1622,0.1601,0.1581,0.1561,0.1543,0.1524,0.1507,0.149,0.1474,0.1458,0.1443,0.1428,0.1414,0.14,0.1386,0.1373,0.136,0.1348,0.1336,0.1324,0.1313,0.1301,0.129,0.128,0.127,0.1259,0.125,0.124,0.123,0.1221,0.1212,0.1203,0.1195,0.1186,0.1178,0.117,0.1162,0.1154,0.1147,0.1139,0.1132,0.1125,0.1118,0.1111,0.1104,0.1097,0.1091,0.1084,0.1078,0.1072,0.1066,0.1059,0.1054,0.1048,0.1042,0.1036,0.1031,0.1025,0.102,0.1015,0.101,0.1005,0.1},
    beacon_counter = "same_type",
    module_slots = 1,
    icons_positioning =
    {
      {inventory_index = defines.inventory.beacon_modules, shift = {0, 0}, multi_row_initial_height_modifier = -0.3, max_icons_per_row = 2}
    },
    map_color = {33, 0, 37},
  },


  {
    type = "module-category",
    name = "panglia_module"
  },
  {
    type = "module",
    name = "panglia_hidden_beacon_module",
    localised_description = {"item-description.speed-module"},
    icon = icons .. "panglia_hidden_beacon_module.png",
    hidden = true,
    --hidden_in_factoriopedia = true,
    --subgroup = "module",
    --order = "a[speed]-b[speed-module-2]",
    category = "panglia_module",
    color_hint = { text = "S" },
    tier = 1,
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    stack_size = 1,
    weight = 20 * kg,
    effect = {speed = beacon_multiplier, consumption = 0.5, pollution = 1, quality = -2},
    --beacon_tint =
    --{
    --  primary = {0.441, 0.714, 1.000, 1.000}, -- #70b6ffff
    --  secondary = {0.388, 0.976, 1.000, 1.000}, -- #63f8ffff
    --},
    art_style = "vanilla",
    requires_beacon_alt_mode = false,
    auto_recycle = false,
  },
})