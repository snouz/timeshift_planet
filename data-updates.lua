
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
