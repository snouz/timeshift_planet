local seconds_interval = 15
local number_of_turret_vars = 16

if script.active_mods["wret-beacon-rebalance-mod"] then 
  local function on_load_setup()
    remote.call("wr-beacon-rebalance", "add_whitelisted_beacon", "panglia_hidden_beacon")
  end
  script.on_load(on_load_setup)
end

script.on_configuration_changed(function(event)
  local surface = game.get_surface("panglia")
  if not surface then return end

  for _, entity in pairs(surface.find_entities_filtered{name = "panglia_hidden_beacon"}) do
    if entity.valid then
      local inventory = entity.get_module_inventory()
      if inventory and inventory.can_insert{name = "panglia_hidden_beacon_module"} then
        inventory.insert{name = "panglia_hidden_beacon_module", count = 1}
      else
        log("Could not insert module into beacon at " .. serpent.line(entity.position))
      end
    end
  end
end)

script.on_event(defines.events.on_chunk_generated, function(event)
  local surface = event.surface
  local area = event.area

  -- Find all entities in the new chunk
  local entities = surface.find_entities_filtered{area = area}

  for _, entity in pairs(entities) do
    if entity.valid then
      if entity.name == "panglia_hidden_beacon" then
        --entity.teleport({x = entity.position.x + 0.5, y = entity.position.y + 0.5})
        local inventory = entity.get_module_inventory()
        if inventory and inventory.can_insert{name = "panglia_hidden_beacon_module"} then
          inventory.insert{name = "panglia_hidden_beacon_module", count = 1}
        else
          log("Could not insert panglia_module into panglia_beacon at position " .. serpent.line(entity.position))
        end

        --Replace by custom tile
        surface.set_tiles({ {name = "panglia_hidden_beacon_tile", position = entity.position} })

        --Remove decoratives
        local decos = surface.find_entities_filtered{ position = entity.position, type = "simple-entity" }
        
        for _, deco in pairs(decos) do
          if deco.valid then
            deco.destroy()
          end
        end

        local decos = surface.find_entities_filtered{ position = entity.position, type = "cliff" }
        for _, deco in pairs(decos) do
          if deco.valid then
            deco.destroy({do_cliff_correction = true})
          end
        end

        surface.destroy_decoratives{ position = entity.position }

      elseif entity.name == "panglia_energy_roots" then

        local pos = entity.position
        local radius = 30
        local neighbors = surface.find_entities_filtered{
          area = { {pos.x - radius, pos.y - radius}, {pos.x + radius, pos.y + radius}},
          name = "panglia_energy_roots"
        }
        for _, other in pairs(neighbors) do
          if other.valid and other ~= entity then
            -- Found a duplicate in range → remove this one
            entity.destroy()
            break
          end
        end

        if entity and entity.valid then
          if not storage.panglia_generators then storage.panglia_generators = {} end
          table.insert(storage.panglia_generators, {
            entity = entity,
          })
          entity.minable_flag = false
          entity.destructible = false
          entity.rotatable = false
          --local rand = math.random(0, 1)
          --if rand == 0 then entity.direction = defines.direction.north else entity.direction = defines.direction.east end
        end
      end
    end
  end
end)


local function try_place_from_radius(surface, center, radius_min, radius_max, name)
  for radius = radius_min, radius_max do
    local attempts = 8 + math.floor(radius / 2)  -- More attempts for larger rings
    for i = 1, attempts do
      local angle = math.random() * math.pi * 2
      local r = radius + math.random()  -- Slight jitter to avoid perfect circle clumping
      local pos = {
        x = center.x + math.cos(angle) * r,
        y = center.y + math.sin(angle) * r
      }

      if surface.can_place_entity{name = name, position = pos} then
        return pos
      end
    end
  end
  return nil
end

local function try_place_or_force_clear_turret(surface, center)
  local maxradius = 20
  local pos = try_place_from_radius(surface, center, 3, maxradius, "panglia_energy_roots_tesla_turret_1")
  if pos then
    return pos
  else
    local candidates = surface.find_entities_filtered{
      area = {
        {center.x - maxradius, center.y - maxradius},
        {center.x + maxradius, center.y + maxradius}
      },
    }

    -- Filter out protected types
    for _, entity in pairs(candidates) do
      if entity.valid and entity.name ~= "panglia_energy_roots" and not string.find(entity.name, "panglia_energy_roots_tesla_turret") and entity.name ~= "character" then
        local pos = entity.position
        entity.destroy({do_cliff_correction = true, raise_destroy = true})
        --return pos
      end
    end
  end

  -- Still nothing
  return nil
end


script.on_nth_tick(seconds_interval * 60, function()
  if not storage.panglia_generators then storage.panglia_generators = {} end
  for i, data in pairs(storage.panglia_generators) do
    local entity = data.entity
    if not (entity and entity.valid) then
      table.remove(storage.panglia_generators, i)
    elseif entity.energy_generated_last_tick and entity.energy_generated_last_tick > 10 then
      local surface = entity.surface
      local pos = try_place_or_force_clear_turret(surface, entity.position)
      if pos then
        local turrNum = math.random(1, number_of_turret_vars)
        local turret = surface.create_entity{
          name = "panglia_energy_roots_tesla_turret_" .. turrNum,
          position = pos,
          force = entity.force
        }
        turret.force = game.forces.enemy
      end
    end
  end
end)




script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive}, function(event)
  local entity = event.created_entity or event.entity
  if entity and entity.valid and entity.surface then

    local surface = entity.surface
    local position = entity.position
    local beacons = surface.find_entities_filtered{area = {{position.x-0.5,position.y-0.5},{position.x+0.5,position.y+0.5}}, name = "panglia_hidden_beacon"}
    
    if surface.name == "panglia" then
      if #beacons > 0 and not string.find(entity.name, "_panglia_fast_version") then -- there's a hidden beacon

        if entity.type == "inserter" or entity.type == "transport-belt" or entity.type == "splitter" then
          local new_entity = surface.create_entity{
            name = entity.name .. "_panglia_fast_version",
            position = position,
            force = entity.force,
            direction = entity.direction,
            fast_replace = true,
            spill = false,
            target = entity
          }
        end
      end
      -- make everything a military target for pangroots and egg monsters
      if entity and entity.valid and entity.prototype.allow_run_time_change_of_is_military_target == true and entity.prototype.is_military_target == false then
        entity.is_military_target = true
      end
    end
    if entity and entity.valid and (surface.name ~= "panglia" or (surface.name == "panglia" and #beacons == 0)) then
      if string.find(entity.name, "_panglia_fast_version") then
        local new_entity = surface.create_entity{
          --name = entity.original_name,
          name = entity.name:gsub( "_panglia_fast_version", "") ,
          position = position,
          force = entity.force,
          direction = entity.direction,
          fast_replace = true,
          raise_built = true,
          player = entity.last_user,
        }
        if new_entity then
          entity.destroy()
        end
      end
    end
  end
end)




script.on_event(prototypes.recipe["panglia_collect_dna_fish"].on_crafted_event, function(event)
  if not event.entity or not event.entity.valid then return end
  local force = event.entity.force
  if not force then return end
  if force.technologies["panglia_advanced_optics_nanotech"].researched then
    if not force.technologies["panglia_collect_dna_fish"].researched then
      force.technologies["panglia_collect_dna_fish"].researched = true
    end
    --script.on_event(prototypes.recipe["panglia_collect_dna_fish"].on_crafted_event, nil) -- would produce desync
  end
end)


script.on_event({prototypes.recipe["panglia_collect_dna_biter"].on_crafted_event,prototypes.recipe["panglia_collect_dna_biter_egg"].on_crafted_event}, function(event)
  if not event.entity or not event.entity.valid then return end
  local force = event.entity.force
  if not force then return end
  if force.technologies["panglia_advanced_optics_nanotech"].researched then
    if not force.technologies["panglia_collect_dna_biter"].researched then
      force.technologies["panglia_collect_dna_biter"].researched = true
    end
    --script.on_event(prototypes.recipe["panglia_collect_dna_biter"].on_crafted_event, nil) -- would produce desync
  end
end)



script.on_event(prototypes.recipe["panglia_collect_dna_demolisher"].on_crafted_event, function(event)
  if not event.entity or not event.entity.valid then return end
  local force = event.entity.force
  if not force then return end
  if force.technologies["panglia_advanced_optics_nanotech"].researched then
    if not force.technologies["panglia_collect_dna_demolisher"].researched then
      force.technologies["panglia_collect_dna_demolisher"].researched = true
    end
    --script.on_event(prototypes.recipe["panglia_collect_dna_demolisher"].on_crafted_event, nil) -- would produce desync
  end
end)


script.on_event(prototypes.recipe["panglia_collect_dna_pentapod"].on_crafted_event, function(event)
  if not event.entity or not event.entity.valid then return end
  local force = event.entity.force
  if not force then return end
  if force.technologies["panglia_advanced_optics_nanotech"].researched then
    if not force.technologies["panglia_collect_dna_pentapod"].researched then
      force.technologies["panglia_collect_dna_pentapod"].researched = true
    end
    --script.on_event(prototypes.recipe["panglia_collect_dna_pentapod"].on_crafted_event, nil) -- would produce desync
  end
end)
























































---------------------------------------------------------------------------------------------------





soundspath = "__panglia_planet_assets__/sounds/"


-- DNA Builder phase transformation script

local required_clones = 100

local PHASE_ONE = "panglia_dna_builder"
local PHASE_TWO = "panglia_dna_builder_phasetwo"

local destroy_filters = {
  {filter = "name", name = PHASE_ONE},
  {filter = "name", name = PHASE_TWO},
}

script.on_init(function()
  storage.panglia_dna_builder_progress = storage.panglia_dna_builder_progress or {}
  storage.panglia_dna_builder_text_ids = storage.panglia_dna_builder_text_ids or {}
end)

script.on_configuration_changed(function()
  storage.panglia_dna_builder_progress = storage.panglia_dna_builder_progress or {}
  storage.panglia_dna_builder_text_ids = storage.panglia_dna_builder_text_ids or {}
end)

local function create_or_update_countdown(entity, progress)
  if not entity or not entity.valid then return end
  local unit_number = entity.unit_number
  local old_id = storage.panglia_dna_builder_text_ids[unit_number]
  
  if old_id then
    local old_obj = rendering.get_object_by_id(old_id)
    if old_obj then old_obj.destroy() end
  end

  if entity.name ~= PHASE_TWO then
    storage.panglia_dna_builder_text_ids[unit_number] = nil
    return
  end

  local remaining = required_clones - progress

  local new_obj = rendering.draw_text({
    text = remaining .. "/" .. required_clones,
    surface = entity.surface,
    target = entity,
    target_offset = {0, 4.5},
    color = {r = 1, g = 1, b = 1},
    alignment = "center",
    scale = 1,
  })
  storage.panglia_dna_builder_text_ids[unit_number] = new_obj.id
end

local function transform_entity(entity, new_name)
  if not entity or not entity.valid then return end
  local surface = entity.surface
  local new_entity = surface.create_entity({
    name = new_name,
    position = entity.position,
    force = entity.force,
    fast_replace = true,
    direction = entity.direction,
    create_build_effect_smoke = false,
  })
  entity.destroy()
  return new_entity
end

local function on_entity_removed(event)
  local entity = event.entity
  if not entity.valid then return end
  if entity.name ~= PHASE_ONE and entity.name ~= PHASE_TWO then return end
  storage.panglia_dna_builder_progress[entity.unit_number] = nil
end

script.on_event(prototypes.recipe["panglia_dna_builder_make_phasetwo"].on_crafted_event, function(event)
  local entity = event.entity

  if not entity or not entity.valid then return end
  if entity.name ~= PHASE_ONE then return end

  local force = entity.force
  if not force then return end

  if not force.technologies["panglia_dna_manipulation_phasetwo_tech"].researched then
    force.technologies["panglia_dna_manipulation_phasetwo_tech"].researched = true
  end

  local old_unit_number = entity.unit_number
  storage.panglia_dna_builder_progress[old_unit_number] = nil
  local new_entity = transform_entity(entity, PHASE_TWO)
  if new_entity and new_entity.valid then
    new_entity.clear_fluids()
    storage.panglia_dna_builder_progress[new_entity.unit_number] = 0
    create_or_update_countdown(new_entity, 0)
    if new_entity.surface then
      new_entity.surface.play_sound({
        path = "panglia_dna_builder_switch_to_phase2",
        position = new_entity.position,
      })
    end
  end
  
end)


script.on_event(prototypes.recipe["panglia_dna_candidate"].on_crafted_event, function(event)
  local entity = event.entity
  if not entity or not entity.valid then return end
  local inventory = entity.get_inventory(defines.inventory.crafter_input)
  if not inventory or not inventory.valid then return end
  local count = inventory.get_item_count("panglia_dna_validated")
  if count >= 0 then
    entity.clear_fluids()
  else
    if math.random(10) == 1 then
      entity.clear_fluids()
    end
  end
end)

script.on_event(prototypes.recipe["panglia_cloned_specimen_body_0"].on_crafted_event, function(event)
  local entity = event.entity
  if not entity or not entity.valid then return end
  if entity.name ~= PHASE_TWO then return end
  local unit_number = entity.unit_number
  local current_progress = (storage.panglia_dna_builder_progress[unit_number] or 0) + 1
  storage.panglia_dna_builder_progress[unit_number] = current_progress

  if current_progress >= required_clones then
    local text_id = storage.panglia_dna_builder_text_ids[unit_number]
    if text_id then
      local text_obj = rendering.get_object_by_id(text_id)
      if text_obj then text_obj.destroy() end
      storage.panglia_dna_builder_text_ids[unit_number] = nil
    end
    storage.panglia_dna_builder_progress[unit_number] = nil
    local new_entity = transform_entity(entity, PHASE_ONE)
    if new_entity and new_entity.valid then
      new_entity.clear_fluids()
      if new_entity.surface then
        new_entity.surface.play_sound({
          path = "panglia_dna_builder_switch_to_phase1",
          position = new_entity.position,
        })
      end
    end
  else
    create_or_update_countdown(entity, current_progress)
  end
end
)


script.on_event(defines.events.on_player_mined_entity, on_entity_removed, destroy_filters)
script.on_event(defines.events.on_robot_mined_entity, on_entity_removed, destroy_filters)
script.on_event(defines.events.on_entity_died, on_entity_removed, destroy_filters)
script.on_event(defines.events.script_raised_destroy, on_entity_removed, destroy_filters)