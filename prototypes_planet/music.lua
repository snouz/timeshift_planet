local icons = "__panglia_planet__/graphics/icons/"
local entity = "__panglia_planet_assets__/graphics/entity/"
local techicons = "__panglia_planet_assets__/graphics/technology/"
local sounds = "__panglia_planet_assets__/sounds/"
local tssounds = "__panglia_planet_assets__/sounds/"

local beacon_multiplier = 50
local panglia_only = {{property = "pressure", min = 1401, max = 1401}}

local musicpath = sounds .. "ambient/"
local vol = 0.7

function make_musictrack(name, type)
  local track_type = type
  if not track_type then track_type = "main-track" end
  data:extend({
    {
      type = "ambient-sound",
      name = name,
      track_type = track_type,
      planets = {"panglia"},
      sound =
      {
        filename = musicpath .. name .. ".ogg",
        volume = vol,
      }
    },
  })
end

data:extend({
  {
    type = "ambient-sound",
    name = "mashup_Serat_Distant_Fields_Pablo_Enver_FF9_Branbal",
    track_type = "hero-track",
    planets = {"panglia"},
    sound =
    {
      filename = "__panglia_planet_assets__/sounds/mashup_Serat_Distant_Fields_Pablo_Enver_FF9_Branbal.ogg",
      volume = 1,
    }
  },
})
--make_musictrack("mashup_Serat_Distant_Fields_Pablo_Enver_FF9_Branbal", "hero-track")

make_musictrack("01_Serat_-_Flow_Sessions_-_Nord_Weg")
make_musictrack("03_Serat_-_Flow_Sessions_-_Distant_Fields")
make_musictrack("04_Serat_-_Flow_Sessions_-_Rapid_Waters")
make_musictrack("06_Serat_-_Flow_Sessions_-_Son_of_the_Vampire")
make_musictrack("07_Serat_-_Flow_Sessions_-_First_Snowy_Night")
make_musictrack("08_Serat_-_Flow_Sessions_-_Images")
make_musictrack("10_Serat_-_Flow_Sessions_-_Symphony_of_Stones")
make_musictrack("11_Serat_-_Flow_Sessions_-_Fragile_Memories")
make_musictrack("12_Serat_-_Flow_Sessions_-_Harfenzwischenspiel")
make_musictrack("14_Serat_-_Flow_Sessions_-_Dark_Transmission")
make_musictrack("15_Serat_-_Flow_Sessions_-_Emergence")
make_musictrack("17_Serat_-_Flow_Sessions_-_Stargazing")

--make_musictrack("01_Blear_Moon_-_Town_Of_Two_Houses_-_These_Walls_Are_Talking", "interlude")
--make_musictrack("02_Blear_Moon_-_Town_Of_Two_Houses_-_Arctic_Fog")
--make_musictrack("03_Blear_Moon_-_Town_Of_Two_Houses_-_Flekkefjord")
--make_musictrack("04_Blear_Moon_-_Town_Of_Two_Houses_-_Boat_for_Sale")
--make_musictrack("05_Blear_Moon_-_Town_Of_Two_Houses_-_Cold_Summer_Landscape")
--make_musictrack("06_Blear_Moon_-_Town_Of_Two_Houses_-_Gean")

make_musictrack("01_Blear_Moon_-_Fallow_-_Anto")
make_musictrack("02_Blear_Moon_-_Fallow_-_Backspace")
make_musictrack("03_Blear_Moon_-_Fallow_-_Laps")
make_musictrack("04_Blear_Moon_-_Fallow_-_Pill")
make_musictrack("05_Blear_Moon_-_Fallow_-_Recalling")
make_musictrack("06_Blear_Moon_-_Fallow_-_Certain_force")
make_musictrack("07_Blear_Moon_-_Fallow_-_Sam")
make_musictrack("08_Blear_Moon_-_Fallow_-_Must")
--make_musictrack("09_Blear_Moon_-_Fallow_-_Com")
make_musictrack("10_Blear_Moon_-_Fallow_-_Chod")
--make_musictrack("11_Blear_Moon_-_Fallow_-_Dementia")

--"hero-track"
--"interlude"
