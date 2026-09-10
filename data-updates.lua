
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
  if data.raw.recipe["datacell-remove-timewarp_data"] then
    data.raw.recipe["datacell-remove-timewarp_data"].localised_name = {"recipe-name.datacell-remove-timewarp_data_nocolor"}
  end
  if data.raw.recipe["panglia_timewarp_data_making"] then
    data.raw.recipe["panglia_timewarp_data_making"].localised_name = {"recipe-name.panglia_timewarp_data_making_data_nocolor"}
  end
  if data.raw.fluid["timewarp_data"] then
    data.raw.fluid["timewarp_data"].localised_name = {"fluid-name.timewarp_data_nocolor"}
  end
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