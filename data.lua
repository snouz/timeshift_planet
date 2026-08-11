local icons = "__panglia_planet__/graphics/icons/"
local entity = "__panglia_planet_assets__/graphics/entity/"
local techicons = "__panglia_planet_assets__/graphics/technology/"
local sounds = "__panglia_planet_assets__/sounds/"
local tssounds = "__panglia_planet_assets__/sounds/"

local beacon_multiplier = 50
local panglia_only = {{property = "pressure", min = 1401, max = 1401}}

require "prototypes_planet.hidden_beacon"
require "prototypes_planet.terrain"
require "prototypes_planet.decoratives"
require "prototypes_planet.planet"
require "prototypes_planet.energy_roots"
require "prototypes_planet.music"


require "prototypes.technology"
require "prototypes.items_recipes"
require "prototypes.plant"
--require "prototypes.nano_forge"
require "prototypes.simulation_chamber"
require "prototypes.crushing"
require "prototypes.achievements"
require "prototypes.compatibility"
require "prototypes.menu-simulations"

table.insert(ModuleCategoryDefaults.default_categories, 'panglia_module')