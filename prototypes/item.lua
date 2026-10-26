local icons = "__panglia_planet__/graphics/icons/"
local datacellicons = "__panglia_planet__/graphics/icons/data/"
local entity = "__panglia_planet_assets__/graphics/entity/"

local beacon_multiplier = 50
local panglia_only = {{property = "pressure", min = 1401, max = 1401}}
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

local seconds = 60
local minutes = 60 * seconds



local monster = table.deepcopy(data.raw.unit["big-wriggler-pentapod-premature"])
monster.name = "panglia_monster_1"

data:extend({monster})

local mutated_monster_egg_trigger_result = 
{
  items_per_trigger = 1,
  trigger =
  {
    type = "direct",
    action_delivery =
    {
      type = "instant",
      source_effects =
      {
        {
          type = "create-entity",
          entity_name = "panglia_monster_1",
          affects_target = true,
          show_in_tooltip = true,
          as_enemy = true,
          find_non_colliding_position = true,
          abort_if_over_space = true,
          offset_deviation = {{-5, -5}, {5, 5}},
          non_colliding_fail_result =
          {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "panglia_monster_1",
                  affects_target = true,
                  show_in_tooltip = false,
                  as_enemy = true,
                  offset_deviation = {{-1, -1}, {1, 1}},
                }
              } 
            } 
          } 
        } 
      } 
    } 
  } 
}


local function branbalitepics(num)
  return 
  {
    layers =
    {
      {
        size = 64,
        filename = icons .. "panglia_branbalite_" .. num .. ".png",
        scale = 0.5,
      },
      {
        draw_as_light = true,
        blend_mode = "additive",
        size = 64,
        filename = icons .. "panglia_branbalite_light_" .. num .. ".png",
        scale = 0.5,
        --tint = {0.3, 0.3, 0.3, 0.3}
      }
    }
  }
end

data:extend({
  {
    type = "item",
    name = "panglia_igneous_rock",
    icon = icons .. "panglia_igneous_rock-1.png",
    subgroup = "panglia-processes",
    order = "a[base]-aa",
    inventory_move_sound = item_sounds.metal_barrel_inventory_move,
    pick_sound = item_sounds.metal_barrel_inventory_pickup,
    drop_sound = item_sounds.metal_barrel_inventory_move,
    pictures =
    {
      {size = 64, filename = icons .. "panglia_igneous_rock-1.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_igneous_rock-2.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_igneous_rock-3.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_igneous_rock-4.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_igneous_rock-5.png", scale = 0.5},
    },
    stack_size = 50,
    default_import_location = "panglia",
    random_tint_color = { 217, 156, 111, 255 },
    weight = 20*kg,
    auto_recycle = false,
  },
  {
    type = "item",
    name = "panglia_panglite",
    icon = icons .. "panglia_panglite-1.png",
    subgroup = "panglia-processes",
    order = "a[base]-cc",
    inventory_move_sound = item_sounds.metal_barrel_inventory_move,
    pick_sound = item_sounds.metal_barrel_inventory_pickup,
    drop_sound = item_sounds.metal_barrel_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
    random_tint_color = { 1.0, 0.83, 0.7, 1.0 },
    weight = 20*kg,
    auto_recycle = false,
    pictures =
    {
      {size = 64, filename = icons .. "panglia_panglite-1.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_panglite-2.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_panglite-3.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_panglite-4.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_panglite-5.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_panglite-6.png", scale = 0.5},
    },
  },

  {
    type = "item",
    name = "panglia_panglite_glass",
    icon = icons .. "panglia_panglite_glass-1.png",
    subgroup = "panglia-processes",
    order = "a[base]-cd",
    inventory_move_sound = item_sounds.metal_barrel_inventory_move,
    pick_sound = item_sounds.metal_barrel_inventory_pickup,
    drop_sound = item_sounds.metal_barrel_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
    random_tint_color = { 1.0, 0.83, 0.7, 1.0 },
    weight = 20*kg,
    auto_recycle = false,
    pictures =
    {
      {size = 64, filename = icons .. "panglia_panglite_glass-1.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_panglite_glass-2.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_panglite_glass-3.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_panglite_glass-4.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_panglite_glass-5.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_panglite_glass-6.png", scale = 0.5},
    },
  },
  {
    type = "item",
    name = "panglia_panglite_fiber",
    icon = icons .. "panglia_panglite_fiber.png",
    subgroup = "panglia-processes",
    order = "a[base]-ee",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
    random_tint_color = { 1.0, 0.83, 0.7, 1.0 },
    weight = 20*kg,
    auto_recycle = false,
  },
  {
    type = "item",
    name = "panglia_branbalite", -- is fruit AND seed
    icon = icons .. "panglia_branbalite_1.png",
    subgroup = "panglia-processes",
    order = "a[base]-dd",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "panglia",
    --random_tint_color = item_tints.iron_rust,
    fuel_value = "11MJ",
    --fuel_category = "panglia_branbalite",
    --fuel_categories = {"chemical"},
    plant_result = "panglia_branbalite_plant",
    --place_result = "panglia_branbalite_plant",
    spoil_ticks = 90 * minute,
    spoil_result = "spoilage",
    weight = 10*kg,
    pictures =
    {
      branbalitepics(1),
      branbalitepics(2),
      branbalitepics(3),
      branbalitepics(4),
    },
    auto_recycle = false,
  },
  {
    type = "item",
    name = "panglia_universe_precursor_volcanic",
    icon = icons .. "panglia_universe_precursor_volcanic.png",
    subgroup = "panglia-processes",
    order = "b[otherres]-bb",
    inventory_move_sound = item_sounds.metal_barrel_inventory_move,
    pick_sound = item_sounds.metal_barrel_inventory_pickup,
    drop_sound = item_sounds.metal_barrel_inventory_move,
    stack_size = 20,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    weight = 50*kg,
  },
--     ██████ ██████  ██    ██ ███████ ██   ██ ██ ███    ██  ██████  
--    ██      ██   ██ ██    ██ ██      ██   ██ ██ ████   ██ ██       
--    ██      ██████  ██    ██ ███████ ███████ ██ ██ ██  ██ ██   ███ 
--    ██      ██   ██ ██    ██      ██ ██   ██ ██ ██  ██ ██ ██    ██ 
--     ██████ ██   ██  ██████  ███████ ██   ██ ██ ██   ████  ██████  
  {
    type = "item",
    name = "panglia_dust",
    icon = icons .. "panglia_dust.png",
    icon_size = 64,
    pictures =
    {
      {size = 64, filename = icons .. "panglia_dust.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_dust_2.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_dust_3.png", scale = 0.5},
    },
    subgroup = "panglia-processes",
    order = "a[base]-ff",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 100,
    weight = 1 * kg,
    auto_recycle = false,
  },
  {
    type = "item",
    name = "panglia_dummy_anything_sign",
    icon = icons .. "panglia_dummy_anything_sign.png",
    subgroup = "panglia-processes",
    order = "b[otherres]-bd",
    stack_size = 1,
    hide_from_player_crafting = true,
    hide_from_signal_gui = true,
    hidden = true,
    flags = {"hide-from-bonus-gui", "hide-from-fuel-tooltip", "hide-spoilage-bar-in-world", "hide-health-bar-in-world", "ignore-spoil-time-modifier"},
    hidden_in_factoriopedia = true,
    allow_as_intermediate = false,
    default_import_location = "panglia",
    weight = 1*kg,
  },

--     ██████ ██       ██████  ███    ██ ██ ███    ██  ██████  
--    ██      ██      ██    ██ ████   ██ ██ ████   ██ ██       
--    ██      ██      ██    ██ ██ ██  ██ ██ ██ ██  ██ ██   ███ 
--    ██      ██      ██    ██ ██  ██ ██ ██ ██  ██ ██ ██    ██ 
--     ██████ ███████  ██████  ██   ████ ██ ██   ████  ██████  

  {
    type = "item",
    name = "panglia_dummy_dna_builder_phase2",
    icon = icons .. "panglia_dummy_dna_builder_phase2.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-bdc",
    stack_size = 1,
    hide_from_player_crafting = true,
    hide_from_signal_gui = true,
    hidden = true,
    flags = {"hide-from-bonus-gui", "hide-from-fuel-tooltip", "hide-spoilage-bar-in-world", "hide-health-bar-in-world", "ignore-spoil-time-modifier"},
    hidden_in_factoriopedia = true,
    allow_as_intermediate = false,
    default_import_location = "panglia",
    weight = 1*kg,
    spoil_ticks = 1,
  },
  {
    type = "smoke-with-trigger",
    name = "biter_dna_sample_decomposition",
    icon = icons .. "biter_dna_sample-waste.png",
    animation = {
      filename = entity .. "dna/biter_dna_sample_decomposition.png",
      flags = {"corpse-decay"},
      priority = "high",
      width = 64,
      height = 64,
      frame_count = 16,
      animation_speed = 1/60,
      scale = 0.25,
      --blend_mode = "normal",
      --tint = opts.tint
    },
    render_layer = "above-tiles",
    affected_by_wind = false,
    movement_slow_down_factor = 1,
    duration = 16*60,
    fade_away_duration = 120,
    show_when_smoke_off = true,
    start_scale = 0.25,
    end_scale = 0.25,
    hidden = true,
    hidden_in_factoriopedia = true,
  },
  {
    type = "item",
    name = "biter_dna_sample",
    icon = icons .. "biter_dna_sample.png",
    pictures =
    {
      { filename = icons .. "biter_dna_sample.png", size = 64, scale = 0.5 },
      { filename = icons .. "biter_dna_sample-1.png", size = 64, scale = 0.5 },
      { filename = icons .. "biter_dna_sample-2.png", size = 64, scale = 0.5 },
    },
    subgroup = "panglia-processes",
    order = "c[cloning]-aaa",
    default_import_location = "nauvis",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_move,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 20,
    weight = 1*kg,
    auto_recycle = false,
    spoil_ticks = 8 * minute,
    spoil_to_trigger_result =
    {
      items_per_trigger = 1, -- per 5 items the trigger is run
      trigger =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            {
              type = "create-smoke",
              show_in_tooltip = false,
              show_details_in_tooltip = false,
              entity_name = "biter_dna_sample_decomposition",
              initial_height = 0
            },
          }
        }
      }
    }
  },
  {
    type = "item",
    name = "demolisher_dna_scale",
    icon = icons .. "demolisher_dna_scale.png",
    pictures =
    {
      { filename = icons .. "demolisher_dna_scale.png", size = 64, scale = 1.5 },
      { filename = icons .. "demolisher_dna_scale-1.png", size = 64, scale = 1.5 },
      { filename = icons .. "demolisher_dna_scale-2.png", size = 64, scale = 1.5 },
      { filename = icons .. "demolisher_dna_scale.png", size = 64, scale = 1.7 },
      { filename = icons .. "demolisher_dna_scale-1.png", size = 64, scale = 1.7 },
      { filename = icons .. "demolisher_dna_scale-2.png", size = 64, scale = 1.7 },
    },
    subgroup = "panglia-processes",
    order = "c[cloning]-aba",
    default_import_location = "vulcanus",
    inventory_move_sound = item_sounds.rock_inventory_move,
    pick_sound = item_sounds.rock_inventory_move,
    drop_sound = item_sounds.rock_inventory_move,
    stack_size = 1,
    auto_recycle = false,
    weight = 50*kg,
  },


  {
    type = "item",
    name = "panglia_cloned_specimen_embryo_candidate",
    icon = icons .. "panglia_cloned_specimen_embryo_candidate.png",
    pictures =
    {
      { filename = icons .. "panglia_cloned_specimen_embryo_candidate_belt1.png", size = 64, scale = 0.5 },
      { filename = icons .. "panglia_cloned_specimen_embryo_candidate_belt2.png", size = 64, scale = 0.5 },
      { filename = icons .. "panglia_cloned_specimen_embryo_candidate_belt3.png", size = 64, scale = 0.5 },
      { filename = icons .. "panglia_cloned_specimen_embryo_candidate_belt4.png", size = 64, scale = 0.5 },
    },
    subgroup = "panglia-processes",
    order = "c[cloning]-bbb",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 1 * minute,
    spoil_result = "spoilage",
    auto_recycle = false,
    weight = 2*kg,
  },

  {
    type = "item",
    name = "panglia_cloned_specimen_embryo",
    icon = icons .. "panglia_cloned_specimen_embryo.png",
    pictures =
    {
      { filename = icons .. "panglia_cloned_specimen_embryo_belt1.png", size = 64, scale = 0.5 },
      { filename = icons .. "panglia_cloned_specimen_embryo_belt2.png", size = 64, scale = 0.5 },
      { filename = icons .. "panglia_cloned_specimen_embryo_belt3.png", size = 64, scale = 0.5 },
      { filename = icons .. "panglia_cloned_specimen_embryo_belt4.png", size = 64, scale = 0.5 },
    },
    subgroup = "panglia-processes",
    order = "c[cloning]-bcb",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 1 * minute,
    spoil_result = "spoilage",
    auto_recycle = false,
    weight = 2*kg,
  },

  {
    type = "item",
    name = "panglia_dna_validated",
    icon = icons .. "panglia_dna_validated.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-bdb",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
    weight = 0.5*kg,
    auto_recycle = false,
  },

  {
    type = "item",
    name = "panglia_cloned_specimen_body_1",
    icon = icons .. "panglia_cloned_specimen_body_1.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-bez",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 1,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 1 * minute,
    spoil_result = "spoilage",
    auto_recycle = false,
    weight = 4*kg,
  },
  {
    type = "item",
    name = "panglia_cloned_specimen_body_2",
    icon = icons .. "panglia_cloned_specimen_body_2.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-bgy",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 1,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 2 * minutes,
    spoil_result = "spoilage",
    auto_recycle = false,
    weight = 50*kg,
  },
  {
    type = "item",
    name = "mutated_monster_egg",
    icon = icons .. "mutated_monster_egg.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-bgz",
    --hidden = true,
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    weight = 5*kg,
    spoil_ticks = 15 * 60, -- 15s
    --spoil_result = "spoilage",
    auto_recycle = false,
    spoil_to_trigger_result = mutated_monster_egg_trigger_result,
  },
  {
    type = "item",
    name = "panglia_cloned_specimen_body_3_genius",
    icon = icons .. "panglia_cloned_specimen_body_3_genius.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-bhy",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 1,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 2 * minutes,
    spoil_result = "spoilage",
    auto_recycle = false,
    weight = 65*kg,
  },
  {
    type = "item",
    name = "panglia_cloned_specimen_body_3",
    icon = icons .. "panglia_cloned_specimen_body_3_dumb.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-bhz",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 1,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 2 * minutes,
    spoil_result = "spoilage",
    auto_recycle = false,
    weight = 65*kg,
  },
  {
    type = "item",
    name = "panglia_sentient_processor",
    icon = icons .. "panglia_sentient_processor.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-bjb",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    weight = 10*kg,
  },
--    ██████   █████  ████████  █████   ██████ ███████ ██      ██      
--    ██   ██ ██   ██    ██    ██   ██ ██      ██      ██      ██      
--    ██   ██ ███████    ██    ███████ ██      █████   ██      ██      
--    ██   ██ ██   ██    ██    ██   ██ ██      ██      ██      ██      
--    ██████  ██   ██    ██    ██   ██  ██████ ███████ ███████ ███████ 
  {
    type = "item",
    name = "datacell-dna-raw",
    icon = datacellicons .. "datacell-dna-raw.png",
    subgroup = "moshine-datacells",
    order = "b[panglia]-aa",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    --durability = 1,
    --durability_description_key = "description.science-pack-remaining-amount-key",
    --factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    --durability_description_value = "description.science-pack-remaining-amount-value",
    stack_size = 200,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    plant_result = "processing-grid-process-dna",
    weight = 0.5*kg,
  },
  {
    type = "item",
    name = "datacell-dna-sequenced",
    icon = datacellicons .. "datacell-dna-unfolded.png",
    subgroup = "moshine-datacells",
    order = "b[panglia]-cc",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    --durability = 1,
    --durability_description_key = "description.science-pack-remaining-amount-key",
    --factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    --durability_description_value = "description.science-pack-remaining-amount-value",
    stack_size = 200,
    default_import_location = "panglia",
    weight = 0.5*kg
  },
  {
    type = "item",
    name = "datacell-timewarp_data",
    icon = datacellicons .. "datacell-timewarp_data.png",
    subgroup = "moshine-datacells",
    order = "b[panglia]-dd",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    --durability = 1,
    --durability_description_key = "description.science-pack-remaining-amount-key",
    --factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    --durability_description_value = "description.science-pack-remaining-amount-value",
    stack_size = 200,
    default_import_location = "panglia",
    weight = 0.5*kg
  },
})



if helpers.compare_versions(mods["base"], "2.1.20") >= 0 then
  data.raw.item["panglia_branbalite"].fuel_categories = {"chemical"}
end