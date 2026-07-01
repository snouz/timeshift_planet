local resource_autoplace = require("resource-autoplace")
require ("__base__.prototypes.entity.pipecovers")
require ("circuit-connector-sprites")
--require ("__base__.prototypes.entity.assemblerpipes")
require ("__base__.prototypes.entity.laser-sounds")
require ("__base__.prototypes.entity.enemy-constants")
require ("__base__.prototypes.entity.spawner-animation")
require ("__base__.prototypes.entity.character-animations")
require ("__base__.prototypes.entity.entity-util")
require ("__base__.prototypes.entity.spidertron-animations")
local simulations = require("__base__.prototypes.factoriopedia-simulations")
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")
local procession_audio_catalogue_types = require("__base__/prototypes/planet/procession-audio-catalogue-types")


require ("__base__.prototypes.entity.enemy-constants")
require ("__base__.prototypes.entity.biter-animations")
require ("__base__.prototypes.entity.spitter-animations")
require ("__base__.prototypes.entity.spawner-animation")

--local biter_ai_settings = require ("__base__.prototypes.entity.biter-ai-settings")
local enemy_autoplace = require ("__base__.prototypes.entity.enemy-autoplace-utils")
local sounds = require ("__base__.prototypes.entity.sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local simulations = require("__base__.prototypes.factoriopedia-simulations")

require("__space-age__.prototypes.entity.beams")

require("circuit-connector-sprites")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

local util = require('util')

local rocket_turret_shift = -20
local tesla_turret_shift = -26

local emptyturretanim = {
  filename = "__core__/graphics/empty.png",
  size = 1,
  priority = "very-low",
  direction_count = 4,
  frame_count = 1,
  line_length = 1,
  run_mode = "forward",
}

local multidir_anim = {
  layers =
  {
    {
      filename = entity .. "panglia_energy_roots/panglia_energy_roots_1_base.png",
      width = 704,
      height = 704,
      repeat_count = 1,
      line_length = 1,
      scale = 0.5,
    },
    --[[{
      filename = entity .. "panglia_energy_roots/panglia_energy_roots_1_shadow.png",
      width = 704,
      height = 704,
      repeat_count = 1,
      line_length = 1,
      scale = 0.5,
      draw_as_shadow = true,
    },]]
    {
      filename = entity .. "panglia_energy_roots/panglia_energy_roots_1_glow.png",
      width = 704,
      height = 704,
      repeat_count = 1,
      line_length = 1,
      scale = 0.5,
      draw_as_glow = true,
      blend_mode = "additive",
    },
  }
}


data:extend({
  {
    type = "generator",
    name = "panglia_energy_roots",
    icon = icons .. "panglia_energy_roots.png",
    flags = {"placeable-neutral","player-creation","not-deconstructable","not-blueprintable","not-flammable","no-automated-item-removal","no-copy-paste","not-upgradable","not-in-kill-statistics"},
    --minable = {mining_time = 0.3, result = "steam-engine"},
    max_health = 400000,
    corpse = "steam-engine-remnants",
    dying_explosion = "steam-engine-explosion",
    --alert_icon_shift = util.by_pixel(0, -12),
    --alert_icon_scale = 0,
    effectivity = 40000,
    fluid_usage_per_tick = 0.1,
    allow_copy_paste = false,
    burns_fluid = true,

    maximum_temperature = 165,
    --[[resistances =
    {
      {
        type = "fire",
        percent = 70
      },
      {
        type = "impact",
        percent = 30
      }
    },]]
    --fast_replaceable_group = "steam-engine",
    collision_box = {{-3.2, -3.2}, {3.2, 3.2}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      volume = 200,
      --[[pipe_picture = {
        north =
        {
          filename = entity .. "panglia_energy_roots/panglia_energy_roots-pipe-N.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          shift = util.by_pixel(0, 32),
          scale = 0.5
        },
        east =
        {
          filename = entity .. "panglia_energy_roots/panglia_energy_roots-pipe-E.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          shift = util.by_pixel(-32, 0),
          scale = 0.5
        },
        south =
        {
          filename = entity .. "panglia_energy_roots/panglia_energy_roots-pipe-S.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          shift = util.by_pixel(0, -32),
          scale = 0.5
        },
        west =
        {
          filename = entity .. "panglia_energy_roots/panglia_energy_roots-pipe-W.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          shift = util.by_pixel(32, 0),
          scale = 0.5
        }
      },]]
      --[[pipe_picture = {
        north =
        {
          filename = entity .. "panglia_energy_roots/panglia_energy_roots-pipe-N.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          shift = util.by_pixel(0, 64),
          scale = 0.5
        },
        east =
        {
          filename = entity .. "panglia_energy_roots/panglia_energy_roots-pipe-E.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          shift = util.by_pixel(-64, 0),
          scale = 0.5
        },
        south =
        {
          filename = entity .. "panglia_energy_roots/panglia_energy_roots-pipe-S.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          shift = util.by_pixel(0, -64),
          scale = 0.5
        },
        west =
        {
          filename = entity .. "panglia_energy_roots/panglia_energy_roots-pipe-W.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          shift = util.by_pixel(64, 0),
          scale = 0.5
        }
      },]]
      always_draw_covers = false,
      pipe_connections =
      {
        { flow_direction = "input", direction = defines.direction.north, position = {0, -3} },
        { flow_direction = "input", direction = defines.direction.east, position = {3, 0} },
        { flow_direction = "input", direction = defines.direction.south, position = {0, 3} },
        { flow_direction = "input", direction = defines.direction.west, position = {-3, 0} },
      },
      production_type = "input",
      filter = "panglia_branbalite_slurry",
      minimum_temperature = 0,
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output",
      render_no_power_icon = false,
      render_no_network_icon = false,
    },
    --horizontal_animation = multidir_anim,
    --vertical_animation = multidir_anim,
    integration_patch = multidir_anim,
    smoke =
    {
      {
        name = "energy_root_pseudosmoke",
        north_position = {0,0}, --{0.9, 0.0},
        east_position = {0,0},--{-2.0, -2.0},
        frequency = 0.2 / 32,
        starting_vertical_speed = 0, -- 0.08,
        starting_frame_deviation = 60,
        vertical_speed_slowdown = 0,
      }
    },
    impact_category = "metal-large",
    open_sound = {filename = tssounds .. "panderoot_open.ogg", volume = 1},
    close_sound = {filename = tssounds .. "panderoot_close.ogg", volume = 1},
    working_sound =
    {
      sound =
      {
        filename = tssounds .. "energy_root_sound.ogg",
        volume = 0.55,
        speed_smoothing_window_size = 600,
        modifiers = volume_multiplier("tips-and-tricks", 1.1),
        audible_distance_modifier = 0.8,
      },
      match_speed_to_activity = true,
      max_sounds_per_prototype = 1,
      fade_in_ticks = 300,
      fade_out_ticks = 300
    },
    perceived_performance = {minimum = 0.25, performance_to_activity_rate = 2.0},
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "panglia_energy_roots",
      order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
      base_density = 1,
      base_spots_per_km2 = 50,
      random_probability = 1/10,
      random_spot_size_minimum = 0.01,
      random_spot_size_maximum = 0.01,
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = 5
    },
    map_color = {1, 1, 0},
  },
  {
    type = "trivial-smoke",
    name = "energy_root_pseudosmoke",
    duration = 300,
    fade_in_duration = 0,
    fade_away_duration = 200,
    spread_duration = 0,-- 120,
    start_scale = 0.5,
    end_scale = 0.5,
    --start_scale = opts.start_scale or 0.20,
    --end_scale = opts.end_scale or 1.0,
    --color = opts.color,
    color = {1,1,1,1},
    movement_slow_down_factor = 0,
    cyclic = true,
    affected_by_wind = false,
    animation =
    {
      filename = entity .. "panglia_energy_roots/panglia_energy_roots-gloweffect.png",
      flags = { "smoke" },
      blend_mode = "additive",
      draw_as_glow = true,
      width = 704,
      height = 704,
      --shift = {-0.265625, 0.8125},
      --priority = "high",
      animation_speed = 0.2,
      scale = 0.5,
      line_length = 5,
      frame_count = 25,
      frame_sequence = {1,1,1,1,2,1,1,3,1,4,1,1,1,1,5,6,7,1,1,8,1,9,1,1,10,1,1,11,6,7,1,1,1,8,1,9,1,1,6,15,1,1,9,10,1,11,1,12,1,1,19,1,1,12,1,13,1,1,1,1,1,1,14,1,1,1,15,16,1,17,1,22,1,23,1,24,1,25,1,18,1,1,19,1,1,1,20,1,1,21,1,1,1,22,1,1,23,1,1,1,24,1,1,1,25,1,1,1,1,2,1,1,3,1,4,1,1,13,1,1,14,1,1,15,1,16,1,1,17,1,18,1,1,1,5,6,1,7,1,1,1,8,1,9,10,1,11,12,1,1,1,19,1,1,20,1,1,21,1,1,1,22,1,1,1,1,1,1,23,1,24,1,25}
    },
    --glow_animation = nil 
    --[[{
      filename = entity .. "fire-smoke/fire-smoke-glow.png",
      flags = { "smoke" },
      blend_mode = "additive",
      line_length = 8,
      width = 352,
      height = 352,
      frame_count = 64,
      --shift = {-0.265625, 0.8125},
      --priority = "high",
      animation_speed = 0.25
    },]]
    --glow_fade_away_duration = 70,
    --vertical_speed_slowdown = opts.vertical_speed_slowdown
  },


  {
    type = "explosion",
    name = "panglia_energy_roots_tesla_turret_explosion",
    localised_name = {"entity-name.panglia_energy_roots_tesla_turret_1"},
    icon = icons .. "panglia_energy_roots_tesla_turret.png",
    order = "a-a-c",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = util.empty_sprite(),
    smoke = "smoke-explosion-particle",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "vulcanus-stone-particle-big",
            only_when_visible = true,
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "vulcanus-stone-particle-medium",
            only_when_visible = true,
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "vulcanus-stone-particle-small",
            only_when_visible = true,
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 50,
            particle_name = "big-rock-stone-particle-tiny",
            only_when_visible = true,
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-trivial-smoke",
            repeat_count = 20,
            smoke_name = "demolisher-mining-smoke",
            only_when_visible = true,
            initial_height = 0,
            speed_from_center = 0.03,
            offset_deviation = {{-1.75, -1.7}, {1.75, 1.75}},
          },


          {
            type = "create-particle",
            repeat_count = 4,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "tintable-water-particle",
            tint = {86, 232, 201, 200},
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.09766, -0.09766 },
              right_bottom = { 0.09766, 0.09766 }
            },
            initial_height = 1,
            initial_height_deviation = 0,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.01,
            frame_speed = 0.5,
            frame_speed_deviation = 0,
            tail_length = 15,
            tail_length_deviation = 1,
            tail_width = 1,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 2,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "tintable-water-particle",
            tint = {86, 232, 201, 200},
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.4961, -0.3945 },
              right_bottom = { 0.4961, 0.3945 }
            },
            initial_height = 0.7,
            initial_height_deviation = 0.14,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.01,
            frame_speed = 0.3,
            frame_speed_deviation = 0,
            tail_length = 15,
            tail_length_deviation = 1,
            tail_width = 1,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 5,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "tintable-water-particle",
            tint = {86, 232, 201, 200},
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.1914, -0.2969 },
              right_bottom = { 0.1914, 0.2969 }
            },
            initial_height = 0.3,
            initial_height_deviation = 0.03,
            initial_vertical_speed = 0.012,
            initial_vertical_speed_deviation = 0,
            speed_from_center = 0.1,
            speed_from_center_deviation = 0,
            frame_speed = 0.5,
            frame_speed_deviation = 0,
            tail_length = 10,
            tail_length_deviation = 0,
            tail_width = 1,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 5,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "tintable-water-particle",
            tint = {86, 232, 201, 200},
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.09766, -0.2969 },
              right_bottom = { 0.09766, 0.2969 }
            },
            initial_height = 0.3,
            initial_height_deviation = 0.03,
            initial_vertical_speed = 0.021,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.07,
            speed_from_center_deviation = 0.05,
            frame_speed = 0.5,
            frame_speed_deviation = 0,
            tail_length = 10,
            tail_length_deviation = 0,
            tail_width = 1,
            rotate_offsets = false
          },
          {
            type = "create-particle",
            repeat_count = 7,
            repeat_count_deviation = 0,
            probability = 1,
            affects_target = false,
            show_in_tooltip = false,
            particle_name = "tintable-water-particle",
            tint = {86, 232, 201, 200},
            offsets = {
              { 0, 0 }
            },
            offset_deviation = {
              left_top = { -0.5, 0 },
              right_bottom = { 0.5, 0 }
            },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.051,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            frame_speed = 0.25,
            frame_speed_deviation = 0,
            tail_length = 7,
            tail_length_deviation = 0,
            tail_width = 1,
            rotate_offsets = false
          }
        }
      }
    }
  },



  {
    type = "ammo-category",
    name = "tesla_energy_roots",
    icon = "__space-age__/graphics/icons/ammo-category/tesla.png",
    subgroup = "ammo-category"
  },



})





local function make_energy_roots_tesla_turret(num, seq)
  local hidden = true
  if num == 1 then hidden = false end
  data:extend({
    {
      type = "electric-turret",
      name = "panglia_energy_roots_tesla_turret_" .. num,
      icon = icons .. "panglia_energy_roots_tesla_turret.png",
      localised_name = {"entity-name.panglia_energy_roots_tesla_turret"},
      flags = {"placeable-player", "placeable-enemy"},
      subgroup = "enemies",
      order = "t-[panglia]-a" .. num,
      max_health = 750,
      collision_box = {{-0.2, -0.2 }, {0.2, 0.2}},
      selection_box = {{-0.5, -0.5 }, {0.5, 0.5}},
      collision_mask = {layers={item=true, object=true, player=true, water_tile=true, is_object=true, is_lower_object=true}},
      damaged_trigger_effect = hit_effects.entity(),
      start_attacking_only_when_can_shoot = true,
      rotation_speed = 0.001,
      preparing_speed = 0.7,
      folding_speed = 0.7,
      ending_attack_speed = 1 / (30 + 1),
      --[[working_sound =
      {
        sound = {filename = "__space-age__/sound/entity/tesla-turret/tesla-turret-base.ogg", volume = 0.3},
        use_doppler_shift = false,
        fade_in_ticks = 4,
        fade_out_ticks = 20,
      },]]
      corpse = "panglia_energy_roots_tesla_turret_remnants_" .. num,
      dying_explosion = "panglia_energy_roots_tesla_turret_explosion",
      energy_source = {type = "void"},
      folded_animation = emptyturretanim,
      glow_light_intensity = 0.5,
      random_animation_offset = true,
      hidden = hidden,
      hidden_in_factoriopedia = hidden,
      integration = 
      {
        filename = entity .. "panglia_energy_roots/cell_roots.png", --_" .. num .. ".png",
        size = 128,
        x = (num - 1) * 128,
        y = 0,
        scale = 0.5,
      },
      graphics_set =
      {
        base_visualisation =
        {
          {
            animation =
            {
              layers =
              {
                {
                  filename = entity .. "panglia_energy_roots/cell.png", --_" .. num .. ".png",
                  size = 128,
                  x = (num - 1) * 128,
                  y = 0,
                  frame_count = 1,
                  repeat_count = 60,
                  scale = 0.5,
                  animation_speed = 0.15,
                },
                {
                  filename = entity .. "panglia_energy_roots/cell_glow.png",
                  size = 128,
                  x = (num - 1) * 128,
                  y = 0,
                  frame_count = 1,
                  repeat_count = 60,
                  scale = 0.5,
                  animation_speed = 0.15,
                  draw_as_glow = true,
                  blend_mode = "additive",
                },
                {
                  filename = entity .. "panglia_energy_roots/cell_electricity.png",
                  size = 128,
                  frame_count = 16,
                  line_length = 16,
                  frame_sequence = seq,
                  scale = 0.5,
                  animation_speed = 0.15,
                  draw_as_glow = true,
                  blend_mode = "additive",
                },
              }
            }
          },
        }
      },

      resistances =
      {
        {type = "electric", percent = 100},
        {type = "laser", percent = 99},
        {type = "acid", percent = 99},
        {type = "explosion", percent = 90},
        {type = "fire", percent = 90},
        {type = "impact", percent = 10},
        {type = "physical", percent = 0},
      },
      attack_parameters =
      {
        type = "beam",
        cooldown = 120,
        range = 10, --30
        range_mode = "center-to-bounding-box",
        fire_penalty = 0.9,
        source_direction_count = 64,
        source_offset = {0, 0}, -- {0, -0.55},
        ammo_category = "tesla_energy_roots",
        ammo_type =
        {
          energy_consumption = "0J",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                -- Chain effect must go first in case the beam kills the target
                {
                  type = "nested-result",
                  action =
                  {
                    type = "direct",
                    action_delivery =
                    {
                      type = "chain",
                      chain = "chain-energy_roots_tesla_turret-chain",
                    }
                  }
                },
                {
                  type = "nested-result",
                  action =
                  {
                    type = "direct",
                    action_delivery =
                    {
                      type = "beam",
                      beam = "chain-energy_roots_tesla_turret-beam-start",
                      max_length = 10, --40
                      duration = 10, --30
                      add_to_shooter = false,
                      destroy_with_source_or_target = false,
                      source_offset = {0, 0}, --{0, -2.6}
                    }
                  }
                }
              }
            }
          }
        }
      },
      call_for_help_radius = 10,
    },



    {
      type = "corpse",
      name = "panglia_energy_roots_tesla_turret_remnants_" .. num,
      icon = icons .. "panglia_energy_roots_tesla_turret_remnants.png",
      localised_name = {"entity-name.panglia_energy_roots_tesla_turret_remnants"},
      flags = {"placeable-neutral", "not-on-map"},
      hidden_in_factoriopedia = true,
      subgroup = "defensive-structure-remnants",
      order = "a-c-a",
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      tile_width = 1,
      tile_height = 1,
      selectable_in_game = false,
      time_before_removed = 60 * 60 * 5, -- 5 minutes
      expires = false,
      final_render_layer = "remnants",
      remove_on_tile_placement = false,
      animation = 
      {
        filename = entity .. "panglia_energy_roots/cell_remnants.png", --_" .. num .. ".png",
        x = (num - 1) * 128,
        y = 0,
        --tint = {.6,.6,.6,.6},
        --filename = entity .. "panglia_energy_roots/cell_" .. num .. "_remnants.png",
        size = 128,
        scale = 0.5,
      },
    },

  })
end

make_energy_roots_tesla_turret(1, {1,1,8,1,15,1,1,2,1,9,12,1,1,1,13,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,14,1,1,1,1,11,7,6,5,1,1,10,16,1,1,1,1,1,1,1,1,4,1,1,1,1,1,1,1})
make_energy_roots_tesla_turret(2, {1,1,1,13,10,1,1,1,1,1,1,1,1,1,9,1,1,8,5,1,3,1,1,6,1,1,1,1,1,1,16,1,1,1,1,1,1,1,1,1,1,1,11,1,7,14,1,12,1,4,1,1,1,1,1,1,1,2,15,1})
make_energy_roots_tesla_turret(3, {1,1,1,1,7,13,1,1,1,1,1,1,1,1,1,5,1,1,1,1,1,1,1,1,9,1,1,1,1,1,8,1,1,14,1,1,4,2,1,1,15,6,16,12,1,1,1,1,1,1,1,3,1,1,1,1,11,1,10,1})
make_energy_roots_tesla_turret(4, {1,1,1,1,13,15,1,1,12,1,11,1,1,1,1,1,1,4,1,1,1,1,1,14,1,2,1,10,1,1,5,1,1,3,1,1,1,8,16,1,1,1,1,1,1,7,1,1,1,1,1,1,1,1,1,1,1,6,1,9})
make_energy_roots_tesla_turret(5, {1,1,1,1,3,1,7,8,9,1,1,1,1,1,1,1,10,5,1,1,1,1,1,12,1,1,1,1,6,1,11,1,1,1,4,1,1,13,1,16,1,1,1,1,1,1,1,1,1,2,1,1,14,1,15,1,1,1,1,1})
make_energy_roots_tesla_turret(6, {1,1,12,9,6,3,2,1,10,1,11,1,1,1,1,1,1,1,1,1,1,1,1,16,1,1,1,1,4,1,1,13,1,1,1,1,7,1,1,1,14,1,1,1,1,5,1,1,1,1,1,1,15,1,1,1,8,1,1,1})
make_energy_roots_tesla_turret(7, {1,1,1,1,1,1,1,12,16,1,1,1,1,1,1,8,1,1,1,1,1,13,1,1,10,7,14,1,6,1,1,1,1,1,11,1,3,1,1,15,2,1,1,1,1,1,4,1,1,1,1,5,1,1,9,1,1,1,1,1})
make_energy_roots_tesla_turret(8, {1,1,1,1,1,1,1,1,1,1,3,1,1,5,15,10,7,1,1,1,1,13,1,1,1,1,1,1,1,14,2,1,1,1,1,1,1,1,4,1,1,1,1,16,1,1,1,1,1,11,1,9,1,1,1,1,12,1,8,6})
make_energy_roots_tesla_turret(9, {1,1,1,1,15,7,1,6,16,8,12,11,1,1,9,1,1,1,1,1,1,1,2,1,1,3,5,1,1,1,1,1,1,1,1,1,14,1,13,1,1,1,1,1,10,1,1,1,1,1,1,4,1,1,1,1,1,1,1,1})
make_energy_roots_tesla_turret(10, {1,1,4,13,1,1,1,1,1,1,10,1,1,15,1,1,1,6,1,16,1,14,1,1,1,9,1,1,1,1,1,1,1,1,1,8,2,7,11,1,1,1,1,1,5,12,1,1,1,3,1,1,1,1,1,1,1,1,1,1})
make_energy_roots_tesla_turret(11, {1,1,1,1,4,1,1,11,1,1,1,7,1,1,1,1,1,8,1,1,12,1,1,1,16,1,6,3,1,1,1,13,15,1,9,2,1,1,1,1,1,1,5,1,1,1,1,1,1,10,1,1,1,1,14,1,1,1,1,1})
make_energy_roots_tesla_turret(12, {1,1,14,1,6,1,1,11,1,1,10,1,12,9,1,1,1,1,7,1,1,1,1,1,1,1,3,1,1,1,16,8,1,1,4,1,13,2,1,1,1,15,1,1,1,1,1,1,1,1,1,1,1,5,1,1,1,1,1,1})
make_energy_roots_tesla_turret(13, {6,3,1,1,1,1,1,1,1,1,14,1,1,8,4,1,10,1,1,1,1,1,1,1,13,1,1,1,7,11,16,1,1,1,1,1,2,1,5,1,1,1,1,1,12,1,9,1,1,1,1,1,1,1,1,15,1,1,1,1})
make_energy_roots_tesla_turret(14, {12,1,1,13,1,1,1,1,3,1,1,6,9,1,1,14,1,1,1,1,1,1,1,1,11,1,1,1,1,1,8,1,7,1,4,1,1,1,1,1,1,1,1,1,1,10,1,1,1,1,1,1,15,1,2,1,5,1,1,16})
make_energy_roots_tesla_turret(15, {1,3,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,4,1,1,8,1,14,1,1,12,1,1,11,1,1,1,1,1,1,15,1,5,10,1,1,1,1,7,1,6,1,1,9,1,1,1,1,1,13,1,16,1,1,1})
make_energy_roots_tesla_turret(16, {1,1,1,1,16,1,1,1,1,1,11,1,1,1,1,1,1,1,1,1,6,1,1,10,1,1,1,1,1,1,1,1,12,1,2,1,1,7,8,1,1,4,1,1,1,1,3,1,1,1,1,14,13,1,9,1,1,15,1,5})



local function make_tesla_chain_lightning_chain(name, beam_name, max_jumps, jump_range, fork_chance, fork_chance_per_quality, beam_duration)
  return {
    name = name,
    type = "chain-active-trigger",
    max_jumps = max_jumps,
    max_range_per_jump = jump_range,
    jump_delay_ticks = 6,
    fork_chance = fork_chance,
    fork_chance_increase_per_quality_level = fork_chance_per_quality,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "beam",
        beam = beam_name,
        max_length = jump_range + 0.5,
        duration = beam_duration,
        add_to_shooter = false,
        destroy_with_source_or_target = false,
        source_offset = {0, 0}, -- should match beam's target_offset
      },
    },
  }
end

data:extend(
{
  make_tesla_chain_lightning_chain("chain-energy_roots_tesla_turret-chain", "chain-energy_roots_tesla_turret-beam-bounce", 4, 6, 0.03, 0.03, 4),
})


local function make_chain_tesla_beams(start_name, bounce_name, sounds, damage)
  data:extend(
  {
    make_tesla_beam(start_name, sounds.start, damage),
    make_tesla_beam_chain(bounce_name, sounds.chain, damage)
  })
end

make_chain_tesla_beams("chain-energy_roots_tesla_turret-beam-start", "chain-energy_roots_tesla_turret-beam-bounce", space_age_sounds.tesla_turret_beam, 10)
