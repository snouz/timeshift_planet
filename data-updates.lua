
if settings.startup["moshine-data-colors"] and settings.startup["moshine-data-colors"].value == false then
-- technology
  if data.raw.technology["panglia_tech_timewarp"] then
    data.raw.technology["panglia_tech_timewarp"].localised_description = {"technology-description.panglia_tech_timewarp_data_nocolor"}
  end
-- item
  if data.raw.item["datacell-dna-raw"] then
    data.raw.item["datacell-dna-raw"].localised_name = {"item-name.datacell-dna-raw_nocolor"}
  end
  if data.raw.item["dna-sequenced"] then
    data.raw.item["dna-sequenced"].localised_name = {"item-name.dna-sequenced_nocolor"}
  end
  if data.raw.item["datacell-timewarp_data"] then
    data.raw.item["datacell-timewarp_data"].localised_name = {"item-name.datacell-timewarp_data_nocolor"}
  end
  if data.raw.item["panglia_dna_candidate"] then
    data.raw.item["panglia_dna_candidate"].localised_name = {"item-name.panglia_dna_candidate_nocolor"}
  end
  if data.raw.item["panglia_dna_validated"] then
    data.raw.item["panglia_dna_validated"].localised_name = {"item-name.panglia_dna_validated_nocolor"}
  end
  if data.raw.item["panglia_cloned_specimen_body_0"] then
    data.raw.item["panglia_cloned_specimen_body_0"].localised_name = {"item-name.panglia_cloned_specimen_body_0_nocolor"}
  end
--recipe
  if data.raw.recipe["datacell-remove-timewarp_data"] then
    data.raw.recipe["datacell-remove-timewarp_data"].localised_name = {"recipe-name.datacell-remove-timewarp_data_nocolor"}
  end
  if data.raw.recipe["datacell-remove-dna-raw"] then
    data.raw.recipe["datacell-remove-dna-raw"].localised_name = {"recipe-name.datacell-remove-dna-raw_nocolor"}
  end
  if data.raw.recipe["datacell-remove-dna-sequenced"] then
    data.raw.recipe["datacell-remove-dna-sequenced"].localised_name = {"recipe-name.datacell-remove-dna-sequenced_nocolor"}
  end
  if data.raw.recipe["panglia_timewarp_data_making"] then
    data.raw.recipe["panglia_timewarp_data_making"].localised_name = {"recipe-name.panglia_timewarp_data_making_data_nocolor"}
  end
--fluid
  if data.raw.fluid["timewarp_data"] then
    data.raw.fluid["timewarp_data"].localised_name = {"fluid-name.timewarp_data_nocolor"}
  end
  if data.raw.fluid["dna_raw_data"] then
    data.raw.fluid["dna_raw_data"].localised_name = {"fluid-name.dna_raw_data_nocolor"}
  end
  if data.raw.fluid["dna_sequenced_data"] then
    data.raw.fluid["dna_sequenced_data"].localised_name = {"fluid-name.dna_sequenced_data_nocolor"}
  end
--entity
  if data.raw["assembling-machine"]["panglia_timewarp_data_maker"] then
    data.raw["assembling-machine"]["panglia_timewarp_data_maker"].localised_name = {"entity-description.panglia_timewarp_data_maker_nocolor"}
  end
end

function prevent_from_panglia(entity)
  if not entity then return end
  if not entity.surface_conditions then
    entity.surface_conditions = {}
  end
  table.insert(entity.surface_conditions, { property = "panglia_timeshift", min = 0, max = 0 })
end

for _, entity in pairs(data.raw["beacon"]) do
  --if not (entity.name == "ring-teleporter") and not (entity.name == "kr-planetary-teleporter") then
    prevent_from_panglia(entity)
  --end
end
if data.raw["assembling-machine"]["quality-condenser"] then
  prevent_from_panglia(data.raw["assembling-machine"]["quality-condenser"])
end

local list_biters = 
{
  "small-biter",
  "medium-biter",
  "big-biter",
  "behemoth-biter",

  "small-spitter",
  "medium-spitter",
  "big-spitter",
  "behemoth-spitter",
}

for _, unit in pairs(list_biters) do
  if data.raw.unit[unit] then
    local monster = data.raw.unit[unit]
    if not monster.loot then monster.loot = {} end
    table.insert(monster.loot, {type = "item", name = "biter_dna_sample", amount = 1, independent_probability = 0.12})
  end
end


local list_demolisher = 
{
  "small-demolisher",
  "medium-demolisher",
  "big-demolisher",

}

for _, unit in pairs(list_demolisher) do
  if data.raw["segmented-unit"][unit] then
    local demolisher = data.raw["segmented-unit"][unit]
    if not demolisher.loot then demolisher.loot = {} end
    table.insert(demolisher.loot, {type = "item", name = "demolisher_dna_scale", amount = 1})
    --table.insert(demolisher.loot, {type = "item", name = "demolisher_dna_scale", amount_min = 49, amount_max = 85})
  end
end

--add biter_dna_sample