// Shop Definition File
// shopDefine.sqf



_emptyshop      = [];

// Basic Vehicle Sell Shop -> All Vehicles must be listed here
_vclsellshop  = [
 "MMT_Civ",  "ATV_US_EP1",  "Skoda", "SkodaBlue", "SkodaRed", "SkodaGreen", "Car_hatchback",   
"Lada1", "Car_Sedan",     "Tractor", "M1030", "TT650_Civ",  "LandRover_CZ_EP1",  "hilux1_civil_1_open",
"hilux1_civil_2_covered", "hilux1_civil_3_open", "datsun1_civil_1_open", "datsun1_civil_2_covered", "datsun1_civil_3_open", "MTVR",  "Ikarus", "Ural_CDF", "Ural_TK_CIV_EP1", "V3S_Civ",  "UAZ_CDF", "HMMWV",
 "HMMWV_M2",  "UAZ_MG_CDF",     "Zodiac", "Smallboat_2", "PBX", "RHIB",   "Mi17_Civilian", 
 "S1203_TK_CIV_EP1", "rpp_hilux", "rpp_hatch", "rpp_sedan", "rpp_skoda"
];

// Basic Weapon & Ammo Sell Shop -> All Weapons & Magazines must be listed here
_weapsellshop   = [
            "Colt1911",    "M9",
"M9SD", "glock17_EP1",         "Makarov", "MakarovSD", "15Rnd_9x19_M9", "15Rnd_9x19_M9SD", "8Rnd_9x18_Makarov",
"8Rnd_9x18_MakarovSD",       "7Rnd_45ACP_1911",  "17Rnd_9x19_glock17",  
       "M4A1", "M4A1_AIM", "M4A1_AIM_SD_CAMO", "M4GL","G36K",
"G36C", "G36A",  "30rnd_9x19_MP5SD", "aks_74_u", "AKS_74_UN_Kobra", "ak_74", "ak_74_gl", "AKS_74_PSO", "M16A2", "M16A2gl", "M16A4_ACG", "M16A4_ACG_GL", "30Rnd_556x45_Stanag", 
"30Rnd_556x45_StanagSD", "30Rnd_556x45_G36", "30rnd_9x19_MP5SD",  "30Rnd_545x39_AKSD", "M24", "SVD", "KSVK",  "5Rnd_762x51_M24", "10Rnd_762x54_SVD",
"5Rnd_127x108_KSVK",  "M136", "JAVELIN", "STINGER", "RPG7V", "STRELA", "M240", "M249", "PK", "1Rnd_HE_M203", "1Rnd_HE_GP25", "100Rnd_762x51_M240",
"200Rnd_556x45_M249", "100Rnd_762x54_PK", "M136", "Javelin", "Stinger", "PG7V",  "Strela", "HandGrenade_East",  "Mine", "MineE",
"PipeBomb", "ACE_NVGoggles", "FlareWhite_GP25", "FlareGreen_GP25", "FlareRed_GP25", "FlareYellow_GP25", "FlareWhite_M203", "FlareGreen_M203", "FlareRed_M203",
"FlareYellow_M203", "SmokeShellRed", "SmokeShellGreen",  "SmokeShell", "30rnd_9x19_MP5", "M4SPR",     
    "MG36",      
  "m1014",   "M4A1_AIM",  "M4A1_AIM_SD_CAMO", "M4A1_HWS_GL", "M4A1_RCO_GL", "M16A4", "M16A4_gl", 
  "AK_47_S",   "AK_107_Kobra",  "AK_107_GL_Kobra", "x26_mag", "x26",
"30Rnd_762x39_AK47"
];

// Drugshops
_drogenshop     = ["DrugShed", "CocaineSeed", "MarijuanaSeed"];
_cocesellshop   = ["kokain", "kokain_low"];
_marisellshop   = ["marihuana"];
_lsdsellshop    = ["lsd"];

_fishshop       = ["fisch"];

// Sell Harvested Stuff
_getreideshop   = ["apple", "getreide", "hopfen", "rotetrauben", "rotetraubenHQ", "weissetrauben", "weissetraubenHQ", "tabak", "Olives"];

_restaurante_buy   = [
"oliveoil", "soup", "donut", "bread", "lowqualitywater", "normqualitywater1", "normqualitywater2", "highqualitywater", "bier", "weizenbier", "starkbier", "rotwein", "weisswein", "zigarre",
"zigarrefatlady"
];

_restaurante_sell   = [
 "oliveoil", "soup", "donut", "bread", "fish_filet", "lowqualitywater", "normqualitywater1", "normqualitywater2", "highqualitywater", "whale_filet", "shark_filet", "bier", "weizenbier", "starkbier", "rotwein", "weisswein", "zigarre",
"zigarrefatlady", "Olives", "apple"
];

_bankbuy   = ["bankversicherung"];
_banksell   = ["bankversicherung", "Diamondring", "EDiamondring"];
_garageshop     = [ "handy", "kleinesreparaturkit", "reparaturkit", "kanister", "soup", "donut"];
// Fuelstation Shops buy
_fuelshop_buy     = [ "handy", "kleinesreparaturkit", "reparaturkit", "kanister", "lighter", "soup", "donut", "lowqualitywater", "bier", "weizenbier", "starkbier", "rotwein", "weisswein", "zigarre", "zigarrefatlady"];

// Fuelstation Shops sell
_fuelshop_sell     = [
"handy", "kleinesreparaturkit", "reparaturkit", "kanister", "lighter", "soup", "donut", "lowqualitywater", "normqualitywater1", "normqualitywater2", "highqualitywater", "whale_filet", "shark_filet", "bier", "weizenbier",
"starkbier", "rotwein", "rotweinhq", "weisswein", "weissweinhq", "zigarre", "zigarrefatlady"
];

// Cityshops buy
_civshop_buy        = ["handy", "soup", "donut", "lowqualitywater", "OliveSeed", "appleseed"];

// Cityshops sell
_civshop_sell       =[
"handy", "lockpick", "kleinesreparaturkit", "reparaturkit", "kanister", "soup", "donut", "lowqualitywater", "normqualitywater1", "normqualitywater2", "highqualitywater", "bier", "weizenbier", "starkbier", "rotwein",
"rotweinhq", "weisswein", "weissweinhq", "zigarre", "zigarrefatlady", "OliveSeed", "appleseed"
];

_ressourceshop_buy = ["bricks", "stone", "holz", "eisenerz", "erdoel", "kupfer", "schwefel", "kohle", "silizium", "sand"];
_ressourceshop_sell = ["bricks", "stone", "holz", "eisenerz", "erdoel", "kupfer", "schwefel", "kohle", "silizium", "sand", "Diamond", "gold_nugget", "gold_barren", "glas", "mineraloel", "schwarzpulver", "stahl", "stahlwolle", "ebauteile"];

_houses         = ["SpawnObj_houses", "SpawnObj_housem", "SpawnObj_apartment", "SpawnObj_mansion", "SpawnObj_villa"];
_fishmarkt = ["fisch", "whale", "shark", "fish_filet", "shark_filet", "whale_filet"];

_constructionmaterials = ["SpawnObj_Fortress", "SpawnObj_Danger", "SpawnObj_Gate", "SpawnObj_Shed", "SpawnObj_Wall", "SpawnObj_Wire", "SpawnObj_RoadCone", "SpawnObj_Fire", "SpawnObj_FenceWood", "SpawnObj_WireFence",
"SpawnObj_RoadBarrier_long", "SpawnObj_minibunker", "SpawnObj_Ramp", "SpawnObj_CampEmpty", "SpawnObj_CampEast", "SpawnObj_Ladder", "SpawnObj_SearchLight"
];

// Illegal Weapons sell
_illegalweapons = ["smallillegalweapons", "mediumillegalweapons", "largeillegalweapons"];

// Bike Shop buy and sell
_bikeshopbuy = ["MMT_Civ",  "M1030", "TT650_Civ",  "ATV_US_EP1" ];
_bikeshopsell = [ "MMT_Civ",  "M1030", "TT650_Civ",  "ATV_US_EP1" ];

// Hospital Shop for Ambulance
_ambulanceshop = [ "S1203_ambulance_EP1", "ACE_Rucksack_MOLLE_Brown_Medic", "ACE_Stretcher", "ACE_Bandage", "ACE_LargeBandage", "ACE_IV", "ACE_Medkit", "ACE_Plasma", "ACE_Splint", "ACE_Morphine", "ACE_Epinephrine" ];

// The normal Vehicle Shop
_vehicleshop1   = [    "Skoda", "SkodaBlue", "SkodaRed", "SkodaGreen", "Car_hatchback",   
"Lada1", "Car_Sedan", "Tractor"
];

// Pickup Shop
_vehicleshop2   = ["LandRover_CZ_EP1", "S1203_TK_CIV_EP1", "hilux1_civil_1_open", "hilux1_civil_2_covered", "hilux1_civil_3_open", "datsun1_civil_1_open", "datsun1_civil_2_covered", "datsun1_civil_3_open"];

// Truck Shop
_vehicleshop3   = [ "Ural_CDF", "Ural_TK_CIV_EP1", "V3S_Civ",  "Ikarus",  "UAZ_CDF"];

// Boat Shop
_vehicleshop5   = ["Zodiac", "Smallboat_2", "PBX"];

// Terrorist Boat
_terrorist_boat = ["RHIB", "RHIB2Turret"];

// Pita Airflag shop
_vehicleshop6   = ["avgas_kanister", "reparaturkit", "Mi17_Civilian" ];

// Muscle Cars shop
_mikes_garage   = [   ];

// Boarderpatrol Vehicles
_borderpatrolveh = ["LadaLM"];

// Bagango Airport
_vehicleshop_air	= ["avgas_kanister", "reparaturkit",  "handy", "Mi17_Civilian" ];

// Mercalillo Airport
_vehicleshop_air2	= ["avgas_kanister", "reparaturkit",  "handy", "Mi17_Civilian" ];

// Police Vehicles (Basic)
_vehicleshop7	= [ "rpp_hilux", "rpp_sedan", "rpp_skoda" ];

// Police Vehicles (with License)
_vehicleshop_copheavy	= [    "UAZ_CDF", "HMMWV" ];

// Police Vehicles AIR
_vehicleshop_copair	= ["avgas_kanister" ];

// Terrorist Airvehicles
_vehicleshop8   = ["avgas_kanister", "reparaturkit",  "handy" ];

// Equipment Shops
_gunshop0       = [
"Binocular", "NVGoggles", "ACE_VTAC_RUSH72", "ACE_FAST_PackEDC", "ACE_CharliePack", "ACE_Backpack_CivAssault", "ACE_BackPack", "ACE_Rucksack_MOLLE_Brown", "ACE_Rucksack_MOLLE_Green", "ACE_Rucksack_MOLLE_Wood", 
"ACE_Rucksack_MOLLE_ACU", "ACE_Rucksack_MOLLE_DMARPAT", "ACE_Rucksack_MOLLE_WMARPAT", "ACE_Rope_M5",
"SmokeShellRed", "SmokeShellGreen", "SmokeShell", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio", "ItemGPS"
];

// Pistol Shop
_gunshop1       = [         "Colt1911",  "M9", "glock17_EP1",   
 "Makarov", "MakarovSD", "15Rnd_9x19_M9", "15Rnd_9x19_M9SD",       "7Rnd_45ACP_1911", 
"17Rnd_9x19_glock17",     "8Rnd_9x18_Makarov", "8Rnd_9x18_MakarovSD"
];

// Rifle Shop
_gunshop2       = [ "m1014", "8Rnd_B_Beneli_74Slug"  ];

// SMP Shop
_gunshop7       = [ "MP5A5", "30rnd_9x19_MP5"
];

// Basic Cop Shop
_copshop        = [
           "kanister", "handy", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio", "ItemGPS", "ACE_Bodybag", "ACE_Stretcher", "ACE_Bandage", "ACE_LargeBandage", "ACE_IV", "ACE_Medkit", "ACE_Plasma", "ACE_Splint", "ACE_Morphine", "ACE_Epinephrine",
"lighter", "soup", ["bread", 300, 300], ["fish_filet", 490, 350], ["normqualitywater1", 300, 200], ["normqualitywater2", 330, 200],  "Binocular", "NVGoggles", "Laserdesignator", "Laserbatteries", "kleinesreparaturkit"
];

// Copshop Patrol License
_copshop_patrol = [["lockpick", 350, 350], "SpeedCam", "reparaturkit", "kanister", "ucasiren", "defuser",       "M9",
"M9SD", "Makarov", "MakarovSD", "x26", "x26_mag",
      "Colt1911",     "glock17_EP1",      "15Rnd_9x19_M9", "15Rnd_9x19_M9SD", "8Rnd_9x18_Makarov",
"8Rnd_9x18_MakarovSD",      "7Rnd_45ACP_1911",    "17Rnd_9x19_glock17",
 "SmokeShellRed", "SmokeShellGreen", "SmokeShell",	"SpawnObj_Fortress", "SpawnObj_Danger", "SpawnObj_Shed", "SpawnObj_Wall", "SpawnObj_Wire", "SpawnObj_RoadCone",
"SpawnObj_RoadBarrier_long", "SpawnObj_blinkbarrier", "SpawnObj_Fire", "SpawnObj_FenceWood", "SpawnObj_minibunker", "SpawnObj_Ladder", "SpawnObj_SearchLight"
];

// Copshop CRO
_copshop_response	= [
 "MP5A5",            "30rnd_9x19_MP5", "30rnd_9x19_MP5SD",
    "m1014",  "8Rnd_B_Beneli_74Slug",
   "30Rnd_556x45_Stanag", 
     
"SpawnObj_minibunker"];

// Copshop SWAT
_copshop_swat	= [
 "m1014",        
"M4A1", "M4A1_AIM",  "M4A1_AIM_SD_CAMO", "M4A1_HWS_GL", "M4A1_RCO_GL", "M16A4", "M16A4_gl",   "M4SPR",
 "30Rnd_556x45_Stanag",  "30Rnd_556x45_StanagSD", "1Rnd_HE_M203",  
"M24", "5Rnd_762x51_M24",    
"FlareWhite_M203", "FlareGreen_M203", "FlareRed_M203", "FlareYellow_M203", "SmokeShell", "G36K",  "G36_C_SD_Eotech", "MG36", 
"30Rnd_556x45_G36",   "M240", "100Rnd_762x51_M240",
"M136", "M136", "Stinger", "Stinger", "HandGrenade_East",  "Mine",  "PipeBomb", "SpawnObj_minibunker", "SpawnObj_MgPillbox"
];

// Boarderpatrol Weapons
_borderpatrolweapons = [
 "kanister", "handy", "lighter", "soup", ["bread", 300, 300], ["fish_filet", 490, 350], ["normqualitywater1", 300, 200], ["normqualitywater2", 330, 200], "Binocular", "NVGoggles", "Laserdesignator",
"Laserbatteries", "kleinesreparaturkit", "reparaturkit", "kanister", "nitro", "defuser",   
    "MP5A5",    
       "30rnd_9x19_MP5", "30rnd_9x19_MP5SD",     
    "30Rnd_556x45_Stanag", "30Rnd_556x45_StanagSD", "1Rnd_HE_M203", "FlareWhite_M203",
"FlareGreen_M203", "FlareRed_M203", "FlareYellow_M203", "SmokeShell", "G36K", "30Rnd_556x45_G36", "HandGrenade_East",  "Mine",  "SpawnObj_Fortress",
"SpawnObj_Danger", "SpawnObj_Shed", "SpawnObj_Wall", "SpawnObj_Wire", "SpawnObj_RoadCone", "SpawnObj_RoadBarrier_long", "SpawnObj_blinkbarrier", "SpawnObj_Fire", "SpawnObj_FenceWood", "SpawnObj_minibunker",
"SpawnObj_MgPillbox", "SpawnObj_Ladder", "SpawnObj_SearchLight"
];

// Shooting Range Ammo
_shooting_range	= [
   "15Rnd_9x19_M9", "15Rnd_9x19_M9SD",      
"7Rnd_45ACP_1911", "17Rnd_9x19_glock17",   "8Rnd_9x18_Makarov", "8Rnd_9x18_MakarovSD",   "30rnd_9x19_MP5", "30rnd_9x19_MP5SD"
];

// Terrorist Shop Buy
_terrorshop_buy	= ["fernzuender", "kleinesreparaturkit", "reparaturkit", "kanister", "lockpick", "lighter", "soup", "bread", "fish_filet", "normqualitywater1", "normqualitywater2", "Binocular", "NVGoggles", "Laserdesignator", "Laserbatteries",  
         "AK_47_S",   "AK_107_Kobra",  "AK_107_GL_Kobra", "30Rnd_762x39_AK47",    
  "1Rnd_HE_GP25",   "HandGrenade_East", 
        "PK",
"100Rnd_762x54_PK", "RPG7V", "PG7V",    "Strela", "Strela",
"stoersender"
];

// Terrorist Shop Sell
_terrorshop_sell	= ["fernzuenderbombe", "zeitzuenderbombe", "aktivierungsbombe", "geschwindigkeitsbombe", "selbstmordbombe", "kleinesreparaturkit", "reparaturkit",	"kanister", "fisch"];

// Vehicle Shop at Terrobase
_terrorshop4	= [
"LandRover_CZ_EP1",  "hilux1_civil_1_open", "hilux1_civil_2_covered", "hilux1_civil_3_open", "datsun1_civil_1_open", "datsun1_civil_2_covered", "datsun1_civil_3_open", ["HMMWV_M2", 180000, 45000],
[ 250000, 75000], ["UAZ_MG_CDF", 180000, 40000], "Ikarus", "Ural_CDF", "Ural_TK_CIV_EP1", "V3S_Civ",  "UAZ_CDF", "MH6",  "M1030", "TT650_Civ"
];

// Blackmarket Buy
_blackmarket_buy = [
"smallillegalweapons", "mediumillegalweapons", "largeillegalweapons", "fernzuenderbombe", "zeitzuenderbombe", "aktivierungsbombe", "geschwindigkeitsbombe", "selbstmordbombe", "fernzuender", "stoersender", "stoersender_improved",
"kleinesreparaturkit", "reparaturkit", "kanister", "lockpick", "Binocular", "NVGoggles", "Laserdesignator", "Laserbatteries",     
 "m1014",    "MP5A5",    
"M4A1", "M4A1_AIM",  "M4A1_AIM_SD_CAMO", "M4A1_HWS_GL", "M4A1_RCO_GL", "M16A4", "M16A4_gl",   "M4SPR",  
 
"ak_74", "AKS_74_PSO", "ak_74_gl","aks_74_u", "AKS_74_UN_Kobra", "RPK_74",  
"PK", "Pecheneg",  "KSVK", "RPG7V",  "Strela",  "JAVELIN",
"SpawnObj_minibunker", "SpawnObj_MgPillboxE",         
 "G36_C_SD_Eotech", "MG36", "M24",
"SVD",
"MineE", "HandGrenade_East",    
 "30rnd_9x19_MP5", "30rnd_9x19_MP5SD",      
       
 "30Rnd_556x45_G36",    "30Rnd_556x45_Stanag", "30Rnd_556x45_StanagSD", "5Rnd_762x51_M24",
"30Rnd_545x39_AKSD",   "10Rnd_762x54_SVD", "100Rnd_762x54_PK",  "5Rnd_127x108_KSVK",
"1Rnd_HE_GP25",  "PG7V",    "Strela", "Javelin"
];

// Blackmarket Sell
_blackmarket_sell = [
"fernzuenderbombe", "zeitzuenderbombe", "aktivierungsbombe", "geschwindigkeitsbombe", "selbstmordbombe", "fernzuender", "stoersender", "stoersender_improved",
"kleinesreparaturkit", "reparaturkit", "kanister", "lockpick", "Binocular", "NVGoggles", "Laserdesignator", "Laserbatteries",     
 "m1014",    "MP5A5",    
"M4A1", "M4A1_AIM",  "M4A1_AIM_SD_CAMO", "M4A1_HWS_GL", "M4A1_RCO_GL", "M16A4", "M16A4_gl",   "M4SPR",  
 
"ak_74", "AKS_74_PSO", "ak_74_gl","aks_74_u", "AKS_74_UN_Kobra", "RPK_74",  
"PK", "Pecheneg",  "KSVK", "RPG7V",  "Strela",  "JAVELIN",
"SpawnObj_minibunker", "SpawnObj_MgPillboxE",         
 "G36_C_SD_Eotech", "MG36", "M24",
"SVD",
"MineE", "HandGrenade_East",    
 "30rnd_9x19_MP5", "30rnd_9x19_MP5SD",      
       
 "30Rnd_556x45_G36",    "30Rnd_556x45_Stanag", "30Rnd_556x45_StanagSD", "5Rnd_762x51_M24",
"30Rnd_545x39_AKSD",   "10Rnd_762x54_SVD", "100Rnd_762x54_PK",  "5Rnd_127x108_KSVK",
"1Rnd_HE_GP25",  "PG7V",    "Strela", "Javelin"
];

_clothingBuy = ["ACE_GlassesBalaklava", "ACE_GlassesSunglasses", "ACE_GlassesBlackSun", "ACE_GlassesBlueSun", 
"ACE_GlassesTactical", "ACE_Earplugs", "ACE_GlassesGasMask_US", "ACE_GlassesSpectacles"
];

//NSPD Shop
_NSPD_Shop = ["nitro", "vclammo", "avgas_kanister", "reparaturkit", "HMMWV_M2",  "UAZ_MG_CDF"];


// interndebug Mode Shop
if (interndebug) then {
	_civshop = [];
	for [{_i=0}, {_i < (count INV_AlleItemsArray)}, {_i=_i+1}] do { _civshop = _civshop + [((INV_AlleItemsArray select _i) select 0)]; };
};

// The Box the Items Spawn in
SpawnBox = {
    private["_name", "_class", "_pos"];
	_name  = _this select 0;
	_class = _this select 1;
	_pos   = [0, 0, 0];
	if ((typeName (_this select 2)) == "ARRAY")  then {_pos = (_this select 2); };
	if ((typeName (_this select 2)) == "OBJECT") then { _pos = getPos(_this select 2); };
	call compile format["%1 = ""%2"" createVehicleLocal %3; %1 setPos %3; clearMagazineCargo %1; ClearWeaponCargo %1;", _name, _class, _pos];
};


// The Private Boxes on the Map
["gunbox01", "AmmoBoxWest", gunbox01_logic ] call SpawnBox;
["gunbox02","AmmoBoxWest",gunbox02_logic] call SpawnBox;
["medicgunbox","AmmoBoxWest",medicbox_logic] call SpawnBox;
["gunbox05", "AmmoBoxWest", gunbox05_logic ] call SpawnBox;
["gunbox06", "AmmoBoxWest", gunbox06_logic ] call SpawnBox;
["gunbox_cop_heavy", "AmmoBoxWest", gunbox_heavycop_logic ] call SpawnBox;
["gunbox_cop_patrol", "AmmoBoxWest", gunbox_patrolcop_logic ] call SpawnBox;
["gunbox_cop_response", "AmmoBoxWest", gunbox_responsecop_logic ] call SpawnBox;
["gunbox_bag_shotrange", "AmmoBoxWest", shooting_range_logic ] call SpawnBox;
["gunbox07", "AmmoBoxWest", gunbox07_logic ] call SpawnBox;
["gunbox_terrorbox", "AmmoBoxWest", gunbox_terrorbox_logic ] call SpawnBox;
["gunbox_blackmarket", "AmmoBoxWest", gunbox_blackmarketbox_logic] call SpawnBox;
["box_fabrik_1","AmmoBoxWest",box_fabrik_1_logic] call SpawnBox;
["box_fabrik_2","AmmoBoxWest", box_fabrik_2_logic] call SpawnBox;
["box_fabrik_3","AmmoBoxWest", box_fabrik_3_logic] call SpawnBox;
["box_fabrik_4","AmmoBoxWest", box_fabrik_4_logic] call SpawnBox;
["box_fabrik_5","AmmoBoxWest", box_fabrik_5_logic] call SpawnBox;
["gunbox_border", "AmmoBoxWest", box_borderlogic] call SpawnBox;

// Cleared Crates on Death
ShopWaffenKistenLeerenBeiTod = [gunbox01, gunbox02, medicgunbox, gunbox04, gunbox05, gunbox06, gunbox_terrorbox, gunbox_blackmarket, gunbox_cop_heavy, gunbox_cop_patrol, gunbox_cop_response, gunbox_bag_shotrange, gunbox_border];


// The Shops itself and what names they have, what gunboxes to use, what shop arrays for buy+sell they use, if licenses needed for items in them, etc...
INV_ItemShops = [ 
[bams,   "rams", dummyobj, dummyobj, _drogenshop, _emptyshop, true, "drugsshop"],
[drugsell1, ">>Drug Dealer<<", dummyobj, dummyobj, _emptyshop, _cocesellshop,true, "normalshop"],
[drugsell2, ">>Drug Dealer<<", dummyobj, dummyobj, _emptyshop, _marisellshop,true, "normalshop"],
[drugsell3, ">>Drug Dealer<<", dummyobj, dummyobj, _emptyshop, _lsdsellshop,true, "normalshop"],

[illegalweaponssellflag, ">>Illegal Weapons<<", dummyobj, dummyobj, _emptyshop, _illegalweapons,true, "normalshop"],
[illegalweaponsbuyflag, ">>Illegal Weapons<<", dummyobj, dummyobj, _illegalweapons, _emptyshop,true, "normalshop"],

[restaurante_1,  ">>Restaurante<<", dummyobj,  dummyobj,  _restaurante_buy,  _restaurante_sell,true, "normalshop"],
[restaurante_2, ">>Restaurante<<", dummyobj, dummyobj, _restaurante_buy, _restaurante_sell,true, "normalshop"],
[restaurante_3, ">>Restaurante<<", dummyobj, dummyobj, _restaurante_buy, _restaurante_sell,true, "normalshop"],
[restaurante_4, ">>Restaurante<<", dummyobj, dummyobj, _restaurante_buy, _restaurante_sell,true, "normalshop"],
[fishmarket_flag, ">>Fish Market<<", dummyobj, dummyobj, _emptyshop, _fishmarkt,false, "normalshop"],

[garage, ">>Garage<<", dummyobj, dummyobj, _garageshop, _garageshop,true, "normalshop"],
[garage_1,  ">>Garage<<",  dummyobj,  dummyobj,  _garageshop,  _garageshop,true, "normalshop"],
[garage_2, ">>Garage<<", dummyobj, dummyobj, _garageshop, _garageshop,true, "normalshop"],

[workplace_getjobflag_3,  ">>Item Shop<<", dummyobj,  dummyobj,  _emptyshop,  _fishshop, true, "normalshop"],
[ernteverkaufsflagge, ">>Item Shop<<", dummyobj, dummyobj, _emptyshop, _getreideshop,true, "normalshop"],
[bankflag_1, ">>Item Shop<<", dummyobj, dummyobj, _bankbuy, _banksell,true, "normalshop"],
[tankstelle_fahne1, ">>Fuel-station<<", dummyobj, dummyobj, _fuelshop_buy , _fuelshop_sell,true, "normalshop"],
[tankstelle2, ">>Fuel-station<<", dummyobj, dummyobj, _fuelshop_buy , _fuelshop_sell,true, "normalshop"],
[tankstelle3, ">>Fuel-station<<", dummyobj, dummyobj, _fuelshop_buy , _fuelshop_sell,true, "normalshop"],
[tankstelle4, ">>Fuel-station<<", dummyobj, dummyobj, _fuelshop_buy , _fuelshop_sell,true, "normalshop"],
[tankstelle5, ">>Fuel-station<<", dummyobj, dummyobj, _fuelshop_buy , _fuelshop_sell,true, "normalshop"],
[tankstelle6, ">>Fuel-station<<", dummyobj, dummyobj, _fuelshop_buy , _fuelshop_sell,true, "normalshop"],
[disable_tanke2, ">>Fuel-station<<", dummyobj, dummyobj, _fuelshop_buy , _fuelshop_sell,true, "normalshop"],
[disable_tanke3, ">>Fuel-station<<", dummyobj, dummyobj, _fuelshop_buy , _fuelshop_sell,true, "normalshop"],
[disable_tanke4, ">>Fuel-station<<", dummyobj, dummyobj, _fuelshop_buy , _fuelshop_sell,true, "normalshop"],
[disable_tanke5, ">>Fuel-station<<", dummyobj, dummyobj, _fuelshop_buy , _fuelshop_sell,true, "normalshop"],
[disable_tanke6, ">>Fuel-station<<", dummyobj, dummyobj, _fuelshop_buy , _fuelshop_sell,true, "normalshop"],
[disable_tanke7, ">>Fuel-station<<", dummyobj, dummyobj, _fuelshop_buy , _fuelshop_sell,true, "normalshop"],
[disable_tanke8, ">>Fuel-station<<", dummyobj, dummyobj, _fuelshop_buy , _fuelshop_sell,true, "normalshop"],
[bagango_shop, ">>Generic Shop<<", dummyobj,  dummyobj,  _civshop_buy, _civshop_sell, true, "normalshop"],
[mercalillo_shop, ">>Generic Shop<<", dummyobj,  dummyobj,  _civshop_buy, _civshop_sell, true, "normalshop"],
[obregan_shop, ">>Generic Shop<<", dummyobj,  dummyobj,  _civshop_buy, _civshop_sell, true, "normalshop"],
[corazol_shop, ">>Generic Shop<<", dummyobj,  dummyobj,  _civshop_buy, _civshop_sell, true, "normalshop"],
[pita_shop, ">>Generic Shop<<", dummyobj,  dummyobj,  _civshop_buy, _civshop_sell, true, "normalshop"],
[masbete_shop, ">>Generic Shop<<", dummyobj,  dummyobj,  _civshop_buy, _civshop_sell, true, "normalshop"],
[eponia_shop, ">>Generic Shop<<", dummyobj,  dummyobj,  _civshop_buy, _civshop_sell, true, "normalshop"],

[realestate_flag, ">>Habibi's Real Estates<<", dummyobj,  dummyobj,  _houses, _houses, true, "normalshop"],
[construcmaterials_flag, ">>Construction Materials<<", dummyobj,  dummyobj,  _constructionmaterials, _constructionmaterials, false, "normalshop"],

[gunlogic1, ">>Pistol Shop<<", gunbox01, dummyobj, _gunshop1, _gunshop1,true, "normalshop"],
[gunlogic7, ">>SMG Shop<<", gunbox07, dummyobj, _gunshop7, _gunshop7,true, "normalshop"],
[gunlogic2, ">>Rifle Shop<<", gunbox02, dummyobj, _gunshop2, _gunshop2,true, "normalshop"],
[gunlogic5, ">>Equipment Shop<<", gunbox05,  dummyobj,  _gunshop0, _gunshop0, true, "normalshop"],

[carflag1,  ">>Car Shop<<", dummyobj, carflag1, _vehicleshop1, _vclsellshop,true, "normalshop"],
[carflag_paraiso,  ">>Car Shop<<", dummyobj, carflag_paraiso, _vehicleshop1, _vclsellshop,true, "normalshop"],
[carflag2, ">>Pickups + Jeeps<<", dummyobj, carflag2, _vehicleshop2, _vclsellshop,true, "normalshop"],
[carflag3, ">>Truck Shop<<", dummyobj, carflag3, _vehicleshop3, _vclsellshop,true, "normalshop"],
[carflag5, ">>Boat Shop<<", dummyobj, carspawn5, _vehicleshop5, _vclsellshop,true, "normalshop"],
[carflag_boat2, ">>Boat Shop<<", dummyobj, cora_boat_spawn1, _vehicleshop5, _vclsellshop,true, "normalshop"],
[carflag_boat3, ">>Boat Shop<<", dummyobj, cora_boat_spawn2, _vehicleshop5, _vclsellshop,true, "normalshop"],
[carflag8,  ">>Boat Shop<<", dummyobj, terrorboatspawn, _terrorist_boat,  _vclsellshop,false, "normalshop"],
[carflag6,  ">>Pita Airport<<", dummyobj, carflag6, _vehicleshop6,  _vclsellshop,true, "normalshop"],
[mikes_garage,  ">>Mikes Retro Vehicles<<", dummyobj, mikes_garage, _mikes_garage,  _vclsellshop,true, "normalshop"],

[airflag1,  ">>Bagango Airport<<", dummyobj, spawn_air_bag, _vehicleshop_air, _vehicleshop_air,true, "normalshop"],
[airflag2,  ">>mercalillo Airport<<", dummyobj, spawn_air_merca, _vehicleshop_air2, _vehicleshop_air2,true, "normalshop"], 

[copbaseflag, ">>Generic Items<<", gunbox06,  dummyobj,  _copshop, _copshop, true, "normalshop"],
[copbaseflag_patrol, ">>Patrol-Officer<<", gunbox_cop_patrol,  dummyobj,  _copshop_patrol, _copshop_patrol, true, "normalshop"],
[copbaseflag_response, ">>Criminal Response Officer<<", gunbox_cop_response,  dummyobj,  _copshop_response, _copshop_response, true, "normalshop"],
[copbaseflag_heavy, ">>SWAT-Officer<<", gunbox_cop_heavy,  dummyobj,  _copshop_swat, _copshop_swat, true, "normalshop"],
[shoting_range, ">>Bagango Shooting Range<<", gunbox_bag_shotrange,  dummyobj,  _shooting_range, _shooting_range, true, "normalshop"],
[copbuy,  ">>Police Vehicles<<",  dummyobj,  copbuy,  _vehicleshop7,  _vehicleshop7,false, "normalshop"],
[copbuy_heavy,  ">>Police Vehicles (License)<<",  dummyobj,  copbuy_heavy,  _vehicleshop_copheavy,  _vehicleshop_copheavy,true, "normalshop"],
[copbuy_air,  ">>Police Air-Vehicles<<",  dummyobj,  airspawn_cop,  _vehicleshop_copair,  _vehicleshop_copair,true, "normalshop"],
[borderpatrol_flag,  ">>Border Patrol Weapons<<",  gunbox_border,  dummyobj,  _borderpatrolweapons,  _borderpatrolweapons,false, "normalshop"],
[copbuy_border,  ">>Police Vehicles<<",  dummyobj,  bordercar_spawn,  _borderpatrolveh,  _borderpatrolveh,false, "normalshop"],

[terrorlicenseflag, ">>Terrorist Equipment<<", gunbox_terrorbox,  dummyobj,  _terrorshop_buy, _terrorshop_buy,false, "terroristshop"],
[blackmarketflag, "Black Market", gunbox_blackmarket,  dummyobj,  _blackmarket_buy, _blackmarket_sell,false, "blackmarketshop"],

[carflag7, ">>Terrorist Airvehicles<<", dummyobj, terrorairspawn, _vehicleshop8, _vclsellshop,false, "terroristshop"],
[carflag9, ">>Vehicle Shop<<", dummyobj, carflag9, _terrorshop4, _vclsellshop,false, "normalshop"], 

[carsellflag_1, ">>Sell Vehicles<<", dummyobj, dummyobj, _emptyshop, _vclsellshop,true, "normalshop"],
[Bike_shop_flag,  ">>Bike and Sports Shop<<",  dummyobj,  Bike_shop_flag, _bikeshopbuy, _bikeshopsell, true, "normalshop"],
[hospitalflag,  ">>Ambulance Shop<<",  medicgunbox,  spawn_hospital, _ambulanceshop, _ambulanceshop, true, "normalshop"],
[carsellflag_3, ">>Sell Vehicles<<", dummyobj, dummyobj, _emptyshop, _vclsellshop,true, "normalshop"],
[carsellflag_4,  ">>Sell Vehicles<<",  dummyobj,  dummyobj,  _emptyshop,  _vclsellshop,true, "normalshop"],
[carsellflag_5, ">>Sell Vehicles<<", dummyobj, dummyobj, _emptyshop, _vclsellshop,true, "normalshop"],
[carsellflag_6, ">>Sell Vehicles<<", dummyobj, dummyobj, _emptyshop, _vclsellshop,true, "normalshop"],

[ressourceshop1_flag, "Resources Shop", dummyobj, dummyobj, _ressourceshop_buy, _ressourceshop_sell, false, "normalshop"],

[clothing, "Clothing Shop", dummyobj, dummyobj, _clothingBuy, _clothingBuy, true, "normalshop"],

[none,  ">>NSPD Shop<<",  dummyobj, NSPD_Shop_spawn,  _NSPD_Shop,  _NSPD_Shop,true, "normalshop"]
];

// Dealershops
INV_DealerShops = [
[drugvehicle,   ">>Buy Seeds/Tools<<", dummyobj, dummyobj, _drogenshop, _emptyshop, true, "drugsshop"]
];
