local datacellicons = "__panglia_planet__/graphics/icons/data/"

data:extend({
  {
    type = "fluid",
    name = "timewarp_data",
    subgroup = "data-fluid",
    order = "g[cosmic-data]",
    default_temperature = 15,
    gas_temperature = 0,
    base_color = util.color("#00ffff"),
    flow_color = util.color("#00ffff"),
    icon = datacellicons .. "timewarp_data.png",
    auto_barrel = false,
    draw_as_glow = true,
  },
})