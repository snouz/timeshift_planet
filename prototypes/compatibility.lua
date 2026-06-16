
if data.raw["lab"]["neural_computer"] then
  table.insert(data.raw["lab"]["neural_computer"].inputs, "datacell-dna-raw")
  table.insert(data.raw["lab"]["neural_computer"].inputs, "datacell-dna-sequenced")
end

if data.raw["agricultural-tower"]["processing-grid"] and data.raw["agricultural-tower"]["processing-grid"].accepted_seeds then
	table.insert(data.raw["agricultural-tower"]["processing-grid"].accepted_seeds, "datacell-dna-raw")
end


--if data.raw.item["universe_precursor"] then
--	data.raw.item["universe_precursor"].subgroup = "panglia-processes"
--  data.raw.item["universe_precursor"].order = "a[universe_precursor]"
--end

if data.raw.item["matter_printer"] then
	data.raw.item["matter_printer"].subgroup = "panglia-production-machine"
  data.raw.item["matter_printer"].order = "a[matter_printer]"
end
if data.raw.item["cloning-vat"] then
	data.raw.item["cloning-vat"].subgroup = "panglia-production-machine"
  data.raw.item["cloning-vat"].order = "c[cloning-vat]"
end
if data.raw.item["thinking-brain"] then
	data.raw.item["thinking-brain"].subgroup = "panglia-production-machine"
  data.raw.item["thinking-brain"].order = "f[universe_precursor]"
end


if data.raw.recipe["matter_printer"] then
  data.raw.recipe["matter_printer"].ingredients =
  {
    {type = "item", name = "neural_computer", amount = 1},
    {type = "item", name = "electromagnetic-plant", amount = 1},
    {type = "item", name = "electronic-circuit", amount = 10},
    --{type = "item", name = "productivity-module", amount = 10},
    --{type = "item", name = "uranium-235", amount = 5},
    {type = "item", name = "panglia_panglite", amount = 10},
    {type = "item", name = "glass", amount = 50},
  }
end
if data.raw.recipe["universe_precursor"] then
  data.raw.recipe["universe_precursor"].surface_conditions = {
    {property = "panglia_timeshift", min = 0, max = 0},
    {property = "gravity", min = 0.01}
  }
end

if data.raw.recipe["thinking-brain"] then
	data.raw.recipe["thinking-brain"].ingredients =
  {
    {type = "item", name = "processing-unit", amount = 10},
    {type = "item", name = "low-density-structure", amount = 5},
    {type = "item", name = "ai-tier-10", amount = 1},
    {type = "item", name = "panglia_cloned_specimen_body_3_genius", amount = 1},
    {type = "fluid", name = "panglia_branbalite_slurry", amount = 150},
  }
end

--if data.raw.technology["cloning-vat-technology"] then
--	table.insert(data.raw.technology["cloning-vat-technology"].effects, {type = "unlock-recipe", recipe = "cloning-vat"})
--end

if data.raw.recipe["cloning-vat"] then
	data.raw.recipe["cloning-vat"].ingredients = {
    {type = "item", name = "biochamber", amount = 1},
    {type = "item", name = "processing-unit", amount = 1},
    {type = "item", name = "carbon-fiber", amount = 5},
    {type = "fluid", name = "panglia_branbalite_slurry", amount = 150},
  }
  data.raw.recipe["cloning-vat"].category = "crafting-with-fluid"
end


if data.raw["assembling-machine"]["cloning-vat"] then
  table.insert(data.raw["assembling-machine"]["cloning-vat"].allowed_module_categories, "panglia_module")
end


if mods["quality-seeds"] then
  if quality_seeds and quality_seeds.ignore_plants then
    table.insert(quality_seeds.ignore_plants, "panglia_branbalite_plant")
    table.insert(quality_seeds.ignore_plants, "processing-grid-process-dna")
  end
end

if mods["snouz_better_asteroid_collector"] then
  data.raw["technology"]["snouz_better_asteroid_collector"].prerequisites = {"panglia_sentient_processor"}
  data.raw["recipe"]["snouz_better_asteroid_collector"].ingredients =
  {
    {type = "item", name = "asteroid-collector", amount = 2},
    {type = "item", name = "panglia_sentient_processor", amount = 1},
    {type = "item", name = "electric-engine-unit", amount = 6};
    {type = "fluid", name = "fluoroketone-cold", amount = 6, ignored_by_stats = 3},
  }
  data.raw["recipe"]["snouz_better_asteroid_collector"].results = {
    {type = "item", name = "snouz_better_asteroid_collector", amount = 1},
    {type = "fluid", name = "fluoroketone-hot", amount = 3, temperature = 180, ignored_by_stats = 3, ignored_by_productivity = 3}
  }
  data.raw["item"]["snouz_better_asteroid_collector"].default_import_location = "panglia"
end

if mods["snouz_space_platform_hull"] then
  data.raw["recipe"]["snouz_wall_hull"].ingredients = 
  {
    {type = "item", name = "stone-wall", amount = 1},
    {type = "item", name = "panglia_panglite_fiber", amount = 5},
    {type = "item", name = "space-platform-foundation", amount = 1},
  }
  data.raw["item"]["snouz_wall_hull"].default_import_location = "panglia"
  data.raw["technology"]["snouz_wall_hull"].prerequisites = {"panglia_panglite_fiber"}
  data.raw["technology"]["snouz_wall_hull"].unit.ingredients =
  {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"military-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1},
    {"utility-science-pack", 1},
    {"space-science-pack", 1},
    --{"metallurgic-science-pack", 1},
    --{"electromagnetic-science-pack", 1},
    --{"agricultural-science-pack", 1},
    --{"cryogenic-science-pack", 1},
    --{"promethium-science-pack", 1}
  }
end

if mods["snouz_long_electric_gun_turret"] then
  data.raw["recipe"]["snouz_long_electric_gun_turret"].ingredients =
  {
    {type = "item", name = "gun-turret", amount = 2},
    {type = "item", name = "supercapacitor", amount = 1},
    {type = "item", name = "radar", amount = 1},
    {type = "item", name = "panglia_panglite_fiber", amount = 5},
  }
  data.raw["item"]["snouz_long_electric_gun_turret"].default_import_location = "panglia"

  data.raw["technology"]["snouz_long_electric_gun_turret"].prerequisites = {"panglia_panglite_fiber", "electromagnetic-plant"}
  data.raw["technology"]["snouz_long_electric_gun_turret"].unit.ingredients =
  {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"military-science-pack", 1},
    {"chemical-science-pack", 1},
    --{"production-science-pack", 1},
    {"utility-science-pack", 1},
    {"space-science-pack", 1},
    --{"metallurgic-science-pack", 1},
    {"electromagnetic-science-pack", 1},
    --{"agricultural-science-pack", 1},
    --{"cryogenic-science-pack", 1},
    --{"promethium-science-pack", 1}
  }
end




data.raw["tool"]["datacell-empty"].subgroup = "moshine-datacells"
data.raw["tool"]["datacell-empty"].order = "a[moshine]-aa"
data.raw["tool"]["datacell-raw-data"].subgroup = "moshine-datacells"
data.raw["tool"]["datacell-raw-data"].order = "a[moshine]-bb"
data.raw["recipe"]["datacell-raw-data"].subgroup = "moshine-datacells"
data.raw["recipe"]["datacell-raw-data"].order = "a[moshine]-bc"
data.raw["recipe"]["datacell-remove-raw-data"].subgroup = "moshine-datacells"
data.raw["recipe"]["datacell-remove-raw-data"].order = "a[moshine]-bd"

data.raw["tool"]["datacell-ai-model-data"].subgroup = "moshine-datacells"
data.raw["tool"]["datacell-ai-model-data"].order = "a[moshine]-cc"
data.raw["recipe"]["datacell-ai-model-data"].subgroup = "moshine-datacells"
data.raw["recipe"]["datacell-ai-model-data"].order = "a[moshine]-cd"

data.raw["tool"]["datacell-equation"].subgroup = "moshine-datacells"
data.raw["tool"]["datacell-equation"].order = "a[moshine]-dd"
data.raw["recipe"]["datacell-equation"].subgroup = "moshine-datacells"
data.raw["recipe"]["datacell-equation"].order = "a[moshine]-de"

data.raw["tool"]["datacell-solved-equation"].subgroup = "moshine-datacells"
data.raw["tool"]["datacell-solved-equation"].order = "a[moshine]-ee"

if data.raw["technology"]["thinking-brain-technology"] then
  data.raw["technology"]["thinking-brain-technology"].unit =
  {
    count = 400,
    ingredients =
    {
      {"datacell-raw-data", 1},
      {"datacell-ai-model-data", 1},
      {"datacell-solved-equation", 1},
      {"datacell-dna-raw", 1},
      {"datacell-dna-sequenced", 1},
    },
    time = 900*500,
  }
end

if mods["canal-excavator"] then
  data:extend({{
    type = "mod-data",
    name = "canex-panglia-config",
    data_type = "canex-surface-config",
    data = {
      surfaceName = "panglia",
      localisation = {"space-location-name.panglia"},
      oreStartingAmount = 10,
      mining_time = 1,
      tint = {r = 113, g = 144, b = 125},
      mineResult = {
        {type="item", name = "stone", probability = 0.6, amount = 1},
        {type="item", name = "panglia_panglite", probability = 0.2, amount = 1},
        {type="item", name = "iron-ore", probability = 0.1, amount = 1},
        {type="item", name = "copper-ore", probability = 0.1, amount = 1},
        {type="item", name = "uranium-238", probability = 0.0005, amount = 1},
      }
    }
  }})
end