local cloning_multiplier = 1 --general multiplier for the whole cloning chain
local beacon_multiplier = 1 --50 --time offset by the hidden beacons


local one_year = 10


local panglia_dna_builder_make_phasetwo_time = 10
local embryo_candidate_time = 1 * one_year --1y
local embryo_time = 1 * one_year --1y

local body_1_candidate_time = 3 * one_year --3y
local body_1_time = 3 * one_year --3y
local body_2_time = 12* one_year --12y
local body_3_time = 8 * one_year --8y


local body_1_candidate_successrate = 0.1
local body_1_successrate = 0.8

--local body_2_successrate = 0.8
local body_2_mutant_rate = 0.1
local body_2_spoilage_rate = 0.1

local body_3_successrate = 0.9
local body_3_genius_rate = 0.1


local icons = "__panglia_planet__/graphics/icons/"
local datacellicons = "__panglia_planet__/graphics/icons/data/"
local entity = "__panglia_planet_assets__/graphics/entity/"

local panglia_only = {{property = "pressure", min = 1401, max = 1401}}
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

local seconds = 60
local minutes = 60 * seconds

local opaque = {r = 1, g = 1, b = 1, a = 1}
local transparent = {r = 0, g = 0, b = 0, a = 0}

local only_primary =    { primary = opaque,      secondary = transparent, tertiary = transparent, quaternary = transparent }
local only_secondary =  { primary = transparent, secondary = opaque,      tertiary = transparent, quaternary = transparent }
local only_tertiary =   { primary = transparent, secondary = transparent, tertiary = opaque,      quaternary = transparent }
local only_quaternary = { primary = transparent, secondary = transparent, tertiary = transparent, quaternary = opaque      }


data:extend({



  {
    type = "recipe",
    name = "panglia_igneous_rock_to_lava",
    icon = icons .. "panglia_igneous_rock_to_lava.png",
    subgroup = "panglia-processes",
    order = "a[base]-bb",
    categories = {"metallurgy"},
    enabled = false,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 1 * beacon_multiplier,
    ingredients = {
      {type = "item", name = "panglia_igneous_rock", amount = 1}
    },
    results = {
      {type = "fluid", name = "lava", amount = 100},
    },
    crafting_machine_tint =
    {
      primary =    util.color("#f56942"),
      secondary =  util.color("#f56942"),
      tertiary =   util.color("#f56942"),
      quaternary = util.color("#f56942"),
    },
    --main_product = "panglia_panglite",
    allow_productivity = true,
    show_amount_in_title = false,
    surface_conditions = panglia_only,
    allow_quality = false,
  },
  {
    type = "recipe",
    name = "panglia_panglite",
    icon = icons .. "panglia_panglite_multiplication.png",
    --subgroup = "panglia-processes",
    --order = "a[base]-cc",
    categories = {"smelting"},
    always_show_made_in = true,
    enabled = false,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 1 * beacon_multiplier,
    ingredients = {
      {type = "item", name = "panglia_panglite", amount = 5}
    },
    results = {
      {type = "item", name = "panglia_panglite", amount = 6}
    },
    main_product = "panglia_panglite",
    allow_productivity = true,
    show_amount_in_title = false,
    surface_conditions = panglia_only,
    allow_quality = false,
  },

  {
    type = "recipe",
    name = "panglia_panglite_glass",
    --icon = icons .. "panglia_panglite_multiplication.png",
    --subgroup = "panglia-processes",
    --order = "a[base]-cc",
    categories = {"metallurgy"},
    always_show_made_in = true,
    enabled = false,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 10,
    ingredients = {
      {type = "item", name = "panglia_panglite", amount = 1},
      {type = "item", name = "glass", amount = 1},
    },
    results = {
      {type = "item", name = "panglia_panglite_glass", amount = 1},
    },
    allow_productivity = true,
    show_amount_in_title = false,
    surface_conditions = panglia_only,
    allow_quality = false,
  },


  {
    type = "recipe",
    name = "panglia_panglite_fiber",
    icon = icons .. "panglia_panglite_fiber.png",
    subgroup = "panglia-processes",
    order = "a[base]-ff",
    categories = {"electromagnetics", "centrifuging"},
    enabled = false,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 5 * beacon_multiplier,
    ingredients = {
      {type = "item", name = "panglia_panglite", amount = 40},
      {type = "item", name = "uranium-238", amount = 1, show_details_in_recipe_tooltip = false},
    },
    results = {
      {type = "item", name = "panglia_panglite_fiber", amount = 10},
      {type = "item", name = "uranium-235", amount = 1, show_details_in_recipe_tooltip = false},
    },
    main_product = "panglia_panglite_fiber",
    always_show_products = true,
    always_show_made_in = true,
    allow_productivity = false,
    show_amount_in_title = false,
    sort_item_ingredients = false,
    crafting_machine_tint =
    {
      primary =    util.color("#f0a838"), --orange
      secondary =  util.color("#f0a838"),
      tertiary =   util.color("#f0a838"),
      quaternary = util.color("#f0a838"),
    },
    surface_conditions = panglia_only,
  },
  {
    type = "recipe",
    name = "panglia_branbalite_slurry",
    icon = icons .. "panglia_branbalite_slurry_recipe.png",
    subgroup = "panglia-processes",
    order = "a[base]-ee",
    categories = {"organic", "chemistry"},
    energy_required = 1,
    ingredients = {
      {type = "item", name = "panglia_branbalite", amount = 1},
      {type = "fluid", name = "water", amount = 30},
    },
    results = {
      {type = "fluid", name = "panglia_branbalite_slurry", amount = 40}
    },
    main_product = "panglia_branbalite_slurry",
    allow_productivity = true,
    enabled = false,
    allow_decomposition = false,
    surface_conditions = panglia_only,
    crafting_machine_tint =
    {
      primary =    util.color("#52c7ee"),
      secondary =  util.color("#52c7ee"),
      tertiary =   util.color("#52c7ee"),
      quaternary = util.color("#52c7ee"),
    },
  },
  {
    type = "recipe",
    name = "panglia_dust",
    categories = {"panglia_crushing"},
    subgroup = "panglia-processes",
    order = "a[base]-ff1",
    enabled = false,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_made_in = true,
    hide_from_signal_gui = false,
    allow_quality = false,
    energy_required = 1,
    always_show_made_in = true,
    ingredients = {
      { type = "item", name = "panglia_dummy_anything_sign", amount = 1 },
    },
    results = {
      { type = "item", name = "panglia_dust", amount = 1 }
    },
    auto_recycle = false,
  },

  {
    type = "recipe",
    name = "item-panglia_dust-panglia_crushing",
    icon = icons .. "panglia_dust-recycling.png",
    categories = {"panglia_crushing"},
    subgroup = "panglia-processes",
    order = "a[base]-ff2",
    enabled = false,
    allow_decomposition = false,
    allow_as_intermediate = false,
    always_show_made_in = true,
    hide_from_signal_gui = false,
    allow_quality = false,
    energy_required = 0.5,
    always_show_made_in = true,
    ingredients = {
      { type = "item", name = "panglia_dust", amount = 1 },
    },
    results = {
      { type = "item", name = "panglia_dust", amount = 1, independent_probability = 0.5 }
    },
    auto_recycle = false,
  },

  {
    type = "recipe",
    name = "panglia_branbalite_slurry_to_lubricant",
    icon = icons .. "panglia_branbalite_slurry_to_lubricant.png",
    subgroup = "panglia-processes",
    order = "b[otherres]-aa",
    categories = {"oil-processing"},
    enabled = false,
    energy_required = 0.5 * beacon_multiplier,
    ingredients = {
      {type = "fluid", name = "panglia_branbalite_slurry", amount = 65},
      {type = "fluid", name = "steam", amount = 35},
    },
    results = {
      {type = "fluid", name = "lubricant", amount = 90},
      {type = "fluid", name = "water", amount = 10, show_details_in_recipe_tooltip = false},
    },
    crafting_machine_tint =
    {
      primary = util.color("#42f59c"),
      secondary = util.color("#6eca62"),
      tertiary = util.color("#a57865"),
      quaternary = util.color("#ff6420"),
    },
    main_product = "lubricant",
    allow_productivity = true,
    allow_decomposition = false,
    surface_conditions = panglia_only,
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "panglia_branbalite_slurry_to_rocket_fuel",
    icon = icons .. "panglia_branbalite_slurry_to_rocket_fuel.png",
    categories = {"chemistry", "cryogenics"},
    subgroup = "panglia-processes",
    order = "b[otherres]-ab",
    auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 0.5 * beacon_multiplier,
    ingredients =
    {
      {type = "fluid", name = "panglia_branbalite_slurry", amount = 10},
      {type = "item", name = "solid-fuel", amount = 10},
    },
    results = {
      {type = "item", name = "rocket-fuel", amount = 1},
    },
    main_product = "rocket-fuel",
    crafting_machine_tint =
    {
      primary = util.color("#52c7ee"), --blue
      secondary = util.color("#52c7ee"),
      tertiary = util.color("#52c7ee"),
      quaternary = util.color("#52c7ee"),
    },
    allow_decomposition = false,
    surface_conditions = panglia_only,
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "panglia_advanced_circuit_from_panglite_fiber",
    icon = icons .. "panglia_advanced_circuit_from_panglite_fiber.png",
    categories = {"crafting", "electromagnetics"},
    subgroup = "panglia-processes",
    order = "b[otherres]-ac",
    auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 0.5 * beacon_multiplier,
    ingredients =
    {
      {type = "item", name = "panglia_panglite_fiber", amount = 2},
      {type = "item", name = "electronic-circuit", amount = 2},
      {type = "item", name = "copper-cable", amount = 4},
    },
    results = {
      {type = "item", name = "advanced-circuit", amount = 1},
    },
    main_product = "advanced-circuit",
    allow_decomposition = false,
    surface_conditions = panglia_only,
    sort_item_ingredients = false,
    auto_recycle = false,
  },
  {
    type = "recipe",
    name = "panglia_low_density_structure_from_panglite_fiber",
    icon = icons .. "panglia_low_density_structure_from_panglite_fiber.png",
    subgroup = "panglia-processes",
    order = "b[otherres]-ad",
    energy_required = 0.1 * beacon_multiplier,
    categories = {"chemistry"},
    ingredients = {
      {type = "item", name = "panglia_panglite_fiber", amount = 1},
      {type = "fluid", name = "steam", amount = 10},
    },
    results = {
      {type = "item", name = "low-density-structure", amount = 2},
    },
    allow_productivity = true,
    enabled = false,
    show_amount_in_title = false,
    auto_recycle = false,
    allow_decomposition = false,
    surface_conditions = panglia_only,
  },
--    ███    ███  █████  ████████ ████████ ███████ ██████      ██████  ██████  ██ ███    ██ ████████ ███████ ██████  
--    ████  ████ ██   ██    ██       ██    ██      ██   ██     ██   ██ ██   ██ ██ ████   ██    ██    ██      ██   ██ 
--    ██ ████ ██ ███████    ██       ██    █████   ██████      ██████  ██████  ██ ██ ██  ██    ██    █████   ██████  
--    ██  ██  ██ ██   ██    ██       ██    ██      ██   ██     ██      ██   ██ ██ ██  ██ ██    ██    ██      ██   ██ 
--    ██      ██ ██   ██    ██       ██    ███████ ██   ██     ██      ██   ██ ██ ██   ████    ██    ███████ ██   ██ 

  {
    type = "recipe",
    name = "panglia_universe_precursor_volcanic",
    energy_required = 0.5 * beacon_multiplier,
    categories = {"metallurgy"},
    ingredients =
    {
      {type = "item", name = "panglia_panglite", amount = 5},
      {type = "fluid", name = "lava", amount = 10},
      {type = "fluid", name = "lubricant", amount = 10},
    },
    results = {
      {type = "item", name = "panglia_universe_precursor_volcanic", amount = 1}
    },
    crafting_machine_tint =
    {
      primary = util.color("#f56942"), --dark orange
      secondary = util.color("#f56942"),
      tertiary = util.color("#f56942"),
      quaternary = util.color("#f56942"),
    },
    allow_productivity = true,
    enabled = false,
    surface_conditions = panglia_only,
    sort_item_ingredients = false,
    allow_decomposition = false,
  },
  {
    type = "recipe",
    name = "panglia_universe_precursor",
    subgroup = "panglia-processes",
    order = "b[otherres]-bc",
    energy_required = 0.5 * beacon_multiplier,
    categories = {"chemistry"},
    ingredients =
    {
      {type = "item", name = "panglia_dust", amount = 50},
      {type = "item", name = "panglia_panglite_fiber", amount = 2},
      {type = "fluid", name = "panglia_branbalite_slurry", amount = 2},
    },
    results = {
      {type = "item", name = "universe_precursor", amount = 1}
    },
    crafting_machine_tint =
    {
      primary = util.color("#52c7ee"), --blue
      secondary = util.color("#52c7ee"),
      tertiary = util.color("#52c7ee"),
      quaternary = util.color("#52c7ee"),
    },
    allow_productivity = true,
    enabled = false,
    surface_conditions = panglia_only,
    sort_item_ingredients = false,
    auto_recycle = false,
    allow_decomposition = false,
  },

  {
    type = "recipe",
    name = "panglia_universe_precursor_volcanic_result",
    --localised_name = {"", {"recipe-name.cosmic_incubator_recipe"}, " (", {"space-location-name." .. planet.name}, ")"},
    icon = icons .. "panglia_universe_precursor_volcanic_result.png",
    categories = {"cosmic_incubator"},
    subgroup = "matter_printer_recipes",
    order = "aaa",
    enabled = false,
    energy_required = 40,
    ingredients = {
      {type = "item", name = "panglia_universe_precursor_volcanic", amount = 1}
    },
    results = {
      {type = "item", name = "panglia_igneous_rock", amount_min = 0, amount_max = 300, independent_probability = 1},
      {type = "item", name = "uranium-238", amount_min = 0, amount_max = 25, independent_probability = 0.4, show_details_in_recipe_tooltip = false},
      {type = "item", name = "solid-fuel", amount_min = 0, amount_max = 50, independent_probability = 0.4, show_details_in_recipe_tooltip = false},
    },
    surface_conditions = panglia_only,
    allow_productivity = false,
    auto_recycle = false,
    allow_decomposition = false,
    hide_from_player_crafting = true,
    hidden_in_factoriopedia = false,
    crafting_machine_tint =
    {
      primary = util.color("#fc9344"), -- orange
      secondary = util.color("#f5d2b8"), --pale orange
    },


  },
  {
    type = "recipe",
    name = "panglia_universe_precursor_2_result",
    --localised_name = {"", {"recipe-name.cosmic_incubator_recipe"}, " (", {"space-location-name." .. planet.name}, ")"},
    icon = icons .. "panglia_universe_precursor_2_result.png",
    categories = {"cosmic_incubator"},
    subgroup = "matter_printer_recipes",
    order = "aaa",
    enabled = true,
    energy_required = 60,
    ingredients = {
      {type = "item", name = "universe_precursor", amount = 1}
    },
    results = {
      {type = "item", name = "silicon", amount_min = 0, amount_max = 75, independent_probability = 0.3, show_details_in_recipe_tooltip = false},
      --{type = "item", name = "solid-fuel", amount_min = 0, amount_max = 15, independent_probability = 0.3, show_details_in_recipe_tooltip = false},
      {type = "item", name = "holmium-ore", amount_min = 0, amount_max = 3, independent_probability = 0.2, show_details_in_recipe_tooltip = false},
      {type = "item", name = "tungsten-ore", amount_min = 0, amount_max = 6, independent_probability = 0.1, show_details_in_recipe_tooltip = false},
      {type = "item", name = "sulfur", amount_min = 0, amount_max = 25, independent_probability = 0.25, show_details_in_recipe_tooltip = false},
      {type = "item", name = "calcite", amount_min = 0, amount_max = 6, independent_probability = 0.07, show_details_in_recipe_tooltip = false},
      {type = "item", name = "lithium", amount_min = 0, amount_max = 6, independent_probability = 0.07, show_details_in_recipe_tooltip = false},
    },
    surface_conditions = panglia_only,
    allow_productivity = false,
    auto_recycle = false,
    allow_decomposition = false,
    hide_from_player_crafting = true,
    hidden_in_factoriopedia = false,
  },

--    ██████  ███    ██  █████  
--    ██   ██ ████   ██ ██   ██ 
--    ██   ██ ██ ██  ██ ███████ 
--    ██   ██ ██  ██ ██ ██   ██ 
--    ██████  ██   ████ ██   ██ 



--panglia_collect_dna_fish
--panglia_collect_dna_biter
--panglia_collect_dna_demolisher
--panglia_collect_dna_pentapod

  {
    type = "recipe",
    name = "panglia_collect_dna_fish",
    icon = datacellicons .. "panglia_collect_dna_fish.png",
    subgroup = "data-fluid",
    order = "h[dna_raw_data]-1",
    categories = {"dna_scanning"},
    energy_required = 1,
    ingredients = {
      --{type = "item", name = "datacell-empty", amount = 1},
      {type = "item", name = "raw-fish", amount = 1},
    },
    results = 
    {
      {type = "fluid", name = "dna_raw_data", amount_min = 12, amount_max = 30},
      {type = "item", name = "spoilage", amount = 1},
    },
    allow_productivity = true,
    enabled = false,
    sort_item_ingredients = false,
    crafting_machine_tint = {primary = util.color("#f0f188"),secondary = util.color("#eeeecb")},
    raise_on_crafted = true,
    auto_recycle = false,
    allow_decomposition = false,
    hide_from_player_crafting = false, --only show this one
  },


  {
    type = "recipe",
    name = "panglia_collect_dna_biter",
    icon = datacellicons .. "panglia_collect_dna_biter.png",
    subgroup = "data-fluid",
    order = "h[dna_raw_data]-2",
    categories = {"dna_scanning"},
    energy_required = 1,
    ingredients = {
      {type = "item", name = "biter_dna_sample", amount = 1},
    },
    results = 
    {
      {type = "fluid", name = "dna_raw_data", amount_min = 15, amount_max = 120},
      {type = "item", name = "spoilage", amount = 1},
    },
    --main_product = "datacell-dna-raw",
    allow_productivity = true,
    enabled = false,
    sort_item_ingredients = false,
    crafting_machine_tint = {primary = util.color("#e39d51"),secondary = util.color("#eccaa5")},
    raise_on_crafted = true,
    auto_recycle = false,
    allow_decomposition = false,
    hide_from_player_crafting = true,
  },

  {
    type = "recipe",
    name = "panglia_collect_dna_biter_egg",
    icon = datacellicons .. "panglia_collect_dna_biter_egg.png",
    subgroup = "data-fluid",
    order = "h[dna_raw_data]-3",
    categories = {"dna_scanning"},
    energy_required = 30,
    ingredients = {
      {type = "item", name = "biter-egg", amount = 1},
    },
    results = 
    {
      {type = "fluid", name = "dna_raw_data", amount_min = 302, amount_max = 2780},
      {type = "item", name = "spoilage", amount = 1},
    },
    --main_product = "datacell-dna-raw",
    allow_productivity = true,
    enabled = false,
    sort_item_ingredients = false,
    crafting_machine_tint = {primary = util.color("#eec34b"),secondary = util.color("#f1deaa")},
    raise_on_crafted = true,
    auto_recycle = false,
    allow_decomposition = false,
    hide_from_player_crafting = true,
  },


  {
    type = "recipe",
    name = "panglia_collect_dna_demolisher",
    icon = datacellicons .. "panglia_collect_dna_demolisher.png",
    subgroup = "data-fluid",
    order = "h[dna_raw_data]-4",
    categories = {"dna_scanning"},
    energy_required = 100,
    ingredients = {
      {type = "item", name = "demolisher_dna_scale", amount = 1},
    },
    results = 
    {
      {type = "fluid", name = "dna_raw_data", amount_min = 302, amount_max = 4780},
      {type = "item", name = "stone", amount_min = 17, amount_max = 32},
    },
    allow_productivity = true,
    enabled = false,
    sort_item_ingredients = false,
    crafting_machine_tint = {primary = util.color("#cf4018"),secondary = util.color("#e28065")},
    raise_on_crafted = true,
    auto_recycle = false,
    allow_decomposition = false,
    hide_from_player_crafting = true,
  },


  {
    type = "recipe",
    name = "panglia_collect_dna_pentapod",
    icon = datacellicons .. "panglia_collect_dna_pentapod.png",
    subgroup = "data-fluid",
    order = "h[dna_raw_data]-5",
    categories = {"dna_scanning"},
    energy_required = 1,
    ingredients = {
      {type = "item", name = "pentapod-egg", amount = 1},
    },
    results = 
    {
      {type = "fluid", name = "dna_raw_data", amount = 100},
      {type = "item", name = "spoilage", amount = 1},
    },
    allow_productivity = true,
    enabled = false,
    sort_item_ingredients = false,
    crafting_machine_tint = {primary = util.color("#c1cd19"),secondary = util.color("#e4e99a")},
    raise_on_crafted = true,
    auto_recycle = false,
    allow_decomposition = false,
    hide_from_player_crafting = true,
  },



  {
    type = "recipe",
    name = "panglia_cloned_specimen_embryo_candidate",
    categories = {"dna_builder_1"},
    always_show_made_in = true,
    enabled = false,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = embryo_candidate_time * cloning_multiplier * beacon_multiplier,
    ingredients = {
      {type = "fluid", name = "dna_raw_data", amount = 5},
    },
    results = {
      {type = "item", name = "panglia_cloned_specimen_embryo_candidate", amount = 1},
    },
    crafting_machine_tint = only_primary,
    allow_productivity = true,
    show_amount_in_title = false,
    surface_conditions = panglia_only,
    allow_quality = false,
    raise_on_crafted = true,
    overload_multiplier = 1,
    allow_inserter_overload = false,
  },
  {
    type = "recipe",
    name = "panglia_dna_builder_make_phasetwo",
    icon = icons .. "panglia_dna_builder_make_phasetwo.png",
    --order = "111",
    categories = {"dna_builder_1"},
    always_show_made_in = true,
    enabled = false,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = panglia_dna_builder_make_phasetwo_time * cloning_multiplier * beacon_multiplier,
    ingredients = {
      {type = "item", name = "panglia_dna_validated", amount = 1},
    },
    results = {
      {type = "item", name = "panglia_dummy_dna_builder_phase2", amount = 1},  ---dummy
    },
    crafting_machine_tint = only_secondary,
    allow_productivity = true,
    show_amount_in_title = false,
    surface_conditions = panglia_only,
    allow_quality = false,
    raise_on_crafted = true,  --------------------------TRANSFORMS BUILDING
    overload_multiplier = 1,
    allow_inserter_overload = false,
  },
  {
    type = "recipe",
    name = "panglia_cloned_specimen_embryo",
    categories = {"dna_builder_2"},
    always_show_made_in = true,
    enabled = true,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = embryo_time * cloning_multiplier * beacon_multiplier,
    ingredients = {
      {type = "fluid", name = "panglia_branbalite_slurry", amount = 15},
    },
    results = {
      {type = "item", name = "panglia_cloned_specimen_embryo", amount = 1},
    },
    crafting_machine_tint = only_primary,
    allow_productivity = true,
    show_amount_in_title = false,
    surface_conditions = panglia_only,
    allow_quality = false,
    raise_on_crafted = true,
    overload_multiplier = 1,
    allow_inserter_overload = false,
  },
  {
    type = "recipe",
    name = "panglia_cloned_specimen_body_1_candidate",
    icon = icons .. "panglia_cloned_specimen_body_1_candidate.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-bdb",
    categories = {"simulation_chamber"},
    energy_required = body_1_candidate_time * cloning_multiplier * beacon_multiplier,
    ingredients = {
      {type = "item", name = "panglia_cloned_specimen_embryo_candidate", amount = 1},
    },
    results = 
    {
      {type = "item", name = "panglia_dna_validated", amount = 1, shared_probability = {min = 0, max = body_1_candidate_successrate}},
      {type = "item", name = "panglia_cloned_specimen_body_1", amount = 1, shared_probability = {min = 0, max = body_1_candidate_successrate}, always_fresh = true},
      {type = "item", name = "spoilage", amount = 2, shared_probability = {min = body_1_candidate_successrate, max = 1}, show_details_in_recipe_tooltip = false},
    },
    main_product = "panglia_dna_validated",
    allow_productivity = false,
    enabled = false,
    crafting_machine_tint = only_secondary,
    surface_conditions = panglia_only,
    auto_recycle = false,
    allow_decomposition = false,
    sort_item_ingredients = false,
  },

  {
    type = "recipe",
    name = "panglia_cloned_specimen_body_1",
    icon = icons .. "panglia_cloned_specimen_body_1_recipe.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-bfb",
    categories = {"simulation_chamber"},
    energy_required = body_1_time * cloning_multiplier * beacon_multiplier,
    ingredients = {
      {type = "item", name = "panglia_cloned_specimen_embryo", amount = 1},
    },
    results = 
    {
      {type = "item", name = "panglia_cloned_specimen_body_1", amount = 1, shared_probability = {min = 0, max = body_1_successrate}, always_fresh = true},
      {type = "item", name = "spoilage", amount = 2,                       shared_probability = {min = body_1_successrate, max = 1}, show_details_in_recipe_tooltip = false},
    },
    main_product = "panglia_cloned_specimen_body_1",
    allow_productivity = false,
    enabled = false,
    crafting_machine_tint = only_secondary,
    surface_conditions = panglia_only,
    auto_recycle = false,
    allow_decomposition = false,
    sort_item_ingredients = false,
  },
  {
    type = "recipe",
    name = "panglia_cloned_specimen_body_2",
    icon = icons .. "panglia_cloned_specimen_body_2_recipe.png",
    categories = {"simulation_chamber"},
    subgroup = "panglia-processes",
    order = "c[cloning]-bgb",
    energy_required = body_2_time * cloning_multiplier * beacon_multiplier,
    ingredients = {
      {type = "item", name = "panglia_cloned_specimen_body_1", amount = 1},
    },
    results = 
    {
      {type = "item", name = "panglia_cloned_specimen_body_2", amount = 1, shared_probability = {min = 0, max = (1 - body_2_spoilage_rate - body_2_mutant_rate)}, always_fresh = true},
      {type = "item", name = "mutated_monster_egg", amount = 1,            shared_probability = {min = (1 - body_2_spoilage_rate - body_2_mutant_rate), max = (1 - body_2_spoilage_rate)}, always_fresh = true},
      {type = "item", name = "spoilage", amount = 1,                       shared_probability = {min = (1 - body_2_spoilage_rate), max = 1}, show_details_in_recipe_tooltip = false},
    },
    main_product = "panglia_cloned_specimen_body_2",
    allow_productivity = true,
    enabled = false,
    crafting_machine_tint = only_tertiary,
    hide_from_player_crafting = true,
    surface_conditions = panglia_only,
    auto_recycle = false,
    allow_decomposition = false,
    sort_item_ingredients = false,
  },
  {
    type = "recipe",
    name = "panglia_cloned_specimen_body_3",
    icon = icons .. "panglia_cloned_specimen_body_3_recipe.png",
    categories = {"simulation_chamber"},
    subgroup = "panglia-processes",
    order = "c[cloning]-bhb",
    energy_required = body_3_time * cloning_multiplier * beacon_multiplier,
    ingredients = {
      {type = "item", name = "panglia_cloned_specimen_body_2", amount = 1},
    },
    results = 
    {
      {type = "item", name = "panglia_cloned_specimen_body_3_genius", amount = 1, shared_probability = {min = 0, max = body_3_genius_rate}, always_fresh = true, show_details_in_recipe_tooltip = false},
      {type = "item", name = "panglia_cloned_specimen_body_3", amount = 1, shared_probability = {min = body_3_genius_rate, max = body_3_successrate}, always_fresh = true},
      {type = "item", name = "spoilage", amount = 1, shared_probability = {min = body_3_successrate, max = 1}, show_details_in_recipe_tooltip = false},
    },
    main_product = "panglia_cloned_specimen_body_3",
    allow_productivity = true,
    enabled = false,
    crafting_machine_tint = only_quaternary,
    hide_from_player_crafting = true,
    surface_conditions = panglia_only,
    auto_recycle = false,
    allow_decomposition = false,
    sort_item_ingredients = false,
  },

--    ██████   █████  ████████  █████   ██████ ███████ ██      ██      ███████ 
--    ██   ██ ██   ██    ██    ██   ██ ██      ██      ██      ██      ██      
--    ██   ██ ███████    ██    ███████ ██      █████   ██      ██      ███████ 
--    ██   ██ ██   ██    ██    ██   ██ ██      ██      ██      ██           ██ 
--    ██████  ██   ██    ██    ██   ██  ██████ ███████ ███████ ███████ ███████ 

  {
    type = "recipe",
    name = "datacell-dna-raw",
    icon =  datacellicons .. "datacell-dna-raw.png",
    categories = {"data-processing"},
    subgroup = "moshine-datacells",
    order = "b[panglia]-ee",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "datacell-empty", amount = 1, ignored_by_stats = 1},
      {type = "fluid", name = "dna_raw_data", amount = 150, ignored_by_stats = 150},
    },
    results = {{type = "item", name = "datacell-dna-raw", amount = 1, ignored_by_stats = 1}},
    allow_productivity = false,
    auto_recycle = false,
    allow_decomposition = false,
    enabled = false,
    crafting_machine_tint = {primary = util.color("#48001e")},
  },
  {
    type = "recipe",
    name = "datacell-remove-dna-raw",
    icon = datacellicons .. "datacell-dna-raw-remove.png",
    categories = {"data-processing"},
    subgroup = "moshine-datacells",
    order = "b[panglia]-ef",
    hide_from_player_crafting = true,
    hide_from_stats = true,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "datacell-dna-raw", amount = 1, ignored_by_stats = 1},
    },
    results = {
      {type = "item", name = "datacell-empty", amount = 1, ignored_by_stats = 1},
      {type = "fluid", name = "dna_raw_data", amount = 150, ignored_by_stats = 150},
    },
    allow_productivity = false,
    auto_recycle = false,
    allow_decomposition = false,
    enabled = false,
    hide_from_player_crafting = true,
    crafting_machine_tint = {primary = util.color("#48001e")},
  },
  {
    type = "recipe",
    name = "datacell-dna-sequenced",
    icon =  datacellicons .. "datacell-dna-unfolded.png",
    categories = {"data-processing"},
    subgroup = "moshine-datacells",
    order = "b[panglia]-fe",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "datacell-empty", amount = 1, ignored_by_stats = 1},
      {type = "fluid", name = "dna_sequenced_data", amount = 100, ignored_by_stats = 100},
    },
    results = {{type = "item", name = "datacell-dna-sequenced", amount = 1, ignored_by_stats = 1}},
    allow_productivity = false,
    auto_recycle = false,
    allow_decomposition = false,
    enabled = false,
    crafting_machine_tint = {primary = util.color("#ffeeee")},
  },
  {
    type = "recipe",
    name = "datacell-remove-dna-sequenced",
    icon = datacellicons .. "datacell-dna-unfolded-remove.png",
    categories = {"data-processing"},
    subgroup = "moshine-datacells",
    order = "b[panglia]-ff",
    hide_from_player_crafting = true,
    hide_from_stats = true,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "datacell-dna-sequenced", amount = 1, ignored_by_stats = 1},
    },
    results = {
      {type = "item", name = "datacell-empty", amount = 1, ignored_by_stats = 1},
      {type = "fluid", name = "dna_sequenced_data", amount = 100, ignored_by_stats = 100},
    },
    allow_productivity = false,
    auto_recycle = false,
    allow_decomposition = false,
    enabled = false,
    hide_from_player_crafting = true,
    crafting_machine_tint = {primary = util.color("#ffeeee")},
  },
  {
    type = "recipe",
    name = "datacell-timewarp_data",
    icon =  datacellicons .. "datacell-timewarp_data.png",
    categories = {"data-processing"},
    subgroup = "moshine-datacells",
    order = "b[panglia]-de",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "datacell-empty", amount = 1, ignored_by_stats = 1},
      {type = "fluid", name = "timewarp_data", amount = 100, ignored_by_stats = 100},
    },
    results = {{type = "item", name = "datacell-timewarp_data", amount = 1, ignored_by_stats = 1}},
    allow_productivity = false,
    auto_recycle = false,
    allow_decomposition = false,
    enabled = false,
    crafting_machine_tint = {primary = util.color("#d699ff")},
  },
  {
    type = "recipe",
    name = "datacell-remove-timewarp_data",
    icon = datacellicons .. "datacell-timewarp_data-remove.png",
    categories = {"data-processing"},
    subgroup = "moshine-datacells",
    order = "b[panglia]-df",
    hide_from_player_crafting = true,
    hide_from_stats = true,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "datacell-timewarp_data", amount = 1, ignored_by_stats = 1},
    },
    results = {
      {type = "item", name = "datacell-empty", amount = 1, ignored_by_stats = 1},
      {type = "fluid", name = "timewarp_data", amount = 100, ignored_by_stats = 100},
    },
    allow_productivity = false,
    auto_recycle = false,
    allow_decomposition = false,
    enabled = false,
    hide_from_player_crafting = true,
    crafting_machine_tint = {primary = util.color("#d699ff")},
  },
  --[[
  {
    type = "recipe",
    name = "panglia_cloned_specimen_body_0",
    icon = icons .. "panglia_cloned_specimen_body_0_recipe.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-ee",
    categories = {"cloning"},
    energy_required = 30 * beacon_multiplier,
    ingredients = {
      {type = "item", name = "datacell-dna-sequenced", amount = 1},
      {type = "item", name = "bioflux", amount = 1},
      {type = "item", name = "uranium-235", amount = 1},
    },
    results = {
      {type = "item", name = "panglia_cloned_specimen_body_0", amount = 1, shared_probability = {min = 0, max = 0.05}, always_fresh = true},
      {type = "item", name = "mutated_monster_egg", amount = 1, shared_probability = {min = 0.05, max = 1}, always_fresh = true},
      {type = "item", name = "datacell-dna-raw", amount = 1, independent_probability = 1},
      {type = "item", name = "uranium-238", amount = 1, independent_probability = 1, show_details_in_recipe_tooltip = false},
    },
    main_product = "panglia_cloned_specimen_body_0",
    allow_productivity = false,
    enabled = false,
    surface_conditions = panglia_only,
    auto_recycle = false,
    allow_decomposition = false,
    sort_item_ingredients = false,
  },
]]



  {
    type = "recipe",
    name = "panglia_sentient_processor",
    icon = icons .. "panglia_sentient_processor.png",
    subgroup = "panglia-processes",
    order = "b[otherres]-nn",
    energy_required = 2 * beacon_multiplier,
    categories = {"thinkingbrain"},
    ingredients =
    {
      {type = "item", name = "panglia_cloned_specimen_body_3", amount = 1},
      {type = "item", name = "panglia_panglite", amount = 5},
      {type = "item", name = "quantum-processor", amount = 1},
      {type = "item", name = "processing-unit", amount = 1},
    },
    results = {
      {type = "item", name = "panglia_sentient_processor", amount = 1}
    },
    main_product = "panglia_sentient_processor",
    allow_productivity = true,
    enabled = false,
    surface_conditions = panglia_only,
    auto_recycle = true,
    allow_decomposition = false,
    sort_item_ingredients = false,
  },
})