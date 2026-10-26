local terrain = "__panglia_planet_assets__/graphics/terrain/"

local tile_trigger_effects = require("__space-age__.prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local vulcanus_tile_offset = 40

local function transition_masks()
  return {
    mask_spritesheet = "__base__/graphics/terrain/masks/transition-1.png",
    mask_layout =
    {
      scale = 0.5,
      inner_corner =
      {
        count = 8,
      },
      outer_corner =
      {
        count = 8,
        x = 64*9
      },
      side =
      {
        count = 8,
        x = 64*9*2
      },
      u_transition =
      {
        count = 1,
        x = 64*9*3
      },
      o_transition =
      {
        count = 1,
        x = 64*9*4
      }
    }
  }
end

local lava_to_out_of_map_transition =
{
  to_tiles = out_of_map_tile_type_names,
  transition_group = out_of_map_transition_group_id,

  overlay_layer_group = "zero",
  apply_effect_color_to_overlay = true,
  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,

  spritesheet = "__base__/graphics/terrain/out-of-map-transition/water-out-of-map-transition-tintable.png",
  layout = tile_spritesheet_layout.transition_4_4_8_1_1,
  background_enabled = false,

  apply_waving_effect_on_masks = true,
  waving_effect_time_scale = 0.005,
  mask_layout =
  {
    spritesheet = "__base__/graphics/terrain/masks/water-edge-transition.png",
    count = 1,
    double_side_count = 0,
    scale = 0.5,
    outer_corner_x = 64,
    side_x = 128,
    u_transition_x = 192,
    o_transition_x = 256,
    y = 0
  }
}

--- max tile layer on nauvis is 33(nuclear_ground), this should generally be above that. Conctrete starts at 100, which this should not be above

local lava_stone_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-cold.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = lava_tile_type_names,
    transition_group = lava_transition_group_id,
    spritesheet = "__space-age__/graphics/terrain/lava-transitions/lava-stone.png",
    lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/lava-transitions/lava-stone-lightmap.png" },
     -- this added the lightmap spritesheet
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/lava-transitions/lava-stone-lightmap.png" },
     -- this added the lightmap spritesheet
    effect_map_layout =
    {
      spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = {"out-of-map","empty-space","oil-ocean-shallow"},
    transition_group = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_4_4_8_1_1,
    overlay_enabled = false
  }
}

local lava_stone_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-cold-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = lava_patch
  },

  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/lava-stone-cold-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      o_transition_count = 0
    }
  },

  {
    transition_group1 = default_transition_group_id,
    transition_group2 = lava_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/lava-transitions/lava-stone-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = lava_patch
  },

  {
    transition_group1 = lava_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/lava-stone-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-to-out-of-map-mask.png",
      o_transition_count = 0
    }
  },
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    overlay_enabled = false
  }
}





--define ranges for all tilesets. Having these as thier own expressions helps with debugging and also modifying things like decorative placement
data:extend({
  scaled_cliff(
    {
      mod_name = "__panglia_planet_assets__",
      name = "cliff-panglia",
      suffix = "panglia",
      subfolder = "panglia",
      scale = 1.0,
      has_lower_layer = false,
      sprite_size_multiplier = 2,
      map_color = util.color("#34342b"),
    }
  ),


  {
    type = "item-subgroup",
    name = "panglia-tiles",
    group = "tiles",
    order = "ka-panglia"
  },



  {
    type = "noise-expression",
    name = "vulcanus_metal_tile",
    expression = "max(0, vulcanus_tungsten_ore_probability)"
  },

  ---- BASALTS
  -- aux controls rocky outcrop pounts.
  -- high-medium aux is cracks
  -- low aux is smooth
  -- hotter is lower elevation
  {
    type = "noise-expression",
    name ="volcanic_cracks_hot_range",
    expression = "vulcanus_basalts_biome * range_select_base(vulcanus_elev, 0, 8, 1, 0, 20)"
  },
  {
    type = "noise-expression",
    name ="volcanic_cracks_warm_range",
    expression = "vulcanus_basalts_biome * range_select_base(vulcanus_elev, 8, 22, 1, 0, 5)\z
                  + (aux - 0.05)\z
                  + 50000 * vulcanus_metal_tile"
  },
  {
    type = "noise-expression",
    name = "volcanic_cracks_cold_range",
    expression = "(0.5 - vulcanus_ashlands_biome) * range_select_base(vulcanus_elev, 20, 100, 1, 0, 1)\z
                  + (aux - 0.3)"
  },
  {
    type = "noise-expression",
    name = "volcanic_smooth_stone_warm_range",
    expression = "vulcanus_basalts_biome * range_select_base(vulcanus_elev, 8, 20, 1, 0, 5)\z
                  - (aux - 0.05)\z
                  + 50000 * vulcanus_metal_tile"
  },
  {
    type = "noise-expression",
    name = "volcanic_smooth_stone_range",
    expression = "(0.5 - vulcanus_ashlands_biome) * range_select_base(vulcanus_elev, 20, 100, 1, 0, 1)\z
                  - (aux - 0.3)"
  },

  -- MOUNTAINS
  -- lumps (jagged/cold folded) are on high aux.
  -- depression channels (hot folded, soil) are low aux.
  -- folded is higher up the mountain.
  -- hot folded is closest to the center.
  -- jagged ground identifies rocky peacks and resource patches.
  -- flat folded ix between extremes
  {
    type = "noise-expression",
    name = "volcanic_folds_flat_range",
    expression = "2 * (vulcanus_mountains_biome - 0.5) - 0.15 * mountain_volcano_spots"
  },
  {
    type = "noise-expression",
    name = "volcanic_folds_range",
    expression = "2 * (vulcanus_mountains_biome - 0.5) + (aux - 0.5) + 0.5 * (mountain_volcano_spots - 0.1)"

  },
  {
    type = "noise-expression",
    name = "volcanic_folds_warm_range",
    expression = "2 * (vulcanus_mountains_biome - 0.5) + 3 * (mountain_volcano_spots - 0.85) - 2 * (aux - 0.5)"
  },
  {
    type = "noise-expression",
    name ="volcanic_jagged_ground_range",
    -- volcano peak circle is expected to be 1020 to 1030, The cliff is at 1020
    expression = "5 * min(10, max(vulcanus_calcite_region + 0.2,\z
                                  range_select_base(vulcanus_elev, 1010, 2000, 2, -10, 1) + 3 * (aux - 0.5)))"
  },
  {
    type = "noise-expression",
    name ="volcanic_soil_light_range_mountains",
    expression = "min(0.8, 4 * (vulcanus_mountains_biome - 0.25)) - 0.35 * mountain_volcano_spots - 3 * (aux - 0.2)"
  },
  {
    type = "noise-expression",
    name ="volcanic_soil_dark_range_mountains",
    expression = "min(0.8, 4 * (vulcanus_mountains_biome - 0.25)) - 0.35 * mountain_volcano_spots - 1 * (aux - 0.5)"
  },

  -- Ashlands
  -- Low aux low moisture is ash
  -- Low aux high moisture is trees & grass.
  -- High aux low moisture is chimneys and rocks.
  -- High aux high moisture is rocks with pita
  {
    type = "noise-expression",
    name = "volcanic_ash_flats_range",
    expression = "2 * (vulcanus_ashlands_biome - 0.5)\z
                  - 1.5 * (aux - 0.25)\z
                  - 1.5 * (moisture - 0.6)"
  },
  {
    type = "noise-expression",
    name = "volcanic_ash_light_range",
    expression = "2 * (vulcanus_ashlands_biome - 0.5)\z
                  - 1.5 * (moisture - 0.6)"
  },
  {
    type = "noise-expression",
    name = "volcanic_ash_dark_range",
    expression = "min(1, 4 * (vulcanus_ashlands_biome - 0.25))\z
                  + max(-1.5 * (aux - 0.25),\z
                        0.01 - 1.5 * abs(aux - 0.5) - 1.5 * (moisture - 0.66))"
    -- the last part is an axtra line blending ash cracks to light ash
  },
  {
    type = "noise-expression",
    name = "volcanic_pumice_stones_range",
    expression = "2 * (vulcanus_ashlands_biome - 0.5)\z
                  + 1.5 * (aux - 0.5)\z
                  + 1.5 * (moisture - 0.66)"
  },
  {
    type = "noise-expression",
    name = "volcanic_ash_cracks_range",
    expression = "min(1, 4 * (vulcanus_ashlands_biome - 0.25))\z
                  + 1.5 * (aux - 0.5)\z
                  - 1.5 * (moisture - 0.66)"
  },
  {
    type = "noise-expression",
    name = "volcanic_ash_soil_range",
    expression = "2 * (vulcanus_ashlands_biome - 0.5)"
  },
  {
    type = "noise-expression",
    name = "volcanic_soil_light_range_ashlands",
    expression = "2 * (vulcanus_ashlands_biome - 0.5)\z
                  + 1.5 * (moisture - 0.8)"
  },
  {
    type = "noise-expression",
    name = "volcanic_soil_dark_range_ashlands",
    expression = "2 * (vulcanus_ashlands_biome - 0.5)\z
                  - 1.5 * (aux - 0.25)\z
                  + 1.5 * (moisture - 0.8)"
  },

  -- COMBINE SHARED
  {
    type = "noise-expression",
    name = "volcanic_soil_light_range",
    expression = "max(volcanic_soil_light_range_mountains, volcanic_soil_light_range_ashlands, 10 * (vulcanus_sulfuric_acid_region_patchy + 0.2))"
  },
  {
    type = "noise-expression",
    name = "volcanic_soil_dark_range",
    expression = "max(volcanic_soil_dark_range_mountains, volcanic_soil_dark_range_ashlands)"
  },




--    ██    ██ ██    ██ ██       ██████  █████  ███    ██ ██    ██ ███████     ████████ ██ ██      ███████ ███████ 
--    ██    ██ ██    ██ ██      ██      ██   ██ ████   ██ ██    ██ ██             ██    ██ ██      ██      ██      
--    ██    ██ ██    ██ ██      ██      ███████ ██ ██  ██ ██    ██ ███████        ██    ██ ██      █████   ███████ 
--     ██  ██  ██    ██ ██      ██      ██   ██ ██  ██ ██ ██    ██      ██        ██    ██ ██      ██           ██ 
--      ████    ██████  ███████  ██████ ██   ██ ██   ████  ██████  ███████        ██    ██ ███████ ███████ ███████ 


  ----------- CLIFF TILE
  {
    type = "tile",
    name = "panglia-volcanic-jagged-ground",
    subgroup = "panglia-tiles",
    order = "a-k",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_jagged_ground_range"
    },
    layer = vulcanus_tile_offset + 5,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      terrain .. "volcanic-jagged-ground.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.rocky_stone({}),
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = util.color("#3a352a"),
  },
  
  ----------- WARM CRACKS
  {
    type = "tile",
    name = "panglia-volcanic-cracks-hot",
    subgroup = "panglia-tiles",
    order = "a-c",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_cracks_hot_range"
    },
    layer = vulcanus_tile_offset + 2,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions_and_light(
      terrain .. "volcanic-cracks-hot.png",
      terrain .. "volcanic-cracks-hot-light.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.warm_stone,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = util.color("#2f341e"),
  },
  {
    type = "tile",
    name = "panglia-volcanic-cracks-warm",
    subgroup = "panglia-tiles",
    order = "a-d",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_cracks_warm_range"
    },
    layer = vulcanus_tile_offset + 3,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions_and_light(
      terrain .. "volcanic-cracks-warm.png",
      terrain .. "volcanic-cracks-warm-lightmap1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.warm_stone,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = util.color("#353730"),
  },
  ----------- COLD CRACKS
  {
    type = "tile",
    name = "panglia-volcanic-cracks",
    subgroup = "panglia-tiles",
    order = "a-e",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_cracks_cold_range"
    },
    layer = vulcanus_tile_offset + 4,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      terrain .. "volcanic-cracks.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.rocky_stone({}),
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = util.color("#494b35"),
  },
  ----------- COLD LAVA FLAT
  {
    type = "tile",
    name = "panglia-volcanic-folds-flat",
    subgroup = "panglia-tiles",
    order = "a-j",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_folds_flat_range"
    },
    layer = vulcanus_tile_offset + 16,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      terrain .. "volcanic-folds-flat.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.rugged_stone({}),
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = util.color("#36352b"),

  },
  ----------- ASH SAND
  {
    type = "tile",
    name = "panglia-volcanic-ash-light",
    subgroup = "panglia-tiles",
    order = "a-o",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_ash_light_range"
    },
    layer = vulcanus_tile_offset + 14,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      terrain .. "volcanic-ash-light.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.soft_sand({}),
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = base_tile_sounds.driving.sand,
    can_be_part_of_blueprint = false,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect(),
    map_color = util.color("#373a33"),
  },
  {
    type = "tile",
    name = "panglia-volcanic-ash-dark",
    subgroup = "panglia-tiles",
    order = "a-p",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_ash_dark_range"
    },
    layer = vulcanus_tile_offset + 13,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      terrain .. "volcanic-ash-dark.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.soft_sand({}),
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = base_tile_sounds.driving.sand,
    can_be_part_of_blueprint = false,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect(),
    map_color = util.color("#464a43"),
  },
  ----------- ASH SAND
  {
    type = "tile",
    name = "panglia-volcanic-ash-flats",
    subgroup = "panglia-tiles",
    order = "a-o",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_ash_flats_range"
    },
    layer = vulcanus_tile_offset + 12,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      terrain .. "volcanic-ash-flats.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.soft_sand({}),
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = base_tile_sounds.driving.sand,
    can_be_part_of_blueprint = false,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect(),
    map_color = util.color("#323832"),
  },
  ----------- PUMICE
  {
    type = "tile",
    name = "panglia-volcanic-pumice-stones",
    subgroup = "panglia-tiles",
    order = "a-n",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_pumice_stones_range"
    },
    layer = vulcanus_tile_offset + 15,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      terrain .. "volcanic-pumice-stones.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.rocky_stone({}),
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = util.color("#2d2e27"),
  },
  ----------- SMOOTH STONE
  {
    type = "tile",
    name = "panglia-volcanic-smooth-stone",
    subgroup = "panglia-tiles",
    order = "a-g",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_smooth_stone_range"
    },
    layer = vulcanus_tile_offset + 1,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      terrain .. "volcanic-smooth-stone.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.rocky_stone({}),
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = util.color("#262622"),

  },
  ----------- SMOOTH STONE WARM
  {
    type = "tile",
    name = "panglia-volcanic-smooth-stone-warm",
    subgroup = "panglia-tiles",
    order = "a-f",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_smooth_stone_warm_range"
    },
    layer = vulcanus_tile_offset,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions_and_light(
      terrain .. "volcanic-smooth-stone-warm.png",
      terrain .. "volcanic-smooth-stone-warm-lightmap.png",

      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.warm_stone,
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    absorptions_per_second = tile_pollution.lava,
    map_color = util.color("#292a21"),
  },
  {
    type = "tile",
    name = "panglia-volcanic-ash-cracks",
    subgroup = "panglia-tiles",
    order = "a-r",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_ash_cracks_range"
    },
    layer = vulcanus_tile_offset + 6,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      terrain .. "volcanic-ash-cracks.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.rugged_stone({}),
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    absorptions_per_second = tile_pollution.lava,
    map_color = util.color("#27261e"),
  },
  {
    type = "tile",
    name = "panglia-volcanic-folds",
    subgroup = "panglia-tiles",
    order = "a-i",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_folds_range"
    },
    layer = vulcanus_tile_offset + 18,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      terrain .. "volcanic-folds.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.rugged_stone({}),
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = util.color("#1d1f1a"),
  },
  {
    type = "tile",
    name = "panglia-volcanic-folds-warm",
    subgroup = "panglia-tiles",
    order = "a-h",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_folds_warm_range"
    },
    layer = vulcanus_tile_offset + 17,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions_and_light(
      terrain .. "volcanic-folds-warm.png",
      terrain .. "volcanic-folds-warm-lightmap.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.rocky_stone({}),
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = util.color("#1f201d"),
  },
  {
    type = "tile",
    name = "panglia-volcanic-soil-dark",
    subgroup = "panglia-tiles",
    order = "a-l",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_soil_dark_range",
    },
    layer = vulcanus_tile_offset + 7,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      terrain .. "volcanic-soil-dark.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
      }
    ),
    -- tint={0.8, 0.75, 0.8},
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.soft_sand({}),
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = base_tile_sounds.driving.sand,
    map_color = util.color("#2b2a21"),
  },
  {
    type = "tile",
    name = "panglia-volcanic-soil-light",
    subgroup = "panglia-tiles",
    order = "a-m",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_soil_light_range"
    },
    layer = vulcanus_tile_offset + 8,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      terrain .. "volcanic-soil-light.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
      }
    ),
    -- tint={0.6, 0.55, 0.55},
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.soft_sand({}),
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = base_tile_sounds.driving.sand,
    map_color = util.color("#2f2c26"),
  },

  {
    type = "tile",
    name = "panglia-volcanic-ash-soil",
    subgroup = "panglia-tiles",
    order = "a-q",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "volcanic_ash_soil_range"
    },
    layer = vulcanus_tile_offset + 11,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      terrain .. "volcanic-ash-soil.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.soft_sand({}),
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = base_tile_sounds.driving.sand,
    map_color = util.color("#34372f"),
  },

})



--     ██████  ██      ███████ ██████   █████      ████████ ██ ██      ███████ ███████ 
--    ██       ██      ██      ██   ██ ██   ██        ██    ██ ██      ██      ██      
--    ██   ███ ██      █████   ██████  ███████        ██    ██ ██      █████   ███████ 
--    ██    ██ ██      ██      ██   ██ ██   ██        ██    ██ ██      ██           ██ 
--     ██████  ███████ ███████ ██████  ██   ██        ██    ██ ███████ ███████ ███████ 

data:extend({
  {
    type = "tile",
    name = "panglia-midland-turquoise-bark",
    order = "c[gleba-land-tiles]-a[midland-turquoise-bark]",
    subgroup = "panglia-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer = gleba_tile_offset + 11,
    sprite_usage_surface = "gleba",
    variants = tile_variations_template_with_transitions_and_effect_map(
      terrain .. "midland-turquoise-bark.png",
      terrain .. "water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
      }
    ),
    autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0, 0.35, 0.2, 0, 1) + 0.2 * gleba_temperature_normalised"},
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.soft_bark,
    landing_steps_sound = tile_sounds.landing.bark,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect(),
    map_color = util.color("#414c38"),
  },
  {
    type = "tile",
    name = "panglia-midland-turquoise-bark-2",
    order = "c[gleba-land-tiles]-a[midland-turquoise-bark]",
    subgroup = "panglia-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer = gleba_tile_offset + 10,
    sprite_usage_surface = "gleba",
    variants = tile_variations_template_with_transitions_and_effect_map(
      terrain .. "midland-turquoise-bark-2.png",
      terrain .. "water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
      }
    ),
    autoplace = {probability_expression = "gleba_midland * gleba_select(gleba_aux, 0.05, 0.4, 0.2, 0, 1) - 0.2 * gleba_temperature_normalised"},
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.soft_bark,
    landing_steps_sound = tile_sounds.landing.bark,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect(),
    map_color = util.color("#55553b"),
  },


  {
    type = "tile-effect",
    name = "panglia-wetland-grey",
    shader = "water",
    water =
    {
      shader_variation = "wetland-water",
      lightmap_alpha = 0, -- needed for water mask
      
      noise_textures =
      {
        {
          filename = terrain .. "watercaustics.png",
          size = 512
        }
      },
      image_textures =
      {
        {
          filename = terrain .. "wetland-dead-skin-shader.png",
        }
      },



------------ for pre-2.1.22 versions
      textures =
      {
        {
          filename = terrain .. "watercaustics.png",
          width = 512,
          height = 512
        },
        {
          filename = terrain .. "wetland-dead-skin-shader.png",
          width = 512 * 4,
          height = 512 * 4
        }
      },

      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 4,

-------------------
      
      animation_speed = 3.5,
      animation_scale = { 0.8, 0.8 },
      tick_scale = 6,
      specular_lightness = { 111, 126, 15 },
      foam_color = { 121, 14, 14 },
      foam_color_multiplier = 1,
      dark_threshold = { 0.3, 0.3 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.19, 0.25 },
      near_zoom = 1 / 16,
      far_zoom = 1 / 16,
    }
  },

  {
    type = "tile",
    name = "panglia-wetland-dead-skin",
    order = "b[wetland]-d[wetland-dead-skin]",
    subgroup = "panglia-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_aux_2 + 2 * min(gleba_select(gleba_aux, 0.3, 0.7, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "panglia-wetland-grey",
    effect_color = { 57, 58, 173 },
    effect_color_secondary = { 76, 70, 179 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 7,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = terrain .. "wetland-dead-skin.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = tile_sounds.walking.wetland,
    landing_steps_sound = tile_sounds.landing.wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.insects_deep_mud({}),
      tile_sounds.ambient.night_insects,
    },
    walking_speed_modifier = 0.8,
    vehicle_friction_modifier = 8.0,
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    map_color = util.color("#373889"),
  },
  {
    type = "tile",
    name = "panglia-wetland-light-dead-skin",
    order = "b[wetland]-c[wetland-light-dead-skin]",
    subgroup = "panglia-tiles",
    collision_mask = tile_collision_masks.shallow_water(),
    autoplace = {probability_expression = "gleba_shallows_edge_aux_2 + 2 * min(gleba_select(gleba_aux, 0.3, 0.7, 0.005, 0, 1), gleba_rockpools_shallow)"},
    lowland_fog = true,
    effect = "panglia-wetland-grey",
    effect_color = { 78, 75, 186 },
    effect_color_secondary = { 76, 70, 179 },
    particle_tints = tile_graphics.gleba_shallow_water_particle_tints,
    layer = 7,
    layer_group = "water-overlay",
    sprite_usage_surface = "gleba",
    variants =
    {
      main =
      {
        {
          picture = terrain .. "wetland-dead-skin.png",
          count = 1,
          scale = 0.5,
          size = 1
        }
      },
      transition = tile_graphics.generic_masked_tile_transitions1
    },
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = tile_sounds.walking.wetland,
    landing_steps_sound = tile_sounds.landing.semi_wet,
    driving_sound = tile_sounds.driving.wetland,
    ambient_sounds =
    {
      tile_sounds.ambient.insects_deep_mud({}),
      tile_sounds.ambient.night_insects,
    },
    trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
    default_cover_tile = "landfill",
    fluid = "water",
    map_color = util.color("#3e3f90"),
  },
  {
    type = "tile",
    name = "panglia-midland-cracked-lichen-dark",
    order = "c[gleba-land-tiles]-a[midland-yellow-crust]",
    subgroup = "panglia-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer_group = "ground-natural",
    layer = gleba_tile_offset,
    autoplace = {probability_expression = "max(1.08 * gleba_midland * gleba_select(gleba_aux, 0, 0.55, 0.1, 0, 1), 1.15 * gleba_highland) + 0.3 * (gleba_plants_noise_b - 0.7)"},
    sprite_usage_surface = "gleba",
    variants = tile_variations_template_with_transitions_and_effect_map(
      terrain .. "cracked-lichen-dark.png",
      terrain .. "water-gleba-mask.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = tile_sounds.walking.soft_bark,
    landing_steps_sound = tile_sounds.landing.bark,
    absorptions_per_second = tile_pollution.gleba,
    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect(),
    map_color = util.color("#423e2b"),
  },


--    ████████ ██ ███    ███ ███████     ███████  ██████  ███    ██ ███████ 
--       ██    ██ ████  ████ ██             ███  ██    ██ ████   ██ ██      
--       ██    ██ ██ ████ ██ █████         ███   ██    ██ ██ ██  ██ █████   
--       ██    ██ ██  ██  ██ ██           ███    ██    ██ ██  ██ ██ ██      
--       ██    ██ ██      ██ ███████     ███████  ██████  ██   ████ ███████ 


  {
    type = "collision-layer",
    name = "panglia_hidden_beacon_tile",
    order = "40",
  },
  {
    type = "tile",
    name = "panglia_hidden_beacon_tile",
    order = "c[artificial]-d[machinery]",
    subgroup = "panglia-tiles",
    collision_mask = {layers={ground_tile=true, panglia_hidden_beacon_tile=true}},
    layer = 12,
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = terrain .. "fulgoran-sand.png",
        line_length = 1,
        count = 1,
        scale = 0.5
      },
      material_texture_width_in_tiles = 32,
      material_texture_height_in_tiles = 28
    },
    transitions = fulgora_rock_sand_transitions,
    transitions_between_transitions = fulgora_sand_transitions_between_transitions,
    walking_sound = tile_sounds.walking.scraps,
    landing_steps_sound = tile_sounds.landing.scraps,
    driving_sound = tile_sounds.driving.metal_rock,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect(),
    walking_speed_modifier = 3,
    vehicle_friction_modifier = 0.1,
    map_color = util.color("#95815e"),
  },

})

table.insert(water_tile_type_names, "panglia-wetland-light-dead-skin")
table.insert(water_tile_type_names, "panglia-wetland-dead-skin")



if data.raw["item"]["landfill"] and data.raw["item"]["landfill"].place_as_tile and data.raw["item"]["landfill"].place_as_tile.tile_condition then
  table.insert(data.raw["item"]["landfill"].place_as_tile.tile_condition, "panglia-wetland-light-dead-skin")
  table.insert(data.raw["item"]["landfill"].place_as_tile.tile_condition, "panglia-wetland-dead-skin")
end

if data.raw["item"]["foundation"] and data.raw["item"]["foundation"].place_as_tile and data.raw["item"]["foundation"].place_as_tile.tile_condition then
  table.insert(data.raw["item"]["foundation"].place_as_tile.tile_condition, "panglia-wetland-light-dead-skin")
  table.insert(data.raw["item"]["foundation"].place_as_tile.tile_condition, "panglia-wetland-dead-skin")
end