local panglia_simulations = "__panglia_planet__/menu-simulations/"

local menu_sims = data.raw["utility-constants"]["default"].main_menu_simulations

-- Remove Vanilla + Expansion menu simulations
-- Base

--[[
menu_sims.nauvis_solar_power_construction = nil
menu_sims.nauvis_lab = nil
menu_sims.nauvis_burner_city = nil
menu_sims.nauvis_mining_defense = nil
menu_sims.nauvis_forest_fire = nil
menu_sims.nauvis_oil_pumpjacks = nil
menu_sims.nauvis_oil_refinery = nil
menu_sims.nauvis_early_smelting = nil
menu_sims.nauvis_train_station = nil
menu_sims.nauvis_logistic_robots = nil
menu_sims.nauvis_nuclear_power = nil
menu_sims.nauvis_train_junction = nil
menu_sims.nauvis_artillery = nil
menu_sims.nauvis_biter_base_spidertron = nil
menu_sims.nauvis_biter_base_artillery = nil
menu_sims.nauvis_biter_base_laser_defense = nil
menu_sims.nauvis_biter_base_player_attack = nil
menu_sims.nauvis_biter_base_steamrolled = nil
menu_sims.nauvis_chase_player = nil
menu_sims.nauvis_big_defense = nil
menu_sims.nauvis_brutal_defeat = nil
menu_sims.nauvis_spider_ponds = nil
menu_sims.nauvis_uranium_processing = nil
-- Elevated Rails
menu_sims.nauvis_ship_rails = nil
menu_sims.nauvis_river_bridge = nil
menu_sims.nauvis_t_section = nil
-- Space Age
menu_sims.nauvis_biolab = nil
menu_sims.nauvis_tank_building = nil
menu_sims.nauvis_power_up = nil
menu_sims.nauvis_bus = nil
menu_sims.platform_science = nil
menu_sims.platform_moving = nil
menu_sims.platform_messy_nuclear = nil
menu_sims.vulcanus_lava_forge = nil
menu_sims.vulcanus_crossing = nil
menu_sims.vulcanus_punishmnent = nil
menu_sims.vulcanus_sulfur_drop = nil
menu_sims.gleba_agri_towers = nil
menu_sims.gleba_pentapod_ponds = nil
menu_sims.gleba_egg_escape = nil
menu_sims.gleba_farm_attack = nil
menu_sims.gleba_grotto = nil
menu_sims.fulgora_city_crossing = nil
menu_sims.fulgora_recycling_hell = nil
menu_sims.fulgora_nightfall = nil
menu_sims.fulgora_race = nil
menu_sims.aquilo_send_help = nil
menu_sims.aquilo_starter = nil
menu_sims.nauvis_rocket_factory = nil
]]

menu_sims.panglia_panderoots_sim = {
  checkboard = false,
  planet = "panglia",
  game_view_settings = {default_show_value = false, show_shortcut_bar = false, show_quickbar = false, show_tool_bar = false},
  init_update_count = 90,
  save = panglia_simulations .. "panglia_panderoots_sim.zip",
  length = 16 * second,
  init = [[
    game.simulation.camera_zoom = 1
    game.simulation.camera_player = "snouz"
    game.simulation.camera_position = {327.5,27.75}
    game.simulation.camera_alt_info = false
    game.simulation.hide_cursor = true
    game.tick_paused = false
  ]],
}

menu_sims.panglia_branbalite_sim = {
  checkboard = false,
  planet = "panglia",
  game_view_settings = {default_show_value = false, show_shortcut_bar = false, show_quickbar = false, show_tool_bar = false},
  init_update_count = 90,
  save = panglia_simulations .. "panglia_branbalite_sim.zip",
  length = 12 * second,
  init = [[
    game.simulation.camera_zoom = 1
    game.simulation.camera_player = "snouz"
    game.simulation.camera_position = {-41.5,12.75}
    game.simulation.camera_alt_info = false
    game.simulation.hide_cursor = true
    game.tick_paused = false
  ]],
}

menu_sims.panglia_universe_sim = {
  checkboard = false,
  planet = "panglia",
  game_view_settings = {default_show_value = false, show_shortcut_bar = false, show_quickbar = false, show_tool_bar = false},
  init_update_count = 90,
  save = panglia_simulations .. "panglia_universe_sim.zip",
  length = 20 * second,
  init = [[
    game.simulation.camera_zoom = 1
    game.simulation.camera_player = "snouz"
    game.simulation.camera_position = {-87.5,59.75}
    game.simulation.camera_alt_info = false
    game.simulation.hide_cursor = true
    game.tick_paused = false
  ]],
}

menu_sims.panglia_simchambers_sim = {
  checkboard = false,
  planet = "panglia",
  game_view_settings = {default_show_value = false, show_shortcut_bar = false, show_quickbar = false, show_tool_bar = false},
  init_update_count = 90,
  save = panglia_simulations .. "panglia_simchambers_sim.zip",
  length = 15 * second,
  init = [[
    game.simulation.camera_zoom = 1
    game.simulation.camera_player = "snouz"
    game.simulation.camera_position = {774.5,940.75}
    game.simulation.camera_alt_info = false
    game.simulation.hide_cursor = true
    game.tick_paused = false
  ]],
}