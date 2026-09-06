local icons = "__panglia_planet__/graphics/icons/"
local entity = "__panglia_planet_assets__/graphics/entity/"
local tssounds = "__panglia_planet_assets__/sounds/"

local panglia_only = {{property = "pressure", min = 1401, max = 1401}}

require ("util")
require ("__base__.prototypes.entity.pipecovers")
require ("circuit-connector-sprites")

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")
local ent_size = 6

data:extend(
{
  {
    type = "item",
    name = "simulation_chamber",
    icon = icons .. "simulation_chamber.png",
    subgroup = "panglia-production-machine",
    order = "e[simulation_chamber]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "simulation_chamber",
    stack_size = 10,
    default_import_location = "panglia",
    weight = 100 * kg
  },
  {
    type = "recipe",
    name = "simulation_chamber",
    energy_required = 1,
    categories = {"crafting-with-fluid"},
    ingredients =
    {
      {type = "item", name = "data-processor", amount = 1},
      {type = "item", name = "cloning-vat", amount = 1},
      {type = "item", name = "ai-tier-10", amount = 1},
      {type = "fluid", name = "panglia_branbalite_slurry", amount = 120},
      -- TOADD core 10
    },
    --surface_conditions = {{ property = "moshine-exclusive", min = 1, max = 1}},
    results = {{type = "item", name = "simulation_chamber", amount = 1}},
    allow_productivity = false,
    enabled = false,
    auto_recycle = true,
    surface_conditions = panglia_only,
    sort_item_ingredients = false,
  },



  {
    type = "corpse",
    name = "simulation_chamber-remnants",
    icon = icons .. "simulation_chamber-remnants.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "production-machine-remnants",
    order = "a-a-a",
    selection_box = {{-ent_size/2, -ent_size/2}, {ent_size/2, ent_size/2}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    animation = 
    {
      filename = entity .. "simulation_chamber/simulation_chamber_remnants.png",
      width = 512,
      height = 512,
      --frame_count = 1,
      --line_length = 1,
      --shift = util.by_pixel(0.5, -9),
      scale = 0.5,
    },
  },
--    ███████ ███    ██ ████████ ██ ████████ ██    ██ 
--    ██      ████   ██    ██    ██    ██     ██  ██  
--    █████   ██ ██  ██    ██    ██    ██      ████   
--    ██      ██  ██ ██    ██    ██    ██       ██    
--    ███████ ██   ████    ██    ██    ██       ██    
  {
    type = "furnace",
    name = "simulation_chamber",
    cant_insert_at_source_message_key = "inventory-restriction.cant-be-simulated",
    icon = icons .. "simulation_chamber.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
    minable = {mining_time = 0.2, result = "simulation_chamber"},
    fast_replaceable_group = "simulation_chamber",
    max_health = 300,
    corpse = "simulation_chamber-remnants",
    dying_explosion = "chemical-plant-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions.create_vector
    (
      universal_connector_template,
      {
        { variation = 27, main_offset = util.by_pixel(10.5, 61), shadow_offset = util.by_pixel(15.5, 66), show_shadow = false },
        { variation = 27, main_offset = util.by_pixel(10.5, 61), shadow_offset = util.by_pixel(15.5, 66), show_shadow = false },
        { variation = 27, main_offset = util.by_pixel(10.5, 61), shadow_offset = util.by_pixel(15.5, 66), show_shadow = false },
        { variation = 27, main_offset = util.by_pixel(10.5, 61), shadow_offset = util.by_pixel(15.5, 66), show_shadow = false }
      }
    ),
    collision_box = {{-(ent_size/2 -0.3), -(ent_size/2 -0.3)}, {(ent_size/2 -0.3), (ent_size/2 -0.3)}},
    selection_box = {{-ent_size/2, -ent_size/2}, {ent_size/2, ent_size/2}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.4,
    --module_slots = 3,
    allowed_effects = {"speed", "pollution"},
    source_inventory_size = 1,
    result_inventory_size = 6,
    crafting_speed = 0.1,

    graphics_set =
    {
      animation = 
      {
        layers =
        {
          {
            filename = entity .. "simulation_chamber/simulation_chamber_base.png",
            width = 512,
            height = 512,
            --frame_count = 1,
            --line_length = 1,
            --shift = util.by_pixel(0.5, -9),
            scale = 0.5,
          },
          {
            filename = entity .. "simulation_chamber/simulation_chamber_shadow.png",
            width = 512,
            height = 512,
            --frame_count = 1,
            --line_length = 1,
            --shift = util.by_pixel(0.5, -9),
            scale = 0.5,
            draw_as_shadow = true,
          },
        }
      },
      working_visualisations =
      {
        {
          animation =
          {
            filename = entity .. "simulation_chamber/simulation_chamber_screen_anim.png",
            width = 64,
            height = 64,
            frame_count = 255, -- max is 255
            line_length = 32,
            animation_speed = 1,
            shift = util.by_pixel_hr(-128, -112),
            scale = 0.5,
            draw_as_glow = true,
          },
        },
        {
          animation =
          {
            filename = entity .. "simulation_chamber/simulation_chamber_glow.png",
            width = 512,
            height = 512,
            --frame_count = 255, -- max is 255
            --line_length = 32,
            --animation_speed = 0.04,
            --shift = util.by_pixel_hr(-128, -112),
            scale = 0.5,
            draw_as_glow = true,
            blend_mode = "additive",
          },
        },
        {
          apply_recipe_tint = "primary",
          animation =
          {
            filename = entity .. "simulation_chamber/layer1.png",
            width = 512,
            height = 512,
            scale = 0.5,
          },
        },
        {
          apply_recipe_tint = "secondary",
          animation =
          {
            filename = entity .. "simulation_chamber/layer2.png",
            width = 512,
            height = 512,
            scale = 0.5,
          },
        },
        {
          apply_recipe_tint = "tertiary",
          animation =
          {
            filename = entity .. "simulation_chamber/layer3.png",
            width = 512,
            height = 512,
            scale = 0.5,
          },
        },
        {
          apply_recipe_tint = "quaternary",
          animation =
          {
            filename = entity .. "simulation_chamber/layer4.png",
            width = 512,
            height = 512,
            scale = 0.5,
          },
        },
      }
    },
    impact_category = "metal-large",
    open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
    close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
    working_sound =
    {
      sound = {
        filename = tssounds .. "simulation_chamber_working_sound.ogg",
        volume = 0.7,
      },
      fade_in_ticks = 10,
      fade_out_ticks = 40,
      max_sounds_per_prototype = 4,
      idle_sound = {
        filename = tssounds .. "simulation_chamber_working_sound_idle.ogg",
        volume = 0.7,
      },
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 4 }
    },
    energy_usage = "210kW",
    crafting_categories = {"simulation_chamber"},
    fluid_boxes = {},
    surface_conditions = panglia_only,
  },
})

if mods["quality"] then
  table.insert(data.raw["furnace"]["simulation_chamber"].allowed_effects, "quality")
end