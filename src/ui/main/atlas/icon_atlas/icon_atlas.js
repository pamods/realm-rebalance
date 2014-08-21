var model;
var handlers;

$(document).ready(function () {

    function IconAtlasViewModel() {
        var self = this;

        self.strategicIconSource = function (string) { return 'img/strategic_icons/' + 'icon_si_' + string + '.png' }
        self.strategicIcons = ko.observableArray([
			'blip',
			'tank_cannon',
			'tank_heavy_armor',
			'tank_flamer',
            'tank_artillery',
            'vehicle_missile',
            'fabrication_vehicle',
            'fabrication_vehicle_adv',
            'tank_flak',
            'vehicle_scout',
            'tank_gattling',
            'fabrication_bot',
            'fabrication_bot_adv',
            'tank_double_cannon',
            'bot_sniper',
            'bot_assault',
            'bot_flamer',
            'bot_antiair',
            'bot_mortar',
            'air_scout',
            'bomber',
            'bomber_adv',
            'bomber_torpedo',
            'transport',
            'fighter',
            'fighter_antiair',
            'gunship',
            'fabrication_aircraft_adv',
            'fabrication_aircraft',
            'commander',
            'fabrication_bot_combat',
            'fabrication_bot_combat_adv',
            'bot_bomb',
            'bot_tactical_missile',
            'metal_extractor',     
            'metal_extractor_adv',   
            'air_factory_adv',
            'air_factory',
            'bot_factory_adv',
            'bot_factory',
            'vehicle_factory_adv',
            'vehicle_factory',
			'energy_plant_adv',
            'energy_plant',
            'energy_storage',			
            'metal_storage',            
			'orbital_launcher',
            'air_defense_missile',
            'air_defense_flak',
            'laser_defense_single',
            'laser_defense_double',
            'laser_defense_triple',
            'artillery_short',
            'artillery_long',
            'land_mine',
            'land_barrier',
            'tactical_missile_launcher',
            'ion_defense',
            'deep_space_radar',
            'delta_v_engine',
            'radar',
            'radar_adv',
            'teleporter',
            'nuke_launcher',
            'anti_nuke_launcher',
            'naval_factory',
            'naval_factory_adv',
            'torpedo_launcher',
            'torpedo_launcher_adv',
            'battleship',
            'destroyer',
            'fabrication_ship',
            'fabrication_ship_adv',
            'frigate',
            'missile_ship',
            'sea_scout',
            'orbital_factory',
            'radar_satellite_adv',
            'solar_array',
            'defense_satellite',
            'orbital_bombardment_platform',
            'orbtial_fabrication_satellite',
            'orbital_missile',
            'orbital_sniper',
            'orbital_transport',
            'radar_satellite'
        ]);

        self.sendIconList = function () {
            var list = model.strategicIcons();
            engine.call('handle_icon_list', list, 52);
        }
    }
    model = new IconAtlasViewModel();
    handlers = {};

    // inject per scene mods
    if (scene_mod_list['icon_atlas'])
        loadMods(scene_mod_list['icon_atlas']);

    // setup send/recv messages and signals
    app.registerWithCoherent(model, handlers);

    // Activates knockout.js
    ko.applyBindings(model);

    model.sendIconList();

});
