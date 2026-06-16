local seconds_interval = 15
local number_of_turret_vars = 16


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
                        raise_built = true,
                        player = entity.last_user,
                    }
                    if new_entity then
                        entity.destroy()
                    end
                end
            end
            -- make everything a military target for pangroots and egg monsters
            if entity and entity.valid and entity.prototype.allow_run_time_change_of_is_military_target == true and entity.prototype.is_military_target == false then
                entity.is_military_target = true
            end
        end
        if entity and entity.valid and surface.name ~= "panglia" or (surface.name == "panglia" and #beacons == 0) then
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