// Factory Details
// factoryDetails.sqf


// Manufacturable Items

_pistolfactory	= [ "Colt1911", "M9", "M9SD", "Glock17_EP1", "Makarov", "MakarovSD", "15Rnd_9x19_M9", "15Rnd_9x19_M9SD", "8Rnd_9x18_Makarov", "8Rnd_9x18_MakarovSD",   
    "7Rnd_45ACP_1911", "17Rnd_9x19_glock17"
];

_smgfactory	= [ "MP5A5", "30rnd_9x19_MP5", "30rnd_9x19_MP5SD" ];

_riflefactory = [ "m1014", "M24", "5Rnd_762x51_M24" ];

_heavyweaponfactory	= [
"M4A1_AIM", "M4SPR", "M4A1", "G36K", "G36C", "G36A", 
 "G36_C_SD_Eotech", "aks_74_u", "AKS_74_UN_Kobra", "AKS_74_PSO", "M16A2", "M16A4", "M16A4_ACG", "30Rnd_556x45_Stanag", 
"30Rnd_556x45_StanagSD", "30Rnd_556x45_G36",
 "30Rnd_545x39_AKSD", "ak_74", "aks_74_u", "AKS_74_UN_Kobra", "SVD", "KSVK", 
"AKS_74_PSO", "ak_74_gl", "M4A1_HWS_GL", "M16A2gl", "M16A4_ACG_GL", "M136", "JAVELIN", "STINGER", "RPG7V", "STRELA", "M240", "M249", "PK", "1Rnd_HE_M203", "1Rnd_HE_GP25", 
"100Rnd_762x51_M240", "200Rnd_556x45_M249", "100Rnd_762x54_PK",  "M136", "Javelin", "Stinger", "PG7V",  "Strela", "10Rnd_762x54_SVD", "5Rnd_127x108_KSVK", 
 "HandGrenade_East",  "Mine", "MineE", "PipeBomb", "FlareWhite_GP25", "FlareGreen_GP25", "FlareRed_GP25", "FlareYellow_GP25", 
"FlareWhite_M203", "FlareGreen_M203", "FlareRed_M203", "FlareYellow_M203"
];


_vehiclefactory 		= [
"MMT_Civ",  "ATV_US_EP1",  "M1030", "TT650_Civ", 
    "Skoda", "SkodaBlue", "SkodaRed", "SkodaGreen", "Car_hatchback",   
"Lada1", "Car_Sedan",     "Tractor", 
"LandRover_CZ_EP1",  "S1203_ambulance_EP1", "hilux1_civil_1_open", "hilux1_civil_2_covered", "hilux1_civil_3_open", "datsun1_civil_1_open", "datsun1_civil_2_covered", "datsun1_civil_3_open",   "S1203_TK_CIV_EP1",         "MTVR",  "Ikarus", "Ural_CDF", "Ural_TK_CIV_EP1", "V3S_Civ",
 "HMMWV_M2", "UAZ_MG_CDF"
];

_itemfactory    		= ["kleinesreparaturkit", "reparaturkit","kanister", "nitro", "lockpick"];
_resourcefactory 		= ["bricks", "mineraloel","ebauteile","schwarzpulver","kohle","glas","plastik","stahlwolle"];
_terrorfactory 		= ["mineraloel","ebauteile","stahl","schwarzpulver", "fernzuender",  "fernzuenderbombe", "zeitzuenderbombe", "aktivierungsbombe", "geschwindigkeitsbombe", "selbstmordbombe", "kleinesreparaturkit", "reparaturkit", "kanister", "nitro", "lockpick",          "Colt1911",    "M9", "M9SD", "Glock17",       "Makarov", "MakarovSD", "15Rnd_9x19_M9", "15Rnd_9x19_M9SD", "8Rnd_9x18_Makarov", "8Rnd_9x18_MakarovSD",       "7Rnd_45ACP_1911",  "17Rnd_9x19_glock17",        "ak_74", "ak_74_gl", "AKS_74_PSO", "aks_74_u", "AKS_74_UN_Kobra", "M4GL", "M4A1_AIM_SD_CAMO", "M4A1_HWS_GL","M4A1_AIM", "M4A1", "G36K", "G36C", "G36A", "MP5A5",  "M16A2", "M16A2gl", "M16A4_ACG", "M16A4_ACG_GL", "30Rnd_556x45_Stanag", "30Rnd_556x45_G36","30rnd_9x19_MP5", "30rnd_9x19_MP5SD",  "30Rnd_545x39_AKSD", "M24", "SVD", "KSVK",  "5Rnd_762x51_M24", "10Rnd_762x54_SVD", "5Rnd_127x108_KSVK",  "M136", "JAVELIN", "STINGER", "RPG7V", "STRELA", "M240", "M249", "PK", "1Rnd_HE_M203", "1Rnd_HE_GP25", "100Rnd_762x51_M240", "200Rnd_556x45_M249", "100Rnd_762x54_PK", "M136", "Javelin", "Stinger", "PG7V",  "Strela", "HandGrenade_East",  "Mine", "MineE",  "PipeBomb","Binocular", "ACE_NVGoggles", "FlareWhite_GP25", "FlareGreen_GP25", "FlareRed_GP25", "FlareYellow_GP25", "FlareWhite_M203", "FlareGreen_M203", "FlareRed_M203", "FlareYellow_M203", "SmokeShellRed", "SmokeShellGreen",  "SmokeShell", "MH6", "SpawnObj_MgPillbox",   "30Rnd_556x45_StanagSD",    "DELETE_ME"];
_airvehiclefactory 	= [  "Mi17_Civilian" ];
_constructionfactory 	= ["SpawnObj_Fortress", "SpawnObj_Danger", "SpawnObj_Gate", "SpawnObj_Shed", "SpawnObj_Wall", "SpawnObj_RoadCone", "SpawnObj_Fire", "SpawnObj_FenceWood", "SpawnObj_WireFence", "SpawnObj_Wire", "SpawnObj_RoadBarrier_long", "SpawnObj_blinkbarrier", "SpawnObj_minibunker", "SpawnObj_stall1", "SpawnObj_houses", "SpawnObj_housem", "SpawnObj_apartment", "SpawnObj_mansion", "SpawnObj_villa"];
_oresmelt 			= ["stahl", "gold_barren"];
_jewlery_list 		= ["Diamondring", "EDiamondring"];
_wasserfabrik_list 	= ["lowqualitywater", "normqualitywater1", "normqualitywater2", "highqualitywater"];
_foodfabrik_list 		= ["cerealbar", "oliveoil", "soup", "donut", "bread", "fish_filet", "whale_filet", "shark_filet"];
_alkfabrik_list 		= ["bier", "weizenbier", "starkbier", "rotwein", "rotweinhq", "weisswein", "weissweinhq", "zigarre", "zigarrefatlady"];

// The Factories
INV_ItemFabriken = 
[
	[WaffenFabrik_1,		"factory1", 	"Pistol Factory",			box_fabrik_1,	dummyobj, 			_pistolfactory, 		40000,	"Fabrikablage1"],
	[FahrzeugFabrik_1,	"factory2",		"Vehicle Factory",		dummyobj,		FahrzeugFabrik_1,		_vehiclefactory,		30000,	"Fabrikablage2"],
	[ItemFabrik_1,		"factory3",		"Item Factory",			dummyobj,		dummyobj,			_itemfactory,		25000,	"Fabrikablage3"],
	[ressourcenfabrik_1,	"factory4", 	"Resource Factory",		dummyobj, 		dummyobj, 			_resourcefactory,		15000,	"Fabrikablage4"],
	[terrorfabrik_1,		"factory5",		"Terrorists Factory",		box_fabrik_2,	terrorfabrik_1,		_terrorfactory,		60000,	"Fabrikablage5"],
	[FahrzeugFabrik_air,	"factory6",		"Air-Vehicle Factory",		dummyobj,		FahrzeugFabrik_air,	_airvehiclefactory,	65000,	"Fabrikablage6"],
	[ContructionFabrik,	"factory7",		"Contruction Factory",		dummyobj, 		dummyobj,			_constructionfactory,	90000,	"Fabrikablage7"],
	[Ore_smelter,		"factory8",		"Ore Smelter",			dummyobj, 		dummyobj,			_oresmelt,			20000,	"Fabrikablage8"],
	[Jewlery1,			"factory9",		"Jewlery Factory",		dummyobj, 		dummyobj,			_jewlery_list,		70000,	"Fabrikablage9"],
	[WasserFabrik_flag,	"factory10",	"Water Factory",			dummyobj, 		dummyobj,			_wasserfabrik_list,	15000,	"Fabrikablage10"],
	[FoodFabrik_flag,		"factory11",	"Food Factory",			dummyobj, 		dummyobj,			_foodfabrik_list,		20000,	"Fabrikablage11"],
	[alkoholFabrik_1,		"factory12",	"Alkohol/Tobacco Factory",	dummyobj, 		dummyobj,			_alkfabrik_list,		50000,	"Fabrikablage12"],
	[WaffenFabrik_2,		"factory13",	"SMG Factory",			box_fabrik_3,	dummyobj,			_smgfactory,		70000,	"Fabrikablage13"],
	[WaffenFabrik_3,		"factory14",	"Rifle Factory",			box_fabrik_4,	dummyobj,			_riflefactory,		100000,	"Fabrikablage14"],
	[WaffenFabrik_4,		"factory15",	"Heavy Weapon Factory",		box_fabrik_5,	dummyobj,			_heavyweaponfactory,	480000,	"Fabrikablage15"]
];


// Set Owners to Blank
INV_Fabrikowner = [];


// Farmable, Collectable Ressources
INV_FarmItemArray = 
[
	[ [["fishareamarkername_1", 		300],
	  ["fishareamarkername_2", 		300]], 	"fisch",		13,	6,   	["Ship"],	 "auto"],
	[ [["fishareamarkername_shark", 	300]],	"shark",		5,	1,   	["Ship"],	 "auto"],
	[ [["fishareamarkername_whale", 	300]],	"whale",		4,	1,   	["Ship"],	 "auto"],
	[ [["farmarea", 				250]],	"getreide",		8, 	7,   	["tractor"], "auto"],
	
	[ [["wald_marker1", 			 50], 
	  ["wald_marker2", 			150], 
	  ["wald_marker3", 			 55]], 	"holz", 		8, 	5, 	["man"], 	"auto"],
	
	[ [["erzmine1", 				 50]], 	"eisenerz", 	20,	7,	["man"],	"auto"],
	[ [["stonemine1",			 50]],  "stone", 	20,	7,	["man"], 		"auto"],
	[ [["siliziummine1", 			 50]], 	"silizium", 	17,	6,	["man"],	"auto"],
	[ [["kupfermine1", 			 50]],  	"kupfer", 		14, 	5, 	["man"], 	"auto"],
	[ [["schwefelmine1", 			 50]], 	"schwefel", 	16,	5,	["man"],	"auto"],
	[ [["kohlemine1", 			 50]],  	"kohle", 		15, 	7, 	["man"], 	"auto"],
	[ [["oelquelle1",      			400]], 	"erdoel", 		15,	5,	["man"],	 "auto"],
	[ [["goldmine_marker", 			 60]], 	"gold_nugget", 	10,	1,	["man"],	"auto"],
	[ [["harvestmarkername_diamondmine", 40]], 	"diamond",		8,	1,	["man"],	"auto"],
	[ [["seawater_harvest1", 		200], 
	  ["seawater_harvest2", 		500], 
	  ["seawater_harvest3", 		500], 
	  ["seawater_harvest4", 		300]], 	"salzwasser", 	18,	2,	["ship"],	 "auto"],
	[ [["quellwasser1", 			 55], 
	  ["quellwasser2", 			 65], 
	  ["quellwasser3", 			 65]], 	"quellwasser", 	14,	2,	["man"],	 "auto"],
	[ [["quellwasser_high1", 		 75]], 	"quellwasserhq", 	14,	1,	["man"],	 "auto"],
	[ [["grapes_red1", 			 60]], 	"rotetrauben", 	12,	2,	["man"],	 "auto"],
	[ [["grapes_redhigh1", 			 60], 
	  ["grapes_redhigh2", 			 65], 
	  ["grapes_redhigh3", 			 65]], 	"rotetraubenHQ", 	10,	1,	["man"],	 "auto"],
	[ [["grapes_white1", 			120]], 	"weissetrauben", 	12,	2,	["man"],	 "auto"],
	[ [["grapes_whitehq1", 			 70], 
	  ["grapes_whitehq2", 			 60], 
	  ["grapes_whitehq3", 			 50]],	"weissetraubenHQ",5,	1,	["man"],	 "auto"],
	[ [["hopfenernte_marker1", 		140], 
	  ["hopfenernte_marker2", 		100]], 	"hopfen", 		12,	2,	["man"],	 "auto"],
	[ [["tabakernte_marker1", 		100]], 	"tabak", 		8,	2,	["man"],	 "auto"],
	[ [["sandgrube1", 			 50]],  	"sand", 		20, 	7, 	["man"], 	"auto"]
];
