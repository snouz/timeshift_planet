local resource_autoplace = require("resource-autoplace")
resource_autoplace.initialize_patch_set("hidden_beacon", true)


local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")

local tile_trigger_effects = require("__space-age__.prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

planet_map_gen.panglia = function()
  return
  {
    property_expression_names =
    {
      elevation = "vulcanus_elevation",
      temperature = "vulcanus_temperature",
      moisture = "vulcanus_moisture",
      aux = "vulcanus_aux",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",
      --["entity:tungsten-ore:probability"] = "vulcanus_tungsten_ore_probability",
      --["entity:tungsten-ore:richness"] = "vulcanus_tungsten_ore_richness",
      --["entity:coal:probability"] = "vulcanus_coal_probability",
      --["entity:coal:richness"] = "vulcanus_coal_richness",
      --["entity:calcite:probability"] = "vulcanus_calcite_probability",
      --["entity:calcite:richness"] = "vulcanus_calcite_richness",
      --["entity:sulfuric-acid-geyser:probability"] = "vulcanus_sulfuric_acid_geyser_probability",
      --["entity:sulfuric-acid-geyser:richness"] = "vulcanus_sulfuric_acid_geyser_richness",
    },
    cliff_settings =
    {
      name = "cliff-panglia",
      cliff_elevation_interval = 170,
      cliff_elevation_0 = 0
    },
    --[[territory_settings =
    {
      units = {"small-demolisher", "medium-demolisher", "big-demolisher"},
      territory_index_expression = "demolisher_territory_expression",
      territory_variation_expression = "demolisher_variation_expression",
      minimum_territory_size = 10
    },]]
    autoplace_controls =
    {
      --["panglia_hidden_beacon"] = {},
      --["vulcanus_coal"] = {},
      --["sulfuric_acid_geyser"] = {},
      --["tungsten_ore"] = {},
      --["calcite"] = {},
      --["vulcanus_volcanism"] = {},
      --["rocks"] = {}, -- can't add the rocks control otherwise nauvis rocks spawn
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          --nauvis tiles
          ["panglia-volcanic-soil-dark"] = {},
          ["panglia-volcanic-soil-light"] = {},
          ["panglia-volcanic-ash-soil"] = {},
          --end of nauvis tiles
          ["panglia-volcanic-ash-flats"] = {},
          ["panglia-volcanic-ash-light"] = {},
          ["panglia-volcanic-ash-dark"] = {},
          ["panglia-volcanic-cracks"] = {},
          ["panglia-volcanic-cracks-warm"] = {},
          ["panglia-volcanic-folds"] = {},
          ["panglia-volcanic-folds-flat"] = {},
          --["lava"] = {},
          --["lava-hot"] = {},
          ["panglia-volcanic-folds-warm"] = {},
          ["panglia-volcanic-pumice-stones"] = {},
          ["panglia-volcanic-cracks-hot"] = {},
          ["panglia-volcanic-jagged-ground"] = {},
          ["panglia-volcanic-smooth-stone"] = {},
          ["panglia-volcanic-smooth-stone-warm"] = {},
          ["panglia-volcanic-ash-cracks"] = {},

          ["panglia-midland-turquoise-bark"] = {},
          ["panglia-midland-turquoise-bark-2"] = {},
          ["panglia-wetland-light-dead-skin"] = {},
          ["panglia-wetland-dead-skin"] = {},
          ["panglia-midland-cracked-lichen-dark"] = {},
          --["panglia_hidden_beacon_tile"] = {},



        }
      },
      ["decorative"] =
      {
        settings =
        {
          -- nauvis decoratives
          --["v-brown-carpet-grass"] = {},
          --["v-green-hairy-grass"] = {},
          --["v-brown-hairy-grass"] = {},
          --["v-red-pita"] = {},
          -- end of nauvis
          ["panglia-vulcanus-rock-decal-large"] = {},
          ["panglia-vulcanus-crack-decal-large"] = {},
          ["panglia-vulcanus-crack-decal-huge-warm"] = {},
          --["vulcanus-dune-decal"] = {},
          --["vulcanus-sand-decal"] = {},
          --["vulcanus-lava-fire"] = {},
          --["calcite-stain"] = {},
          --["calcite-stain-small"] = {},
          --["sulfur-stain"] = {},
          --["sulfur-stain-small"] = {},
          --["sulfuric-acid-puddle"] = {},
          --["sulfuric-acid-puddle-small"] = {},
          --["crater-small"] = {},
          --["crater-large"] = {},
          --["pumice-relief-decal"] = {},
          ["panglia-small-panglite-rock"] = {},
          ["panglia-medium-panglite-rock"] = {},
          ["panglia-tiny-panglite-rock"] = {},
          ["panglia-tiny-rock-cluster"] = {},
          --["small-sulfur-rock"] = {},
          --["tiny-sulfur-rock"] = {},
          --["sulfur-rock-cluster"] = {},
          --["waves-decal"] = {},


          ["panglia-barnacles-decal"] = {},
          ["panglia-green-cup"] = {},
          ["panglia-solo-barnacle"] = {},
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["panglia_hidden_beacon"] = {},
          ["panglia_energy_roots"] = {},
          --["coal"] = {},
          --["calcite"] = {},
          --["sulfuric-acid-geyser"] = {},
          --["tungsten-ore"] = {},
          ["panglia-huge-panglite-rock"] = {},
          ["panglia-big-panglite-rock"] = {},
          ["crater-cliff"] = {},
          ["panglia_branbalite_plant"] = {},
          ["panglia-big-rock"] = {},
          ["panglia-huge-igneous-rock"] = {},
          --["vulcanus-chimney"] = {},
          --["vulcanus-chimney-faded"] = {},
          --["vulcanus-chimney-cold"] = {},
          --["vulcanus-chimney-short"] = {},
          --["vulcanus-chimney-truncated"] = {},
          --["ashland-lichen-tree"] = {},
          --["ashland-lichen-tree-flaming"] = {},
        }
      }
    }
  }
end

local planet_catalogue_vulcanus = require("__space-age__.prototypes.planet.procession-catalogue-vulcanus")
local effects = require("__core__.lualib.surface-render-parameter-effects")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

data:extend({
  --[[{
    type = "autoplace-control",
    name = "panglia_hidden_beacon",
    localised_name = {"autoplace-control-description.panglia_hidden_beacon"},
    richness = true,
    order = "z-a",
    category = "terrain",
    can_be_disabled = false
  },]]

  {
    type = "surface-property",
    name = "temperature-celcius",
    default_value = 15,
    hidden_in_factoriopedia = true,
    hidden = true,
  },
  {
    type = "surface-property",
    name = "panglia_timeshift",
    default_value = 0,
    hidden_in_factoriopedia = true,
    hidden = true,
  },


  {
    type = "planet",
    name = "panglia",
    icon = icons .. "planet-panglia.png",
    starmap_icon = icons .. "starmap-planet-panglia.png",
    starmap_icon_size = 2048,

    gravity_pull = 5,
    distance = 22,
    orientation = 0.187,
    magnitude = 0.65,
    label_orientation = 0.25,
    draw_orbit = false,

    --pollutant_type = "panglia_energy_roots_pollution",
    --gravity_pull = 10,
    --distance = 11,
    --orientation = 0.1,
    --magnitude = 1.5,
    order = "f[panglia]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen.panglia(),
    pollutant_type = nil,
    solar_power_in_space = 190,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    procession_graphic_catalogue = planet_catalogue_vulcanus,
    surface_properties =
    {
      ["day-night-cycle"] = 4 * minute,
      ["magnetic-field"] = 56,
      ["solar-power"] = 40,
      pressure = 1401, --must be 1000 >< 2000 for agricultural tower
      gravity = 14.01,
      panglia_timeshift = 1,
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba, 0.9),
    persistent_ambient_sounds =
    {
      base_ambience = {filename = sounds .. "panglia_ambiance_klankbeeld.ogg", volume = 0.8},
      wind = {filename = sounds .. "atmosphere_panglia.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 0.0},
        to = {control = 2, volume_percentage = 100.0}
      },
      --[[semi_persistent =
      {
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-rumble", 3, 0.5)},
          delay_mean_seconds = 10,
          delay_variance_seconds = 5
        },
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-flames", 5, 0.6)},
          delay_mean_seconds = 15,
          delay_variance_seconds = 7.0
        }
      }]]
    },
    surface_render_parameters =
    {
      fog = {
        shape_noise_texture =
        {
          filename = "__core__/graphics/clouds-noise.png",
          size = 2048
        },
        detail_noise_texture =
        {
          filename = "__core__/graphics/clouds-detail-noise.png",
          size = 2048
        },
        --color1 = {1.0, 0.8706, 0.302},
        --color2 = {1.0, 0.8706, 0.2902},
        color1 = {109, 179, 146},
        color2 = {90, 176, 135},
        tick_factor = 0.000005,
      },
      -- clouds = effects.default_clouds_effect_properties(),

      -- Should be based on the default day/night times, ie
      -- sun starts to set at 0.25
      -- sun fully set at 0.45
      -- sun starts to rise at 0.55
      -- sun fully risen at 0.75
      day_night_cycle_color_lookup =
      {
        --{0.0, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        --{0.20, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        --{0.45, "__space-age__/graphics/lut/vulcanus-2-night.png"},
        --{0.55, "__space-age__/graphics/lut/vulcanus-2-night.png"},
        --{0.80, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        --{0.0, "__panglia_planet__/graphics/lut/identity-lut.png"},
        --{0.5, "__core__/graphics/color_luts/lut-night.png"},
        {0.00, "__panglia_planet__/graphics/lut/panglia-day2-lut.png"},
        {0.20, "__panglia_planet__/graphics/lut/panglia-day1-lut.png"},
        {0.35, "__panglia_planet__/graphics/lut/panglia-afternoon1-lut.png"},
        {0.40, "__panglia_planet__/graphics/lut/panglia-afternoon2-lut.png"},
        {0.45, "__panglia_planet__/graphics/lut/panglia-night-lut.png"},
        {0.55, "__panglia_planet__/graphics/lut/panglia-night-lut.png"},
        {0.65, "__panglia_planet__/graphics/lut/panglia-dawn1-lut.png"},
        {0.75, "__panglia_planet__/graphics/lut/panglia-dawn2-lut.png"},
        {0.90, "__panglia_planet__/graphics/lut/panglia-day1-lut.png"},
      },

      terrain_tint_effect =
      {
        noise_texture =
        {
          filename = "__space-age__/graphics/terrain/vulcanus/tint-noise.png",
          size = 4096
        },

        offset = { 0.2, 0, 0.4, 0.8 },
        intensity = { 0.5, 0.2, 0.3, 1.0 },
        scale_u = { 3, 1, 1, 1 },
        scale_v = { 1, 1, 1, 1 },

        global_intensity = 0.3,
        global_scale = 0.1,
        zoom_factor = 3,
        zoom_intensity = 0.6
      }
    }
  },
  {
    type = "space-connection",
    name = "gleba-" .. "panglia",
    subgroup = "planet-connections",
    from = "gleba",
    to = "panglia",
    order = "a",
    length = 1000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
  },
  --[[{
    type = "space-connection",
    name = "vulcanus-moshine",
    subgroup = "planet-connections",
    from = "vulcanus",
    to = "moshine",
    order = "a",
    length = 3000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
  },]]

})
