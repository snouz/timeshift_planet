require ("__base__.prototypes.entity.pipecovers")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
local panglia_only = {{property = "pressure", min = 1401, max = 1401}}
local size = 6
local pipedistance = 0.5
local pipedistance2 = 0.5
local animspeed = 0.2

local soundspath = "__panglia_planet_assets__/sounds/"

local entityname = "panglia_dna_builder"
local entityname2 = "panglia_dna_builder_phasetwo"
local entity = "__panglia_planet_assets__/graphics/entity/panglia_dna_builder/"

local wire = {variation = 14, main_offset = util.by_pixel_hr(-140, -89), shadow_offset = util.by_pixel_hr(-67, -16), show_shadow = true}

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
  north = 
  {
    filename = entity .. entityname .. "_pipeN.png",
    shift = {0, 1},
    width = 128,
    height = 128,
    scale = 0.5,
  },
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

local actual_pipe_connectors = {
  north = 
  {
    filename = entity .. entityname .. "_liquid-pipe-N.png",
    shift = {0, 1},
    width = 128,
    height = 128,
    scale = 0.5,
  },
  east =
  {
    filename = entity .. entityname .. "_liquid-pipe-E.png",
    shift = {-1, 0},
    width = 128,
    height = 128,
    scale = 0.5,
  },
  south =
  {
    filename = entity .. entityname .. "_liquid-pipe-S.png",
    shift = {0, -1},
    width = 128,
    height = 128,
    scale = 0.5,
  },
  west =
  {
    filename = entity .. entityname .. "_liquid-pipe-W.png",
    shift = {1, 0},
    width = 128,
    height = 128,
    scale = 0.5,
  },
}

local running_anim = 
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
        animation_speed = animspeed,
        scale = 0.5,
        filename = entity .. entityname .. "_anim.png",
        blend_mode = "normal",
        width = 366,
        height = 404,
        line_length = 8,
        lines_per_file = 4,
        frame_count = 32,
        shift = util.by_pixel_hr(201, -56),
      },
      {
        animation_speed = animspeed,
        scale = 0.5,
        filename = entity .. entityname .. "_anim_light.png",
        blend_mode = "normal",
        width = 366,
        height = 404,
        line_length = 8,
        lines_per_file = 4,
        frame_count = 32,
        shift = util.by_pixel_hr(201, -56),
        draw_as_glow = true,
        blend_mode = "additive",
      },
    },
  },
}


local screen_anim_base = function(num)
  return
  {
    apply_recipe_tint = "primary",
    name = "screen",
    constant_speed = false,
    always_draw = true,
    draw_in_states = {"working"},
    frame_based_on_shift_animation_progress = true,
    render_layer = "object",
    secondary_draw_order = 9,
    animation = 
    {
      layers = 
      {
        {
          animation_speed = animspeed,
          scale = 0.5,
          filename = entity .. entityname .. "_screen_anim".. num ..".png",
          width = 128,
          height = 192,
          line_length = 10,
          lines_per_file = 5,
          frame_count = 50,
          shift = util.by_pixel_hr(121, 45),
          draw_as_glow = true,
          blend_mode = "additive",
        },
      },
    },
  }
end

local screen_anim_when_changing = 
{
  apply_recipe_tint = "secondary",
  name = "screen",
  constant_speed = false,
  always_draw = true,
  draw_in_states = {"working"},
  frame_based_on_shift_animation_progress = true,
  render_layer = "object",
  secondary_draw_order = 9,
  animation = 
  {
    layers = 
    {
      {
        animation_speed = 0.2,
        scale = 0.5,
        filename = entity .. entityname .. "_screen_anim5.png",
        width = 128,
        height = 192,
        line_length = 10,
        lines_per_file = 5,
        frame_count = 50,
        shift = util.by_pixel_hr(121, 45),
        draw_as_glow = true,
        blend_mode = "additive",
      },
    },
  },
}

local base_image = function(num)
  return 
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
          filename = entity .. entityname .. "_base_" .. num ..".png",
          width = 512,
          height = 512,
          shift = util.by_pixel_hr(0, 0),
          animation_speed = animspeed,
          scale = 0.5,
        },
        {
          filename = entity .. entityname .. "_light_" .. num ..".png",
          width = 512,
          height = 512,
          shift = util.by_pixel_hr(0, 0),
          animation_speed = animspeed,
          scale = 0.5,
          draw_as_glow = true,
          blend_mode = "additive",
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
  }
end


local graphicsset = function(num)
  local visu = nil
  if num == 1 then
    visu = 
    {
      base_image(1),
      screen_anim_base(1),
      screen_anim_when_changing,
    }
  else
    visu = 
    {
      running_anim,
      base_image(2),
      screen_anim_base(2),
    }
  end

  return
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
        duration = 50,
        next_active = "working",
        next_inactive = "idle",
      },
    },
    working_visualisations = visu,
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
  }
end

data:extend({
    {
        type = "sound",
        name = "panglia_dna_builder_switch_to_phase1",
        category = "game-effect",
        filename = "__panglia_planet_assets__/sounds/panglia_dna_builder_switch_to_phase1.ogg",
        volume = 0.8,
    },
    {
        type = "sound",
        name = "panglia_dna_builder_switch_to_phase2",
        category = "game-effect",
        filename = "__panglia_planet_assets__/sounds/panglia_dna_builder_switch_to_phase2.ogg",
        volume = 0.8,
    }
})


--    ██ ████████ ███████ ███    ███ 
--    ██    ██    ██      ████  ████ 
--    ██    ██    █████   ██ ████ ██ 
--    ██    ██    ██      ██  ██  ██ 
--    ██    ██    ███████ ██      ██ 

data:extend({
  {
    type = "item",
    name = entityname,
    icon = "__panglia_planet__/graphics/icons/panglia_dna_builder.png",
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
    categories = {"crafting-with-fluid"},
    ingredients =
    {
      {type = "item", name = "panglia_dna_scanner", amount = 1},
      {type = "item", name = "ai-tier-3", amount = 10},
      {type = "item", name = "datacell-dna-raw", amount = 100},
      {type = "fluid", name = "panglia_branbalite_slurry", amount = 200},
    },
    results = {{type = "item", name = entityname, amount = 1}},
    allow_productivity = false,
    enabled = false,
    auto_recycle = true,
    allow_decomposition = false,
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
    icon = "__panglia_planet__/graphics/icons/panglia_dna_builder.png",
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

--    ██████  ██   ██  █████  ███████ ███████      ██ 
--    ██   ██ ██   ██ ██   ██ ██      ██          ███ 
--    ██████  ███████ ███████ ███████ █████        ██ 
--    ██      ██   ██ ██   ██      ██ ██           ██ 
--    ██      ██   ██ ██   ██ ███████ ███████      ██ 

  {
    --type = "furnace",
    type = "furnace",
    name = entityname,
    icon = "__panglia_planet__/graphics/icons/panglia_dna_builder.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = entityname},
    crafting_categories = {"dna_builder_1"},
    max_health = 400,
    corpse = entityname .. "-remnants",
    surface_conditions = panglia_only,
    dying_explosion = "assembling-machine-1-explosion",
    show_recipe_icon = false,
    icon_draw_specification = {shift = {0, 0}, scale = 1},
    resistances = {},
    result_inventory_size = 2,
    source_inventory_size = 1,
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = pipe_connectors,
        volume = 100,
        pipe_connections = {
          {flow_direction = "input", direction = defines.direction.north, position = {pipedistance, -((size/2)-0.5)}, connection_category = "data"},
          {flow_direction = "input", direction = defines.direction.north, position = {-pipedistance, -((size/2)-0.5)}, connection_category = "data"},
          {flow_direction = "input", direction = defines.direction.south, position = {pipedistance, ((size/2)-0.5)}, connection_category = "data"},
          {flow_direction = "input", direction = defines.direction.south, position = {-pipedistance, ((size/2)-0.5)}, connection_category = "data"},
        },
        secondary_draw_orders = {east = -12, west = -12, north = -12, south = 4},
        render_layer = "object",
        max_pipeline_extent = 1000000,
      },
    },
    collision_box = {{-((size/2)-0.3), -((size/2)-0.3)}, {((size/2)-0.3), ((size/2)-0.3)}},
    selection_box = {{-(size/2), -(size/2)}, {(size/2), (size/2)}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = entityname,
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions.create_vector(universal_connector_template, {wire,wire,wire,wire}),
    alert_icon_shift = util.by_pixel(0, 0),
    graphics_set = graphicsset(1),
    match_animation_speed_to_activity = true,
    perceived_performance  = {minimum = 0.5, maximum = 5},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW",
    },
    energy_usage = "30kW",
    module_slots = 2,
    allowed_effects = {"speed", "consumption", "pollution", "productivity"},
    effect_receiver = {uses_module_effects = true, uses_beacon_effects = true, uses_surface_effects = true},
    impact_category = "metal-large",
    open_sound = {filename = soundspath .. "dna_builder_open.ogg", volume = 1},
    close_sound = {filename = soundspath .. "dna_builder_close.ogg", volume = 1},
    build_sound = {filename = soundspath .. "dna_builder_built.ogg", volume = 1},
    working_sound =
    {
      sound = {filename = soundspath .. "dna_builder_working1.ogg", volume = 1},
      max_sounds_per_prototype = 5,
      fade_in_ticks = 20,
      fade_out_ticks = 20,
      --sound_accents = {
      --  {
      --    sound = {filename = soundspath .. "dna_scanner_recurring.ogg", volume = 1.5},
      --    frame = 30,
      --    play_for_working_visualisation = "running_anim"
      --  },
      --},
    },
  },

--    ██████  ██   ██  █████  ███████ ███████     ██████  
--    ██   ██ ██   ██ ██   ██ ██      ██               ██ 
--    ██████  ███████ ███████ ███████ █████        █████  
--    ██      ██   ██ ██   ██      ██ ██          ██      
--    ██      ██   ██ ██   ██ ███████ ███████     ███████ 

  {
    type = "furnace",
    fixed_recipe = "panglia_cloned_specimen_body_0",
    name = entityname2,
    icon = "__panglia_planet__/graphics/icons/panglia_dna_builder.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = entityname},
    crafting_categories = {"dna_builder_2"},
    max_health = 400,
    corpse = entityname .. "-remnants",
    surface_conditions = panglia_only,
    dying_explosion = "assembling-machine-1-explosion",
    show_recipe_icon = false,
    icon_draw_specification = {shift = {0, 0}, scale = 1},
    resistances = {},
    result_inventory_size = 2,
    source_inventory_size = 1,
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = actual_pipe_connectors,
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {
          {flow_direction = "input", direction = defines.direction.east, position = {((size/2)-0.5), pipedistance}},
          {flow_direction = "input", direction = defines.direction.east, position = {((size/2)-0.5), -pipedistance}},
          {flow_direction = "input", direction = defines.direction.west, position = {-((size/2)-0.5), pipedistance}},
          {flow_direction = "input", direction = defines.direction.west, position = {-((size/2)-0.5), -pipedistance}},
        },
        secondary_draw_orders = {east = 12, west = 12, north = -13, south = 12},
        render_layer = "object",
      },
    },
    collision_box = {{-((size/2)-0.3), -((size/2)-0.3)}, {((size/2)-0.3), ((size/2)-0.3)}},
    selection_box = {{-(size/2), -(size/2)}, {(size/2), (size/2)}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = entityname,
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions.create_vector(universal_connector_template, {wire,wire,wire,wire}),
    alert_icon_shift = util.by_pixel(0, 0),
    graphics_set = graphicsset(2),
    match_animation_speed_to_activity = true,
    perceived_performance  = {minimum = 0.5, maximum = 5},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW",
    },
    energy_usage = "30kW",
    module_slots = 2,
    allowed_effects = {"speed", "consumption", "pollution", "productivity"},
    effect_receiver = {uses_module_effects = true, uses_beacon_effects = true, uses_surface_effects = true},
    impact_category = "metal-large",
    open_sound = {filename = soundspath .. "dna_builder_open.ogg", volume = 1},
    close_sound = {filename = soundspath .. "dna_builder_close.ogg", volume = 1},
    working_sound =
    {
      sound = {filename = soundspath .. "dna_builder_working2.ogg", volume = 1},
      max_sounds_per_prototype = 5,
      fade_in_ticks = 20,
      fade_out_ticks = 20,
      --sound_accents = {
      --  {
      --    sound = {filename = soundspath .. "dna_scanner_recurring.ogg", volume = 1.5},
      --    frame = 30,
      --    play_for_working_visualisation = "running_anim"
      --  },
      --},
    },
  },

})