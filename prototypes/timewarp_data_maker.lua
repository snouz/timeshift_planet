local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
local panglia_only = {{property = "pressure", min = 1401, max = 1401}}
local size = 3
local pipedistance = 0
local pipedistance2 = 0
local animframes = 1
local animspeed = 0.3

local soundspath = "__panglia_planet_assets__/sounds/"

local entityname = "panglia_timewarp_data_maker"
local entity = "__panglia_planet_assets__/graphics/entity/panglia_timewarp_data_maker/"



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




empty = {
  filename = "__panglia_planet_assets__/graphics/empty.png",
  priority = "low",
  --shift = {0, 0},
  width = 1,
  height = 1,
  scale = 0.5,
  render_layer = "object",
}

local pipe_connectors = {
  north = empty, 
  --[[
  {
    filename = entity .. entityname .. "_pipeN.png",
    priority = "extra-high",
    shift = {0, 1},
    width = 1,
    height = 1,
    scale = 0.5,
    render_layer = "object",
  },
  ]]
  east = empty, 
  --[[
  {
    filename = entity .. entityname .. "_pipeE.png",
    priority = "extra-high",
    shift = {-1, 0},
    width = 128,
    height = 128,
    scale = 0.5,
    render_layer = "object",
  },
  ]]
  south = 
  {
    filename = entity .. entityname .. "_pipeS.png",
    priority = "extra-high",
    shift = {0, -1},
    width = 128,
    height = 128,
    scale = 0.5,
    render_layer = "object",
  },
  west = empty, 
  --[[
  {
    filename = entity .. entityname .. "_pipeW.png",
    priority = "extra-high",
    shift = {1, 0},
    width = 128,
    height = 128,
    scale = 0.5,
    render_layer = "object",
  },
  ]]
}


local graphicsset = {
      animation_progress = 0.15,
      always_draw_idle_animation = true,
      states =
      {
        {
          name = "idle",
          duration = 1,
          next_active = "turnon",
          next_inactive = "idle",
        },
        {
          name = "turnon",
          duration = 9,
          next_active = "working",
          next_inactive = "turnoff",
        },
        {
          name = "turnoff",
          duration = 9,
          next_active = "turnon",
          next_inactive = "idle",
        },
        {
          name = "working",
          duration = 32,
          next_active = "working",
          next_inactive = "turnoff",
        },
      },
      idle_animation =
      {
        layers =
        {
          {
            filename = entity .. entityname .. "_base.png",
            priority="high",
            width = 320,
            height = 448,
            repeat_count = animframes,
            line_length = 1,
            animation_speed = animspeed,
            scale = 0.5,
            shift = util.by_pixel_hr(0, -64),
          },
          {
            filename = entity .. entityname .. "_shadow.png",
            priority="high",
            width = 448,
            height = 320,
            shift = util.by_pixel_hr(128, -64),
            repeat_count = animframes,
            line_length = 1,
            animation_speed = animspeed,
            scale = 0.5,
            draw_as_shadow = true,
          },
        }
      },
      working_visualisations =
      {
        --[[{
          name = "lights",
          constant_speed = true,
          always_draw = true,
          draw_in_states = {"idle", "working"},
          render_layer = "higher-object-under",
          fadeout = true,
          effect = "flicker",
          apply_tint = "status",
          animation = 
          { 
            layers =
            {
              {
                filename = entity .. entityname .. "_light.png",
                priority="high",
                width = 320,
                height = 448,
                repeat_count = animframes,
                line_length = 1,
                animation_speed = animspeed,
                draw_as_glow = true,
                blend_mode = "additive",
                scale = 0.5,
                shift = util.by_pixel_hr(0, -64),
              },
            }
          },
        },]]
        --[[{
          name = "dome",
          constant_speed = true,
          always_draw = true,
          draw_in_states = {"idle", "working"},
          render_layer = "higher-object-above",
          animation = 
          { 
            layers =
            {
              {
                filename = "__Moshine-assets__/graphics/entity/moshine_cosmicscanner/moshine_cosmicscanner-finished-spinningdome.png",
                priority = "high",
                width = 740,
                height = 740,
                frame_count = 64,
                line_length = 8,
                animation_speed = animspeed,
                run_mode = "forward",
                --draw_as_glow = true,
                --blend_mode = "additive",
                scale = 0.5
                ---render_layer = "",
              },
            }
          },
        },]]
        {
          name = "screens_turnon",
          constant_speed = true,
          always_draw = true,
          draw_in_states = {"turnon"},
          draw_when_state_filter_matches = true,
          --fadeout = true,
          effect = "flicker",
          frame_based_on_shift_animation_progress = false,
          --apply_tint = "status",
          render_layer = "train-stop-top",
          animation = 
          { 
            layers =
            {
              {
                filename = entity .. entityname .. "_light_anim_turnon.png",
                priority = "high",
                width = 256,
                height = 256,
                frame_count = 9,
                line_length = 9,
                animation_speed = animspeed,
                --run_mode = "forward-then-backward",
                draw_as_glow = true,
                blend_mode = "additive",
                scale = 0.5,
                --render_layer = "",

                shift = util.by_pixel_hr(32, -32),
              },
            }
          },
        },
        {
          name = "screens_turnoff",
          constant_speed = true,
          always_draw = true,
          draw_in_states = {"turnoff"},
          --fadeout = true,
          effect = "flicker",
          frame_based_on_shift_animation_progress = false,
          --apply_tint = "status",
          render_layer = "train-stop-top",
          animation = 
          { 
            layers =
            {
              {
                filename = entity .. entityname .. "_light_anim_turnon.png",
                priority = "high",
                width = 256,
                height = 256,
                frame_count = 9,
                line_length = 9,
                animation_speed = animspeed,
                run_mode = "backward",
                draw_as_glow = true,
                blend_mode = "additive",
                scale = 0.5,
                --render_layer = "",

                shift = util.by_pixel_hr(32, -32),
              },
            }
          },
        },
        {
          name = "screens",
          constant_speed = true,
          always_draw = true,
          draw_in_states = {"working"},
          --fadeout = true,
          effect = "flicker",
          frame_based_on_shift_animation_progress = false,
          --apply_tint = "status",
          render_layer = "train-stop-top",
          animation = 
          { 
            layers =
            {
              {
                filename = entity .. entityname .. "_light_anim.png",
                priority = "high",
                width = 256,
                height = 256,
                frame_count = 32,
                line_length = 32,
                animation_speed = animspeed,
                --run_mode = "forward-then-backward",
                draw_as_glow = true,
                blend_mode = "additive",
                scale = 0.5,
                --render_layer = "",

                shift = util.by_pixel_hr(32, -32),
              },
            }
          },
        },
      },

      --[[status_colors = {
        idle={0.1,0.1,0.1,0.1},
        no_minable_resources={0,0,0,0},
        full_output={0,0,0,0},
        insufficient_input={0.3,0.1,0.1,0.1},
        disabled={0,0,0,0},
        no_power={0.02,0.02,0.02,0.02},
        working={1,1,1,1},
        low_power={0.4,0.4,0.2,0.2},
      },]]
      --[[integration_patch =
      {
        filename = "__Moshine-assets__/graphics/entity/moshine_cosmicscanner/moshine_cosmicscanner-underplatform.png",
        priority = crash_site_sprite_priority,
        width = 1024,
        height = 1772,
        scale = 0.5
      },
      integration_patch_render_layer = "background-transitions",]]
    }


data:extend({
  {
    type = "recipe-category",
    name = "panglia_timewarp_data_making"
  },

  {
    type = "item",
    name = entityname,
    icon = "__panglia_planet__/graphics/icons/panglia_timewarp_data_maker.png",
    subgroup = "panglia-production-machine",
    order = "g[".. entityname .."]",
    place_result = entityname,
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    stack_size = 20,
    weight = 100 * kg
  },

  {
    type = "recipe",
    name = entityname,
    energy_required = 5,
    categories = {"crafting"},
    ingredients =
    {
      {type = "item", name = "panglia_panglite_fiber", amount = 10},
    },
    results = {{type = "item", name = entityname, amount = 1}},
    allow_productivity = false,
    enabled = false,
    auto_recycle = false,
    surface_conditions = panglia_only,
    sort_item_ingredients = false,
  },


  {
    type = "recipe",
    name = "panglia_timewarp_data_making",
    icon = "__panglia_planet__/graphics/icons/data/timewarp_data.png",
    categories = {"panglia_timewarp_data_making"},
    subgroup = "moshine-datacells",
    order = "b[panglia]-ea",
    --hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
      {type = "fluid", name = "raw-data", amount = 10},
    },
    results = {{
      type = "fluid", 
      name = "timewarp_data", 
      --independent_probability = 0.4,
      --amount_min = 1240, 
      --amount_max = 13480,
      amount = 10,
    }},
    allow_productivity = false,
    auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    crafting_machine_tint = {primary = util.color("#00ffff"),},
  },

  {
    type = "corpse",
    name = entityname .. "-remnants",
    icon = "__panglia_planet__/graphics/icons/panglia_timewarp_data_maker.png",
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
          width = 320,
          height = 448,
          line_length = 1,
          scale = 0.5,
          shift = util.by_pixel_hr(0, -64),
    },
  },
  {
    type = "assembling-machine",
    name = entityname,
    icon = "__panglia_planet__/graphics/icons/panglia_timewarp_data_maker.png",
    --factoriopedia_simulation = {planet = "nauvis", init = make_simulation(entityname)},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    fixed_recipe = "panglia_timewarp_data_making",
    minable = {mining_time = 1, result = entityname},
    crafting_categories = {"panglia_timewarp_data_making"},
    max_health = 300,
    corpse = "moshine_cosmicscanner-remnants",
    dying_explosion = "assembling-machine-1-explosion",
    show_recipe_icon = false,
    icon_draw_specification = {shift = {0, 0}, scale = 1},
    surface_conditions = panglia_only,
    tall = true,
    tile_buildability_rules = 
    { 
      {
        area = {{-((size/2)-0.3), -((size/2)-0.3)}, {((size/2)-0.3), ((size/2)-0.3)}},
        required_tiles = {layers = {panglia_hidden_beacon_tile=true}},
        colliding_tiles = {layers={}},
        remove_on_collision = true,
      } 
    },
    resistances =
    {
      --{
      --  type = "impact",
      --  percent = 10
      --}
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = pipe_connectors,
        --pipe_covers = pipecoverspictures(),
        volume = 10000,
        --filter = "raw-data",
        pipe_connections = {
          --{flow_direction = "input", direction = defines.direction.north, position = {pipedistance, -((size/2)-0.5)}, connection_category = "data"},
          --{flow_direction = "input", direction = defines.direction.north, position = {-pipedistance, -((size/2)-0.5)}, connection_category = "data"},
          --{flow_direction = "input", direction = defines.direction.east, position = {((size/2)-0.5), pipedistance}, connection_category = "data"},
          --{flow_direction = "input", direction = defines.direction.east, position = {((size/2)-0.5), -pipedistance}, connection_category = "data"},
          --{flow_direction = "input", direction = defines.direction.south, position = {pipedistance, ((size/2)-0.5)}, connection_category = "data"},
          --{flow_direction = "input", direction = defines.direction.south, position = {-pipedistance, ((size/2)-0.5)}, connection_category = "data"},
          {flow_direction = "input", direction = defines.direction.west, position = {-((size/2)-0.5), pipedistance}, connection_category = "data"},
          --{flow_direction = "input", direction = defines.direction.west, position = {-((size/2)-0.5), -pipedistance}, connection_category = "data"},
        },
        secondary_draw_orders = {east = -4, west = -4, north = -4},
        max_pipeline_extent = 1000000,
        --draw_only_when_connected = true,
      },
      {
        production_type = "output",
        pipe_picture = pipe_connectors,
        --pipe_picture = assembler3pipepictures(),
        --pipe_covers = pipecoverspictures(),
        volume = 10000,
        --filter = "raw-data",
        pipe_connections = {
          --{flow_direction = "output", direction = defines.direction.north, position = {pipedistance2, -((size/2)-0.5)}, connection_category = "data"},
          --{flow_direction = "output", direction = defines.direction.north, position = {-pipedistance2, -((size/2)-0.5)}, connection_category = "data"},
          --{flow_direction = "output", direction = defines.direction.east, position = {((size/2)-0.5), pipedistance2}, connection_category = "data"},
          --{flow_direction = "output", direction = defines.direction.east, position = {((size/2)-0.5), -pipedistance2}, connection_category = "data"},
          --{flow_direction = "output", direction = defines.direction.south, position = {pipedistance2, ((size/2)-0.5)}, connection_category = "data"},
          {flow_direction = "output", direction = defines.direction.east, position = {((size/2)-0.5), pipedistance}, connection_category = "data"},
          --{flow_direction = "output", direction = defines.direction.south, position = {-pipedistance2, ((size/2)-0.5)}, connection_category = "data"},
          --{flow_direction = "output", direction = defines.direction.west, position = {-((size/2)-0.5), pipedistance2}, connection_category = "data"},
          --{flow_direction = "output", direction = defines.direction.west, position = {-((size/2)-0.5), -pipedistance2}, connection_category = "data"},
        },
        secondary_draw_orders = {east = -4, west = -4, north = -4},
        max_pipeline_extent = 1000000,
        --draw_only_when_connected = true,
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
        { variation = 18, main_offset = util.by_pixel(0, 0), shadow_offset = util.by_pixel(128, 340), show_shadow = false },
        { variation = 18, main_offset = util.by_pixel(0, 0), shadow_offset = util.by_pixel(128, 340), show_shadow = false },
        { variation = 18, main_offset = util.by_pixel(0, 0), shadow_offset = util.by_pixel(128, 340), show_shadow = false },
        { variation = 18, main_offset = util.by_pixel(0, 0), shadow_offset = util.by_pixel(128, 340), show_shadow = false }
      }
    ),
    alert_icon_shift = util.by_pixel(0, 0),
    graphics_set = graphicsset,
    graphics_set_flipped  = graphicsset,
    match_animation_speed_to_activity = false,
    
    perceived_performance  = {minimum = 0, maximum = 1},


    crafting_speed = 0.1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      --emissions_per_minute = { pollution = 4 }
      drain = "1kW",
    },
    energy_usage = "30kW",
    --heating_energy = "200kW",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    --allowed_effects = {"speed", "consumption", "pollution"},
    --effect_receiver = {uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true},
    --module_slots = 0,
    allowed_effects = {"speed"}, --{"speed"}, --{"consumption", "speed", "pollution", "quality"}, --"productivity"
    --allowed_module_categories = {"productivity"},
    effect_receiver = {uses_module_effects = false, uses_beacon_effects = true, uses_surface_effects = false},
    --[[working_sound =
    {
      sound =
      {
        filename = "__Moshine-assets__/sound/data-processor/processor_buzz.ogg",
        volume = 0.7,
        modifiers = volume_multiplier("main-menu", 1.44),
        audible_distance_modifier = 0.6
      },
      match_volume_to_activity = true,
      activity_to_volume_modifiers = {offset = 2, inverted = true},
      fade_in_ticks = 4,
      fade_out_ticks = 20,
    },]]


    impact_category = "metal-large",
    open_sound = {filename = soundspath .. "tv_open.ogg", volume = 1},
    close_sound = {filename = soundspath .. "tv_close.ogg", volume = 1},
    working_sound =
    {
      sound = {filename = soundspath .. "tv_loop.ogg", volume = 0.5},
      max_sounds_per_prototype = 5,
      fade_in_ticks = 20,
      fade_out_ticks = 20,
      sound_accents = {
        {
          sound = {filename = soundspath .. "tv_turnon.ogg", volume = 1},
          frame = 1,
          play_for_working_visualisation = "screens_turnon",
        },
        {
          sound = {filename = soundspath .. "tv_turnoff.ogg", volume = 1},
          frame = 1,
          play_for_working_visualisation = "screens_turnoff",
        },
      },
    },
  },
})