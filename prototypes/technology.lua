


data:extend({
  {
    type = "technology",
    name = "panglia_planet_discovery_panglia",
    icons = util.technology_icon_constant_planet(techicons .. "panglia-tech-panglia.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "panglia",
        use_icon_overlay_constant = true
      },
    },
    prerequisites = {"agricultural-science-pack", "foundry"},
    unit =
    {
      count = 800,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "panglia_branbalite_slurry",
    icon = techicons .. "panglia_branbalite_slurry.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_branbalite_slurry"
      },
    },
    prerequisites = {"agriculture", "panglia_planet_discovery_panglia"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "panglia_branbalite_plant"
    },
  },

  {
    type = "technology",
    name = "panglia_panglite_multiplication",
    icon = techicons .. "panglia_panglite_multiplication.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_panglite"
      },
    },
    prerequisites = {"panglia_planet_discovery_panglia"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "panglia-huge-panglite-rock"
    }
  },

  --[[{
    type = "technology",
    name = "panglia_branbalite_slurry_to_crudeoil",
    icon = techicons .. "panglia_branbalite_slurry_to_crudeoil.png",
    icon_size = 256,
    effects =
    {
      --{
      --  type = "unlock-recipe",
      --  recipe = "panglia_branbalite_slurry_to_crudeoil"
      --},
    },
    prerequisites = {"panglia_branbalite_slurry"},
    research_trigger =
    {
      type = "craft-fluid",
      fluid = "panglia_branbalite_slurry",
      amount = 50,
    },
  },]]


  {
    type = "technology",
    name = "panglia_branbalite_slurry_to_lubricant",
    icon = techicons .. "panglia_branbalite_slurry_to_lubricant.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_branbalite_slurry_to_lubricant"
      },
    },
    prerequisites = {"panglia_branbalite_slurry"},
    research_trigger =
    {
      type = "craft-fluid",
      fluid = "panglia_branbalite_slurry",
      amount = 50,
    },
  },


  {
    type = "technology",
    name = "panglia_igneous_rock_to_lava",
    icon = techicons .. "panglia_igneous_rock_to_lava.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_igneous_rock_to_lava"
      },
    },
    prerequisites = {"panglia_planet_discovery_panglia"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "panglia-huge-igneous-rock"
    },
  },

  {
    type = "technology",
    name = "panglia_universe_precursor_volcanic",
    icon = techicons .. "panglia_universe_precursor_volcanic.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_universe_precursor_volcanic"
      },
      {
        type = "unlock-recipe",
        recipe = "panglia_universe_precursor_volcanic_result"
      },
    },
    prerequisites = {"panglia_igneous_rock_to_lava", "matter_printer-technology", "panglia_branbalite_slurry_to_lubricant"},
    unit =
    {
      count = 800,
      ingredients =
      {
        --{"automation-science-pack", 1},
        --{"logistic-science-pack", 1},
        --{"military-science-pack", 1},
        --{"chemical-science-pack", 1},
        --{"production-science-pack", 1},
        --{"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        --{"agricultural-science-pack", 1},
        --{"cryogenic-science-pack", 1},
        --{"promethium-science-pack", 1}
      },
      time = 60
    },
  },

  {
    type = "technology",
    name = "panglia_branbalite_slurry_to_rocket_fuel",
    icon = techicons .. "panglia_branbalite_slurry_to_rocket_fuel.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_branbalite_slurry_to_rocket_fuel"
      },
    },
    prerequisites = {"panglia_branbalite_slurry", "panglia_universe_precursor_volcanic"},
    research_trigger =
    {
      type = "craft-fluid",
      fluid = "panglia_branbalite_slurry",
      amount = 1000,
    },
  },



  {
    type = "technology",
    name = "panglia_advanced_optics_nanotech",
    icon = techicons .. "panglia_advanced_optics_nanotech.png",
    icon_size = 256,
    effects =
    {
      --{
      --  type = "unlock-recipe",
      --  recipe = "datacell-dna-raw"
      --},
    },
    prerequisites = {"panglia_planet_discovery_panglia", "moshine-tech-data-processor-building"},
    research_trigger =
    {
      type = "craft-item",
      item = "panglia_panglite",
      count = 100,
    }
  },





  {
    type = "technology",
    name = "panglia_panglite_fiber",
    icon = techicons .. "panglia_panglite_fiber.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_panglite_fiber"
      },
    },
    prerequisites = {"panglia_panglite_multiplication"},
    research_trigger =
    {
      type = "craft-item",
      item = "panglia_panglite",
      count = 1000,
    }
  },



  {
    type = "technology",
    name = "panglia_advanced_circuit_from_panglite_fiber",
    icon = techicons .. "panglia_advanced_circuit_from_panglite_fiber.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_advanced_circuit_from_panglite_fiber"
      },
    },
    prerequisites = {"panglia_panglite_fiber"},
    research_trigger =
    {
      type = "craft-item",
      item = "panglia_panglite_fiber",
      amount = 50,
    },
  },


  {
    type = "technology",
    name = "panglia_crusher",
    icon = techicons .. "panglia_crusher.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_crusher",
      },
      {
        type = "unlock-recipe",
        recipe = "panglia_dust",
      }
    },
    prerequisites = {"matter_printer-technology", "panglia_branbalite_slurry", "panglia_advanced_circuit_from_panglite_fiber"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
      },
      time = 60
    },
  },

  {
    type = "technology",
    name = "panglia_low_density_structure_from_panglite_fiber",
    icon = techicons .. "panglia_low_density_structure_from_panglite_fiber.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_low_density_structure_from_panglite_fiber"
      },
    },
    prerequisites = {"panglia_panglite_fiber"},
    research_trigger =
    {
      type = "craft-item",
      item = "panglia_panglite_fiber",
      amount = 100,
    },
  },



  {
    type = "technology",
    name = "panglia_universe_precursor",
    icon = techicons .. "panglia_universe_precursor.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_universe_precursor"
      },
    },
    prerequisites = {"panglia_panglite_fiber", "panglia_universe_precursor_volcanic", "panglia_crusher"},
    research_trigger =
    {
      type = "craft-item",
      item = "panglia_panglite_fiber",
      amount = 200,
    },
  },


------------------------------------------------













  {
    type = "technology",
    name = "panglia_dna_manipulation",
    icon = techicons .. "panglia_dna_manipulation.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_cloned_specimen_body_0"
      },
    },
    prerequisites = {"cloning-vat-technology", "moshine-tech-processing-grid", "uranium-processing"},
    unit =
    {
      count = 10,
      ingredients =
      {
        {"datacell-ai-model-data", 1},
        {"datacell-solved-equation", 1},
        {"datacell-dna-raw", 1},
      },
      time = 145*500
    }
  },

  {
    type = "technology",
    name = "panglia_simulation_chamber",
    icon = techicons .. "panglia_simulation_chamber.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "simulation_chamber"
      },
      {
        type = "unlock-recipe",
        recipe = "panglia_cloned_specimen_body_1"
      },
    },
    prerequisites = {"moshine-tech-ai-tier-10", "panglia_dna_manipulation", "matter_printer-technology"},
    unit =
    {
      count = 40,
      ingredients =
      {
        {"datacell-ai-model-data", 1},
        {"datacell-solved-equation", 1},
        {"datacell-dna-raw", 1},
        {"datacell-dna-sequenced", 1},
      },
      time = 1658*500,
    }
  },


  {
    type = "technology",
    name = "panglia_simulation_matrix",
    icon = techicons .. "panglia_simulation_matrix.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_cloned_specimen_body_2"
      },
      {
        type = "unlock-recipe",
        recipe = "panglia_cloned_specimen_body_3"
      },
    },
    prerequisites = {"panglia_simulation_chamber"},
    research_trigger =
    {
      type = "craft-item",
      item = "panglia_cloned_specimen_body_1",
      count = 1,
    },
  },

  {
    type = "technology",
    name = "panglia_sentient_processor",
    icon = techicons .. "panglia_sentient_processor.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_sentient_processor"
      },
    },
    prerequisites = {"thinking-brain-technology", "quantum-processor"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"datacell-ai-model-data", 1},
        {"datacell-solved-equation", 1},
        {"datacell-dna-raw", 1},
        {"datacell-dna-sequenced", 1},
      },
      time = 1008*500,
    }
  },







  {
    type = "technology",
    name = "panglia_worker-robots-speed",
    icons = util.technology_icon_constant_movement_speed(techicons .. "panglia_worker-robots-speed.png"),
    effects =
    {
      {
        type = "worker-robot-speed",
        modifier = 0.40
      }
    },
    prerequisites = {"panglia_sentient_processor", "electromagnetic-science-pack"},
    unit =
    {
      count_formula = "2^(L-3)*1000",
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"datacell-ai-model-data", 1},
        {"datacell-solved-equation", 1},
        {"datacell-dna-sequenced", 1},
      },
      time = 6000
    },
    max_level = "infinite",
    upgrade = true
  },

  {
    type = "technology",
    name = "panglia_worker-robots-storage-1",
    icons = util.technology_icon_constant_capacity(techicons .. "panglia_worker-robots-storage.png"),
    effects =
    {
      {
        type = "worker-robot-storage",
        modifier = 1
      }
    },
    prerequisites = {"panglia_sentient_processor", "worker-robots-storage-3"},
    unit =
    {
      count = 800,
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"datacell-ai-model-data", 1},
        {"datacell-solved-equation", 1},
        {"datacell-dna-sequenced", 1},
      },
      time = 10000
    },
    upgrade = true
  },

  {
    type = "technology",
    name = "panglia_worker-robots-storage-2",
    icons = util.technology_icon_constant_capacity(techicons .. "panglia_worker-robots-storage.png"),
    effects =
    {
      {
        type = "worker-robot-storage",
        modifier = 1
      }
    },
    prerequisites = {"panglia_worker-robots-storage-1"},
    unit =
    {
      count = 1600,
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"datacell-ai-model-data", 1},
        {"datacell-solved-equation", 1},
        {"datacell-dna-sequenced", 1},
      },
      time = 10000
    },
    upgrade = true
  },


})



if data.raw["technology"]["matter_printer-technology"] then
  table.insert(data.raw["technology"]["matter_printer-technology"].prerequisites, "panglia_advanced_optics_nanotech")
  table.insert(data.raw["technology"]["matter_printer-technology"].prerequisites, "panglia_panglite_multiplication")
end
  --table.insert(data.raw["technology"]["panglia_crusher"].effects, {type = "unlock-recipe", recipe = "panglia_universe_precursor"})

if data.raw["technology"]["cloning-vat-technology"] then
  table.insert(data.raw["technology"]["cloning-vat-technology"].prerequisites, "panglia_branbalite_slurry")
  table.insert(data.raw["technology"]["cloning-vat-technology"].prerequisites, "panglia_advanced_optics_nanotech")
  table.insert(data.raw["technology"]["panglia_simulation_chamber"].prerequisites, "cloning-vat-technology")
  table.insert(data.raw["technology"]["cloning-vat-technology"].effects,
    {type = "unlock-recipe", recipe = "datacell-dna-raw"}
  )
end

if data.raw["technology"]["thinking-brain-technology"] then
  data.raw["technology"]["thinking-brain-technology"].prerequisites = {"panglia_simulation_matrix"}
end



--table.insert(data.raw["technology"]["panglia_advanced_optics_nanotech"].prerequisites, "planet-discovery-moshine")
--data.raw["technology"]["panglia_advanced_optics_nanotech"].research_trigger = {
--  type = "craft-item",
--  item = "glass",
--  count = 10
--}



--if mods["moshine"] then
--  table.insert(data.raw["technology"]["panglia_planet_discovery_panglia"].prerequisites, "panglia_simulation_matrix")
--end