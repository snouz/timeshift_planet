local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
local panglia_only = {{property = "pressure", min = 1401, max = 1401}}
local size = 6
local pipedistance = 0.5
local pipedistance2 = 0.5
local animspeed = 0.3

local soundspath = "__panglia_planet_assets__/sounds/"

local entityname = "panglia_dna_scanner"
local entity = "__panglia_planet_assets__/graphics/entity/panglia_dna_scanner/"



local make_simulation = function(name)
  return
  [[
    game.simulation.camera_position = {0, 0}
    game.simulation.camera_zoom = 0.8
    for x = -16, 16, 1 do
      for y = -8, 8 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "space-platform-foundation"}}
      end
    end

    game.surfaces[1].create_entity{name = "]]..name..[[", position = {0, 0}}

  ]]
end


--     ██████  ██████   █████  ██████  ██   ██ ██  ██████ ███████ 
--    ██       ██   ██ ██   ██ ██   ██ ██   ██ ██ ██      ██      
--    ██   ███ ██████  ███████ ██████  ███████ ██ ██      ███████ 
--    ██    ██ ██   ██ ██   ██ ██      ██   ██ ██ ██           ██ 
--     ██████  ██   ██ ██   ██ ██      ██   ██ ██  ██████ ███████ 

empty = {filename = "__panglia_planet_assets__/graphics/empty.png", size = 1}

local pipe_connectors = {
  north = empty,
  east =
  {
    filename = entity .. entityname .. "_pipeE.png",
    shift = {-1, 0},
    width = 128,
    height = 128,
    scale = 0.5,
  },
  south =
  {
    filename = entity .. entityname .. "_pipeS.png",
    shift = {0, -1},
    width = 128,
    height = 128,
    scale = 0.5,
  },
  west =
  {
    filename = entity .. entityname .. "_pipeW.png",
    shift = {1, 0},
    width = 128,
    height = 128,
    scale = 0.5,
  },
}


local graphicsset = 
{
  animation_progress = 0.5,
  always_draw_idle_animation = true,
  states =
  {
    {
      name = "idle",
      duration = 1,
      next_active = "working",
      next_inactive = "idle",
    },
    {
      name = "working",
      duration = 100,
      next_active = "working",
      next_inactive = "idle",
    },
  },
  working_visualisations =
  {
    {
      effect = "uranium-glow",
      render_layer = "item-in-inserter-hand",
      draw_in_states = {"working"},
      always_draw = true,
      fadeout = true,
      light = {intensity = 0.5, size = 17, shift = {0, 0}, color = util.color("#d17849")}
    },
    {
      name = "running_anim",
      constant_speed = true,
      always_draw = true,
      draw_in_states = {"working", "idle"},
      frame_based_on_shift_animation_progress = true,
      render_layer = "object",
      secondary_draw_order = -10,
      animation = 
      {
        layers = 
        {
          {
            animation_speed = 0.5,
            scale = 0.5,
            filename = entity .. "/quantum-stabilizer-hr-animation-1.png",
            blend_mode = "normal",
            width = 410,
            height = 410,
            line_length = 8,
            lines_per_file = 13,
            frame_count = 100,
            shift = util.by_pixel_hr(0, 0),
          },
        },
      },
    },
    {
      name = "running_light",
      constant_speed = true,
      always_draw = true,
      draw_in_states = {"working"},
      fadeout = true,
      effect = "flicker",
      frame_based_on_shift_animation_progress = true,
      render_layer = "object",
      secondary_draw_order = -9,
      animation = 
      {
        layers = 
        {
          {
            animation_speed = 0.5,
            scale = 0.5,
            filename = entity .. "/quantum-stabilizer-hr-emission-1.png",
            blend_mode = "additive",
            width = 410,
            height = 410,
            line_length = 8,
            lines_per_file = 13,
            frame_count = 100,
            shift = util.by_pixel_hr(0, 0),
            draw_as_glow = true,
          },
        },
      },
    },
    {
      name = "dna_helix",
      constant_speed = false,
      always_draw = true,
      draw_in_states = {"working"},
      fadeout = true,
      effect = "flicker",
      frame_based_on_shift_animation_progress = false,
      apply_recipe_tint = "secondary",
      render_layer = "object",
      secondary_draw_order = -7,
      animation = 
      {
        layers = 
        {
          {
            animation_speed = 1,
            scale = 0.5,
            filename = entity .. entityname .. "_dna_helix.png",
            blend_mode = "additive",
            width = 250,
            height = 250,
            line_length = 13,
            lines_per_file = 3,
            frame_count = 39,
            shift = util.by_pixel_hr(0, -83),
            draw_as_glow = true,
          },
        },
      },
    },

    {
      name = "base",
      constant_speed = true,
      always_draw = true,
      draw_in_states = {"working", "idle"},
      --frame_based_on_shift_animation_progress = true,
      render_layer = "object",
      secondary_draw_order = 0,
      animation = 
      {
        layers =
        {
          {
            filename = entity .. entityname .. "_base.png",
            width = 512,
            height = 512,
            shift = util.by_pixel_hr(0, 0),
            animation_speed = animspeed,
            scale = 0.5,
          },
          {
            filename = entity .. entityname .. "_shadow.png",
            width = 512,
            height = 512,
            shift = util.by_pixel_hr(0, 0),
            animation_speed = animspeed,
            scale = 0.5,
            draw_as_shadow = true,
          },
        }
      },
    },




    {
      name = "running_light_over",
      constant_speed = true,
      always_draw = true,
      draw_in_states = {"working"},
      fadeout = true,
      effect = "flicker",
      frame_based_on_shift_animation_progress = false,
      render_layer = "object",
      secondary_draw_order = 8,
      animation = 
      {
        layers = 
        {
          {
            animation_speed = 0.5,
            scale = 0.5,
            filename = entity .. "/panglia_dna_scanner_light.png",
            blend_mode = "additive",
            width = 512,
            height = 512,
            line_length = 1,
            lines_per_file = 1,
            repeat_count = 1,
            shift = util.by_pixel_hr(0, 0),
            draw_as_glow = true,
          },
        },
      },
    },
    {
      name = "armilory_animated",
      constant_speed = false,
      always_draw = true,
      draw_in_states = {"working", "idle"},
      frame_based_on_shift_animation_progress = true,
      render_layer = "object",
      secondary_draw_order = 9,
      animation = 
      {
        layers = 
        {
          {
            animation_speed = 0.1,
            scale = 0.5,
            filename = entity .. entityname .. "_armilory.png",
            width = 256,
            height = 256,
            line_length = 8,
            lines_per_file = 3,
            frame_count = 24,
            repeat_count = 2,
            shift = util.by_pixel_hr(2, -162),
          },
        },
      },
    },
    
    {
      name = "armilory_animated_light",
      constant_speed = false,
      always_draw = true,
      draw_in_states = {"working"},
      fadeout = true,
      frame_based_on_shift_animation_progress = true,
      render_layer = "object",
      secondary_draw_order = 10,
      animation = 
      {
        layers = 
        {
          {
            animation_speed = 0.1,
            scale = 0.5,
            filename = entity .. entityname .. "_armilory_light.png",
            width = 256,
            height = 256,
            line_length = 8,
            lines_per_file = 3,
            frame_count = 24,
            repeat_count = 2,
            shift = util.by_pixel_hr(2, -162),
            draw_as_glow = true,
            blend_mode = "additive",
          },
        },
      },
    },
  },
  water_reflection =
  {
    pictures =
    {
      filename = entity .. entityname .. "_water_reflection.png",
      width = 51,
      height = 51,
      variation_count = 1,
      scale = 5,
      shift = util.by_pixel_hr(0, 157)
    }
  },

  frozen_patch = {
    filename = entity .. entityname .. "_frozen.png",
    width = 512,
    height = 512,
    scale = 0.5,
  }
}

--    ██ ████████ ███████ ███    ███ 
--    ██    ██    ██      ████  ████ 
--    ██    ██    █████   ██ ████ ██ 
--    ██    ██    ██      ██  ██  ██ 
--    ██    ██    ███████ ██      ██ 

data:extend({

  {
    type = "item",
    name = entityname,
    icon = "__panglia_planet__/graphics/icons/panglia_dna_scanner.png",
    subgroup = "panglia-production-machine",
    order = "a3[".. entityname .."]",
    place_result = entityname,
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    stack_size = 20,
    weight = 200 * kg
  },

  {
    type = "recipe",
    name = entityname,
    energy_required = 5,
    categories = {"crafting"},
    ingredients =
    {
      {type = "item", name = "data-processor", amount = 1},
      {type = "item", name = "laser-turret", amount = 4},
      {type = "item", name = "3d-data-storage", amount = 40},
      {type = "item", name = "panglia_panglite_glass", amount = 10},
    },
    results = {{type = "item", name = entityname, amount = 1}},
    allow_productivity = false,
    enabled = false,
    auto_recycle = false,
    surface_conditions = panglia_only,
    sort_item_ingredients = false,
  },

--    ███████ ███    ██ ████████ ██ ████████ ██    ██ 
--    ██      ████   ██    ██    ██    ██     ██  ██  
--    █████   ██ ██  ██    ██    ██    ██      ████   
--    ██      ██  ██ ██    ██    ██    ██       ██    
--    ███████ ██   ████    ██    ██    ██       ██    

  {
    type = "corpse",
    name = entityname .. "-remnants",
    icon = "__panglia_planet__/graphics/icons/panglia_dna_scanner.png",
    flags = {"placeable-neutral", "not-on-map", "not-rotatable"},
    hidden_in_factoriopedia = true,
    subgroup = "production-machine-remnants",
    order = "a-a-a",
    selection_box = {{-(size/2), -(size/2)}, {(size/2), (size/2)}},
    tile_width = size,
    tile_height = size,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    animation = {
      filename = entity .. entityname .. "_remnants.png",
      priority="high",
      width = 512,
      height = 512,
      line_length = 1,
      scale = 0.5,
      --shift = util.by_pixel_hr(0, -64),
    },
  },
  {
    type = "assembling-machine",
    name = entityname,
    icon = "__panglia_planet__/graphics/icons/panglia_dna_scanner.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = entityname},
    crafting_categories = {"dna_scanning"},
    max_health = 300,
    corpse = entityname .. "-remnants",
    dying_explosion = "assembling-machine-1-explosion",
    show_recipe_icon = false,
    icon_draw_specification = {shift = {0, 0}, scale = 1},
    resistances = {},
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = pipe_connectors,
        volume = 20000,
        pipe_connections = {
          {flow_direction = "input", direction = defines.direction.west, position = {-((size/2)-0.5), pipedistance}, connection_category = "data"},
          {flow_direction = "input", direction = defines.direction.west, position = {-((size/2)-0.5), -pipedistance}, connection_category = "data"},
        },
        secondary_draw_orders = {east = -12, west = -12, north = -12, south = 4},
        render_layer = "object",
        max_pipeline_extent = 1000000,
      },
      {
        production_type = "output",
        pipe_picture = pipe_connectors,
        volume = 20000,
        pipe_connections = {
          {flow_direction = "output", direction = defines.direction.east, position = {((size/2)-0.5), pipedistance}, connection_category = "data"},
          {flow_direction = "output", direction = defines.direction.east, position = {((size/2)-0.5), -pipedistance}, connection_category = "data"},
        },
        secondary_draw_orders = {east = -12, west = -12, north = -12, south = 4},
        render_layer = "object",
        max_pipeline_extent = 1000000,
      },
    },
    use_mirroring = true,
    collision_box = {{-((size/2)-0.3), -((size/2)-0.3)}, {((size/2)-0.3), ((size/2)-0.3)}},
    selection_box = {{-(size/2), -(size/2)}, {(size/2), (size/2)}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = entityname,
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions.create_vector
    (
      universal_connector_template,
      {
        { variation = 7, main_offset = util.by_pixel_hr(-85, 105), shadow_offset = util.by_pixel_hr(-10, 179), show_shadow = true },
        { variation = 7, main_offset = util.by_pixel_hr(-85, 105), shadow_offset = util.by_pixel_hr(-10, 179), show_shadow = true },
        { variation = 7, main_offset = util.by_pixel_hr(-85, 105), shadow_offset = util.by_pixel_hr(-10, 179), show_shadow = true },
        { variation = 7, main_offset = util.by_pixel_hr(-85, 105), shadow_offset = util.by_pixel_hr(-10, 179), show_shadow = true }
      }
    ),
    alert_icon_shift = util.by_pixel(0, 0),
    graphics_set = graphicsset,
    --graphics_set_flipped  = graphicsset,
    match_animation_speed_to_activity = true,
    
    perceived_performance  = {minimum = 0.5, maximum = 5},


    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      --emissions_per_minute = { pollution = 4 }
      drain = "1kW",
    },
    energy_usage = "30kW",
    heating_energy = "200kW",
    module_slots = 2,
    allowed_effects = {"speed", "consumption", "pollution", "productivity"},
    effect_receiver = {uses_module_effects = true, uses_beacon_effects = true, uses_surface_effects = true},
    impact_category = "metal-large",
    open_sound = {filename = soundspath .. "tv_open.ogg", volume = 1},
    close_sound = {filename = soundspath .. "tv_close.ogg", volume = 1},
    working_sound =
    {
      sound = {filename = soundspath .. "dna_scanner.ogg", volume = 0.5},
      max_sounds_per_prototype = 5,
      fade_in_ticks = 20,
      fade_out_ticks = 20,
      sound_accents = {
        {
          sound = {filename = soundspath .. "dna_scanner_recurring.ogg", volume = 1.5},
          frame = 30,
          play_for_working_visualisation = "running_anim"
        },
      },
    },
  },
})