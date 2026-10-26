local icons = "__panglia_planet__/graphics/icons/"
local datacellicons = "__panglia_planet__/graphics/icons/data/"

data:extend({

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
    base_color = util.color("#52c7ee"),
    flow_color = util.color("#52c7ee"),
    visualization_color = util.color("#52c7ee"),
    draw_as_glow = true,
    auto_barrel = true,
    fuel_value = "1MJ",
  },


  ---- DATA
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


