local ach = "__panglia_planet_assets__/graphics/achievement/"

data:extend({
  {
    type = "change-surface-achievement",
    name = "panglia_visit-panglia",
    order = "p[panglia]-aaa",
    surface = "panglia",
    icon = ach .. "panglia_visit-panglia.png",
    icon_size = 128,
  },
  {
    type = "build-entity-achievement",
    name = "panglia_build-matter_printer",
    order = "p[panglia]-bbb",
    to_build = "matter_printer",
    icon = ach .. "panglia_build-matter_printer.png",
    icon_size = 128
  },
  {
    type = "produce-achievement",
    name = "panglia_produce_cloned_specimen_body_0",
    order = "p[panglia]-ccc",
    item_product = "panglia_cloned_specimen_body_0",
    amount = 1,
    limited_to_one_game = true,
    icon = ach .. "panglia_produce_cloned_specimen_body_0.png",
    icon_size = 128
  },
  {
    type = "produce-achievement",
    name = "panglia_produce_cloned_specimen_body_2",
    order = "p[panglia]-ccd",
    item_product = "panglia_cloned_specimen_body_2",
    amount = 1,
    limited_to_one_game = true,
    icon = ach .. "panglia_produce_cloned_specimen_body_2.png",
    icon_size = 128
  },
  {
    type = "build-entity-achievement",
    name = "panglia_build-thinking-brain",
    order = "p[panglia]-ddd",
    to_build = "thinking-brain",
    icon = ach .. "panglia_build-thinking-brain.png",
    icon_size = 128
  },
  {
    type = "produce-achievement",
    name = "panglia_produce-sentient-processors",
    order = "p[panglia]-eee",
    item_product = "panglia_sentient_processor",
    amount = 500,
    limited_to_one_game = true,
    icon = ach .. "panglia_produce-sentient-processors.png",
    icon_size = 128
  },
  --[[{
    type = "research-achievement",
    name = "research-moshine-tech-ai-tier-10",
    order = "p[panglia]-eee",
    technology = "thinking-brain-technology",
    icon = "__Moshine__/graphics/achievement/research-moshine-tech-ai-tier-10.png",
    icon_size = 128
  },]]
})