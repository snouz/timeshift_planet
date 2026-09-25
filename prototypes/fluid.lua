local datacellicons = "__panglia_planet__/graphics/icons/data/"

data:extend({
  {
    type = "fluid",
    name = "timewarp_data",
    subgroup = "data-fluid",
    order = "g[timewarp_data]",
    default_temperature = 15,
    gas_temperature = 0,
    base_color = util.color("#d699ff"),
    flow_color = util.color("#d699ff"),
    icon = datacellicons .. "timewarp_data.png",
    auto_barrel = false,
    draw_as_glow = true,
  },
  {
    type = "fluid",
    name = "dna_raw_data",
    subgroup = "data-fluid",
    order = "h[dna_raw_data]",
    default_temperature = 15,
    gas_temperature = 0,
    base_color = util.color("#eb9191"),
    flow_color = util.color("#eb9191"),
    icon = datacellicons .. "dna-raw-data.png",
    auto_barrel = false,
    draw_as_glow = true,
  },
  {
    type = "fluid",
    name = "dna_sequenced_data",
    subgroup = "data-fluid",
    order = "h[dna_sequenced_data]",
    default_temperature = 15,
    gas_temperature = 0,
    base_color = util.color("#ffeeee"),
    flow_color = util.color("#ffeeee"),
    icon = datacellicons .. "dna-unfolded-data.png",
    auto_barrel = false,
    draw_as_glow = true,
  },
})


