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


local only_primary = {
  primary = {r = 1, g = 1, b = 1, a = 1},
  secondary = {r = 0, g = 0, b = 0, a = 0},
  tertiary = {r = 0, g = 0, b = 0, a = 0},
  quaternary = {r = 0, g = 0, b = 0, a = 0},
}
local only_secondary = {
  primary = {r = 0, g = 0, b = 0, a = 0}, -- #ffa342ff
  secondary = {r = 1, g = 1, b = 1, a = 1}, -- #ffb85fff
  tertiary = {r = 0, g = 0, b = 0, a = 0}, -- #d9a892ff
  quaternary = {r = 0, g = 0, b = 0, a = 0}, -- #ff7e45ff
}
local only_tertiary = {
  primary = {r = 0, g = 0, b = 0, a = 0},
  secondary = {r = 0, g = 0, b = 0, a = 0},
  tertiary = {r = 1, g = 1, b = 1, a = 1},
  quaternary = {r = 0, g = 0, b = 0, a = 0},
}
local only_quaternary = {
  primary = {r = 0, g = 0, b = 0, a = 0}, -- #ffa342ff
  secondary = {r = 0, g = 0, b = 0, a = 0}, -- #ffb85fff
  tertiary = {r = 0, g = 0, b = 0, a = 0}, -- #d9a892ff
  quaternary = {r = 1, g = 1, b = 1, a = 1}, -- #ff7e45ff
}


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
      primary = {245, 105, 66},
      secondary = {245, 105, 66},
      tertiary = {245, 105, 66},
      quaternary = {245, 105, 66},
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
      --{type = "fluid", name = "sulfuric-acid", amount = 40},
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
      primary = {240, 168, 56, 255}, -- #f0a938ff
      secondary = {240, 168, 56, 255},
      tertiary = {240, 168, 56, 255},
      quaternary = {240, 168, 56, 255},
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
      primary = {82, 199, 238},
      secondary = {82, 199, 238},
      tertiary = {82, 199, 238},
      quaternary = {82, 199, 238},
    },
  },
  {
    type = "recipe",
    name = "panglia_dust",
    --icon = icons .. "panglia_dust.png",
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
    results = {{ type = "item", name = "panglia_dust", amount = 1, independent_probability = 0.5 }},
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
      {type = "fluid", name = "steam", amount = 35}
    },
    results = {
      {type = "fluid", name = "lubricant", amount = 90},
      {type = "fluid", name = "water", amount = 10, show_details_in_recipe_tooltip = false}
    },
    crafting_machine_tint =
    {
      primary = {66, 245, 156}, -- #44b838ff
      secondary = {r = 0.432, g = 0.793, b = 0.386, a = 1.000}, -- #6eca62ff
      tertiary = {r = 0.647, g = 0.471, b = 0.396, a = 1.000}, -- #a57865ff
      quaternary = {r = 1.000, g = 0.395, b = 0.127, a = 1.000}, -- #ff6420ff
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
      {type = "item", name = "rocket-fuel", amount = 1}
    },
    main_product = "rocket-fuel",
    crafting_machine_tint =
    {
      primary = {82, 199, 238},
      secondary = {82, 199, 238},
      tertiary = {82, 199, 238},
      quaternary = {82, 199, 238},
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
      {type = "item", name = "copper-cable", amount = 4}
    },
    results = {
      {type = "item", name = "advanced-circuit", amount = 1}
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
      {type = "item", name = "low-density-structure", amount = 2}
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
      primary = {245, 105, 66},
      secondary = {245, 105, 66},
      tertiary = {245, 105, 66},
      quaternary = {245, 105, 66},
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
      primary = {82, 199, 238},
      secondary = {82, 199, 238},
      tertiary = {82, 199, 238},
      quaternary = {82, 199, 238},
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
      primary = {252, 147, 68},
      secondary = {245, 210, 184},
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
    subgroup = "panglia-processes",
    order = "c[dna_scanning]-dda",
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
    subgroup = "panglia-processes",
    order = "c[dna_scanning]-ddb",
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
    subgroup = "panglia-processes",
    order = "c[dna_scanning]-ddc",
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
    subgroup = "panglia-processes",
    order = "c[dna_scanning]-ddd",
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
    subgroup = "panglia-processes",
    order = "c[dna_scanning]-dde",
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
    name = "panglia_dna_candidate",
    categories = {"dna_builder_1"},
    always_show_made_in = true,
    enabled = false,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 1 * beacon_multiplier,
    ingredients = {
      {type = "fluid", name = "dna_raw_data", amount = 5},
    },
    results = {
      {type = "item", name = "panglia_dna_candidate", amount = 1},
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
    order = "111",
    categories = {"dna_builder_1"},
    always_show_made_in = true,
    enabled = false,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 10 * beacon_multiplier,
    ingredients = {
      {type = "item", name = "panglia_dna_validated", amount = 1},
    },
    results = {},
    crafting_machine_tint = only_secondary,
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
    name = "panglia_cloned_specimen_body_1_trial",
    icon = icons .. "panglia_cloned_specimen_body_1_recipe.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-gg",
    categories = {"simulation_chamber"},
    energy_required = 1 * beacon_multiplier, --30 * beacon_multiplier,
    ingredients = {
      {type = "item", name = "panglia_dna_candidate", amount = 1},
    },
    results = 
    {
      {type = "item", name = "panglia_dna_validated", amount = 1, shared_probability = {min = 0, max = 0.5}},
      {type = "item", name = "panglia_cloned_specimen_body_1", amount = 1, shared_probability = {min = 0, max = 0.5}, always_fresh = true},
      {type = "item", name = "spoilage", amount = 2, shared_probability = {min = 0.5, max = 1}, show_details_in_recipe_tooltip = false},
    },
    main_product = "panglia_dna_validated",
    allow_productivity = false,
    enabled = false,
    crafting_machine_tint = only_primary,
    surface_conditions = panglia_only,
    auto_recycle = false,
    allow_decomposition = false,
  },

  {
    type = "recipe",
    name = "panglia_cloned_specimen_body_0",
    categories = {"dna_builder_2"},
    always_show_made_in = true,
    enabled = true,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 1 * beacon_multiplier,
    ingredients = {
      {type = "fluid", name = "panglia_branbalite_slurry", amount = 15},
    },
    results = {
      {type = "item", name = "panglia_cloned_specimen_body_0", amount = 5},
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
    name = "panglia_cloned_specimen_body_1",
    icon = icons .. "panglia_cloned_specimen_body_1_recipe.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-gg",
    categories = {"simulation_chamber"},
    energy_required = 30 * beacon_multiplier,
    ingredients = {
      {type = "item", name = "panglia_cloned_specimen_body_0", amount = 1},
    },
    results = 
    {
      {type = "item", name = "panglia_cloned_specimen_body_1", amount = 1, shared_probability = {min = 0, max = 0.9}, always_fresh = true},
      {type = "item", name = "spoilage", amount = 2, shared_probability = {min = 0.9, max = 1}, show_details_in_recipe_tooltip = false},
    },
    main_product = "panglia_cloned_specimen_body_1",
    allow_productivity = false,
    enabled = false,
    crafting_machine_tint = only_primary,
    surface_conditions = panglia_only,
    auto_recycle = false,
    allow_decomposition = false,
  },


  {
    type = "recipe",
    name = "panglia_cloned_specimen_body_2",
    icon = icons .. "panglia_cloned_specimen_body_2_recipe.png",
    categories = {"simulation_chamber"},
    subgroup = "panglia-processes",
    order = "c[cloning]-ii",
    energy_required = 60 * beacon_multiplier,
    ingredients = {
      {type = "item", name = "panglia_cloned_specimen_body_1", amount = 1},
    },
    results = 
    {
      {type = "item", name = "panglia_cloned_specimen_body_2", amount = 1, shared_probability = {min = 0, max = 0.8}, always_fresh = true},
      {type = "item", name = "spoilage", amount = 1, shared_probability = {min = 0.8, max = 1}, show_details_in_recipe_tooltip = false},
    },
    main_product = "panglia_cloned_specimen_body_2",
    allow_productivity = true,
    enabled = false,
    crafting_machine_tint = only_tertiary,
    hide_from_player_crafting = true,
    surface_conditions = panglia_only,
    auto_recycle = false,
    allow_decomposition = false,
  },

  {
    type = "recipe",
    name = "panglia_cloned_specimen_body_3",
    icon = icons .. "panglia_cloned_specimen_body_3_recipe.png",
    categories = {"simulation_chamber"},
    subgroup = "panglia-processes",
    order = "c[cloning]-kk",
    energy_required = 30 * beacon_multiplier,
    ingredients = {
      {type = "item", name = "panglia_cloned_specimen_body_2", amount = 1},
    },
    results = 
    {
      {type = "item", name = "panglia_cloned_specimen_body_3_genius", amount = 1, shared_probability = {min = 0, max = 0.1}, always_fresh = true, show_details_in_recipe_tooltip = false},
      {type = "item", name = "panglia_cloned_specimen_body_3", amount = 1, shared_probability = {min = 0.1, max = 1}, always_fresh = true},
    },
    main_product = "panglia_cloned_specimen_body_3",
    allow_productivity = true,
    enabled = false,
    crafting_machine_tint = only_quaternary,
    hide_from_player_crafting = true,
    surface_conditions = panglia_only,
    auto_recycle = false,
    allow_decomposition = false,
  },

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