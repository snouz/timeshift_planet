local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

local seconds = 60
local minutes = 60 * seconds



------------------------------------------------------
--------------------- SUB-GROUPS ---------------------
------------------------------------------------------

data:extend({

  {
    type = "item-subgroup",
    name = "moshine-datacells",
    group = "intermediate-products",
    order = "pb"
  },
  {
    type = "item-subgroup",
    name = "panglia-processes",
    group = "intermediate-products",
    order = "pc"
  },
  {
    type = "item-subgroup",
    name = "panglia-production-machine",
    group = "production",
    order = "e3"
  },
  {
    type = "recipe-category",
    name = "simulation_chamber"
  },
  {
    type = "fuel-category",
    name = "panglia_branbalite"
  },
  {
    type = "item-subgroup",
    name = "panglia-sped-up-entities",
    group = "other",
    order = "zz"
  },
})





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
    type = "recipe",
    name = "panglia_igneous_rock_to_lava",
    icon = icons .. "panglia_igneous_rock_to_lava.png",
    subgroup = "panglia-processes",
    order = "a[base]-bb",
    category = "metallurgy",
    enabled = false,
    auto_recycle = false,
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

------------------------------------------------------
------------- PANGLITE (circular rocks) --------------
------------------------------------------------------

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
    type = "recipe",
    name = "panglia_panglite",
    --icon = icons .. "panglia_panglite_multiplication.png",
    --subgroup = "panglia-processes",
    --order = "a[base]-cc",
    category = "smelting",
    enabled = false,
    auto_recycle = false,
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
  },

  {
    type = "recipe",
    name = "panglia_panglite_fiber",
    icon = icons .. "panglia_panglite_fiber.png",
    --subgroup = "panglia-processes",
    --category = "chemistry",
    subgroup = "panglia-processes",
    order = "a[base]-ff",
    --category = "centrifuging",
    category = "electromagnetics",
    additional_categories = {"centrifuging"},
    enabled = false,
    auto_recycle = false,
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
    crafting_machine_tint =
    {
      primary = {240, 168, 56, 255}, -- #f0a938ff
      secondary = {240, 168, 56, 255},
      tertiary = {240, 168, 56, 255},
      quaternary = {240, 168, 56, 255},
    },
    surface_conditions = panglia_only,
  },

})

------------------------------------------------------
---------- BRANBALITE (cyan plant/slurry) ------------
------------------------------------------------------


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
    fuel_value = "1MJ",
    fuel_category = "panglia_branbalite",
    plant_result = "panglia_branbalite_plant",
    place_result = "panglia_branbalite_plant",
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
  },
  {
    type = "fluid",
    name = "panglia_branbalite_slurry",
    icon = icons .. "panglia_branbalite_slurry.png",
    subgroup = "fluid",
    order = "zzz[new-fluid]-s[panglia]-a[branbalite_slurry]",
    default_temperature = 165,
    max_temperature = 165,
    gas_temperature = 165,
    heat_capacity = "0.2kJ",
    base_color = {82, 199, 238},
    flow_color = {82, 199, 238},
    --order = "a[fluid]-a[water]-c[panglia_branbalite_slurry]",
    auto_barrel = true,
    fuel_value = "1MJ",
  },
  {
    type = "recipe",
    name = "panglia_branbalite_slurry",
    icon = icons .. "panglia_branbalite_slurry_recipe.png",
    subgroup = "panglia-processes",
    order = "a[base]-ee",
    category = "organic-or-chemistry",
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



  ------DUST
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
    hidden_in_factoriopedia = true,
    default_import_location = "panglia",
    weight = 1*kg,
  },

  {
    type = "recipe",
    name = "panglia_dust",
    --icon = icons .. "panglia_dust.png",
    category = "panglia_crushing",
    subgroup = "panglia-processes",
    order = "a[base]-ff",
    enabled = false,
    --hide_from_player_crafting = true,
    --hide_from_signal_gui = true,
    --hidden = true,
    --hidden_in_factoriopedia = true,
    -- this is now done through incinerator crafting speed
    -- energy_required = 1.0 / settings.startup["flare-stack-item-rate"].value,
    energy_required = 1,
    always_show_made_in = true,
    ingredients = {
      { type = "item", name = "panglia_dummy_anything_sign", amount = 1 },
    },
    results = {
      { type = "item", name = "panglia_dust", amount = 1 }
    },
    --icon_size = 64,
    --order = "zz[panglia_crushing]",
  },

})


--- OTHER RESOURCES

data:extend({



  {
    type = "recipe",
    name = "panglia_branbalite_slurry_to_lubricant",
    icon = icons .. "panglia_branbalite_slurry_to_lubricant.png",
    subgroup = "panglia-processes",
    order = "b[otherres]-aa",
    category = "oil-processing",
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
  },
  {
    type = "recipe",
    name = "panglia_branbalite_slurry_to_rocket_fuel",
    icon = icons .. "panglia_branbalite_slurry_to_rocket_fuel.png",
    category = "chemistry-or-cryogenics",
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
  },
  {
    type = "recipe",
    name = "panglia_advanced_circuit_from_panglite_fiber",
    icon = icons .. "panglia_advanced_circuit_from_panglite_fiber.png",
    category = "electronics",
    subgroup = "panglia-processes",
    order = "b[otherres]-ac",
    auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 0.5 * beacon_multiplier,
    ingredients =
    {
      {type = "item", name = "electronic-circuit", amount = 2},
      {type = "item", name = "panglia_panglite_fiber", amount = 2},
      {type = "item", name = "copper-cable", amount = 4}
    },
    results = {
      {type = "item", name = "advanced-circuit", amount = 1}
    },
    main_product = "advanced-circuit",
    allow_decomposition = false,
    surface_conditions = panglia_only,
  },
  {
    type = "recipe",
    name = "panglia_low_density_structure_from_panglite_fiber",
    icon = icons .. "panglia_low_density_structure_from_panglite_fiber.png",
    subgroup = "panglia-processes",
    order = "b[otherres]-ad",
    energy_required = 0.1 * beacon_multiplier,
    --category = "crafting-with-fluid",
    category = "chemistry",
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
    --always_show_made_in = true,
    surface_conditions = panglia_only,
  },

    --[[
  {
    type = "recipe",
    name = "panglia_branbalite_slurry_to_crudeoil",
    icon = icons .. "panglia_branbalite_slurry_to_crudeoil.png",
    subgroup = "panglia-processes",
    order = "b[otherres]-aa",
    category = "oil-processing",
    enabled = false,
    energy_required = 0.5 * beacon_multiplier,
    ingredients = {
      {type = "fluid", name = "panglia_branbalite_slurry", amount = 65},
      {type = "fluid", name = "steam", amount = 35}
    },
    results = {
      {type = "fluid", name = "crude-oil", amount = 90},
      {type = "fluid", name = "water", amount = 10, show_details_in_recipe_tooltip = false}
    },
    main_product = "crude-oil",
    allow_productivity = true,
    allow_decomposition = false,
    surface_conditions = panglia_only,
  },
]]
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
  --[[{
    type = "item",
    name = "panglia_universe_precursor_2",
    icon = icons .. "panglia_universe_precursor_2.png",
    subgroup = "panglia-processes",
    order = "b[otherres]-bb",
    inventory_move_sound = item_sounds.metal_barrel_inventory_move,
    pick_sound = item_sounds.metal_barrel_inventory_pickup,
    drop_sound = item_sounds.metal_barrel_inventory_move,
    stack_size = 20,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    weight = 50*kg,
  },]]
  {
    type = "recipe",
    name = "panglia_universe_precursor_volcanic",
    --icon = icons .. "panglia_universe_precursor_1.png",
    --subgroup = "panglia-processes",
    --order = "b[otherres]-bb",
    energy_required = 0.5 * beacon_multiplier,
    category = "metallurgy",
    ingredients =
    {
      {type = "fluid", name = "lava", amount = 10},
      {type = "fluid", name = "lubricant", amount = 10},
      {type = "item", name = "panglia_panglite", amount = 5},
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
  },
  {
    type = "recipe",
    name = "panglia_universe_precursor",
    --icon = icons .. "panglia_universe_precursor_2.png",
    subgroup = "panglia-processes",
    order = "b[otherres]-bc",
    energy_required = 0.5 * beacon_multiplier,
    category = "chemistry",
    ingredients =
    {
      {type = "fluid", name = "panglia_branbalite_slurry", amount = 2},
      {type = "item", name = "panglia_panglite_fiber", amount = 2},
      {type = "item", name = "panglia_dust", amount = 50},
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
  },

  {
    type = "recipe",
    name = "panglia_universe_precursor_volcanic_result",
    --localised_name = {"", {"recipe-name.cosmic_incubator_recipe"}, " (", {"space-location-name." .. planet.name}, ")"},
    icon = icons .. "panglia_universe_precursor_volcanic_result.png",
    category = "cosmic_incubator",
    subgroup = "matter_printer_recipes",
    order = "aaa",
    enabled = false,
    energy_required = 40,
    ingredients = {
      {type = "item", name = "panglia_universe_precursor_volcanic", amount = 1}
    },
    results = {
      {type = "item", name = "panglia_igneous_rock", amount_min = 0, amount_max = 300, probability = 1},
      {type = "item", name = "uranium-238", amount_min = 0, amount_max = 25, probability = 0.4, show_details_in_recipe_tooltip = false},
      {type = "item", name = "solid-fuel", amount_min = 0, amount_max = 50, probability = 0.4, show_details_in_recipe_tooltip = false},
      --{type = "item", name = "calcite", amount_min = 0, amount_max = 42, probability = 0.4},
    },
    surface_conditions = panglia_only,
    allow_productivity = false,
    --allow_inserter_overload = true,
    --overload_multiplier = 1000,
    auto_recycle = false,
    --hidden = true,
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
    category = "cosmic_incubator",
    subgroup = "matter_printer_recipes",
    order = "aaa",
    enabled = true,
    energy_required = 60,
    ingredients = {
      {type = "item", name = "universe_precursor", amount = 1}
    },
    results = {
      {type = "item", name = "silicon", amount_min = 0, amount_max = 75, probability = 0.3, show_details_in_recipe_tooltip = false},
      --{type = "item", name = "solid-fuel", amount_min = 0, amount_max = 15, probability = 0.3, show_details_in_recipe_tooltip = false},
      {type = "item", name = "holmium-ore", amount_min = 0, amount_max = 3, probability = 0.2, show_details_in_recipe_tooltip = false},
      {type = "item", name = "tungsten-ore", amount_min = 0, amount_max = 6, probability = 0.1, show_details_in_recipe_tooltip = false},
      {type = "item", name = "sulfur", amount_min = 0, amount_max = 25, probability = 0.25, show_details_in_recipe_tooltip = false},
      {type = "item", name = "calcite", amount_min = 0, amount_max = 6, probability = 0.07, show_details_in_recipe_tooltip = false},
      {type = "item", name = "lithium", amount_min = 0, amount_max = 6, probability = 0.07, show_details_in_recipe_tooltip = false},
    },
    surface_conditions = panglia_only,
    allow_productivity = false,
    --allow_inserter_overload = true,
    --overload_multiplier = 1000,
    auto_recycle = false,
    --hidden = true,
    hide_from_player_crafting = true,
    hidden_in_factoriopedia = false,
  },


})


-------------------- datacells

data:extend({

  {
    type = "tool",
    name = "datacell-dna-raw",
    icon = icons .. "datacell-dna-raw.png",
    subgroup = "moshine-datacells",
    order = "b[panglia]-aa",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    stack_size = 40,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    plant_result = "processing-grid-process-dna",
    weight = 5*kg,
  },
  {
    type = "recipe",
    name = "datacell-dna-raw",
    icon = icons .. "datacell-dna-raw.png",
    subgroup = "moshine-datacells",
    order = "b[panglia]-bb",
    category = "cloning",
    energy_required = 1 * beacon_multiplier,
    ingredients = {
      {type = "item", name = "datacell-empty", amount = 1},
      --TODO add DNA source
    },
    results = 
    {
      {type = "item", name = "datacell-dna-raw", amount = 1, probability = 0.01},
      {type = "item", name = "datacell-empty", amount = 1, probability = 0.99},
    },
    main_product = "datacell-dna-raw",
    allow_productivity = true,
    enabled = false,
  },
  {
    type = "tool",
    name = "datacell-dna-sequenced",
    icon = icons .. "datacell-dna-sequenced.png",
    subgroup = "moshine-datacells",
    order = "b[panglia]-cc",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    stack_size = 40,
    default_import_location = "panglia",
    weight = 5*kg
  },

})

--log(serpent.block(data.raw.unit["big-wriggler-pentapod-premature"]))

local monster = table.deepcopy(data.raw.unit["big-wriggler-pentapod-premature"])
monster.name = "panglia_monster_1"

data:extend({monster})

------------------ mutants
data:extend({
  {
    type = "item",
    name = "mutated_monster_egg",
    icon = icons .. "mutated_monster_egg.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-dd",
    hidden = true,
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    weight = 5*kg,
    spoil_ticks = 15 * 60, -- 15s
    --spoil_result = "spoilage",
    spoil_to_trigger_result =
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
    },
  },
})










------------------------------ Brains

data:extend({
  {
    type = "recipe",
    name = "panglia_cloned_specimen_body_0",
    icon = icons .. "panglia_cloned_specimen_body_0_recipe.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-ee",
    category = "cloning",
    energy_required = 30 * beacon_multiplier,
    ingredients = {
      --{type = "item", name = "datacell-empty", amount = 1},
      {type = "item", name = "uranium-235", amount = 1},
      {type = "item", name = "bioflux", amount = 1},
      {type = "item", name = "datacell-dna-sequenced", amount = 1}
      --TODO add DNA source
    },
    results = {
      {type = "item", name = "datacell-dna-raw", amount = 1, probability = 1},
      --{type = "item", name = "datacell-empty", amount = 1, probability = 0.99}
      {type = "item", name = "uranium-238", amount = 1, probability = 1, show_details_in_recipe_tooltip = false},
      {type = "item", name = "panglia_cloned_specimen_body_0", amount = 1, probability = 0.05},
      {type = "item", name = "mutated_monster_egg", amount = 1, probability = 0.95},
    },
    main_product = "panglia_cloned_specimen_body_0",
    allow_productivity = false,
    enabled = false,
    surface_conditions = panglia_only,
    auto_recycle = false,
    result_is_always_fresh = true,
    reset_freshness_on_craft = true,
  },




  {
    type = "item",
    name = "panglia_cloned_specimen_body_0",
    icon = icons .. "panglia_cloned_specimen_body_0.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-ff",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 1 * minute,
    spoil_result = "spoilage",
    weight = 2*kg,
  },




  {
    type = "recipe",
    name = "panglia_cloned_specimen_body_1",
    icon = icons .. "panglia_cloned_specimen_body_1_recipe.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-gg",
    category = "simulation_chamber",
    energy_required = 30 * beacon_multiplier,
    ingredients = {
      {type = "item", name = "panglia_cloned_specimen_body_0", amount = 1},
    },
    results = 
    {
      {type = "item", name = "panglia_cloned_specimen_body_1", amount = 1, probability = 0.9},
      {type = "item", name = "spoilage", amount = 2, probability = 1, show_details_in_recipe_tooltip = false},
    },
    main_product = "panglia_cloned_specimen_body_1",
    allow_productivity = false,
    enabled = false,
    crafting_machine_tint = {
      primary = {r = 1, g = 1, b = 1, a = 1}, -- #ffa342ff
      secondary = {r = 0, g = 0, b = 0, a = 0}, -- #ffb85fff
      tertiary = {r = 0, g = 0, b = 0, a = 0}, -- #d9a892ff
      quaternary = {r = 0, g = 0, b = 0, a = 0}, -- #ff7e45ff
    },
    surface_conditions = panglia_only,
    auto_recycle = false,
    result_is_always_fresh = true,
    reset_freshness_on_craft = true,
  },
  {
    type = "item",
    name = "panglia_cloned_specimen_body_1",
    icon = icons .. "panglia_cloned_specimen_body_1.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-hh",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 1,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 1 * minute,
    spoil_result = "spoilage",
    weight = 4*kg,
  },


  {
    type = "recipe",
    name = "panglia_cloned_specimen_body_2",
    icon = icons .. "panglia_cloned_specimen_body_2_recipe.png",
    category = "simulation_chamber",
    subgroup = "panglia-processes",
    order = "c[cloning]-ii",
    energy_required = 60 * beacon_multiplier,
    ingredients = {
      {type = "item", name = "panglia_cloned_specimen_body_1", amount = 1},
    },
    results = 
    {
      {type = "item", name = "panglia_cloned_specimen_body_2", amount = 1, probability = 0.8},
      {type = "item", name = "spoilage", amount = 1, probability = 0.5, show_details_in_recipe_tooltip = false},
    },
    main_product = "panglia_cloned_specimen_body_2",
    allow_productivity = true,
    enabled = false,
    crafting_machine_tint = {
      primary = {r = 0, g = 0, b = 0, a = 0},
      secondary = {r = 0, g = 0, b = 0, a = 0},
      tertiary = {r = 1, g = 1, b = 1, a = 1},
      quaternary = {r = 0, g = 0, b = 0, a = 0},
    },
    --hidden = true,
    hide_from_player_crafting = true,
    surface_conditions = panglia_only,
    auto_recycle = false,
    result_is_always_fresh = true,
    reset_freshness_on_craft = true,
  },
  {
    type = "item",
    name = "panglia_cloned_specimen_body_2",
    icon = icons .. "panglia_cloned_specimen_body_2.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-jj",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 1,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 2 * minutes,
    spoil_result = "spoilage",
    weight = 50*kg,
  },

  {
    type = "recipe",
    name = "panglia_cloned_specimen_body_3",
    icon = icons .. "panglia_cloned_specimen_body_3_recipe.png",
    category = "simulation_chamber",
    subgroup = "panglia-processes",
    order = "c[cloning]-kk",
    energy_required = 30 * beacon_multiplier,
    ingredients = {
      {type = "item", name = "panglia_cloned_specimen_body_2", amount = 1},
    },
    results = 
    {
      {type = "item", name = "panglia_cloned_specimen_body_3_genius", amount = 1, probability = 0.1, show_details_in_recipe_tooltip = false},
      {type = "item", name = "panglia_cloned_specimen_body_3", amount = 1, probability = 0.9},
    },
    main_product = "panglia_cloned_specimen_body_3",
    allow_productivity = true,
    enabled = false,
    crafting_machine_tint = {
      primary = {r = 0, g = 0, b = 0, a = 0},
      secondary = {r = 0, g = 0, b = 0, a = 0},
      tertiary = {r = 0, g = 0, b = 0, a = 0},
      quaternary = {r = 1, g = 1, b = 1, a = 1},
    },
    --hidden = true,
    hide_from_player_crafting = true,
    surface_conditions = panglia_only,
    auto_recycle = false,
    result_is_always_fresh = true,
    reset_freshness_on_craft = true,
  },

  {
    type = "item",
    name = "panglia_cloned_specimen_body_3_genius",
    icon = icons .. "panglia_cloned_specimen_body_3_genius.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-ll",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 1,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 2 * minutes,
    spoil_result = "spoilage",
    weight = 65*kg,
  },
  {
    type = "item",
    name = "panglia_cloned_specimen_body_3",
    icon = icons .. "panglia_cloned_specimen_body_3_dumb.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-mm",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 1,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 2 * minutes,
    spoil_result = "spoilage",
    weight = 65*kg,
  },


  {
    type = "item",
    name = "panglia_sentient_processor",
    icon = icons .. "panglia_sentient_processor.png",
    subgroup = "panglia-processes",
    order = "c[cloning]-nn",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    weight = 10*kg,
  },
  {
    type = "recipe",
    name = "panglia_sentient_processor",
    icon = icons .. "panglia_sentient_processor.png",
    subgroup = "panglia-processes",
    order = "b[otherres]-nn",
    energy_required = 2 * beacon_multiplier,
    category = "thinkingbrain",
    ingredients =
    {
      {type = "item", name = "quantum-processor", amount = 1},
      {type = "item", name = "panglia_cloned_specimen_body_3", amount = 1},
      {type = "item", name = "processing-unit", amount = 1},
      {type = "item", name = "panglia_panglite", amount = 5},
    },
    results = {
      {type = "item", name = "panglia_sentient_processor", amount = 1}
    },
    main_product = "panglia_sentient_processor",
    allow_productivity = true,
    enabled = false,
    surface_conditions = panglia_only,
    auto_recycle = false,
  },

})
