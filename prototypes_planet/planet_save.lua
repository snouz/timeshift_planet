



local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")

planet_map_gen.panglia = function()
  return
  {
    cliff_settings =
    {
      name = "cliff-gleba",
      control = "gleba_cliff",
      cliff_elevation_0 = 40,
      cliff_elevation_interval = 60,
      richness = 0.80,
      cliff_smoothing = 0 -- Not critical but looks better
    },
    property_expression_names =
    {
      elevation = "gleba_elevation",
      aux = "gleba_aux",
      moisture = "gleba_moisture",
      temperature = "gleba_temperature",
      cliffiness = "gleba_cliffiness",
      cliff_elevation = "cliff_elevation_from_elevation",
      enemy_base_radius = "gleba_enemy_base_radius",
      enemy_base_frequency = "gleba_enemy_base_frequency",
      --[[["entity:stone:richness"] = "gleba_stone_richness",
      ["entity:stone:probability"] = "gleba_stone_probability",

      ["decorative:red-desert-bush:probability"] = "gleba_red_desert_bush_probability",
      ["decorative:white-desert-bush:probability"] = "gleba_white_desert_bush_probability",
      ["decorative:red-pita:probability"] = "gleba_red_pita_probability",
      ["decorative:green-bush-mini:probability"] = "gleba_green_bush_probability",
      ["decorative:green-croton:probability"] = "gleba_green_cronton_probability",
      ["decorative:green-pita:probability"] = "gleba_green_pita_probability",
      ["decorative:green-pita-mini:probability"] = "gleba_green_pita_mini_probability",
      ["decorative:lichen-decal:probability"] = "gleba_orange_lichen_probability",
      ["decorative:shroom-decal:probability"] = "gleba_carpet_shroom_probability",
      ["decorative:cracked-mud-decal:probability"] = "gleba_cracked_mud_probability",
      ["decorative:light-mud-decal:probability"] = "gleba_light_mud_probability",
      ["decorative:dark-mud-decal:probability"] = "gleba_dark_mud_probability",
      ["decorative:green-carpet-grass:probability"] = "gleba_green_carpet_grass_probability",
      ["decorative:green-hairy-grass:probability"] = "gleba_green_hairy_grass_probability"]]
    },
    autoplace_controls =
    {
      ["gleba_stone"] = {},
      ["gleba_plants"] = {},
      ["gleba_enemy_base"] = {},
      ["gleba_water"] = {},
      --["gleba_cliff"] = {},
      ["fulgora_islands"] = {},
      --["fulgora_cliff"] = {},
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {

          ["fulgoran-dust"] = {},


          ["natural-yumako-soil"] = {},
          --["natural-jellynut-soil"] = {},
          ["wetland-yumako"] = {},
          --["wetland-jellynut"] = {},
          ["wetland-blue-slime"] = {},
          --["wetland-light-green-slime"] = {},
          --["wetland-green-slime"] = {},
          --["wetland-light-dead-skin"] = {},
          ["wetland-dead-skin"] = {},
          --["wetland-pink-tentacle"] = {},
          --["wetland-red-tentacle"] = {},
          ["gleba-deep-lake"] = {},
          --["lowland-brown-blubber"] = {},
          --["lowland-olive-blubber"] = {},
          --["lowland-olive-blubber-2"] = {},
          --["lowland-olive-blubber-3"] = {},
          --["lowland-pale-green"] = {},
          --["lowland-cream-cauliflower"] = {},
          --["lowland-cream-cauliflower-2"] = {},
          --["lowland-dead-skin"] = {},
          --["lowland-dead-skin-2"] = {},
          --["lowland-cream-red"] = {},
          --["lowland-red-vein"] = {},
          --["lowland-red-vein-2"] = {},
          --["lowland-red-vein-3"] = {},
          --["lowland-red-vein-4"] = {},
          --["lowland-red-vein-dead"] = {},
          --["lowland-red-infection"] = {},
          ["midland-turquoise-bark"] = {},
          ["midland-turquoise-bark-2"] = {},
          --["midland-cracked-lichen"] = {},
          --["midland-cracked-lichen-dull"] = {},
          --["midland-cracked-lichen-dark"] = {},
          --["midland-yellow-crust"] = {},
          --["midland-yellow-crust-2"] = {},
          --["midland-yellow-crust-3"] = {},
          --["midland-yellow-crust-4"] = {},
          --["highland-dark-rock"] = {},
          --["highland-dark-rock-2"] = {},
          --["highland-yellow-rock"] = {},
          --["pit-rock"] = {}
        }

      },
      ["decorative"] =
      {
        settings =
        {

          ["red-nerve-roots-veins-dense"] = {},
          ["red-nerve-roots-veins-sparse"] = {},
          ["purple-nerve-roots-veins-dense"] = {},
          ["purple-nerve-roots-veins-sparse"] = {},
          ["cream-nerve-roots-veins-dense"] = {},
          ["cream-nerve-roots-veins-sparse"] = {},
          ["red-nerve-roots-veins-dense"] = {},
          ["red-nerve-roots-veins-sparse"] = {},
          ["purple-nerve-roots-veins-dense"] = {},
          ["purple-nerve-roots-veins-sparse"] = {},
          ["cream-nerve-roots-veins-dense"] = {},
          ["cream-nerve-roots-veins-sparse"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          
          --[[["yellow-lettuce-lichen-1x1"] = {},
          ["yellow-lettuce-lichen-3x3"] = {},
          ["yellow-lettuce-lichen-6x6"] = {},
          ["yellow-lettuce-lichen-cups-1x1"] = {},
          ["yellow-lettuce-lichen-cups-3x3"] = {},
          ["yellow-lettuce-lichen-cups-6x6"] = {},
          ["green-lettuce-lichen-1x1"] = {},
          ["green-lettuce-lichen-3x3"] = {},
          ["green-lettuce-lichen-6x6"] = {},
          ["green-lettuce-lichen-water-1x1"] = {},
          ["green-lettuce-lichen-water-3x3"] = {},
          ["green-lettuce-lichen-water-6x6"] = {},
          ["honeycomb-fungus"] = {},
          ["honeycomb-fungus-1x1"] = {},
          ["honeycomb-fungus-decayed"] = {},
          ["split-gill-1x1"] = {},
          ["split-gill-2x2"] = {},
          ["split-gill-dying-1x1"] = {},
          ["split-gill-dying-2x2"] = {},
          ["split-gill-red-1x1"] = {},
          ["split-gill-red-2x2"] = {},
          ["veins"] = {},
          ["veins-small"] = {},
          ["mycelium"] = {},
          ["coral-water"] = {},
          ["coral-land"] = {},
          ["black-sceptre"] = {},
          ["pink-phalanges"] = {},
          ["pink-lichen-decal"] = {},
          ["red-lichen-decal"] = {},
          ["green-cup"] = {},
          ["brown-cup"] = {},
          ["blood-grape"] = {},
          ["blood-grape-vibrant"] = {},
          ["brambles"] = {},
          ["polycephalum-slime"] = {},
          ["polycephalum-balloon"] = {},
          ["fuchsia-pita"] = {},
          ["wispy-lichen"] = {},
          ["grey-cracked-mud-decal"] = {},
          ["barnacles-decal"] = {},
          ["coral-stunted"] = {},
          ["coral-stunted-grey"] = {},
          ["red-nerve-roots-veins-dense"] = {},
          ["red-nerve-roots-veins-sparse"] = {},
          ["purple-nerve-roots-veins-dense"] = {},
          ["purple-nerve-roots-veins-sparse"] = {},
          ["cream-nerve-roots-veins-dense"] = {},
          ["cream-nerve-roots-veins-sparse"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["curly-roots-orange"] = {},
          ["knobbly-roots"] = {},
          ["knobbly-roots-orange"] = {},
          ["matches-small"] = {},
          ["pale-lettuce-lichen-cups-1x1"] = {},
          ["pale-lettuce-lichen-cups-3x3"] = {},
          ["pale-lettuce-lichen-cups-6x6"] = {},
          ["pale-lettuce-lichen-1x1"] = {},
          ["pale-lettuce-lichen-3x3"] = {},
          ["pale-lettuce-lichen-6x6"] = {},
          ["pale-lettuce-lichen-water-1x1"] = {},
          ["pale-lettuce-lichen-water-3x3"] = {},
          ["pale-lettuce-lichen-water-6x6"] = {},
          ["white-carpet-grass"] = {},
          ["green-carpet-grass"] = {},
          ["green-hairy-grass"] = {},

          --shared
          ["light-mud-decal"] = {},
          ["dark-mud-decal"] = {},
          ["cracked-mud-decal"] = {},
          ["red-desert-bush"] = {},
          ["white-desert-bush"] = {},
          ["red-pita"] = {},
          ["green-bush-mini"] = {},
          ["green-croton"] = {},
          ["green-pita"] = {},
          ["green-pita-mini"] = {},
          ["lichen-decal"] = {},
          ["shroom-decal"] = {}]]
        }
      },
      ["entity"] =
      {
        settings =
        {
          --["stone"] = {},
          --["iron-stromatolite"] = {},
          --["copper-stromatolite"] = {}
        }
      }
    }
  }
end

local planet_catalogue_vulcanus = require("__space-age__.prototypes.planet.procession-catalogue-vulcanus")
local effects = require("__core__.lualib.surface-render-parameter-effects")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

data:extend({

  {
    type = "surface-property",
    name = "temperature-celcius",
    default_value = 15,
    hidden_in_factoriopedia = true,
    hidden = true,
  },
  {
    type = "surface-property",
    name = "moshine-exclusive",
    default_value = 0,
    hidden_in_factoriopedia = true,
    hidden = true,
  },
  {
    type = "planet",
    name = "panglia",
    icon = "__space-age__/graphics/icons/gleba.png",
    starmap_icon = "__space-age__/graphics/icons/starmap-planet-gleba.png",
    starmap_icon_size = 512,
    gravity_pull = 10,
    distance = 22,
    orientation = 0.175,
    magnitude = 1.1,
    label_orientation = 0.15,
    order = "c[gleba]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen.panglia(),
    pollutant_type = "spores",
    solar_power_in_space = 200,
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
    procession_graphic_catalogue = planet_catalogue_gleba,
    surface_properties =
    {
      ["day-night-cycle"] = 10 * minute,
      ["magnetic-field"] = 25,
      ["solar-power"] = 50,
      pressure = 2000,
      gravity = 20
    },
    surface_render_parameters=
    {
      fog =
      {
        fog_type = "gleba",
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
        color1 = {255, 217, 139, 1.0},
        color2 = {183, 255, 169, 1.0},
        tick_factor = 0.000001,
      },
       clouds = effects.default_clouds_effect_properties(),

      -- Should be based on the default day/night times, ie
      -- sun starts to set at 0.25
      -- sun fully set at 0.45
      -- sun starts to rise at 0.55
      -- sun fully risen at 0.75
      day_night_cycle_color_lookup =
      {
        {0.00, "__space-age__/graphics/lut/gleba-1-noon.png"},
        {0.15, "__space-age__/graphics/lut/gleba-2-afternoon.png"},
        {0.25, "__space-age__/graphics/lut/gleba-3-late-afternoon.png"},
        {0.35, "__space-age__/graphics/lut/gleba-4-sunset.png"},
        {0.45, "__space-age__/graphics/lut/gleba-5-after-sunset.png"},
        {0.55, "__space-age__/graphics/lut/gleba-6-before-dawn.png"},
        {0.65, "__space-age__/graphics/lut/gleba-7-dawn.png"},
        {0.75, "__space-age__/graphics/lut/gleba-8-morning.png"},
      },

      terrain_tint_effect =
      {
        noise_texture =
        {
          filename = "__space-age__/graphics/terrain/vulcanus/tint-noise.png",
          size = 4096
        },

        offset = { 0.2, 0, 0.4, 0.8 },
        intensity = { 0.2, 0.4, 0.3, 0.15 },
        scale_u = { 1.85, 1.85, 1.85, 1.85 },
        scale_v = { 1, 1, 1, 1 },

        global_intensity = 0.5,
        global_scale = 0.4,
        zoom_factor = 3.8,
        zoom_intensity = 0.75
      }
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba, 0.9),
    persistent_ambient_sounds =
    {
      base_ambience =
      {
        {sound = {filename = "__space-age__/sound/wind/base-wind-gleba-night.ogg", volume = 0.8, advanced_volume_control = {darkness_threshold = 0.85}}},
        {sound = {filename = "__space-age__/sound/wind/base-wind-gleba-day.ogg", volume = 0.8, advanced_volume_control = {darkness_threshold = -0.7}}}
      },
      wind = {filename = "__space-age__/sound/wind/wind-gleba.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 0.2},
        to = {control = 2, volume_percentage = 100.0}
      },
      semi_persistent =
      {
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/wind-gust", 6, 0.4)},
          delay_mean_seconds = 10,
          delay_variance_seconds = 5
        },
        {
          sound =
            {
              filename = "__space-age__/sound/world/weather/rain.ogg", volume = 0.25,
              advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.2, volume_percentage = 0.6}, to = {1.2, 100.0 }}}}
            }
        },
        {
          sound =
            {
              variations = sound_variations("__space-age__/sound/world/semi-persistent/night-birds", 14, 0.4),
              advanced_volume_control =
              {
                fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}},
                darkness_threshold = 0.85
              }
            },
            delay_mean_seconds = 10,
            delay_variance_seconds = 5
        }
      }
    },
    player_effects =
    { -- TODO: replace with shader & find a way to have rain appear and disappear with weather system.
      type = "cluster",
      cluster_count = 10,
      distance = 8,
      distance_deviation = 8,
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          type = "create-trivial-smoke",
          smoke_name = "gleba-raindrops",
          speed = {-0.05, 0.5},
          initial_height = 1,
          speed_multiplier = 2,
          speed_multiplier_deviation = 0.05,
          starting_frame = 2,
          starting_frame_deviation = 2,
          offset_deviation = {{-96, -56}, {96, 40}},
          speed_from_center = 0.01,
          speed_from_center_deviation = 0.02
        }
      }
    },
    ticks_between_player_effects = 1
  },
  {
    type = "space-connection",
    name = "gleba-" .. "panglia",
    subgroup = "planet-connections",
    from = "gleba",
    to = "panglia",
    order = "a",
    length = 100,
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
