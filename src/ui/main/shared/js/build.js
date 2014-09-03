
function BuildHotkeyModel() {
    var self = this;

    self.SpecIdToGridMap = ko.observable(
        {
            "/pa/units/land_utility/radar_adv/radar_adv.json": ["utility", 0],                    
            "/pa/units/land_econ/energy_plant_adv/energy_plant_adv.json": ["utility", 3],
            "/pa/units/land_econ/metal_extractor_adv/metal_extractor_adv.json": ["utility", 4],
            "/pa/units/land_utility/delta_v_engine/delta_v_engine.json": ["utility", 5],
            "/pa/units/land_utility/radar/radar.json": ["utility", 6],          
            "/pa/units/land_combat/anti_nuke_launcher/anti_nuke_launcher.json": ["utility", 7],
            "/pa/units/land_econ/energy_plant/energy_plant.json": ["utility", 8],
            "/pa/units/land_econ/metal_extractor/metal_extractor.json": ["utility", 9],
            "/pa/units/land_utility/teleporter/teleporter.json": ["utility", 10],
            "/pa/units/land_utility/deep_space_radar/deep_space_radar.json": ["utility", 11],
            "/pa/units/land_combat/land_barrier/land_barrier.json": ["utility", 12],
            "/pa/units/land_econ/energy_storage/energy_storage.json": ["utility", 13],
            "/pa/units/land_econ/metal_storage/metal_storage.json": ["utility", 14],
            "/pa/units/land_utility/control_module/control_module.json": ["utility", 1],

                              
            "/pa/units/surfacenaval_econ/naval_factory_adv/naval_factory_adv.json": ["factory", 8],           
            "/pa/units/land_econ/air_factory_adv/air_factory_adv.json": ["factory", 7],
            "/pa/units/land_econ/bot_factory_adv/bot_factory_adv.json": ["factory", 5],
            "/pa/units/land_econ/vehicle_factory_adv/vehicle_factory_adv.json": ["factory", 6],
            "/pa/units/land_econ/orbital_launcher/orbital_launcher.json": ["factory", 14],
            "/pa/units/surfacenaval_econ/naval_factory/naval_factory.json": ["factory", 13],       
            "/pa/units/land_econ/air_factory/air_factory.json": ["factory", 12],
            "/pa/units/land_econ/bot_factory/bot_factory.json": ["factory", 10],
            "/pa/units/land_econ/vehicle_factory/vehicle_factory.json": ["factory", 11],


            "/pa/units/land_combat/laser_defense_single/laser_defense_single.json": ["combat", 10],
            "/pa/units/land_combat/laser_defense_double/laser_defense_double.json": ["combat", 5],
            "/pa/units/land_combat/laser_defense_triple/laser_defense_triple.json": ["combat", 0],                   
            "/pa/units/land_combat/air_defense_missile/air_defense_missile.json": ["combat", 11],  
            "/pa/units/land_combat/air_defense_flak/air_defense_flak.json": ["combat", 6],  
            "/pa/units/surfacenaval_combat/torpedo_launcher/torpedo_launcher.json": ["combat", 12],
            "/pa/units/surfacenaval_combat/torpedo_launcher_adv/torpedo_launcher_adv.json": ["combat", 7],
            "/pa/units/land_combat/artillery_short/artillery_short.json": ["combat", 13],
            "/pa/units/land_combat/artillery_long/artillery_long.json": ["combat", 8],
            "/pa/units/land_combat/tactical_missile_launcher/tactical_missile_launcher.json": ["combat", 9],
            "/pa/units/land_combat/nuke_launcher/nuke_launcher.json": ["combat", 4],
            "/pa/units/land_combat/ion_defense/ion_defense.json": ["combat", 14],
         

            "/pa/units/land_vehicles/fabrication_vehicle/fabrication_vehicle.json": ["vehicle", 10],                        
            "/pa/units/land_vehicles/tank_cannon/tank_cannon.json": ["vehicle", 11],
		"/pa/units/land_vehicles/tank_gattling/tank_gattling.json": ["vehicle", 12],
            "/pa/units/land_vehicles/vehicle_missile/vehicle_missile.json": ["vehicle", 13], 
            "/pa/units/land_vehicles/tank_flamer/tank_flamer.json": ["vehicle", 14], 
            "/pa/units/land_vehicles/vehicle_scout/vehicle_scout.json": ["vehicle", 6],    
                   
            "/pa/units/land_vehicles/fabrication_vehicle_adv/fabrication_vehicle_adv.json": ["advVehicle", 10],
            "/pa/units/land_vehicles/tank_double_cannon/tank_double_cannon.json": ["advVehicle", 11],
            "/pa/units/land_vehicles/tank_flak/tank_flak.json": ["advVehicle", 12],
            "/pa/units/land_vehicles/tank_heavy_armor/tank_heavy_armor.json": ["advVehicle", 13],
            "/pa/units/land_vehicles/tank_artillery/tank_artillery.json": ["advVehicle", 14],


            "/pa/units/land_bots/fabrication_bot/fabrication_bot.json": ["bot", 10],
            "/pa/units/land_bots/fabrication_bot_combat/fabrication_bot_combat.json": ["bot", 5],     
            "/pa/units/land_bots/bot_assault/bot_assault.json": ["bot", 11],
            "/pa/units/land_bots/bot_mortar/bot_mortar.json": ["bot", 12],
            "/pa/units/land_bots/bot_antiair/bot_antiair.json": ["bot", 13],

            "/pa/units/land_bots/fabrication_bot_adv/fabrication_bot_adv.json": ["advBot", 10],
            "/pa/units/land_bots/fabrication_bot_combat_adv/fabrication_bot_combat_adv.json": ["advBot", 5],   
            "/pa/units/land_bots/bot_flamer/bot_flamer.json": ["advBot", 11],
            "/pa/units/land_bots/bot_sniper/bot_sniper.json": ["advBot", 12],
            "/pa/units/land_bots/bot_tactical_missile/bot_tactical_missile.json": ["advBot", 13],
            "/pa/units/land_bots/bot_bomb/bot_bomb.json": ["advBot", 14],     


            "/pa/units/orbital_units/orbital_missile/orbital_missile.json": ["orbital", 11],
            "/pa/units/orbital_units/orbital_bombardment_platform/orbital_bombardment_platform.json": ["orbital", 8],
            "/pa/units/orbital_units/defense_satellite/defense_satellite.json": ["orbital", 7],           
            "/pa/units/orbital_units/orbital_fabrication_satellite/orbital_fabrication_satellite.json": ["orbital", 10],
            "/pa/units/orbital_units/orbital_sniper/orbital_sniper.json": ["orbital", 6],
            "/pa/units/orbital_units/radar_satellite/radar_satellite.json": ["orbital", 13],
            "/pa/units/orbital_units/orbital_transport/orbital_transport.json": ["orbital", 12],
            "/pa/units/orbital_units/radar_satellite_adv/radar_satellite_adv.json": ["orbital", 14],

            "/pa/units/orbital_structures/orbital_factory/orbital_factory.json": ["satellite", 10],
            "/pa/units/orbital_structures/solar_array/solar_array.json": ["satellite", 11],         
            "/pa/units/orbital_structures/mining_platform/mining_platform.json": ["satellite", 12],                


            "/pa/units/air/fabrication_aircraft/fabrication_aircraft.json": ["air", 10],
            "/pa/units/air/fighter/fighter.json": ["air", 11],
            "/pa/units/air/bomber/bomber.json": ["air", 12],
		"/pa/units/air/bomber_torpedo/bomber_torpedo.json": ["air", 13],
            "/pa/units/air/transport/transport.json": ["air", 14],
            "/pa/units/air/air_scout/air_scout.json": ["air", 6],

            "/pa/units/air/fabrication_aircraft_adv/fabrication_aircraft_adv.json": ["advAir", 10],
            "/pa/units/air/fighter_antiair/fighter_antiair.json": ["advAir", 11],
            "/pa/units/air/bomber_adv/bomber_adv.json": ["advAir", 12],
            "/pa/units/air/gunship/gunship.json": ["advAir", 13],


            "/pa/units/surfacenaval_units/fabrication_ship/fabrication_ship.json": ["naval", 10],
            "/pa/units/surfacenaval_units/sea_scout/sea_scout.json": ["naval", 11],
            "/pa/units/surfacenaval_units/frigate/frigate.json": ["naval", 12],
            "/pa/units/surfacenaval_units/destroyer/destroyer.json": ["naval", 13],

            "/pa/units/surfacenaval_units/fabrication_ship_adv/fabrication_ship_adv.json": ["advNaval", 10],
            "/pa/units/surfacenaval_units/battleship/battleship.json": ["advNaval", 11],
            "/pa/units/surfacenaval_units/missile_ship/missile_ship.json": ["advNaval", 12],


            "/pa/units/land_combat/nuke_launcher/nuke_launcher_tac_ammo.json": ["missile", 10],
            "/pa/units/land_combat/nuke_launcher/nuke_launcher_strat_ammo.json": ["missile", 11],
		"/pa/units/land_combat/anti_nuke_launcher/anti_nuke_launcher_ammo.json": ["missile", 12],

            "/pa/units/land_combat/land_mine/land_mine.json": ["mine", 10],
        }
    );
};
