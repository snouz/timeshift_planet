if data.raw["lab"]["neural_computer"] then
  table.insert(data.raw["lab"]["neural_computer"].inputs, "datacell-dna-raw")
  table.insert(data.raw["lab"]["neural_computer"].inputs, "datacell-dna-sequenced")
end

local icons = "__panglia_planet__/graphics/icons/"

for i, inserter in pairs(data.raw["inserter"]) do
  if not string.find(inserter.name, "_panglia_fast_version") then
    local newinserter = table.deepcopy(inserter)
    newinserter.name = inserter.name .. "_panglia_fast_version"
    --newinserter.original_name = inserter.name
    newinserter.localised_name = {"entity-name." .. inserter.name}
    newinserter.localised_description = {"entity-name." .. inserter.name}
    newinserter.rotation_speed = inserter.rotation_speed * beacon_multiplier
    newinserter.extension_speed = inserter.extension_speed * beacon_multiplier
    newinserter.hidden = true
    newinserter.subgroup = "panglia-sped-up-entities"
    if inserter.next_upgrade then
      newinserter.next_upgrade = inserter.next_upgrade .. "_panglia_fast_version"
    end
    if inserter.minable and inserter.minable.result then
      newinserter.placeable_by = {item = inserter.minable.result, count = 1}
      newinserter.minable.mining_time = 0.0001
    end
    data:extend({newinserter})
  end
end

for i, belt in pairs(data.raw["transport-belt"]) do
  if not string.find(belt.name, "_panglia_fast_version") then
    local newbelt = table.deepcopy(belt)
    newbelt.name = belt.name .. "_panglia_fast_version"
    --newbelt.original_name = belt.name
    newbelt.localised_name = {"entity-name." .. belt.name}
    newbelt.localised_description = {"entity-name." .. belt.name}
    newbelt.speed = belt.speed * beacon_multiplier
    newbelt.hidden = true
    newbelt.subgroup = "panglia-sped-up-entities"
    if newbelt.next_upgrade then
      newbelt.next_upgrade = belt.next_upgrade .. "_panglia_fast_version"
    end
    if belt.minable and belt.minable.result then
      newbelt.placeable_by = {item = belt.minable.result, count = 1}
      newbelt.minable.mining_time = 0.0001
    end
    data:extend({newbelt})
  end
end
--[[
for i, belt in pairs(data.raw["underground-belt"]) do
  if not string.find(belt.name, "_panglia_fast_version") then
    local newbelt = table.deepcopy(belt)
    newbelt.name = belt.name .. "_panglia_fast_version"
    --newbelt.original_name = belt.name
    newbelt.localised_name = {"entity-name." .. belt.name}
    newbelt.localised_description = {"entity-name." .. belt.name}
    newbelt.speed = belt.speed * beacon_multiplier
    newbelt.hidden = true
    newbelt.subgroup = "panglia-sped-up-entities"
    if belt.minable and belt.minable.result then
      newbelt.placeable_by = {item = belt.minable.result, count = 1}
    end
    data:extend({newbelt})
  end
end
]]

for i, belt in pairs(data.raw["splitter"]) do
  if not string.find(belt.name, "_panglia_fast_version") then
    local newbelt = table.deepcopy(belt)
    newbelt.name = belt.name .. "_panglia_fast_version"
    --newbelt.original_name = belt.name
    newbelt.localised_name = {"entity-name." .. belt.name}
    newbelt.localised_description = {"entity-name." .. belt.name}
    newbelt.speed = belt.speed * beacon_multiplier
    newbelt.hidden = true
    newbelt.subgroup = "panglia-sped-up-entities"
    if newbelt.next_upgrade then
      newbelt.next_upgrade = belt.next_upgrade .. "_panglia_fast_version"
    end
    if belt.minable and belt.minable.result then
      newbelt.placeable_by = {item = belt.minable.result, count = 1}
      newbelt.minable.mining_time = 0.0001
    end
    data:extend({newbelt})
  end
end



-- make everything a military target for pangroots and egg monsters
local entitytypes = {"accumulator", "agricultural-tower", "boiler", "container", "logistic-container", "assembling-machine", "furnace", "rocket-silo", "display-panel", 
"electric-energy-interface", "construction-robot", "logistic-robot", "lab", "lamp", "mining-drill", "offshore-pump", "roboport",
"solar-panel", "splitter", "underground-belt", "valve"}

for i, entitytype in pairs(entitytypes) do
  for j, entity in pairs(data.raw[entitytype]) do
    if entity then
      entity.allow_run_time_change_of_is_military_target = true
    end
  end
end





-- Based on GotLag's flare stack
-------- CRUSHING -------


local crushing_icon = {
  icon = icons .. "crushing_icon.png",
  icon_size = 64,
  icon_mipmaps = 1,
}

pangliacrushing = {}

-- returns icon/icons always in the form of a table of icons
function pangliacrushing.get_icons(prototype)
  if prototype.icons then
    return table.deepcopy(prototype.icons)
  else
    return {
      {
        icon = prototype.icon,
        icon_size = prototype.icon_size or 64,
        icon_mipmaps = prototype.icon_mipmaps or 1,
      },
    }
  end
end

-- generates a recipe to incinerate the specified non-fluid prototype
function pangliacrushing.incinerateRecipe(item, category, weight)
  local newicons = pangliacrushing.get_icons(item)
  table.insert(newicons, crushing_icon)
 

  local grouporder = "z"
  local subgrouporder = "z"
  local itemorder = item.order or "z"
  if item.subgroup then
    local subgroup = data.raw["item-subgroup"][item.subgroup]
    if subgroup and subgroup.group then
      subgrouporder = subgroup.order or "z"
      local group = data.raw["item-group"][subgroup.name]
      if group then
        grouporder = group.order or "z"
      end
    end
  end

  local order = grouporder .. "-" .. subgrouporder .. "-" .. itemorder

  local weight = item.weight or (1 * kg)
  local number_from_weight = math.max(1, math.min(math.floor(weight/1000), 40))
 
  data:extend({
    {
      type = "recipe",
      name = category .. "-" .. item.name .. "-panglia_crushing",
      localised_name = "(" .. category .. ") " .. item.name:gsub("^%l", string.upper) .. " crushing",
      icons = newicons,
      category = "panglia_crushing",
      enabled = true,
      hide_from_player_crafting = true,
      hide_from_signal_gui = true,
      hidden = true,
      hidden_in_factoriopedia = true,
      -- this is now done through incinerator crafting speed
      -- energy_required = 1.0 / settings.startup["flare-stack-item-rate"].value,
      energy_required = number_from_weight,
      ingredients = {
        { type = "item", name = item.name, amount = 1 },
      },
      results = {
        { type = "item", name = "panglia_dust", amount = number_from_weight }
      },
      --icon_size = 64,
      subgroup = "panglia_crushing",
      order = item.order or "zzzz",
      --order = "zz[panglia_crushing]",
    },
  })
end

-- non-item categories to incinerate too
pangliacrushing.category_list = {
  "item",
  "capsule",
  "ammo",
  "gun",
  "module",
  "armor",
  "mining-tool",
  "repair-tool",
  "tool",
  "blueprint-book",
  "blueprint",
  "rail-planner",
}

for _, cat in pairs(pangliacrushing.category_list) do
  if data.raw[cat] then
    for _, proto in pairs(data.raw[cat]) do
      pangliacrushing.incinerateRecipe(proto, cat)
    end
  end
end


local function add_tech_unit(tech, count, time, ingredients)
  if data.raw["technology"][tech] and count and time and ingredients then
    data.raw["technology"][tech].unit =
    {
      count = count,
      ingredients = ingredients,
      time = time,
    }
  end
end


add_tech_unit("panglia_dna_manipulation", 10, 145*500,     {{"datacell-ai-model-data", 1},{"datacell-solved-equation", 1},{"datacell-dna-raw", 1},} )
add_tech_unit("panglia_simulation_chamber", 40, 1658*500,  {{"datacell-ai-model-data", 1},{"datacell-solved-equation", 1},{"datacell-dna-raw", 1},{"datacell-dna-sequenced", 1},} )
add_tech_unit("panglia_sentient_processor", 200, 1008*500, {{"datacell-raw-data", 1},{"datacell-ai-model-data", 1},{"datacell-solved-equation", 1},{"datacell-dna-raw", 1},{"datacell-dna-sequenced", 1},} )
add_tech_unit("panglia_worker-robots-storage-1", 800, 10000, {{"datacell-raw-data", 1},{"datacell-ai-model-data", 1},{"datacell-solved-equation", 1},{"datacell-dna-sequenced", 1},} )
add_tech_unit("panglia_worker-robots-storage-2", 1600, 10000, {{"datacell-raw-data", 1},{"datacell-ai-model-data", 1},{"datacell-solved-equation", 1},{"datacell-dna-sequenced", 1},} )

data.raw["technology"]["panglia_worker-robots-speed"].unit =
{
  count_formula = "2^(L-3)*1000",
  ingredients =
  {
    {"datacell-raw-data", 1},
    {"datacell-ai-model-data", 1},
    {"datacell-solved-equation", 1},
    {"datacell-dna-sequenced", 1},
  },
  time = 6000
}


--make panglite impossible to make higher quality
if data.raw["recipe"]["matter_printer-recycling"] and data.raw["recipe"]["matter_printer-recycling"].results then
  data.raw["recipe"]["matter_printer-recycling"].results = {
    {
      amount = 0.25,
      extra_count_fraction = 0.25,
      name = "neural_computer",
      type = "item"
    },
    {
      amount = 0.25,
      extra_count_fraction = 0.25,
      name = "electromagnetic-plant",
      type = "item"
    },
    {
      amount = 2.5,
      extra_count_fraction = 0.5,
      name = "electronic-circuit",
      type = "item"
    },
    {
      amount = 12.5,
      extra_count_fraction = 0.5,
      name = "glass",
      type = "item"
    }
  }
end



local function add_tech_unit(tech, count, time, ingredients)
  if data.raw["technology"][tech] and count and time and ingredients then
    data.raw["technology"][tech].unit =
    {
      count = count,
      ingredients = ingredients,
      time = time,
    }
  end
end

add_tech_unit("panglia_planet_discovery_panglia", 250, 60, {{"datacell-raw-data", 1}} )