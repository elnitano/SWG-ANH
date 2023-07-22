-- Planet Region Definitions
--
-- {"regionName", x, y, shape and size, tier, {"spawnGroup1", ...}, maxSpawnLimit}
-- For circle and ring, x and y are the center point
-- For rectangles, x and y are the bottom left corner. x2 and y2 (see below) are the upper right corner
-- Shape and size is a table with the following format depending on the shape of the area:
--   - Circle: {CIRCLE, radius}
--   - Rectangle: {RECTANGLE, x2, y2}
--   - Ring: {RING, inner radius, outer radius}
-- Tier is a bit mask with the following possible values where each hexadecimal position is one possible configuration.
-- That means that it is not possible to have both a spawn area and a no spawn area in the same region, but
-- a spawn area that is also a no build zone is possible.

require("scripts.managers.planet.regions")

naboo_regions = {
	-- No Build Zones
	{"northedge_naboo_nobuild", -7998, 7640, {RECTANGLE, 8000, 8000}, NOBUILDZONEAREA},
	{"westedge_naboo_nobuild", -8000, -8000, {RECTANGLE, -7621, 7640}, NOBUILDZONEAREA},
	{"southedge_naboo_nobuild", -7620, -8000, {RECTANGLE, 8000, -7640}, NOBUILDZONEAREA},
	{"eastedge_naboo_nobuild", 7640, -7640, {RECTANGLE, 8000, 7640}, NOBUILDZONEAREA},
	--{"old_battlefield_nobuild_nab1", -4113, -533, {CIRCLE, 256},NOBUILDZONEAREA},
	--{"old_battlfield_nobuild_nab2", -3762, -5377, {CIRCLE, 192}, NOBUILDZONEAREA},
	--{"old_battlfield_nobuild_nab3", -5044, 6662, {CIRCLE, 192}, NOBUILDZONEAREA},


	-- Named Regions, POIs and Decor
	{"battle_statue", -3603, 3119, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"bounty_hunter_camp", 5029, 4156, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"campfire_and_bones", 3939, 2701, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"campfire_and_ruins", -1771, 2387, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"dead_tree", -675, 5203, {CIRCLE, 16}, NOBUILDZONEAREA},
	{"gungan_statue", -1695, 5427, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"debris", -2957, 1699, {CIRCLE, 64}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"debris_2", -2405, 566, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"fishing_dock", -6314, -5087, {CIRCLE, 64}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"graveyard", 1260, 4291, {CIRCLE, 64}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"gate_and_columns", -259, -60, {CIRCLE, 64}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"gazebo", 1012, -3460, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"gungan_fountain", 5556, 5531, {CIRCLE, 64}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"gungan_head", 1940, 6611, {CIRCLE, 64}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"gungan_head_with_walls", -5046, 6178, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"gungan_monument", -7547, 2251, {CIRCLE, 64}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"gungan_ruins", 3428, 5075, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"imperial_vs_gungan_poi", 4765, -3872, {CIRCLE, 192}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},
	{"lake_retreat_gazebo", -5637, 174, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"rebel_outpost", -1499, -1732, {CIRCLE, 128}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},
	{"military_tower", 972, -1348, {CIRCLE, 64}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"ruined_wall", -3586, -879, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"ruins", -2547, 6787, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"ruins_2", -1776, -488, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},
	{"ruins_3", -7319, -4143, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},
	{"ruins_4", 2148, 5427, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"ruins_5", 1228, 5515, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"shield_generator", -1339, 6531, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"small_garden", -6459, 1747, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"small_graveyard", -2174, 6357, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"statues", -1635, -4036, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"statues_and_droideka", -2331, 5075, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"statues_and_torches", -1147, 347, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"tower", -1568, 6003, {CIRCLE, 64}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"wreckage", 6314, 4248, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"sdungeon_gungan_stronghold", -264, 2836, {CIRCLE, 200}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},
	{"sdungeon_mauler_stronghold_cave", 2919, 1107, {CIRCLE, 200}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},
	{"naboo_sdungeon_cave_01", 5837, -4669, {CIRCLE, 200}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},
	{"naboo_sdungeon_cave_02", -6496, -3296, {CIRCLE, 200}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},
	{"naboo_sdungeon_cave_03", 5708, -1538, {CIRCLE, 200}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},
	{"@naboo_region_names:gallo_mountains_11", -7552, -2560, {RECTANGLE, 3392, -736}, NAMEDREGION},
	{"@naboo_region_names:gallo_mountains_12", 2480, -176, {CIRCLE, 1100}, NAMEDREGION},
	{"@naboo_region_names:gallo_mountains_13", -4448, -3520, {CIRCLE, 975}, NAMEDREGION},
	{"@naboo_region_names:gallo_mountains_14", -4784, 592, {CIRCLE, 816}, NAMEDREGION},
	{"@naboo_region_names:gallo_mountains_15", 1920, -3648, {CIRCLE, 928}, NAMEDREGION},
	{"@naboo_region_names:gallo_mountains_16", 3520, -2752, {RECTANGLE, 8000, -1024}, NAMEDREGION},
	{"@naboo_region_names:gallo_mountains_17", 6368, -1088, {RECTANGLE, 8000, 800}, NAMEDREGION},
	{"@naboo_region_names:lianorm_swamp_1", -416, 0, {CIRCLE, 945}, NAMEDREGION},
	{"@naboo_region_names:lianorm_swamp_2", -1040, 1808, {CIRCLE, 600}, NAMEDREGION},
	{"@naboo_region_names:great_grass_plains_1", -7552, 4640, {RECTANGLE, 7552, 7000}, NAMEDREGION},
	{"@naboo_region_names:great_grass_plains_2", -3184, 4656, {CIRCLE, 528}, NAMEDREGION},
	{"@naboo_region_names:great_grass_plains_3", -80, 4944, {CIRCLE, 855}, NAMEDREGION},
	{"@naboo_region_names:great_grass_plains_4", 2608, 5008, {CIRCLE, 912}, NAMEDREGION},
	{"@naboo_region_names:great_grass_plains_5", 0, 4704, {RECTANGLE, 7520, 6880}, NAMEDREGION},
	{"@naboo_region_names:lasay_swamp", -7712, -7328, {RECTANGLE, -1408, -5280}, NAMEDREGION},
	{"@naboo_region_names:paitnnu_wetlands", 5104, -5904, {CIRCLE, 1500}, NAMEDREGION},
	{"gungan_sacred_place_nobuild_1", -1999, -5418, {CIRCLE, 500}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"statue_fountain_landmark_nobuild_1", 5559, 5531, {CIRCLE, 10}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"naboo_force_shrine_01", 7182, -235, {CIRCLE, 199}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"naboo_force_shrine_02", -6859, -1938, {CIRCLE, 199}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"naboo_force_shrine_03", 2378, -474, {CIRCLE, 199}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"naboo_force_shrine_04", -2583, -6185, {CIRCLE, 199}, NOSPAWNAREA + NOBUILDZONEAREA},

	-- Cities
	{"@naboo_region_names:deeja_peak", 5048, -1528, {CIRCLE, 616}, CITY + NOSPAWNAREA},
	{"@naboo_region_names:kaadara", 5168, 6704, {CIRCLE, 320}, CITY + NOSPAWNAREA},
	{"@naboo_region_names:keren", 336, 2140, {RECTANGLE, 2512, 3264}, CITY + NOSPAWNAREA},
	{"@naboo_region_names:moenia", 4800, -4784, {CIRCLE, 336}, CITY + NOSPAWNAREA},
	{"@naboo_region_names:theed", -6160, 3920, {RECTANGLE, -4480, 4816}, CITY +  NOSPAWNAREA},
	{"@naboo_region_names:lake_retreat", -5568, 0, {CIRCLE, 176}, CITY + NOSPAWNAREA + NOBUILDZONEAREA},
	{"@naboo_region_names:emperors_retreat", 2280, -3944, {CIRCLE, 280}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},

	{"deeja_peak_nobuild_1", 5048, -1528, {CIRCLE, 1200}, NOBUILDZONEAREA + NOWORLDSPAWNAREA},
	{"kaadara_nobuild_1", 5168, 6704, {CIRCLE, 640}, NOBUILDZONEAREA + NOWORLDSPAWNAREA},
	{"keren_nobuild_1", -200, 1756, {RECTANGLE, 3000, 3700}, NOBUILDZONEAREA + NOWORLDSPAWNAREA},
	{"moenia_nobuild_1", 4800, -4784, {CIRCLE, 700}, NOBUILDZONEAREA + NOWORLDSPAWNAREA},
	{"theed_nobuild_1", -6600, 3420, {RECTANGLE, -3980, 5316}, NOBUILDZONEAREA + NOWORLDSPAWNAREA},

	--Spawns
	{"deeja_easy_newbie", 5060, -1470, {CIRCLE, 1300}, SPAWNAREA, {"naboo_deeja_easy_newbie"}, 64},
	{"deeja_medium_newbie", 5060, -1470, {RING, 1300, 2200}, SPAWNAREA, {"naboo_deeja_medium_newbie"}, 32},
	{"kaadara_easy_newbie", 5150, 6680, {CIRCLE, 1300}, SPAWNAREA, {"naboo_beachtown_easy_newbie"}, 64},
	{"kaadara_medium_newbie", 5150, 6680, {RING, 1300, 2200}, SPAWNAREA, {"naboo_beachtown_medium_newbie"}, 32},
	{"keren_easy_newbie", 1685, 2620, {CIRCLE, 1300}, SPAWNAREA, {"naboo_keren_easy_newbie"}, 64},
	{"keren_medium_newbie", 1685, 2620, {RING, 1300, 2200}, SPAWNAREA, {"naboo_keren_medium_newbie"}, 32},
	{"moenia_easy_newbie", 4800, -4820, {CIRCLE, 1300}, SPAWNAREA, {"naboo_moenia_easy_newbie"}, 64},
	{"moenia_medium_newbie", 4800, -4820, {RING, 1300, 2200}, SPAWNAREA, {"naboo_moenia_medium_newbie"}, 32},
	{"theed_easy_newbie_1", -5485, 4380, {CIRCLE, 1750}, SPAWNAREA, {"naboo_theed_easy_newbie"}, 32},
	{"theed_easy_newbie_1_nsz", -5026, 3816, {CIRCLE, 285}, NOSPAWNAREA, {"naboo_theed_easy_newbie"}, 32},
	{"theed_easy_newbie_2", -4940, 4030, {CIRCLE, 1750}, SPAWNAREA, {"naboo_theed_easy_newbie"}, 32},
	{"theed_medium_newbie", -5212, 4205, {RING, 1750, 2800}, SPAWNAREA, {"naboo_theed_medium_newbie"}, 64},

	-- North
	{"@naboo_region_names:northeast", 650, 1008, {RECTANGLE, 7600, 6970}, SPAWNAREA, {"naboo_northeast", "naboo_easy_gnort_ne", "naboo_medium_ikopi_ne", "naboo_hard_veermok_ne", "naboo_medium_tusk_cat_ne"}, 32},
	{"@naboo_region_names:northwest", -7520, 1008, {RECTANGLE, 639, 6970}, SPAWNAREA, {"naboo_northwest", "naboo_hard_capper_spineflap_nw", "naboo_hard_mauler_nw", "naboo_medium_tusk_cat_nw"}, 32},

	-- South
	{"@naboo_region_names:southeast", 2800, -7620, {RECTANGLE, 7630, -1940}, SPAWNAREA, {"naboo_southeast"}, 32},
	{"@naboo_region_names:central_south", -3940, -7625, {RECTANGLE, 2806, -1950}, SPAWNAREA, {"naboo_central_south"}, 32},
	{"@naboo_region_names:southwestern_hard", -7520, -7625, {RECTANGLE, -3944, -1950}, SPAWNAREA, {"naboo_southwestern_hard", "naboo_hard_capper_spineflap_sw"}, 32},

	{"hard_peko_peko_nw", -2720, 20, {CIRCLE, 480}, SPAWNAREA, {"naboo_hard_peko_peko_nw"}, 8},
	{"@naboo_region_names:central_mountain_range", -7540, -1942, {RECTANGLE, 7640, 1000}, SPAWNAREA, {"naboo_central_mountain_range"}, 32},
	{"@naboo_region_names:hard_gungan_se", -1877, -177, {CIRCLE, 250}, SPAWNAREA, {"naboo_hard_gungan_se"}, 8},
	{"@naboo_region_names:medium_gungan_se", 5504, -471, {CIRCLE, 196}, SPAWNAREA, {"naboo_medium_gungan_se"}, 8},
	{"@naboo_region_names:medium_imperial_se", 4877, -4329, {CIRCLE, 250}, SPAWNAREA, {"naboo_medium_imperial_se"}, 8},
	{"@naboo_region_names:medium_mauler_se", 4442, -659, {CIRCLE, 250}, SPAWNAREA, {"naboo_medium_mauler_se"}, 8},
	{"@naboo_region_names:medium_sharupat_se", 5757, -3236, {CIRCLE, 250}, SPAWNAREA, {"naboo_medium_sharupat_se"}, 8},
	{"@naboo_region_names:medium_swamp_cat_central_south", -2483, -5627, {CIRCLE, 250}, SPAWNAREA, {"naboo_medium_swamp_cat_central_south"}, 8},
	{"@naboo_region_names:medium_swamp_cat_se_2", 6492, -6125, {CIRCLE, 284}, SPAWNAREA, {"naboo_medium_swamp_cat_se_2"}, 8},
	{"@naboo_region_names:medium_swamp_cat_se", 3705, -5625, {CIRCLE, 345}, SPAWNAREA, {"naboo_medium_swamp_cat_se"}, 16},
	{"@naboo_region_names:medium_swamp_cat_southwest", -5288, -5638, {CIRCLE, 250}, SPAWNAREA, {"naboo_medium_swamp_cat_southwest"}, 8},
	{"@naboo_region_names:medium_veermok_se", 3771, 704, {CIRCLE, 196}, SPAWNAREA, {"naboo_medium_veermok_se"}, 8},
	{"@naboo_region_names:northeast_gungan_medium", 5912, 3012, {CIRCLE, 250}, SPAWNAREA, {"naboo_northeast_gungan_medium"}, 8},
	{"@naboo_region_names:northeast_imperial_medium", 2112, 3528, {CIRCLE, 250}, SPAWNAREA, {"naboo_northeast_imperial_medium"}, 8},
	{"@naboo_region_names:northeast_nightspiders_medium", 3179, 4929, {CIRCLE, 588}, SPAWNAREA, {"naboo_northeast_nightspiders_medium"}, 16},
	{"@naboo_region_names:northwest_gungan_medium", -58, 2159, {CIRCLE, 250}, SPAWNAREA, {"naboo_northwest_gungan_medium"}, 8},
	{"@naboo_region_names:northeast_veermok_medium", 6779, 4352, {CIRCLE, 250}, SPAWNAREA, {"naboo_northeast_veermok_medium"}, 8},
	{"@naboo_region_names:medium_peko_central_south_hard", -2404, -3024, {CIRCLE, 250}, SPAWNAREA, {"naboo_medium_peko_cental_south_hard"}, 8},
	{"@naboo_region_names:medium_peko_2_central_south_hard", 286, -3148, {CIRCLE, 250}, SPAWNAREA, {"naboo_medium_peko_2_cental_south_hard"}, 8},

	--{"@naboo_region_names:gallo_mountains", -4584, -7999, {RECTANGLE, 7999, -1500}, SPAWNAREA + NAMEDREGION, {"naboo_world"}, 256},
	{"@naboo_region_names:gallo_mountains_1", -4464, -3408, {CIRCLE, 1640}, SPAWNAREA + NAMEDREGION, {"naboo_southwest_mountain_circle", "naboo_medium_mountain_ikopi_sw", "naboo_medium_mountain_krevol_sw"}, 128},
	{"@naboo_region_names:gallo_mountains_2", -5040, 528, {CIRCLE, 1552}, SPAWNAREA + NAMEDREGION, {"naboo_central_mountain_circle"}, 128},
	{"@naboo_region_names:gallo_mountains_3", 2464, -256, {CIRCLE, 2016}, SPAWNAREA + NAMEDREGION, {"naboo_central_mountain_circle", "naboo_medium_mountain_ikopi_ne"}, 128},
	{"@naboo_region_names:gallo_mountains_4", 6816, -1696, {CIRCLE, 1000}, SPAWNAREA + NAMEDREGION, {"naboo_eastern_mountains"}, 64},
	{"@naboo_region_names:gallo_mountains_5", 1984, -3520, {CIRCLE, 1760}, SPAWNAREA + NAMEDREGION, {"naboo_medium_mountain_ikopi_se", "naboo_medium_mountain_krevol_se"}, 128},
	{"@naboo_region_names:gallo_mountains_6", -8000, -3232, {RECTANGLE, 8000, -224}, SPAWNAREA + NAMEDREGION, {"naboo_southwest_mountain_circle", "naboo_eastern_mountains", "naboo_medium_mountain_ikopi_sw", "naboo_medium_mountain_krevol_sw"}, 128},
	{"@naboo_region_names:swamp_1", 5040, -5936, {CIRCLE, 1840}, SPAWNAREA, {"naboo_southeast_swamp"}, 32},
	{"@naboo_region_names:swamp_2", -8000, -7971, {RECTANGLE, -558, -5181}, SPAWNAREA, {"naboo_southwest_swamp", "naboo_hard_gungan_sw"}, 128},
	{"@naboo_region_names:swamp_3", 5494, -4475, {RECTANGLE, 7433, -3300}, SPAWNAREA, {"naboo_eastern_jungle_swamp"}, 16},
	{"@naboo_region_names:rainforest_1", -432, 2064, {CIRCLE, 976}, SPAWNAREA, {"naboo_central_jungle_swamp"}, 32},
	{"@naboo_region_names:rainforest_2", 3856, 2640, {CIRCLE, 1000}, SPAWNAREA, {"naboo_north_eastern_jungle_swamp"}, 32},
	{"@naboo_region_names:rainforest_3", 6464, 6592, {CIRCLE, 500}, SPAWNAREA, {"naboo_north_eastern_jungle_swamp"}, 16},
	{"@naboo_region_names:forest_1", -6768, 2928, {CIRCLE, 845}, SPAWNAREA, {"naboo_hard_peko_peko_nw", "naboo_medium_tusk_cat_nw"}, 8},
	{"@naboo_region_names:gallo_jungle_1", -8000, -448, {RECTANGLE, 8000, 1856}, SPAWNAREA, {"naboo_central_jungle_swamp"}, 256},
	{"@naboo_region_names:gallo_jungle_2", -8000, -5276, {RECTANGLE, 8000, -3076}, SPAWNAREA, {"naboo_southeast_swamp", "naboo_southwest_swamp", "naboo_hard_gungan_sw"}, 256},
	{"@naboo_region_names:gallo_forest_1", -8000, -3008, {RECTANGLE, 8000, -448}, SPAWNAREA, {"naboo_world"}, 256},
	{"@naboo_region_names:plains_1", -8000, 1856, {RECTANGLE, 8000, 7232}, SPAWNAREA, {"naboo_northern_plains"}, 256},

	{"@naboo_region_names:world_spawner", 0, 0, {RECTANGLE, 0, 0}, SPAWNAREA + WORLDSPAWNAREA, {"naboo_world"}, 2048},

	-- Deliver Mission Locations
	--[[
	{"deeja_peak_deliver_10", 4998, -1461, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_11", 4948, -1536, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_12", 5012, -1570, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_13", 4876, -1525, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_14", 5361, -1552, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_15", 5171, -1408, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_16", 5147, -1533, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_17", 5109, -1553, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_18", 5078, -1495, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_19", 4995, -1500, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_2", 4751, -1285, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_20", 4932, -1560, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_21", 4717, -1399, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_22", 4686, -1361, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_23", 4745, -1357, {CIRCLE, 5}, UNDEFINEDAREA},
	{"deeja_peak_deliver_24", 4696, -1286, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_25", 4817, -1477, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_26", 4792, -1476, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_27", 4854, -1408, {CIRCLE, 5}, UNDEFINEDAREA},
	{"deeja_peak_deliver_28", 4857, -1357, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_29", 4958, -1419, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_3", 4701, -1440, {CIRCLE, 7}, UNDEFINEDAREA},
	{"deeja_peak_deliver_4", 4616, -1379, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_5", 4894, -1377, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_6", 4933, -1373, {CIRCLE, 5}, UNDEFINEDAREA},
	{"deeja_peak_deliver_7", 5012, -1460, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_8", 5057, -1457, {CIRCLE, 2}, UNDEFINEDAREA},
	{"deeja_peak_deliver_9", 5115, -1427, {CIRCLE, 2}, UNDEFINEDAREA},
	{"kaadara_deliver_1", 4942, 6758, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_10", 5402, 6667, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_11", 5312, 6596, {CIRCLE, 7}, UNDEFINEDAREA},
	{"kaadara_deliver_12", 5296, 6595, {CIRCLE, 7}, UNDEFINEDAREA},
	{"kaadara_deliver_13", 5271, 6596, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_15", 5212, 6642, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_16", 5180, 6615, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_17", 5057, 6643, {CIRCLE, 7}, UNDEFINEDAREA},
	{"kaadara_deliver_19", 4968, 6651, {CIRCLE, 7}, UNDEFINEDAREA},
	{"kaadara_deliver_2", 5172, 6823, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_20", 4979, 6631, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_21", 4940, 6698, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_22", 5016, 6716, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_23", 5087, 6804, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_24", 5178, 6780, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_25", 5161, 6764, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_26", 5141, 6745, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_27", 5126, 6730, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_28", 5239, 6793, {CIRCLE, 2}, UNDEFINEDAREA},
	{"kaadara_deliver_29", 5205, 6781, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_3", 5179, 6727, {CIRCLE, 2}, UNDEFINEDAREA},
	{"kaadara_deliver_31", 5164, 6642, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_32", 5363, 6581, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_33", 4977, 6817, {CIRCLE, 2}, UNDEFINEDAREA},
	{"kaadara_deliver_34", 5001, 6800, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_4", 5217, 6742, {CIRCLE, 2}, UNDEFINEDAREA},
	{"kaadara_deliver_5", 5239, 6720, {CIRCLE, 7}, UNDEFINEDAREA},
	{"kaadara_deliver_8", 5344, 6710, {CIRCLE, 5}, UNDEFINEDAREA},
	{"kaadara_deliver_9", 5374, 6735, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_1", 1992, 2509, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_10", 1620, 2426, {CIRCLE, 10}, UNDEFINEDAREA},
	{"keren_deliver_11", 1799, 2526, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_12", 1765, 2494, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_13", 2076, 2602, {CIRCLE, 7}, UNDEFINEDAREA},
	{"keren_deliver_14", 2000, 2594, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_15", 1541, 2825, {CIRCLE, 5}, UNDEFINEDAREA},
	{"keren_deliver_17", 1645, 2927, {CIRCLE, 10}, UNDEFINEDAREA},
	{"keren_deliver_18", 1669, 2941, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_19", 1652, 2950, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_2", 1942, 2442, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_20", 1300, 2836, {CIRCLE, 7}, UNDEFINEDAREA},
	{"keren_deliver_21", 1324, 2835, {CIRCLE, 7}, UNDEFINEDAREA},
	{"keren_deliver_22", 1249, 2797, {CIRCLE, 15}, UNDEFINEDAREA},
	{"keren_deliver_23", 1245, 2762, {CIRCLE, 15}, UNDEFINEDAREA},
	{"keren_deliver_24", 1267, 2778, {CIRCLE, 5}, UNDEFINEDAREA},
	{"keren_deliver_25", 1274, 2805, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_26", 1270, 2708, {CIRCLE, 7}, UNDEFINEDAREA},
	{"keren_deliver_27", 1275, 2727, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_28", 1294, 2666, {CIRCLE, 7}, UNDEFINEDAREA},
	{"keren_deliver_29", 1318, 2669, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_3", 1963, 2436, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_30", 1329, 2667, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_31", 1422, 2730, {CIRCLE, 5}, UNDEFINEDAREA},
	{"keren_deliver_32", 1432, 2746, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_33", 1674, 2626, {CIRCLE, 5}, UNDEFINEDAREA},
	{"keren_deliver_34", 1692, 2596, {CIRCLE, 5}, UNDEFINEDAREA},
	{"keren_deliver_35", 1701, 2621, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_36", 1621, 2633, {CIRCLE, 10}, UNDEFINEDAREA},
	{"keren_deliver_37", 1728, 2468, {CIRCLE, 5}, UNDEFINEDAREA},
	{"keren_deliver_38", 1730, 2526, {CIRCLE, 7}, UNDEFINEDAREA},
	{"keren_deliver_39", 1688, 2670, {CIRCLE, 7}, UNDEFINEDAREA},
	{"keren_deliver_4", 1966, 2478, {CIRCLE, 10}, UNDEFINEDAREA},
	{"keren_deliver_40", 1640, 2578, {CIRCLE, 7}, UNDEFINEDAREA},
	{"keren_deliver_41", 1737, 2589, {CIRCLE, 5}, UNDEFINEDAREA},
	{"keren_deliver_42", 1762, 2578, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_43", 1840, 2585, {CIRCLE, 5}, UNDEFINEDAREA},
	{"keren_deliver_44", 1812, 2560, {CIRCLE, 5}, UNDEFINEDAREA},
	{"keren_deliver_45", 1826, 2559, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_46", 1881, 2663, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_47", 1896, 2635, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_48", 1873, 2615, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_49", 1852, 2642, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_5", 1974, 2505, {CIRCLE, 5}, UNDEFINEDAREA},
	{"keren_deliver_50", 1820, 2648, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_51", 1886, 2591, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_52", 1810, 2726, {CIRCLE, 5}, UNDEFINEDAREA},
	{"keren_deliver_53", 1780, 2739, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_54", 2036, 2549, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_55", 1804, 2698, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_56", 1726, 2734, {CIRCLE, 5}, UNDEFINEDAREA},
	{"keren_deliver_57", 2050, 2549, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_58", 1732, 2712, {CIRCLE, 7}, UNDEFINEDAREA},
	{"keren_deliver_59", 1908, 2749, {CIRCLE, 7}, UNDEFINEDAREA},
	{"keren_deliver_6", 1679, 2432, {CIRCLE, 7}, UNDEFINEDAREA},
	{"keren_deliver_60", 1896, 2760, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_61", 1936, 2713, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_62", 1878, 2735, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_63", 1989, 2622, {CIRCLE, 7}, UNDEFINEDAREA},
	{"keren_deliver_64", 1977, 2557, {CIRCLE, 10}, UNDEFINEDAREA},
	{"keren_deliver_65", 2019, 2538, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_66", 1949, 2419, {CIRCLE, 10}, UNDEFINEDAREA},
	{"keren_deliver_67", 1926, 2416, {CIRCLE, 5}, UNDEFINEDAREA},
	{"keren_deliver_68", 1920, 2378, {CIRCLE, 7}, UNDEFINEDAREA},
	{"keren_deliver_69", 1950, 2357, {CIRCLE, 10}, UNDEFINEDAREA},
	{"keren_deliver_7", 1679, 2415, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_70", 1881, 2418, {CIRCLE, 5}, UNDEFINEDAREA},
	{"keren_deliver_71", 1931, 2388, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_72", 1890, 2382, {CIRCLE, 5}, UNDEFINEDAREA},
	{"keren_deliver_73", 1906, 2425, {CIRCLE, 7}, UNDEFINEDAREA},
	{"keren_deliver_74", 1862, 2448, {CIRCLE, 5}, UNDEFINEDAREA},
	{"keren_deliver_75", 1841, 2462, {CIRCLE, 5}, UNDEFINEDAREA},
	{"keren_deliver_76", 1888, 2399, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_77", 1406, 2836, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_8", 1665, 2429, {CIRCLE, 2}, UNDEFINEDAREA},
	{"keren_deliver_9", 1644, 2451, {CIRCLE, 5}, UNDEFINEDAREA},
	{"moenia_deliver_1", 4972, -4929, {CIRCLE, 5}, UNDEFINEDAREA},
	{"moenia_deliver_10", 4879, -4956, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_11", 4859, -4971, {CIRCLE, 5}, UNDEFINEDAREA},
	{"moenia_deliver_12", 4832, -4980, {CIRCLE, 7}, UNDEFINEDAREA},
	{"moenia_deliver_13", 4849, -4926, {CIRCLE, 10}, UNDEFINEDAREA},
	{"moenia_deliver_14", 4853, -4903, {CIRCLE, 5}, UNDEFINEDAREA},
	{"moenia_deliver_15", 4816, -4952, {CIRCLE, 7}, UNDEFINEDAREA},
	{"moenia_deliver_16", 4799, -4964, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_17", 4814, -4965, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_18", 4765, -4967, {CIRCLE, 7}, UNDEFINEDAREA},
	{"moenia_deliver_19", 4799, -4918, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_2", 4924, -4891, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_20", 4777, -4895, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_21", 4727, -4576, {CIRCLE, 10}, UNDEFINEDAREA},
	{"moenia_deliver_22", 4894, -4667, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_23", 4763, -4584, {CIRCLE, 7}, UNDEFINEDAREA},
	{"moenia_deliver_24", 4775, -4602, {CIRCLE, 5}, UNDEFINEDAREA},
	{"moenia_deliver_25", 4767, -4574, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_26", 4826, -4620, {CIRCLE, 15}, UNDEFINEDAREA},
	{"moenia_deliver_27", 4807, -4674, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_28", 4755, -4726, {CIRCLE, 7}, UNDEFINEDAREA},
	{"moenia_deliver_3", 4911, -4893, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_30", 4693, -4722, {CIRCLE, 15}, UNDEFINEDAREA},
	{"moenia_deliver_31", 4667, -4792, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_32", 4693, -4801, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_33", 4713, -4826, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_34", 4743, -4855, {CIRCLE, 5}, UNDEFINEDAREA},
	{"moenia_deliver_35", 4685, -4866, {CIRCLE, 7}, UNDEFINEDAREA},
	{"moenia_deliver_36", 4702, -4879, {CIRCLE, 5}, UNDEFINEDAREA},
	{"moenia_deliver_37", 4701, -4906, {CIRCLE, 5}, UNDEFINEDAREA},
	{"moenia_deliver_38", 4682, -4910, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_39", 4786, -4822, {CIRCLE, 7}, UNDEFINEDAREA},
	{"moenia_deliver_4", 4877, -4887, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_40", 4664, -4588, {CIRCLE, 10}, UNDEFINEDAREA},
	{"moenia_deliver_41", 4644, -4616, {CIRCLE, 10}, UNDEFINEDAREA},
	{"moenia_deliver_42", 4641, -4639, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_43", 4685, -4574, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_44", 4662, -4675, {CIRCLE, 7}, UNDEFINEDAREA},
	{"moenia_deliver_45", 4766, -4850, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_46", 4765, -4815, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_47", 4815, -4824, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_48", 4842, -4840, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_49", 4854, -4869, {CIRCLE, 7}, UNDEFINEDAREA},
	{"moenia_deliver_5", 4975, -4976, {CIRCLE, 5}, UNDEFINEDAREA},
	{"moenia_deliver_50", 4818, -4909, {CIRCLE, 5}, UNDEFINEDAREA},
	{"moenia_deliver_51", 4851, -4790, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_52", 4865, -4771, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_53", 4871, -4789, {CIRCLE, 5}, UNDEFINEDAREA},
	{"moenia_deliver_54", 4905, -4840, {CIRCLE, 10}, UNDEFINEDAREA},
	{"moenia_deliver_55", 4889, -4814, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_56", 4888, -4851, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_57", 4940, -4860, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_58", 4932, -4848, {CIRCLE, 5}, UNDEFINEDAREA},
	{"moenia_deliver_59", 4957, -4886, {CIRCLE, 5}, UNDEFINEDAREA},
	{"moenia_deliver_6", 4972, -4957, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_60", 4770, -4886, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_61", 4779, -4946, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_62", 4740, -4939, {CIRCLE, 5}, UNDEFINEDAREA},
	{"moenia_deliver_63", 4701, -4930, {CIRCLE, 7}, UNDEFINEDAREA},
	{"moenia_deliver_64", 4699, -4984, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_65", 4708, -5010, {CIRCLE, 5}, UNDEFINEDAREA},
	{"moenia_deliver_66", 4654, -4928, {CIRCLE, 5}, UNDEFINEDAREA},
	{"moenia_deliver_7", 4943, -4957, {CIRCLE, 2}, UNDEFINEDAREA},
	{"moenia_deliver_8", 4926, -4970, {CIRCLE, 5}, UNDEFINEDAREA},
	{"moenia_deliver_9", 4901, -4995, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_1", -4686, 4006, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_10", -5404, 4200, {CIRCLE, 7}, UNDEFINEDAREA},
	{"theed_deliver_100", -5320, 4236, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_101", -5361, 4230, {CIRCLE, 7}, UNDEFINEDAREA},
	{"theed_deliver_102", -5319, 4365, {CIRCLE, 7}, UNDEFINEDAREA},
	{"theed_deliver_103", -4867, 4160, {CIRCLE, 10}, UNDEFINEDAREA},
	{"theed_deliver_104", -5291, 4429, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_105", -5695, 4630, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_106", -5635, 4641, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_107", -5644, 4680, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_108", -5680, 4540, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_109", -5600, 4054, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_11", -5261, 4215, {CIRCLE, 7}, UNDEFINEDAREA},
	{"theed_deliver_110", -5627, 4062, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_111", -5593, 4155, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_112", -5632, 4138, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_113", -5691, 4124, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_114", -5664, 4136, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_115", -5709, 4134, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_116", -5729, 4121, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_117", -5752, 4148, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_118", -5818, 4408, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_119", -5686, 4307, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_12", -5257, 4254, {CIRCLE, 7}, UNDEFINEDAREA},
	{"theed_deliver_120", -5758, 4411, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_121", -5762, 4451, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_122", -5997, 4270, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_123", -5969, 4288, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_124", -5997, 4310, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_125", -5942, 4339, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_126", -6024, 4213, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_127", -6012, 4242, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_128", -6041, 4260, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_129", -6055, 4320, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_13", -5433, 4045, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_130", -6036, 4287, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_131", -5859, 4147, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_132", -5803, 4101, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_133", -5742, 4305, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_137", -5889, 4236, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_138", -5929, 4217, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_139", -5492, 4338, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_14", -5404, 3997, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_140", -5485, 4373, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_141", -5385, 4283, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_142", -5459, 4343, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_143", -5469, 4433, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_144", -5457, 4469, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_145", -5450, 4429, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_146", -5429, 4448, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_147", -5394, 4519, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_148", -5396, 4493, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_149", -5375, 4523, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_15", -5424, 3977, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_150", -5380, 4629, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_151", -5310, 4534, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_152", -5318, 4560, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_153", -5327, 4530, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_154", -5341, 4591, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_155", -5417, 4414, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_156", -5400, 4425, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_157", -5426, 4372, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_158", -5409, 4387, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_159", -5371, 4384, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_16", -5437, 3943, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_160", -5418, 4347, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_161", -5393, 4361, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_162", -5371, 4337, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_163", -5309, 4307, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_164", -5326, 4293, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_165", -5306, 4358, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_166", -5281, 4373, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_167", -5283, 4406, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_168", -5307, 4474, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_169", -5304, 4493, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_17", -5521, 4004, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_18", -5470, 3969, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_19", -5466, 4041, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_2", -4654, 3962, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_20", -5493, 4049, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_21", -5512, 4044, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_22", -5482, 4102, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_23", -5507, 4078, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_24", -5531, 4086, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_25", -5482, 4132, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_26", -5497, 4149, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_27", -5457, 4156, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_28", -5453, 4199, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_29", -5477, 4170, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_3", -4640, 4031, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_30", -5487, 4194, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_31", -5521, 4159, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_32", -5508, 4196, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_33", -5545, 4200, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_34", -5563, 4208, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_35", -5584, 4238, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_36", -5599, 4262, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_37", -5559, 4284, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_38", -5544, 4232, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_39", -5555, 4241, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_4", -4694, 3935, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_40", -5541, 4303, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_41", -5555, 4319, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_42", -5547, 4383, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_43", -5542, 4394, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_44", -5653, 4428, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_45", -5566, 4469, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_46", -5587, 4495, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_47", -5546, 4466, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_48", -5537, 4411, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_5", -4613, 4108, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_50", -5489, 4404, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_51", -5520, 4349, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_52", -5508, 4309, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_53", -4956, 4205, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_54", -4973, 4175, {CIRCLE, 7}, UNDEFINEDAREA},
	{"theed_deliver_56", -4986, 4213, {CIRCLE, 7}, UNDEFINEDAREA},
	{"theed_deliver_57", -4982, 4244, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_58", -4974, 4220, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_59", -4979, 4264, {CIRCLE, 7}, UNDEFINEDAREA},
	{"theed_deliver_6", -5438, 4301, {CIRCLE, 7}, UNDEFINEDAREA},
	{"theed_deliver_60", -5021, 4230, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_61", -4969, 4159, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_62", -4941, 4184, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_63", -4979, 4120, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_64", -4898, 4193, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_65", -4896, 4168, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_66", -4921, 4061, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_67", -4934, 4090, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_68", -4903, 4107, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_69", -4892, 4083, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_7", -5337, 4146, {CIRCLE, 7}, UNDEFINEDAREA},
	{"theed_deliver_70", -4925, 4035, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_71", -4970, 4070, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_72", -5008, 4112, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_73", -5038, 4079, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_74", -5005, 4068, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_75", -5024, 4040, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_76", -5019, 4126, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_77", -5032, 4132, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_78", -4992, 4125, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_79", -5077, 4162, {CIRCLE, 2}, UNDEFINEDAREA},
	{"theed_deliver_8", -5351, 4095, {CIRCLE, 7}, UNDEFINEDAREA},
	{"theed_deliver_80", -5089, 4152, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_81", -5091, 4173, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_82", -5054, 4152, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_83", -5076, 4204, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_84", -5070, 4262, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_85", -5107, 4297, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_86", -5101, 4246, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_87", -5123, 4201, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_88", -5171, 4148, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_89", -5165, 4173, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_9", -5413, 4120, {CIRCLE, 7}, UNDEFINEDAREA},
	{"theed_deliver_90", -5125, 4232, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_91", -5136, 4220, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_92", -5195, 4190, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_93", -5141, 4405, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_95", -5134, 4529, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_96", -5095, 4527, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_97", -5219, 4292, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_98", -5282, 4326, {CIRCLE, 5}, UNDEFINEDAREA},
	{"theed_deliver_99", -5328, 4267, {CIRCLE, 5}, UNDEFINEDAREA},
	]]
}