// Item, Vehicle and Weapon Arrays
// goodsArray.sqf

// Weapon and Gear Arrays
INV_AlleWaffenObjekte = [

// OBJECTS (Fixed for A2 - Tom)
["Binocular", ["Waffe", "Equipment"],["Binocular", "Binocular"], [300, 100], [0, "", ""], [], "Binocular" call ISSE_Cfg_Weapons_GetName, "Binocular" call ISSE_Cfg_Weapons_GetDesc, [["plastik", 1],["glas", 1]]],

["Laserdesignator", ["Waffe", "Equipment"],["Laserdesignator", "Laser Range Finder"], [1900, 900], [0, "", ""], [], "Laserdesignator" call ISSE_Cfg_Weapons_GetName, "Laserdesignator" call ISSE_Cfg_Weapons_GetDesc, [["plastik", 1],["glas", 1]]],

["NVGoggles",["Waffe", "Equipment"],["NVGoggles", "NVGoggles"], [550, 200], [0, "", ""],[], "NVGoggles" call ISSE_Cfg_Weapons_GetName,"NVGoggles" call ISSE_Cfg_Weapons_GetDesc,[["plastik", 1],["glas", 1],["ebauteile", 1]]],

["ItemMap",["Waffe", "Equipment"],["ItemMap", "Map"], [300, 200], [0, "", ""],[], "ItemMap" call ISSE_Cfg_Weapons_GetName,"ItemMap" call ISSE_Cfg_Weapons_GetDesc,[["plastik", 1],["glas", 1],["ebauteile", 1]]],

["ItemCompass",["Waffe", "Equipment"],["ItemCompass", "Compass"], [300, 200], [0, "", ""],[], "ItemCompass" call ISSE_Cfg_Weapons_GetName,"ItemCompass" call ISSE_Cfg_Weapons_GetDesc,[["plastik", 1],["glas", 1],["ebauteile", 1]]],

["ItemWatch",["Waffe", "Equipment"],["ItemWatch", "Watch"], [300, 200], [0, "", ""],[], "ItemWatch" call ISSE_Cfg_Weapons_GetName,"ItemWatch" call ISSE_Cfg_Weapons_GetDesc,[["plastik", 1],["glas", 1],["ebauteile", 1]]],

["ItemRadio",["Waffe", "Equipment"],["ItemRadio", "Radio"], [550, 0], [0, "", ""],[], "ItemRadio" call ISSE_Cfg_Weapons_GetName,"ItemRadio" call ISSE_Cfg_Weapons_GetDesc,[["plastik", 1],["glas", 1],["ebauteile", 1]]],

["ItemGPS",["Waffe", "Equipment"],["ItemGPS", "GPS"], [550, 200], [0, "", ""],[], "ItemGPS" call ISSE_Cfg_Weapons_GetName,"ItemGPS" call ISSE_Cfg_Weapons_GetDesc,[["plastik", 1],["glas", 1],["ebauteile", 1]]],


// COUNTER-TERRORISM RIFLES/SMGs (Fixed for A2 - Tom)
["G36K", ["Waffe", "rifle"], ["G36K", "G36K"],[20000, 11000], [2, "rifle", "swat_training"], [], "G36K" call ISSE_Cfg_Weapons_GetName, "G36K" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 15],["plastik", 5]] ],

["G36C", ["Waffe", "rifle"],["G36C", "G36C"], [18000, 10000], [2, "rifle", "swat_training"], [], "G36C" call ISSE_Cfg_Weapons_GetName, "G36C" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 15],["plastik", 7],["glas", 1]]],

["G36A", ["Waffe", "rifle"], ["G36A", "G36A"],[22000, 13000], [2, "rifle", "swat_training"], [], "G36A" call ISSE_Cfg_Weapons_GetName, "G36A" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 15],["plastik", 10],["glas", 1]] ],

["G36_C_SD_Eotech", ["Waffe", "rifle"],["G36_C_SD_Eotech", "G36C SD Eotech"], [20000, 10000], [2, "rifle", "swat_training"], [], "G36_C_SD_Eotech" call ISSE_Cfg_Weapons_GetName, "G36_C_SD_Eotech" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 15],["plastik", 7],["glas", 1]]],

["MP5SD", ["Waffe", "rifle"],["MP5SD", "MP5A5 SD"], [7000, 5000], [2, "smg", "response_training"], [], "MP5SD" call ISSE_Cfg_Weapons_GetName, "MP5SD" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 10],["plastik", 5]]],

["MP5A5", ["Waffe", "rifle"],["MP5A5", "MP5A5"], [6500, 5000], [2, "smg", "response_training"], [], "MP5A5" call ISSE_Cfg_Weapons_GetName, "MP5A5" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 10],["plastik", 5]]],

//["UZI_EP1", ["Waffe", "rifle"],["MP5A5", "MP5A5"], [6500, 5000], [2, "smg", "response_training"], [], "UZI_EP1" call ISSE_Cfg_Weapons_GetName, "UZI_EP1" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 10],["plastik", 5]]],


// SEMI-AUTO RIFLES/SHOTGUNS (Fixed for A2 - Tom)
["m1014",["Waffe", "rifle"], ["m1014", "M1014 Auto Shotgun"], [7000, 5400], [2, "rifle", "patrol_training"], [], "m1014" call ISSE_Cfg_Weapons_GetName, "m1014" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 12],["kupfer", 5],["plastik", 6]]],


// WESTERN TYPICAL ASSAULT-RIFLES (Fixed for A2 - Tom)
["M4A1",["Waffe", "rifle"], ["M4A1", "M4A1"], [10500, 5000], [2, "rifle", "swat_training"], [], "M4A1" call ISSE_Cfg_Weapons_GetName, "M4A1" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 20],["plastik", 10]]],

["M4A1_AIM",["Waffe", "rifle"], ["M4A1_AIM", "M4A1 Aimpoint"], [12000, 6500], [2, "rifle", "swat_training"], [], "M4A1_AIM" call ISSE_Cfg_Weapons_GetName, "M4A1_AIM" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 20],["plastik", 12]]],

["M4A1_AIM_SD_CAMO",["Waffe", "rifle"], ["M4A1_AIM_SD_CAMO", "M4A1 Aimpoint SD"], [13000, 4500], [2, "rifle", "swat_training"], [], "M4A1_AIM_SD_CAMO" call ISSE_Cfg_Weapons_GetName, "M4A1_AIM_SD_CAMO" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 20],["plastik", 11]]],

["M4A1_HWS_GL",["Waffe", "rifle"], ["M4A1_HWS_GL", "M4A1 Eotech GL"], [15000, 5500], [2, "rifle", "swat_training"], [], "M4A1_HWS_GL" call ISSE_Cfg_Weapons_GetName, "M4A1_HWS_GL" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 22],["plastik", 16]]],

["M4A1_RCO_GL",["Waffe", "rifle"], ["M4A1_RCO_GL", "M4A1 RCO GL"], [18000, 7500], [2, "rifle", "swat_training"], [], "M4A1_RCO_GL" call ISSE_Cfg_Weapons_GetName, "M4A1_RCO_GL" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 22],["plastik", 16]]],

["M16A2",["Waffe", "rifle"], ["M16A2", "M16A2"], [12000, 5500], [2, "rifle", "swat_training"], [], "M16A2" call ISSE_Cfg_Weapons_GetName, "M16A2" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 22],["plastik", 14]]],

["M16A2gl",["Waffe", "rifle"], ["M16A2gl", "M16A2 GL"], [16000, 7500], [2, "rifle", "swat_training"], [], "M16A2gl" call ISSE_Cfg_Weapons_GetName, "M16A2gl" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 22],["plastik", 14]]],

["M16A4",["Waffe", "rifle"], ["M16A4", "M16A4"], [13000, 7000], [2, "rifle", "swat_training"], [], "M16A4" call ISSE_Cfg_Weapons_GetName, "M16A4" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 20],["plastik", 11]]],

["M16A4_gl",["Waffe", "rifle"], ["M16A4_gl", "M16A4 GL"], [17000, 9000], [2, "rifle", "swat_training"], [], "M16A4_gl" call ISSE_Cfg_Weapons_GetName, "M16A4_gl" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 24],["plastik", 14]]],

["M16A4_ACG",["Waffe", "rifle"], ["M16A4_ACG", "M16A4 ACOG"], [16000, 7500], [2, "rifle", "swat_training"], [], "M16A4_ACG" call ISSE_Cfg_Weapons_GetName, "M16A4_ACG" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 24],["glas", 1],["plastik", 14]]],

["M16A4_ACG_GL",["Waffe", "rifle"], ["M16A4_ACG_GL", "M16A4 GL ACOG"], [20000, 9500], [2, "rifle", "swat_training"], [], "M16A4_ACG_GL" call ISSE_Cfg_Weapons_GetName, "M16A4_ACG_GL" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 25],["glas", 1],["plastik", 15]]],


// EXOTICS

// CREW SERVED


// EASTERN TYPICAL/MODERN ASSAULT-RIFLES (Fixed for A2 - Tom)
["ak_74",["Waffe", "rifle"], ["ak_74", "AK-74 5.45mm"], [8500, 1500], [2, "rifle", "swat_training"], [], "ak_74" call ISSE_Cfg_Weapons_GetName, "ak_74" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 20],["holz", 10]]],

["ak_74_gl",["Waffe", "rifle"], ["ak_74_gl", "AK-74 GL 5.45mm + GP30"], [9000, 4600], [2, "rifle", "swat_training"], [], "ak_74_gl" call ISSE_Cfg_Weapons_GetName, "ak_74_gl" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 25],["holz", 10]]],

["aks_74_u",["Waffe", "rifle"], ["aks_74_u", "AKSU-74 5.45mm"], [7000, 3500], [2, "rifle", "swat_training"], [], "aks_74_u" call ISSE_Cfg_Weapons_GetName, "aks_74_u" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 15],["holz", 5]]],

["AKS_74_PSO",["Waffe", "rifle"], ["AKS_74_PSO", "AK-74 PSO-1 5.45mm"], [15000, 7000], [2, "rifle", "swat_training"], [], "AKS_74_PSO" call ISSE_Cfg_Weapons_GetName, "AKS_74_PSO" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 25],["holz", 10]]],

["AKS_74_UN_Kobra",["Waffe", "rifle"], ["AKS_74_UN_Kobra", "AKSU-74SD Kobra 5.45mm"], [8000, 3500], [2, "rifle", "swat_training"], [], "AKS_74_UN_Kobra" call ISSE_Cfg_Weapons_GetName, "AKS_74_UN_Kobra" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 16],["holz", 5]]],


// EASTERN/TERRORIST ASSAULT RIFLES (Fixed for A2 - Tom)
["AK_47_S",["Waffe", "rifle"], ["AK_47_S", "AK-47 7.62mm"], [4100, 1500], [2, "rifle", "swat_training"], [], "AK_47_S" call ISSE_Cfg_Weapons_GetName, "AK_47_S" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 20],["holz", 10]]],

["AK_107_Kobra",["Waffe", "rifle"], ["AK_107_Kobra", "AKM 7.62mm Cobra"], [5900, 4500], [2, "rifle", "swat_training"], [], "AK_107_Kobra" call ISSE_Cfg_Weapons_GetName, "AK_107_Kobra" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 20],["holz", 10]]],

["AK_107_GL_Kobra",["Waffe", "rifle"], ["AK_107_GL_Kobra", "AKM 7.62mm Cobra + GP30"], [6900, 5000], [2, "rifle", "swat_training"], [], "AK_107_GL_Kobra" call ISSE_Cfg_Weapons_GetName, "AK_107_GL_Kobra" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 20],["holz", 10]]],


// MACHINEGUNS/SARs (Fixed for A2 - Tom)
["M240", ["Waffe", "mg"],["M240", "M240G"], [75000, 40000], [2, "machinegun", "swat_training"], [], "M240" call ISSE_Cfg_Weapons_GetName, "M240" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 40],["kupfer", 10],["plastik", 20]]],

["M249", ["Waffe", "mg"],["M249", "M249"], [60000, 53000], [2, "machinegun", "swat_training"], [], "M249" call ISSE_Cfg_Weapons_GetName, "M249" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 40],["kupfer", 10],["plastik", 20]]],

["PK",["Waffe", "mg"], ["PK", "PKM"], [84000, 40000], [2, "machinegun", "swat_training"],[], "PK" call ISSE_Cfg_Weapons_GetName, "PK" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 40],["kupfer", 10],["holz", 20]]],

["Pecheneg",["Waffe", "mg"], ["Pecheneg", "Pecheneg"], [89000, 60000], [2, "machinegun", "swat_training"],[], "Pecheneg" call ISSE_Cfg_Weapons_GetName, "Pecheneg" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 40],["kupfer", 10],["holz", 20]]],

["RPK_74", ["Waffe", "mg"],["RPK_74", "RPK-74 5.45mm"], [32000, 16000], [2, "machinegun", "swat_training"], [], "RPK_74" call ISSE_Cfg_Weapons_GetName, "RPK_74" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 40],["kupfer", 10],["holz", 20]]],

["MG36", ["Waffe", "rifle"],["MG36", "MG 36"], [35000, 19000], [2, "rifle", "swat_training"], [], "MG36" call ISSE_Cfg_Weapons_GetName, "MG36" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 30],["plastik", 20],["glas", 1]]],


// SNIPER/MARKSMAN RIFLES (Fixed for A2 - Tom)
["M24", ["Waffe", "sniper"],["M24", "M24"], [35000, 16000], [2, "sniper", "swat_training"], [], "M24" call ISSE_Cfg_Weapons_GetName, "M24" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 20],["holz", 15],["glas", 1]]],

["SVD", ["Waffe", "sniper"],["SVD", "SVD"],[27000, 18000], [2, "sniper"], [], "SVD" call ISSE_Cfg_Weapons_GetName, "SVD" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 20],["holz", 15],["glas", 1]]],

["KSVK", ["Waffe", "sniper"],["KSVK", "KSVK"],[36000, 18000], [2, "sniper", "swat_training"], [], "KSVK" call ISSE_Cfg_Weapons_GetName, "KSVK" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 20],["holz", 15],["glas", 1]]], 

["M4SPR",["Waffe", "sniper"], ["M4SPR", "Mk12 SPR"], [31500, 16000], [2, "rifle", "swat_training"], [], "M4SPR" call ISSE_Cfg_Weapons_GetName, "M4SPR" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 30],["plastik", 12]]],


// GRENADELAUNCHERS (Fixed for A2 - Tom)


// BACKPACKS - RUCKSACKS (Fixed for A2 - Tom)
["ACE_VTAC_RUSH72", ["Waffe", "launcher"],["ACE_VTAC_RUSH72", "VTAC RUSH72 SF-Backpack"],[2500, 1700], [0, "", ""],[], "ACE_VTAC_RUSH72" call ISSE_Cfg_Weapons_GetName, "ACE_VTAC_RUSH72" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 2],["kupfer", 2],["plastik", 3]]],

["ACE_FAST_PackEDC", ["Waffe", "launcher"],["ACE_FAST_PackEDC", "F.A.S.T. EDC SF-Backpack"],[2100, 1500], [0, "", ""],[], "ACE_FAST_PackEDC" call ISSE_Cfg_Weapons_GetName, "ACE_FAST_PackEDC" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 2],["kupfer", 2],["plastik", 3]]],

["ACE_CharliePack", ["Waffe", "launcher"],["ACE_CharliePack", "Arc Teryx Charlie SF-Backpack"],[3000, 1400], [0, "", ""],[], "ACE_CharliePack" call ISSE_Cfg_Weapons_GetName, "ACE_CharliePack" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 2],["kupfer", 2],["plastik", 3]]],

["ACE_Backpack_CivAssault", ["Waffe", "launcher"],["ACE_Backpack_CivAssault", "Backpack Civ"],[3900, 1900], [0, "", ""],[], "ACE_Backpack_CivAssault" call ISSE_Cfg_Weapons_GetName, "ACE_Backpack_CivAssault" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 2],["kupfer", 2],["plastik", 3]]],

["ACE_BackPack", ["Waffe", "launcher"],["ACE_BackPack", "Backpack"],[3000, 1400], [0, "", ""],[], "ACE_BackPack" call ISSE_Cfg_Weapons_GetName, "ACE_BackPack" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 2],["kupfer", 2],["plastik", 3]]],

["ACE_Rucksack_MOLLE_Brown", ["Waffe", "launcher"],["ACE_Rucksack_MOLLE_Brown", "Molle Brown Backpack"],[3000, 1400], [0, "", ""],[], "ACE_Rucksack_MOLLE_Brown" call ISSE_Cfg_Weapons_GetName, "ACE_Rucksack_MOLLE_Brown" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 2],["kupfer", 2],["plastik", 3]]],

["ACE_Rucksack_MOLLE_Brown_Medic", ["Waffe", "launcher"],["ACE_Rucksack_MOLLE_Brown_Medic", "Molle Brown Medic Backpack"],[3000, 1400], [0, "", ""],[], "ACE_Rucksack_MOLLE_Brown_Medic" call ISSE_Cfg_Weapons_GetName, "ACE_Rucksack_MOLLE_Brown_Medic" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 2],["kupfer", 2],["plastik", 3]]],

["ACE_Rucksack_MOLLE_Green", ["Waffe", "launcher"],["ACE_Rucksack_MOLLE_Green", "Molle Green Backpack"],[3000, 1400], [0, "", ""],[], "ACE_Rucksack_MOLLE_Green" call ISSE_Cfg_Weapons_GetName, "ACE_Rucksack_MOLLE_Green" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 2],["kupfer", 2],["plastik", 3]]],

["ACE_Rucksack_MOLLE_Wood", ["Waffe", "launcher"],["ACE_Rucksack_MOLLE_Wood", "Molle Woodland Backpack"],[3000, 1400], [0, "", ""],[], "ACE_Rucksack_MOLLE_Wood" call ISSE_Cfg_Weapons_GetName, "ACE_Rucksack_MOLLE_Wood" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 2],["kupfer", 2],["plastik", 3]]],

["ACE_Rucksack_MOLLE_ACU", ["Waffe", "launcher"],["ACE_Rucksack_MOLLE_ACU", "Molle ACU-Pattern Backpack"],[3000, 1400], [0, "", ""],[], "ACE_Rucksack_MOLLE_ACU" call ISSE_Cfg_Weapons_GetName, "ACE_Rucksack_MOLLE_ACU" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 2],["kupfer", 2],["plastik", 3]]],

["ACE_Rucksack_MOLLE_DMARPAT", ["Waffe", "launcher"],["ACE_Rucksack_MOLLE_DMARPAT", "Molle Desert-MARPAT Backpack"],[3000, 1400], [0, "", ""],[], "ACE_Rucksack_MOLLE_DMARPAT" call ISSE_Cfg_Weapons_GetName, "ACE_Rucksack_MOLLE_DMARPAT" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 2],["kupfer", 2],["plastik", 3]]],

["ACE_Rucksack_MOLLE_WMARPAT", ["Waffe", "launcher"],["ACE_Rucksack_MOLLE_WMARPAT", "Molle Woodland-MARPAT Backpack"],[3000, 1400], [0, "", ""],[], "ACE_Rucksack_MOLLE_WMARPAT" call ISSE_Cfg_Weapons_GetName, "ACE_Rucksack_MOLLE_WMARPAT" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 2],["kupfer", 2],["plastik", 3]]],

// ROCKETLAUNCHERS (Fixed for A2 - Tom)
["M136", ["Waffe", "launcher"],["M136", "M136 AT4"],[39000, 3500], [3, "explosive", "swat_training"],[], "M136" call ISSE_Cfg_Weapons_GetName, "M136" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 60],["kupfer", 30],["plastik", 20]]],

["JAVELIN", ["Waffe", "launcher"],["JAVELIN", "JAVELIN"], [250000, 90000], [3, "explosive", "swat_training"], [], "JAVELIN" call ISSE_Cfg_Weapons_GetName, "JAVELIN" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 60],["plastik", 20],["ebauteile", 5]]],

["Stinger",["Waffe", "launcher"],["Stinger", "Stinger AA Manpad"],[100000, 65000], [3, "explosive", "swat_training"],[], "Stinger" call ISSE_Cfg_Weapons_GetName,"Stinger" call ISSE_Cfg_Weapons_GetDesc,[["stahl", 60],["plastik", 20],["ebauteile", 5]]],

["STRELA", ["Waffe", "launcher"],["STRELA", "STRELA AA Manpad"], [150000, 70000], [3, "explosive", "swat_training"],[], "STRELA" call ISSE_Cfg_Weapons_GetName,"STRELA" call ISSE_Cfg_Weapons_GetDesc,[["stahl", 60],["plastik", 20],["ebauteile", 5]]],

["RPG7V", ["Waffe", "launcher"],["RPG7V", "RPG7"], [100000, 3500], [3, "explosive", "swat_training"], [], "RPG7V" call ISSE_Cfg_Weapons_GetName, "RPG7V" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 60],["plastik", 20],["ebauteile", 5]] ],



// PISTOLS (Fixed for A2 - Tom)
["Makarov",["Waffe", "pistol"],["Makarov", "Makarov 9x18mm"],[1150, 500], [1, "handgun", "patrol_training"],[], "Makarov" call ISSE_Cfg_Weapons_GetName,"Makarov" call ISSE_Cfg_Weapons_GetDesc,[["holz", 5],["stahl", 5]] ],

["MakarovSD", ["Waffe", "pistol"],["MakarovSD", "Makarov SD 9x18mm"], [1200, 350], [1, "handgun", "basic_police"], [], "MakarovSD" call ISSE_Cfg_Weapons_GetName, "MakarovSD" call ISSE_Cfg_Weapons_GetDesc, [["holz", 5],["stahl", 6]]],

["Colt1911", ["Waffe", "pistol"],["Colt1911", "Colt M1911"], [1900, 900], [1, "handgun", "patrol_training"], [], "Colt1911" call ISSE_Cfg_Weapons_GetName, "Colt1911" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 6],["holz", 5] ]],

["M9", ["Waffe", "pistol"],["M9", "Beretta 92 FS 9mm"],[1200, 600], [1, "handgun", "patrol_training"],[], "M9" call ISSE_Cfg_Weapons_GetName, "M9" call ISSE_Cfg_Weapons_GetDesc, [["stahl", 6],["plastik", 5] ]],

["M9SD",["Waffe", "pistol"],["M9SD", "Beretta 92 FS-SD 9mm"], [1600, 700], [1, "handgun", "patrol_training"],[], "M9SD" call ISSE_Cfg_Weapons_GetName,"M9SD" call ISSE_Cfg_Weapons_GetDesc,[["stahl", 7],["plastik", 5] ] ],

["x26", ["Waffe", "pistol"],["x26", "x26 Taser"], [1250, 500], [1, "handgun", "patrol_training"],[], "x26" call ISSE_Cfg_Weapons_GetName,"x26" call ISSE_Cfg_Weapons_GetDesc,[["stahl", 7],["plastik", 5] ] ],

["ACE_GlassesBalaklava", ["Waffe", "pistol"],["ACE_GlassesBalaklava", "Balaclava"],[4500, 1250], [1, "", ""], [], "ACE_GlassesBalaklava" call ISSE_Cfg_Weapons_GetName, "ACE_GlassesBalaklava" call ISSE_Cfg_Weapons_GetDesc, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_GlassesBalaklavaOlive", ["Waffe", "pistol"],["ACE_GlassesBalaklavaOlive", "Balaclava (Olive)"],[4500, 1250], [1, "", ""], [], "ACE_GlassesBalaklavaOlive" call ISSE_Cfg_Weapons_GetName, "ACE_GlassesBalaklavaOlive" call ISSE_Cfg_Weapons_GetDesc, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_GlassesBalaklavaGray", ["Waffe", "pistol"],["ACE_GlassesBalaklavaGray", "Balaclava (Gray)"],[4500, 1250], [1, "", ""], [], "ACE_GlassesBalaklavaGray" call ISSE_Cfg_Weapons_GetName, "ACE_GlassesBalaklavaGray" call ISSE_Cfg_Weapons_GetDesc, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_GlassesSunglasses", ["Waffe", "pistol"],["ACE_GlassesSunglasses", "Sunglasses"],[500, 250], [1, "", ""], [], "ACE_GlassesSunglasses" call ISSE_Cfg_Weapons_GetName, "ACE_GlassesSunglasses" call ISSE_Cfg_Weapons_GetDesc, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_GlassesBlackSun", ["Waffe", "pistol"],["ACE_GlassesBlackSun", "Black Sunglasses"],[500, 250], [1, "", ""], [], "ACE_GlassesBlackSun" call ISSE_Cfg_Weapons_GetName, "ACE_GlassesBlackSun" call ISSE_Cfg_Weapons_GetDesc, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_GlassesBlueSun", ["Waffe", "pistol"],["ACE_GlassesBlueSun", "Blue Sunglasses"],[500, 250], [1, "", ""], [], "ACE_GlassesBlueSun" call ISSE_Cfg_Weapons_GetName, "ACE_GlassesBlueSun" call ISSE_Cfg_Weapons_GetDesc, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_GlassesTactical", ["Waffe", "pistol"],["ACE_GlassesTactical", "Tactical Goggles"],[500, 250], [1, "", ""], [], "ACE_GlassesTactical" call ISSE_Cfg_Weapons_GetName, "ACE_GlassesTactical" call ISSE_Cfg_Weapons_GetDesc, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_Earplugs", ["Waffe", "pistol"],["ACE_Earplugs", "Eatplugs"],[100, 50], [1, "", ""], [], "ACE_Earplugs" call ISSE_Cfg_Weapons_GetName, "ACE_Earplugs" call ISSE_Cfg_Weapons_GetDesc, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_GlassesGasMask_US", ["Waffe", "pistol"],["ACE_GlassesGasMask_US", "Gasmask"],[4500, 1250], [1, "", ""], [], "ACE_GlassesGasMask_US" call ISSE_Cfg_Weapons_GetName, "ACE_GlassesGasMask_US" call ISSE_Cfg_Weapons_GetDesc, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_GlassesSpectacles", ["Waffe", "pistol"],["ACE_GlassesSpectacles", "Spectacles"],[250, 100], [1, "", ""], [], "ACE_GlassesSpectacles" call ISSE_Cfg_Weapons_GetName, "ACE_GlassesSpectacles" call ISSE_Cfg_Weapons_GetDesc, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_Stretcher",["Waffe", "pistol"],["ACE_Stretcher", "Stretcher"],[400, 250], [1, "medic", "medic"], [], "ACE_Stretcher" call ISSE_Cfg_Weapons_GetName, "ACE_Stretcher" call ISSE_Cfg_Weapons_GetDesc, [["kupfer", 1],["schwarzpulver", 1]] ],

["glock17_EP1", ["Waffe", "pistol"],["glock17_EP1", "Glock 17 9mm"],[2200, 1000], [1, "handgun", "patrol_training"],[], "glock17_EP1" call ISSE_Cfg_Weapons_GetName,"glock17_EP1" call ISSE_Cfg_Weapons_GetDesc,[["stahl", 6],["plastik", 5] ]],

["ACE_MugLite", ["Waffe", "pistol"],["ACE_MugLite", "Flashlight"],[550, 390], [1, "", ""],[], "ACE_MugLite" call ISSE_Cfg_Weapons_GetName,"ACE_MugLite" call ISSE_Cfg_Weapons_GetDesc,[["stahl", 3],["plastik", 1] ]],

["revolver_EP1", ["Waffe", "pistol"],["revolver_EP1", "Revolver .45 Silver"],[5500, 3500], [1, "handgun", "patrol_training"],[], "revolver_EP1" call ISSE_Cfg_Weapons_GetName,"revolver_EP1" call ISSE_Cfg_Weapons_GetDesc,[["stahl", 6],["plastik", 2] ]],

["revolver_gold_EP1", ["Waffe", "pistol"],["revolver_gold_EP1", "Revolver .45 Gold"],[8500, 4500], [1, "handgun", "patrol_training"],[], "revolver_gold_EP1" call ISSE_Cfg_Weapons_GetName,"revolver_gold_EP1" call ISSE_Cfg_Weapons_GetDesc,[["stahl", 6],["plastik", 2] ]]

];


// Weapon Magazine Arrays (Fixed for A2 - Tom)
INV_AlleMagazinObjekte = [


["8Rnd_B_Beneli_Pellets",["Magazin", "rifle"],["8Rnd_B_Beneli_Pellets", "8Rnds 00 Buckshot Ammo"],[320, 180], [1, "rifle", "patrol_training"], [], "8Rnd_B_Beneli_Pellets" call ISSE_Cfg_MagazineInfo, "8Rnd_B_Beneli_Pellets" call ISSE_Cfg_MagazineInfo, [["kupfer", 2],["schwarzpulver", 2]] ],

["8Rnd_B_Beneli_74Slug",["Magazin", "rifle"],["8Rnd_B_Beneli_74Slug", "8Rnds SLUGs Shotgun Ammo"],[350, 150], [1, "rifle", "patrol_training"], [], "8Rnd_B_Beneli_74Slug" call ISSE_Cfg_MagazineInfo, "8Rnd_B_Beneli_74Slug" call ISSE_Cfg_MagazineInfo, [["kupfer", 2],["schwarzpulver", 2]] ],

["x26_mag",["Magazin", "pistol"],["x26_mag", "X26 Cartridge"],[80, 50], [1, ""], [], "x26_mag" call ISSE_Cfg_MagazineInfo, "x26_mag" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["15Rnd_9x19_M9",["Magazin", "pistol"],["15Rnd_9x19_M9", "15Rnd 9mm M9/92FS Mag"],[120, 50], [1, ""], [], "15Rnd_9x19_M9" call ISSE_Cfg_MagazineInfo, "15Rnd_9x19_M9" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["15Rnd_9x19_M9SD",["Magazin", "pistol"],["15Rnd_9x19_M9SD", "15Rnd 9mm M9/92FS-SD Mag"],[140, 50], [1, ""], [], "15Rnd_9x19_M9SD" call ISSE_Cfg_MagazineInfo, "15Rnd_9x19_M9SD" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["8Rnd_9x18_Makarov",["Magazin", "pistol"],["8Rnd_9x18_Makarov", "8Rnd 9mm Makarov Mag"],[100, 50], [1, ""], [], "8Rnd_9x18_Makarov" call ISSE_Cfg_MagazineInfo, "8Rnd_9x18_Makarov" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["8Rnd_9x18_MakarovSD",["Magazin", "pistol"],["8Rnd_9x18_MakarovSD", "8Rnd Makarov SD 9x18mm"],[80, 50], [1, ""], [], "8Rnd_9x18_MakarovSD" call ISSE_Cfg_MagazineInfo, "8Rnd_9x18_MakarovSD" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["30Rnd_556x45_Stanag",["Magazin", "rifle"],["30Rnd_556x45_Stanag", "30Rnd 5.56mm Stanag"],[400, 100], [1, ""], [], "30Rnd_556x45_Stanag" call ISSE_Cfg_MagazineInfo, "30Rnd_556x45_Stanag" call ISSE_Cfg_MagazineInfo, [["kupfer", 3],["schwarzpulver", 2]] ],

["30Rnd_556x45_StanagSD",["Magazin", "rifle"],["30Rnd_556x45_StanagSD", "30Rnd 5.56mm Subsonic Stanag"],[450, 90], [1, ""], [], "30Rnd_556x45_StanagSD" call ISSE_Cfg_MagazineInfo, "30Rnd_556x45_StanagSD" call ISSE_Cfg_MagazineInfo, [["kupfer", 3],["schwarzpulver", 2]] ],

["30Rnd_556x45_G36", ["Magazin", "rifle"],["30Rnd_556x45_G36", "30Rnd G36 Mag"],[250, 50],[1, ""],[], "30Rnd_556x45_G36" call ISSE_Cfg_MagazineInfo, "30Rnd_556x45_G36" call ISSE_Cfg_MagazineInfo, [["kupfer", 3],["schwarzpulver", 2]] ],

["30rnd_9x19_MP5", ["Magazin", "rifle"],["30rnd_9x19_MP5", "30Rnd 9mm MP5 Mag"],[150, 50],[1, ""],[], "30rnd_9x19_MP5" call ISSE_Cfg_MagazineInfo, "30rnd_9x19_MP5" call ISSE_Cfg_MagazineInfo, [["kupfer", 3],["schwarzpulver", 2]] ],

["30rnd_9x19_MP5SD",["Magazin", "rifle"],["30rnd_9x19_MP5SD", "30Rnd 9mm MP5-SD Mag"],[160, 55],[1, ""],[], "30rnd_9x19_MP5SD" call ISSE_Cfg_MagazineInfo, "30rnd_9x19_MP5SD" call ISSE_Cfg_MagazineInfo, [["kupfer", 3],["schwarzpulver", 2]] ],

["30Rnd_545x39_AKSD", ["Magazin", "rifle"],["30Rnd_545x39_AKSD", "30Rnd 5.45 AK-74SD/AKSU-SD Mag"], [210, 50],[1, ""],[], "30Rnd_545x39_AKSD" call ISSE_Cfg_MagazineInfo,"30Rnd_545x39_AKSD" call ISSE_Cfg_MagazineInfo,[["kupfer", 3],["schwarzpulver", 2]] ],

["30Rnd_545x39_AK", ["Magazin", "rifle"],["30Rnd_545x39_AK", "30Rnd 5.45 AK-74/AKSU Mag"], [210, 50],[1, ""],[], "30Rnd_545x39_AK" call ISSE_Cfg_MagazineInfo,"30Rnd_545x39_AK" call ISSE_Cfg_MagazineInfo,[["kupfer", 3],["schwarzpulver", 2]] ],

["30Rnd_762x39_AK47", ["Magazin", "rifle"],["30Rnd_762x39_AK47", "30Rnd 7.62 AK-47 Mag"], [310, 50],[1, ""],[], "30Rnd_762x39_AK47" call ISSE_Cfg_MagazineInfo,"30Rnd_762x39_AK47" call ISSE_Cfg_MagazineInfo,[["kupfer", 3],["schwarzpulver", 2]] ],

["5Rnd_762x51_M24",["Magazin", "sniper"],["5Rnd_762x51_M24", "5Rnd M24 Mag"],[460, 150], [1, ""], [], "5Rnd_762x51_M24" call ISSE_Cfg_MagazineInfo, "5Rnd_762x51_M24" call ISSE_Cfg_MagazineInfo, [["kupfer", 3],["schwarzpulver", 2]] ],

["10Rnd_762x54_SVD", ["Magazin", "sniper"],["10Rnd_762x54_SVD", "10Rnd 7.62mm SVD Mag"],[370, 50],[1, ""],[], "10Rnd_762x54_SVD" call ISSE_Cfg_MagazineInfo, "10Rnd_762x54_SVD" call ISSE_Cfg_MagazineInfo, [["kupfer", 3],["schwarzpulver", 2]] ],

["5Rnd_127x108_KSVK",["Magazin", "sniper"],["5Rnd_127x108_KSVK", "5Rnd KSVK Mag"],[1350, 400], [1, ""], [], "5Rnd_127x108_KSVK" call ISSE_Cfg_MagazineInfo, "5Rnd_127x108_KSVK" call ISSE_Cfg_MagazineInfo, [["kupfer", 3],["schwarzpulver", 2]] ],

["100Rnd_762x51_M240",["Magazin", "mg"],["100Rnd_762x51_M240", "100Rnd 7.62mm M240 Mag"],[850, 200], [2, ""], [], "100Rnd_762x51_M240" call ISSE_Cfg_MagazineInfo, "100Rnd_762x51_M240" call ISSE_Cfg_MagazineInfo, [["kupfer", 12],["schwarzpulver", 8]] ],

["200Rnd_556x45_M249", ["Magazin", "mg"], ["200Rnd_556x45_M249", "200Rnd M249 Mag"], [800, 400],[2, ""],[], "200Rnd_556x45_M249" call ISSE_Cfg_MagazineInfo,"200Rnd_556x45_M249" call ISSE_Cfg_MagazineInfo,[["kupfer", 12],["schwarzpulver", 8]] ],

["100Rnd_762x54_PK",["Magazin", "mg"],["100Rnd_762x54_PK", "100Rnd PK Mag"],[725, 400], [2, ""], [], "100Rnd_762x54_PK" call ISSE_Cfg_MagazineInfo, "100Rnd_762x54_PK" call ISSE_Cfg_MagazineInfo, [["kupfer", 12],["schwarzpulver", 8]] ],

["1Rnd_HE_M203",["Magazin", "explosive"],["1Rnd_HE_M203", "M203 HE"],[300, 50], [3, "explosive"], [], "1Rnd_HE_M203" call ISSE_Cfg_MagazineInfo, "1Rnd_HE_M203" call ISSE_Cfg_MagazineInfo, [["kupfer", 3],["schwarzpulver", 5]] ],

["1Rnd_HE_GP25",["Magazin", "explosive"],["1Rnd_HE_GP25", "GP25/GP30 HE"],[300, 50], [3, "explosive"], [], "1Rnd_HE_GP25" call ISSE_Cfg_MagazineInfo, "1Rnd_HE_GP25" call ISSE_Cfg_MagazineInfo, [["kupfer", 3],["schwarzpulver", 5]] ],

["M136", ["Magazin", "rocket"],["M136", "AT4 AT Round"],[20000, 12000],[3, "explosive"],[], "M136" call ISSE_Cfg_MagazineInfo,"M136" call ISSE_Cfg_MagazineInfo,[["kupfer", 15],["schwarzpulver", 15]] ],

["Javelin", ["Magazin", "rocket"],["Javelin", "FGM-148 JAVELIN Rocket"], [150000, 60000], [3, "explosive"], [], "Javelin" call ISSE_Cfg_MagazineInfo, "Javelin" call ISSE_Cfg_MagazineInfo, [["kupfer", 10],["schwarzpulver", 10],["ebauteile", 2]]],

["Stinger",["Magazin", "rocket"],["STINGER", "STINGER AA Manpad Rocket"],[50000, 35000], [3, "explosive"], [], "STINGER" call ISSE_Cfg_MagazineInfo, "STINGER" call ISSE_Cfg_MagazineInfo, [["kupfer", 10],["schwarzpulver", 10],["ebauteile", 2]] ],

["PG7V", ["Magazin", "rocket"],["PG7V", "PG7V Rocket"],[25000, 12000], [3, "explosive", "swat_training"],[], "PG7V" call ISSE_Cfg_MagazineInfo,"PG7V" call ISSE_Cfg_MagazineInfo,[["kupfer", 10],["schwarzpulver", 10],["ebauteile", 2]]], 

["Strela", ["Magazin", "rocket"],["Strela", "STRELA AA Manpad Rocket"], [45000, 20000], [3, "explosive" , "swat_training"],[], "Strela" call ISSE_Cfg_MagazineInfo, "Strela" call ISSE_Cfg_MagazineInfo, [["kupfer", 10],["schwarzpulver", 10],["ebauteile", 2]]],

["HandGrenade_East", ["Magazin", "explosive"], ["HandGrenade_East", "RGO-1 Hand Grenade"], [550, 390],[4, "explosive", "swat_training"],[], "HandGrenade_East" call ISSE_Cfg_MagazineInfo,"HandGrenade_East" call ISSE_Cfg_MagazineInfo,[["stahl", 5],["schwarzpulver", 10]] ],

["Mine",["Magazin", "explosive"],["Mine", "Mine"],[5900, 1700], [4, "explosive", "swat_training"], [], "RndMine" call ISSE_Cfg_MagazineInfo, "Mine" call ISSE_Cfg_MagazineInfo, [["stahl", 10],["schwarzpulver", 10]] ],

["MineE",["Magazin", "explosive"], ["MineE", "Soviet Mine"], [5000, 2600],[4, "explosive", "swat_training"],[], "MineE" call ISSE_Cfg_MagazineInfo, "MineE" call ISSE_Cfg_MagazineInfo, [["stahl", 10],["schwarzpulver", 10]] ],

["PipeBomb",["Magazin", "explosive"],["PipeBomb", "Satchel Charge"],[4100, 1000], [4, "explosive", "swat_training"], [], "PipeBomb" call ISSE_Cfg_MagazineInfo, "PipeBomb" call ISSE_Cfg_MagazineInfo, [["stahl", 10],["schwarzpulver", 10]] ],

["FlareWhite_GP25",["Magazin", "equipment"], ["FlareWhite_GP25", "White GP25 Flare"], [100, 50],[0, ""],[], "FlareWhite_GP25" call ISSE_Cfg_MagazineInfo, "FlareWhite_GP25" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["FlareGreen_GP25",["Magazin", "equipment"], ["FlareGreen_GP25", "Green GP25 Flare"], [100, 50],[0, ""],[], "FlareGreen_GP25" call ISSE_Cfg_MagazineInfo, "FlareGreen_GP25" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["FlareRed_GP25",["Magazin", "equipment"],["FlareRed_GP25", "Red GP25 Flare"],[100, 50], [0, ""], [], "FlareRed_GP25" call ISSE_Cfg_MagazineInfo, "FlareRed_GP25" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["FlareYellow_GP25", ["Magazin", "equipment"], ["FlareYellow_GP25", "Yellow GP25 Flare"], [100, 50],[0, ""],[], "FlareYellow_GP25" call ISSE_Cfg_MagazineInfo, "FlareYellow_GP25" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["FlareWhite_M203",["Magazin", "equipment"], ["FlareWhite_M203", "White M203 Flare"], [100, 50],[0, ""],[], "FlareWhite_M203" call ISSE_Cfg_MagazineInfo, "FlareWhite_M203" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["FlareGreen_M203",["Magazin", "equipment"], ["FlareGreen_M203", "Green M203 Flare"], [100, 50],[0, ""],[], "FlareGreen_M203" call ISSE_Cfg_MagazineInfo, "FlareGreen_M203" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["FlareRed_M203",["Magazin", "equipment"],["FlareRed_M203", "Red M203 Flare"],[100, 50], [0, ""], [], "FlareRed_M203" call ISSE_Cfg_MagazineInfo, "FlareRed_M203" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["FlareYellow_M203", ["Magazin", "equipment"], ["FlareYellow_M203", "Yellow M203 Flare"], [100, 50],[0, ""],[], "FlareYellow_M203" call ISSE_Cfg_MagazineInfo, "FlareYellow_M203" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["SmokeShellRed",["Magazin", "equipment"],["SmokeShellRed", "Red Smoke Grenade"],[100, 50], [0, "", "patrol_training"], [], "SmokeShellRed" call ISSE_Cfg_MagazineInfo, "SmokeShellRed" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["SmokeShellGreen",["Magazin", "equipment"],["SmokeShellGreen", "Green Smoke Grenade"],[100, 50], [0, "", "patrol_training"], [], "SmokeShellGreen" call ISSE_Cfg_MagazineInfo, "SmokeShellGreen" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["SmokeShell", ["Magazin", "equipment"], ["SmokeShell", "White Smoke Grenade"],[100, 50],[0, ""],[], "SmokeShell" call ISSE_Cfg_MagazineInfo,"SmokeShell" call ISSE_Cfg_MagazineInfo,[["kupfer", 1],["schwarzpulver", 1]] ], 

["Laserbatteries", ["Magazin", "equipment"], ["Laserbatteries", "Laser Designator Battery"],[100, 50],[0, "", "patrol_training"],[], "Laserbatteries" call ISSE_Cfg_MagazineInfo,"Laserbatteries" call ISSE_Cfg_MagazineInfo,[["kupfer", 1],["schwarzpulver", 1]] ], 

["ACE_Bandage",["Magazin", "pistol"],["ACE_Bandage", "Bandage"],[200, 180], [1, "medic", "medic"], [], "ACE_Bandage" call ISSE_Cfg_MagazineInfo, "ACE_Bandage" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_LargeBandage",["Magazin", "pistol"],["ACE_LargeBandage", "Compress"],[300, 180], [1, "medic", "medic"], [], "ACE_LargeBandage" call ISSE_Cfg_MagazineInfo, "ACE_LargeBandage" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_IV",["Magazin", "pistol"],["ACE_IV", "IV Bag"],[300, 180], [1, "medic", "medic"], [], "ACE_IV" call ISSE_Cfg_MagazineInfo, "ACE_IV" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_Medkit",["Magazin", "pistol"],["ACE_Medkit", "Medkit"],[400, 180], [1, "medic", "medic"], [], "ACE_Medkit" call ISSE_Cfg_MagazineInfo, "ACE_Medkit" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_Plasma",["Magazin", "pistol"],["ACE_Plasma", "Plasma"],[350, 180], [1, "medic", "medic"], [], "ACE_Plasma" call ISSE_Cfg_MagazineInfo, "ACE_Plasma" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_Splint",["Magazin", "pistol"],["ACE_Splint", "Splint"],[100, 60], [1, "medic", "medic"], [], "ACE_Splint" call ISSE_Cfg_MagazineInfo, "ACE_Splint" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_Morphine",["Magazin", "pistol"],["ACE_Morphine", "Morphine"],[300, 180], [1, "medic", "medic"], [], "ACE_Morphine" call ISSE_Cfg_MagazineInfo, "ACE_Morphine" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_Epinephrine",["Magazin", "pistol"],["ACE_Epinephrine", "Epinephrine"],[500, 480], [1, "medic", "medic"], [], "ACE_Epinephrine" call ISSE_Cfg_MagazineInfo, "ACE_Epinephrine" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_Bodybag",["Magazin", "pistol"],["ACE_Bodybag", "Bodybag"],[250, 180], [1, "", ""], [], "ACE_Bodybag" call ISSE_Cfg_MagazineInfo, "ACE_Bodybag" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["7Rnd_45ACP_1911",["Magazin", "pistol"],["7Rnd_45ACP_1911", "7Rnd M1911 .45 Mag"],[140, 20], [1, ""], [], "7Rnd_45ACP_1911" call ISSE_Cfg_MagazineInfo, "7Rnd_45ACP_1911" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["17Rnd_9x19_glock17",["Magazin", "pistol"],["17Rnd_9x19_glock17", "17Rnd 9mm Glock 17 Mag"],[150, 20],[1, ""],[], "17Rnd_9x19_glock17" call ISSE_Cfg_MagazineInfo, "17Rnd_9x19_glock17" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["ACE_Flashbang",["Magazin", "equipment"],["ACE_Flashbang", "Flashbang"],[250, 160],[1, ""],[], "ACE_Flashbang" call ISSE_Cfg_MagazineInfo, "ACE_Flashbang" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ],

["HandGrenade_Stone",["Magazin", "equipment"],["HandGrenade_Stone", "Stone"],[20, 10],[1, ""],[], "HandGrenade_Stone" call ISSE_Cfg_MagazineInfo, "HandGrenade_Stone" call ISSE_Cfg_MagazineInfo, [["stone", 1]] ],

["ACE_Rope_TOW_M_5",["Magazin", "equipment"],["ACE_Rope_TOW_M_5", "Towing Rope"],[250, 160],[1, ""],[], "HandGrenade_Stone" call ISSE_Cfg_MagazineInfo, "HandGrenade_Stone" call ISSE_Cfg_MagazineInfo, [["plastik", 1]] ],

["ACE_Rope_M5",["Magazin", "equipment"],["ACE_Rope_M5", "Fast Rope"],[2500, 1600],[1, ""],[], "ACE_Rope_M5" call ISSE_Cfg_MagazineInfo, "ACE_Rope_M5" call ISSE_Cfg_MagazineInfo, [["plastik", 1]] ],

["ACE_ParachutePack",["Magazin", "launcher"],["ACE_ParachutePack", "Steerable Parachute"],[5500, 4600],[1, ""],[], "ACE_ParachutePack" call ISSE_Cfg_MagazineInfo, "ACE_ParachutePack" call ISSE_Cfg_MagazineInfo, [["plastik", 3]] ],

["ACE_Knicklicht_Y",["Magazin", "equipment"],["ACE_Knicklicht_Y", "Chemlight Yellow"],[350, 290],[1, ""],[], "ACE_Knicklicht_Y" call ISSE_Cfg_MagazineInfo, "ACE_Knicklicht_Y" call ISSE_Cfg_MagazineInfo, [["plastik", 2]] ],

["ACE_KeyCuffs",["Magazin", "equipment"],["ACE_KeyCuffs", "Handcuffs"],[350, 290],[1, ""],[], "ACE_KeyCuffs" call ISSE_Cfg_MagazineInfo, "ACE_KeyCuffs" call ISSE_Cfg_MagazineInfo, [["plastik", 2]] ],

["6Rnd_45ACP",["Magazin", "pistol"],["6Rnd_45ACP", "6Rnd 45ACP Revolver"],[140, 50], [1, ""], [], "6Rnd_45ACP" call ISSE_Cfg_MagazineInfo, "6Rnd_45ACP" call ISSE_Cfg_MagazineInfo, [["kupfer", 1],["schwarzpulver", 1]] ]

];

// Vehicle Array (Fixed for A2 - Tom)
INV_AlleFahrzeugeArray = [


["Zodiac",["Fahrzeug", "boat"],["Zodiac", "Zodiac"],[5000, 3000], [0, "boat", "basic_police"], [100,[1,0,0,4] ], "Zodiac" call ISSE_Cfg_Vehicle_GetName,"Zodiac" call ISSE_Cfg_Vehicle_GetDesc,[["plastik", 10],["mineraloel", 5]] ],

["Smallboat_2",["Fahrzeug", "boat"],["Smallboat_2", "Small Boat"],[5000, 3000], [0, "boat", "basic_police"], [100, [1,0,0,4]], "Smallboat_2" call ISSE_Cfg_Vehicle_GetName, "Smallboat_2" call ISSE_Cfg_Vehicle_GetDesc, [["plastik", 10],["mineraloel", 5]] ],

["PBX", ["Fahrzeug", "boat"],["PBX", "PBX"],[5000, 3000], [0, "boat", "basic_police"], [100,[1,1,0,3] ], "PBX" call ISSE_Cfg_Vehicle_GetName, "PBX" call ISSE_Cfg_Vehicle_GetDesc, [["plastik", 10],["mineraloel", 5]] ],

["RHIB",["Fahrzeug", "boat"],["RHIB", "RHIB 1 Turret"], [100000, 69000],[0, "boat", "swat_training"], [100,[1,2,0,10] ], "RHIB" call ISSE_Cfg_Vehicle_GetName, "RHIB" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 10],["plastik", 10],["mineraloel", 5]]],

["RHIB2Turret",["Fahrzeug", "boat"],["RHIB2Turret", "RHIB2Turret"], [180000, 110000],[0, "boat", "swat_training"], [100,[1,2,0,10] ], "RHIB2Turret" call ISSE_Cfg_Vehicle_GetName, "RHIB2Turret" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 10],["plastik", 10],["mineraloel", 5]]],

["Skoda",["Fahrzeug", "car"],["Skoda", "Skoda"],[5000, 2000], [1, "car", "basic_police"], [150, [1,0,0,3]], "Skoda" call ISSE_Cfg_Vehicle_GetName, "Skoda" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 3],["ebauteile", 1],["mineraloel", 1]] ],

["SkodaBlue",["Fahrzeug", "car"],["SkodaBlue", "Blue Skoda"],[5000, 2000], [1, "car", "basic_police"], [150, [1,0,0,3]], "SkodaBlue" call ISSE_Cfg_Vehicle_GetName, "SkodaBlue" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 3],["ebauteile", 1],["mineraloel", 1]] ],

["SkodaRed",["Fahrzeug", "car"],["SkodaRed", "Red Skoda"],[5000, 2000], [1, "car", "basic_police"], [150, [1,0,0,3]], "SkodaRed" call ISSE_Cfg_Vehicle_GetName, "SkodaRed" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 3],["ebauteile", 1],["mineraloel", 1]] ],

["SkodaGreen",["Fahrzeug", "car"],["SkodaGreen", "Green Skoda"],[5000, 2000], [1, "car", "basic_police"], [150, [1,0,0,3]], "SkodaGreen" call ISSE_Cfg_Vehicle_GetName, "SkodaGreen" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 3],["ebauteile", 1],["mineraloel", 1]] ],

["Car_hatchback",["Fahrzeug", "car"],["Car_hatchback", "Hatchback (yellow)"],[6000, 3000], [1, "car", "basic_police"], [150, [1,0,0,3]], "Car_hatchback" call ISSE_Cfg_Vehicle_GetName, "Car_hatchback" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 5],["ebauteile", 1],["mineraloel", 1]] ],

["Lada1",["Fahrzeug", "car"],["Lada1", "Lada (red)"],[6000, 3000], [1, "car", "basic_police"], [150, [1,0,0,3]], "Lada1" call ISSE_Cfg_Vehicle_GetName, "Lada1" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 5],["ebauteile", 1],["mineraloel", 1]] ],

["Car_Sedan",["Fahrzeug", "car"],["Car_Sedan", "Sedan (white)"],[6000, 3000], [1, "car", "basic_police"], [150, [1,0,0,3]], "Car_Sedan" call ISSE_Cfg_Vehicle_GetName, "Car_Sedan" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 5],["ebauteile", 1],["mineraloel", 1]] ],

["Tractor",["Fahrzeug", "car"],["Tractor", "Tractor"],[4000, 1500], [1, "car", "basic_police"], [100, [1,0,0,0]], "Tractor" call ISSE_Cfg_Vehicle_GetName, "Tractor" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 5],["ebauteile", 1],["mineraloel", 1]] ],

["ATV_US_EP1",["Fahrzeug", "car"],["ATV_US_EP1", "ATV"],[3000, 2500], [1, "car", "basic_police"], [100, [1,0,0,1]], "ATV_US_EP1" call ISSE_Cfg_Vehicle_GetName, "ATV_US_EP1" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 2],["ebauteile", 1],["mineraloel", 1]] ],

["M1030",["Fahrzeug", "car"],["M1030", "M1030"], [2000, 750], [1, "car", "patrol_training"], [50,[1,0,0,1] ], "M1030" call ISSE_Cfg_Vehicle_GetName, "M1030" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 1],["ebauteile", 1],["mineraloel", 1]]],

["TT650_Civ",["Fahrzeug", "car"],["TT650_Civ", "TT650"],[2000, 750], [1, "car", "patrol_training"], [50, [1,0,0,1]], "TT650_Civ" call ISSE_Cfg_Vehicle_GetName, "TT650_Civ" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 1],["ebauteile", 1],["mineraloel", 1]] ],

["MMT_Civ",["Fahrzeug", "car"],["MMT_Civ", "Mountainbike"],[400, 350], [1, "", ""], [50,[1,0,0,0] ], "MMT_Civ" call ISSE_Cfg_Vehicle_GetName,"MMT_Civ" call ISSE_Cfg_Vehicle_GetDesc,[["stahl", 1],["plastik", 1]]],

["LandRover_CZ_EP1",["Fahrzeug", "pickup"],["LandRover_CZ_EP1", "Landrover Closed"],[11000, 5000], [1, "pickup", "patrol_training"], [250, [1,0,0,6]], "LandRover_CZ_EP1" call ISSE_Cfg_Vehicle_GetName, "LandRover_CZ_EP1" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 20],["ebauteile", 5],["glas", 1],["mineraloel", 1]] ],

["hilux1_civil_1_open", ["Fahrzeug", "pickup"],["hilux1_civil_1_open", "Pickup(Open, Gold)"],[12500, 5000], [2, "pickup", "patrol_training"], [350,[1,0,0,1] ], "hilux1_civil_1_open" call ISSE_Cfg_Vehicle_GetName, "hilux1_civil_1_open" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 20],["ebauteile", 5],["mineraloel", 1]]],

["hilux1_civil_2_covered",["Fahrzeug", "pickup"],["hilux1_civil_2_covered", "Pickup(Covered, Red)"],[13500, 5000], [2, "pickup", "patrol_training"], [350,[1,0,0,1]], "hilux1_civil_2_covered" call ISSE_Cfg_Vehicle_GetName, "hilux1_civil_2_covered" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 20],["ebauteile", 5],["mineraloel", 1]] ], 

["hilux1_civil_3_open", ["Fahrzeug", "pickup"],["hilux1_civil_3_open", "Pickup(Open, Silver)"], [13500, 5000], [2, "pickup", "patrol_training"], [350, [1,0,0,1] ], "hilux1_civil_3_open" call ISSE_Cfg_Vehicle_GetName, "hilux1_civil_3_open" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 20],["ebauteile", 5],["mineraloel", 1]]],

["datsun1_civil_1_open",["Fahrzeug", "pickup"],["datsun1_civil_1_open", "Datsun(Open, Blue)"],[10500, 4000], [2, "pickup", "patrol_training"], [350,[1,0,0,1]], "datsun1_civil_1_open" call ISSE_Cfg_Vehicle_GetName, "datsun1_civil_1_open" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 20],["ebauteile", 5],["mineraloel", 1]] ], 

["datsun1_civil_2_covered",["Fahrzeug", "pickup"],["datsun1_civil_2_covered", "Datsun(Covered, Red)"],[10500, 5000], [2, "pickup", "patrol_training"], [350, [1,0,0,1] ], "datsun1_civil_2_covered" call ISSE_Cfg_Vehicle_GetName,"datsun1_civil_2_covered" call ISSE_Cfg_Vehicle_GetDesc,[["stahl", 20],["ebauteile", 5],["mineraloel", 1]] ], 

["datsun1_civil_3_open",["Fahrzeug", "pickup"],["datsun1_civil_3_open", "Datsun (Open, Green)"], [10500, 4000], [2, "pickup", "patrol_training"], [350, [1,0,0,1] ], "datsun1_civil_3_open" call ISSE_Cfg_Vehicle_GetName, "datsun1_civil_3_open" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 20],["ebauteile", 5],["mineraloel", 1]] ], 

["HMMWV",["Fahrzeug", "truck"],["HMMWV", "HMMWV"], [25000, 9000], [2, "pickup", "response_training"], [350, [1,1,0,3] ], "HMMWV" call ISSE_Cfg_Vehicle_GetName, "HMMWV" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 50],["ebauteile", 10],["glas", 5],["mineraloel", 3]] ],

["HMMWV_M2", ["Fahrzeug", "truck"],["HMMWV_M2", "HMMWV M2"], [80000, 32000],[2, "pickup", "swat_training"], [350, [1,1,0,1] ], "HMMWV_M2" call ISSE_Cfg_Vehicle_GetName, "HMMWV_M2" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 50],["ebauteile", 10],["mineraloel", 3],["schwarzpulver", 5]] ],

["UAZ_CDF",["Fahrzeug", "truck"],["UAZ_CDF", "UAZ"],[20000, 7500], [2, "pickup", "response_training"], [350,[1,1,0,1]], "UAZ_CDF" call ISSE_Cfg_Vehicle_GetName, "UAZ_CDF" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 50],["holz", 20],["ebauteile", 10],["glas", 5],["mineraloel", 3]] ],

["UAZ_MG_CDF",["Fahrzeug", "truck"],["UAZ_MG_CDF", "UAZ MG"],[80000, 40000], [2, "pickup", "swat_training"], [350,[1,1,0,1]], "UAZ_MG_CDF" call ISSE_Cfg_Vehicle_GetName, "UAZ_MG_CDF" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 50],["holz", 30],["ebauteile", 10],["mineraloel", 3],["schwarzpulver", 5]] ],

["UAZ_AGS30_CDF",["Fahrzeug", "truck"],["UAZ_AGS30_CDF", "UAZ AGS30"],[36000, 15500], [2, "pickup", "swat_training"], [350,[1,1,0,1]], "UAZ_AGS30_CDF" call ISSE_Cfg_Vehicle_GetName, "UAZ_AGS30_CDF" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 50],["holz", 20],["ebauteile", 10],["glas", 5],["mineraloel", 3]] ],

["MTVR",["Fahrzeug", "truck"],["MTVR", "MTVR"],[50000, 30000], [3, "truck", "response_training"], [500,[1,0,0,13]], "MTVR" call ISSE_Cfg_Vehicle_GetName, "MTVR" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 70],["holz", 20],["ebauteile", 10],["glas", 5],["mineraloel", 5]] ],

["Ikarus", ["Fahrzeug", "truck"],["Ikarus", "Bus"],[40000, 25000],[3, "truck", "response_training"], [500, [1,0,0,12] ], "Ikarus" call ISSE_Cfg_Vehicle_GetName,"Ikarus" call ISSE_Cfg_Vehicle_GetDesc,[["stahl", 50],["holz", 50],["ebauteile", 10],["glas", 30],["mineraloel", 5]] ],

["Ural_CDF",["Fahrzeug", "truck"],["Ural_CDF", "Ural"], [41000, 30000],[3, "truck", "patrol_training"], [500, [1,0,0,14] ], "Ural_CDF" call ISSE_Cfg_Vehicle_GetName, "Ural_CDF" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 70],["holz", 50],["ebauteile", 10],["glas", 5],["mineraloel", 5]] ],

["Ural_TK_CIV_EP1", ["Fahrzeug", "truck"],["Ural_TK_CIV_EP1", "Civil Ural #1"],[40500, 30000],[3, "truck", "patrol_training"], [500, [1,0,0,14] ], "Ural_TK_CIV_EP1" call ISSE_Cfg_Vehicle_GetName,"Ural_TK_CIV_EP1" call ISSE_Cfg_Vehicle_GetDesc,[["stahl", 70],["holz", 50],["ebauteile", 10],["glas", 5],["mineraloel", 5]] ],

["V3S_Civ",["Fahrzeug", "truck"],["V3S_Civ", "V3S Civ"],[40500, 30000], [3, "truck", "patrol_training"], [500,[1,0,0,14]], "V3S_Civ" call ISSE_Cfg_Vehicle_GetName, "V3S_Civ" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 70],["holz", 50],["ebauteile", 10],["glas", 5],["mineraloel", 5]] ],

["MH60S",["Fahrzeug", "air"],["MH60S", "MH60S"],[550000, 260000], [5, "air", "air_support_training"], [1000,[1,1,0,13]], "MH60S" call ISSE_Cfg_Vehicle_GetName, "MH60S" call ISSE_Cfg_Vehicle_GetDesc, [] ],

["Mi17_Civilian",["Fahrzeug", "air"],["Mi17_Civilian", "Mi17 Civilian"],[550000, 260000], [5, "air", "air_support_training"], [1000,[1,0,0,16]], "Mi17_Civilian" call ISSE_Cfg_Vehicle_GetName, "Mi17_Civilian" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 800],["ebauteile", 100],["glas", 20],["plastik", 70],["mineraloel", 100],["money",10000]] ],

["S1203_TK_CIV_EP1",["Fahrzeug", "pickup"],["S1203_TK_CIV_EP1", "S1203"],[22000, 10000], [1, "pickup", "basic_police"], [150, [1,0,0,3]], "S1203_TK_CIV_EP1" call ISSE_Cfg_Vehicle_GetName, "S1203_TK_CIV_EP1" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 10],["ebauteile", 1],["mineraloel", 3]] ],

["LadaLM",["Fahrzeug", "car"],["LadaLM", "Police VAZ"],[7000, 5000], [1, "car", "basic_police"], [150, [1,0,0,3]], "LadaLM" call ISSE_Cfg_Vehicle_GetName, "LadaLM" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 10],["ebauteile", 1],["mineraloel", 3]] ],

["rpp_hilux", ["Fahrzeug", "pickup"],["rpp_hilux", "Police Coyota"],[13500, 9000], [2, "pickup", "patrol_training"], [350,[1,0,0,1] ], "rpp_hilux" call ISSE_Cfg_Vehicle_GetName, "rpp_hilux" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 50],["ebauteile", 10],["glas", 5],["mineraloel", 3]]],

["rpp_hatch", ["Fahrzeug", "car"],["rpp_hatch", "Police Hatchback"],[12500, 9000], [2, "car", "patrol_training"], [350,[1,0,0,6] ], "rpp_hatch" call ISSE_Cfg_Vehicle_GetName, "rpp_hatch" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 50],["ebauteile", 10],["glas", 5],["mineraloel", 3]]],

["rpp_sedan", ["Fahrzeug", "car"],["rpp_sedan", "Police Sedan"],[11500, 8000], [2, "car", "patrol_training"], [350,[1,0,0,1] ], "rpp_sedan" call ISSE_Cfg_Vehicle_GetName, "rpp_sedan" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 50],["ebauteile", 10],["glas", 5],["mineraloel", 3]]],

["rpp_skoda",["Fahrzeug", "car"],["slr_policeSkoda", "Police Skoda 105"],[16000, 12000], [1, "car", "basic_police"], [150, [1,0,0,3]], "rpp_skoda" call ISSE_Cfg_Vehicle_GetName, "rpp_skoda" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 10],["ebauteile", 1],["mineraloel", 3]] ],

["S1203_ambulance_EP1", ["Fahrzeug", "pickup"],["S1203_ambulance_EP1", "S1203 Ambulance"],[21500, 16000], [2, "medic", "medic"], [350,[1,0,0,2] ], "S1203_ambulance_EP1" call ISSE_Cfg_Vehicle_GetName, "S1203_ambulance_EP1" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 50],["ebauteile", 10],["glas", 5],["mineraloel", 3]]],

["An2_1_TK_CIV_EP1", ["Fahrzeug", "air"],["An2_1_TK_CIV_EP1", "An2 Civilian"],[155500, 140000], [2, "air", "air_support_training"], [500,[1,0,0,8] ], "An2_1_TK_CIV_EP1" call ISSE_Cfg_Vehicle_GetName, "An2_1_TK_CIV_EP1" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 80],["ebauteile", 15],["glas", 8],["mineraloel", 4]]],

["An2_2_TK_CIV_EP1", ["Fahrzeug", "air"],["An2_2_TK_CIV_EP1", "An2 TakAir"],[155500, 140000], [2, "air", "air_support_training"], [500,[1,0,0,8] ], "An2_2_TK_CIV_EP1" call ISSE_Cfg_Vehicle_GetName, "An2_2_TK_CIV_EP1" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 80],["ebauteile", 15],["glas", 8],["mineraloel", 4]]],

["SUV_TK_CIV_EP1", ["Fahrzeug", "pickup"],["SUV_TK_CIV_EP1", "SUV black"],[155500, 140000], [2, "pickup", "patrol_training"], [650,[1,0,0,5] ], "SUV_TK_CIV_EP1" call ISSE_Cfg_Vehicle_GetName, "SUV_TK_CIV_EP1" call ISSE_Cfg_Vehicle_GetDesc, [["stahl", 60],["ebauteile", 12],["glas", 4],["mineraloel", 4]]]

];


// Item Arrays 
INV_AlleItemsArray = [

["money",["Item", "money"], ["money", "Money"], [1, 1],[0, ""],[true,true,true, false, ""],localize "STRS_item_money", localize "STRS_item_money_info",[]],

["illegal_money",["Item", "money"], ["Schwarzgeld", "Illegal Money"], [1, 1],[0, ""],[true,true,true, true, ""],localize "STRS_item_illegal_money", localize "STRS_item_illegal_money_info",[]],

["reparaturkit",["Item", "service"],["reparaturkit", "Large Repair Kit"],[4500, 2400], [10, "engineer", "patrol_training"],[true,true,true, false, "repairCar.sqf"],localize "STRS_inv_item_repairkit", localize "STRS_inv_item_repairkit_info",[["kupfer", 2],["ebauteile", 2],["plastik", 2]] ],

["kleinesreparaturkit", ["Item", "service"],["Kleines Reparaturkit", "Small Repair Kit"],[1000, 390], [4, "", "patrol_training"],[true,true,true, false, "smallRepairKit.sqf"],localize "STRS_inv_item_repairkit",localize "STRS_inv_item_repairkit_info",[["kupfer", 1],["ebauteile", 1],["plastik", 1]] ],

["kanister", ["Item", "service"],["kanister", "Refuel Can"], [35, 18], [7, "", "patrol_training"],[true,true,true, false, "refuelCan.sqf"], localize "STRS_inv_item_kanister", localize "STRS_inv_item_kanister_info",[["plastik", 1],["mineraloel", 1]] ],

["avgas_kanister", ["Item", "service"],["avgas_kanister", "AVGas Refuel Can"], [1500, 810], [20, "", ""],[true,true,true, false, "avgas_can.sqf"], localize "STRS_inv_item_avgascan", localize "STRS_inv_item_avgascan_info",[["plastik", 5],["mineraloel", 10]] ],

["schluesselbund",["Item", "carobjects"],["schluesselbund", "Key chain"],[0, 0], [0, ""], [false,false, false,false,"carKeys.sqf"],localize "STRS_inv_item_schluesselbund",localize "STRS_inv_item_schluesselb_info", [] ],

["pistole",["Item", "weapon"], ["pistole", "Pistol"],[0, 0],[0, ""],[false, false,true, true, "holsterGuns.sqf"], localize "STRS_inv_item_waffe",localize "STRS_inv_item_waffe_info", []],

["gewehr",["Item", "weapon"], ["gewehr", "Rifle"],[0, 0],[0, ""],[false, false,true, true, "holsterGuns.sqf"], localize "STRS_inv_item_waffe",localize "STRS_inv_item_waffe_info", []],

["nitro",["Item", "carobjects"],["nitro", "Nitro"], [7500, 7400], [12, "engineer", "patrol_training"],[true,true,true, false, "nitro.sqf"], localize "STRS_inv_item_nitro",localize "STRS_inv_item_nitro_info", [["plastik", 5],["mineraloel", 5]]],

["waffentasche",["Item", "misc"],["waffentasche", "Weaponbag"],[300, 150], [3, "patrol_training", "patrol_training"], [true, true, true,false,"weaponbag.sqf"],localize "STRS_inv_item_waffentascbe",localize "STRS_inv_item_waffentascbe_info", [["plastik", 2]]],

["defuser",["Item", "misc"], ["defuser", "Defuser"],[2500, 1200], [3, "bomb", "patrol_training"], [true,true,true, false, "bombDefuser.sqf"], localize "STRS_inv_item_defuser", localize "STRS_inv_item_defuser_info", [["kupfer", 4],["plastik", 4],["ebauteile", 4]]],

["bankversicherung", ["Item", "misc"], ["bankversicherung", "Bank insurance"],[3000, 1000], [0, ""],[true,true,true, false, "bankInsurance.sqf"], localize "STRS_item_versicherung", localize "STRS_item_versicherung_info",[]],

["seil",["Item", "carobjects"],["seil", "Rope"],[5000, 2500], [10, "air", "air_support_training"], [true, true, true,false,"heliLift.sqf"],localize "STRS_inv_item_seil",localize "STRS_inv_item_seil_info", [["stahl", 20]]],

["fernzuenderbombe",["Item", "bomb"],["fernzuenderbombe", "Remote Bomb"],[145000, 15000], [10, "engineer"], [true, true, true,true,"bombs.sqf"],localize "STRS_inv_item_fernbombe",localize "STRS_inv_item_fernbombe_info", [["schwarzpulver", 10],["ebauteile", 5],["plastik", 10]]],

["zeitzuenderbombe",["Item", "bomb"],["zeitzuenderbombe", "Time Bomb"],[140000, 12500], [10, "engineer", "swat_training"], [true, true, true,true,"bombs.sqf"],localize "STRS_inv_item_zeitbombe",localize "STRS_inv_item_zeitbombe_info", [["schwarzpulver", 10],["ebauteile", 5],["plastik", 10]] ],

["aktivierungsbombe", ["Item", "bomb"], ["aktivierungsbombe", "Activation Bomb"], [155000, 13000],[10, "engineer", "swat_training"],[true,true,true, true, "bombs.sqf"],localize "STRS_inv_item_enginebombe",localize "STRS_inv_item_enginebombe_info",[["schwarzpulver", 10],["ebauteile", 5],["plastik", 10]] ],

["geschwindigkeitsbombe",["Item", "bomb"], ["geschwindigkeitsbombe", "Speed Bomb"], [160000, 12500],[10, "engineer", "swat_training"],[true,true,true, true, "bombs.sqf"],localize "STRS_inv_item_speedbombe",localize "STRS_inv_item_speedbombe_info",[["schwarzpulver", 10],["ebauteile", 5],["plastik", 10]] ], 

["nuke",["Item", "bomb"], ["nuke", "Nuclear Bomb"], [160000, 12500],[10, "engineer", "swat_training"],[true,true,true, true, "bombs.sqf"],localize "STRS_inv_item_zeitbombe",localize "STRS_inv_item_zeitbombe",[["schwarzpulver", 10],["ebauteile", 5],["plastik", 10]] ], 

["lighter",["Item", "service"],["lighter", localize "STRS_inv_item_name_lighter"],[1340, 150], [3, "", ""],[true,true,true, false, "ignitefuel.sqf"],localize "STRS_inv_item_lighter", localize "STRS_inv_item_lighter_info",[["kupfer", 5],["plastik", 10]] ],

["fernzuender", ["Item", "bomb"], ["fernzuender", "Remote Control"], [1000, 750], [1, ""],[true,true,true, true, "bombs.sqf"],localize "STRS_inv_item_fernzuender",localize "STRS_inv_item_zuender_info", [["ebauteile", 3], ["kupfer", 1]]],

["smallillegalweapons",["Item", "misc"], ["smallillegalweapons", localize "STRS_inv_item_name_smallweaps"], [22500, 45000],[10, "", ""],[true,true,true, true, "hungerThirst.sqf"],localize "STRS_inv_item_illegalweapons",localize "STRS_inv_item_illegalweapons_info",[["schwarzpulver", 10],["ebauteile", 5],["holz", 10]] ], 

["mediumillegalweapons",["Item", "misc"], ["mediumillegalweapons", localize "STRS_inv_item_name_medweaps"], [65500, 110000],[20, "", ""],[true,true,true, true, "hungerThirst.sqf"],localize "STRS_inv_item_illegalweapons",localize "STRS_inv_item_illegalweapons_info",[["schwarzpulver", 20],["ebauteile", 5],["holz", 15]] ], 

["largeillegalweapons",["Item", "misc"], ["largeillegalweapons", localize "STRS_inv_item_name_largeweaps"], [105000, 215000],[35, "", ""],[true,true,true, true, "hungerThirst.sqf"],localize "STRS_inv_item_illegalweapons",localize "STRS_inv_item_illegalweapons_info",[["schwarzpulver", 35],["ebauteile", 5],["holz", 35]] ], 

["fisch",["Item", "ressource"],["fisch", localize "STRS_inv_item_name_fish"],[1000, 600], [1, ""], [true, true, true,false,"hungerThirst.sqf"],localize "STRS_inv_item_shortdesc_fish",localize "STRS_inv_item_nahrung_info", [] ],

["getreide", ["Item", "ressource"], ["getreide", localize "STRS_inv_item_name_korn"],[350, 220], [1, ""],[true,true,true, false, "hungerThirst.sqf"], localize "STRS_inv_item_shortdesc_korn", localize "STRS_inv_item_nahrung_info", []],

["hopfen", ["Item", "ressource"], ["hopfen", localize "STRS_inv_item_name_hopfen"],[150, 100], [1, ""],[true,true,true, false, "hungerThirst.sqf"], localize "STRS_inv_item_shortdesc_korn", localize "STRS_item_farmitem_info", []],

["rotetrauben", ["Item", "ressource"], ["rotetrauben", localize "STRS_inv_item_name_redtrauben"],[250, 270], [1, ""],[true,true,true, false, "hungerThirst.sqf"], localize "STRS_inv_item_shortdesc_korn", localize "STRS_item_farmitem_info", []],

["rotetraubenHQ", ["Item", "ressource"], ["rotetraubenHQ", localize "STRS_inv_item_name_redtraubenhg"],[450, 450], [1, ""],[true,true,true, false, "hungerThirst.sqf"], localize "STRS_inv_item_shortdesc_korn", localize "STRS_item_farmitem_info", []],

["weissetrauben", ["Item", "ressource"], ["weissetrauben", localize "STRS_inv_item_name_whitetrauben"],[250, 250], [1, ""],[true,true,true, false, "hungerThirst.sqf"], localize "STRS_inv_item_shortdesc_korn", localize "STRS_item_farmitem_info", []],

["weissetraubenHQ", ["Item", "ressource"], ["weissetraubenHQ", localize "STRS_inv_item_name_whitetraubenhg"],[450, 420], [1, ""],[true,true,true, false, "hungerThirst.sqf"], localize "STRS_inv_item_shortdesc_korn", localize "STRS_item_farmitem_info", []],

["tabak", ["Item", "ressource"], ["tabak", localize "STRS_inv_item_name_tabak"],[550, 450], [1, ""],[true,true,true, false, "hungerThirst.sqf"], localize "STRS_inv_item_shortdesc_korn", localize "STRS_item_farmitem_info", []],

["Shark",["Item", "ressource"],["Shark", localize "STRS_inv_item_name_shark"],[5000, 1500], [20, ""], [true, true, true,false,"hungerThirst.sqf"],localize "STRS_inv_item_shortdesc_shark",localize "STRS_inv_item_nahrung_info", [] ],

["Whale",["Item", "ressource"],["Whale", localize "STRS_inv_item_name_whale"],[10000, 6500], [40, ""], [true, true, true,false,"hungerThirst.sqf"],localize "STRS_inv_item_shortdesc_whale",localize "STRS_inv_item_nahrung_info", [["getreide", 1]] ],

["salzwasser", ["Item", "ressource"],["salzwasser", localize "STRS_inv_item_name_salzwasser"],[2000, 200],[1, ""],[true,true,true, false, "useResource.sqf"], localize "STRS_inv_item_shortdesc_water", localize "STRS_item_farmitem_info", []],

["quellwasser", ["Item", "ressource"],["quellwasser", localize "STRS_inv_item_name_quellwasser"],[2000, 300],[1, ""],[true,true,true, false, "thirst.sqf"], localize "STRS_inv_item_shortdesc_water", localize "STRS_inv_item_getraenke_info", []],

["quellwasserhq", ["Item", "ressource"],["quellwasserhq", localize "STRS_inv_item_name_quellwasserhq"],[2000, 600],[1, ""],[true,true,true, false, "thirst.sqf"], localize "STRS_inv_item_shortdesc_water", localize "STRS_inv_item_getraenke_info", []],

["lowqualitywater",["Item", "drink"],["lowqualitywater", localize "STRS_inv_item_name_bottlewater_low"],[150, 50], [1, ""], [true, true, true,false,"thirst.sqf"],localize "STRS_inv_item_shortdesc_bottlewater_low",localize "STRS_inv_item_getraenke_info", [["salzwasser", 1]] ],

["normqualitywater1",["Item", "drink"],["normqualitywater1", localize "STRS_inv_item_name_bottlewater_no1"],[600, 220], [1, ""], [true, true, true,false,"thirst.sqf"],localize "STRS_inv_item_shortdesc_bottlewater_no1",localize "STRS_inv_item_getraenke_info", [["salzwasser", 2]] ],

["normqualitywater2",["Item", "drink"],["normqualitywater1", localize "STRS_inv_item_name_bottlewater_no2"],[850, 250], [1, ""], [true, true, true,false,"thirst.sqf"],localize "STRS_inv_item_shortdesc_bottlewater_no2",localize "STRS_inv_item_getraenke_info", [["quellwasser", 2]] ],

["highqualitywater",["Item", "drink"],["highqualitywater", localize "STRS_inv_item_name_bottlewater_hq"],[1200, 450], [1, ""], [true, true, true,false,"thirst.sqf"],localize "STRS_inv_item_shortdesc_bottlewater_hq",localize "STRS_inv_item_getraenke_info", [["quellwasserhq", 1]] ],

["bier",["Item", "drink"],["bier", localize "STRS_inv_item_name_bier"],[50, 50], [1, ""], [true, true, true,false,"alkeffekt.sqf"],localize "STRS_inv_item_shortdesc_alkohol_generic",localize "STRS_inv_item_alkohol_info", [["quellwasser", 2], ["hopfen", 2]] ],

["weizenbier",["Item", "drink"],["weizenbier", localize "STRS_inv_item_name_weizenbier"],[80, 80], [1, ""], [true, true, true,false,"alkeffekt.sqf"],localize "STRS_inv_item_shortdesc_alkohol_generic",localize "STRS_inv_item_alkohol_info", [["quellwasser", 2], ["hopfen", 1], ["getreide", 1]] ],

["starkbier",["Item", "drink"],["starkbier", localize "STRS_inv_item_name_Starkbier"],[120, 120], [1, ""], [true, true, true,false,"alkeffekt.sqf"],localize "STRS_inv_item_shortdesc_alkohol_generic",localize "STRS_inv_item_alkohol_info", [["quellwasserhq", 2], ["hopfen", 3]] ],

["rotwein",["Item", "drink"],["rotwein", localize "STRS_inv_item_name_rotwein"],[75, 75], [1, ""], [true, true, true,false,"alkeffekt.sqf"],localize "STRS_inv_item_shortdesc_alkohol_generic",localize "STRS_inv_item_alkohol_info", [["quellwasser", 2], ["rotetrauben", 3]] ],

["rotweinhq",["Item", "drink"],["rotweinhq", localize "STRS_inv_item_name_rotweinhq"],[350, 350], [1, ""], [true, true, true,false,"alkeffekt.sqf"],localize "STRS_inv_item_shortdesc_alkohol_generic",localize "STRS_inv_item_alkohol_info", [["quellwasserhq", 2], ["rotetraubenHQ", 3]] ],

["weisswein",["Item", "drink"],["weisswein", localize "STRS_inv_item_name_weisswein"],[70, 70], [1, ""], [true, true, true,false,"alkeffekt.sqf"],localize "STRS_inv_item_shortdesc_alkohol_generic",localize "STRS_inv_item_alkohol_info", [["quellwasser", 2], ["weissetrauben", 3]] ],

["weissweinhq",["Item", "drink"],["weissweinhq", localize "STRS_inv_item_name_weissweinhq"],[320, 320], [1, ""], [true, true, true,false,"alkeffekt.sqf"],localize "STRS_inv_item_shortdesc_alkohol_generic",localize "STRS_inv_item_alkohol_info", [["quellwasserhq", 2], ["weissetraubenHQ", 3]] ],

["zigarre",["Item", "drink"],["zigarre", localize "STRS_inv_item_name_cigar"],[400, 370], [1, ""], [true, true, true,false,"alkeffekt.sqf"],localize "STRS_inv_item_shortdesc_zigarre_generic",localize "STRS_inv_item_tobacco_info", [["tabak", 2]] ],

["zigarrefatlady",["Item", "drink"],["zigarrefatlady", localize "STRS_inv_item_name_cigarfatlady"],[1200, 1000], [1, ""], [true, true, true,false,"alkeffekt.sqf"],localize "STRS_inv_item_shortdesc_zigarre_generic",localize "STRS_inv_item_tobacco_info", [["tabak", 4]] ],

["soup",["Item", "food"],["soup", localize "STRS_inv_item_name_soup"],[200, 150], [0.1, ""], [true, true, true,false,"hungerThirst.sqf"],localize "STRS_inv_item_shortdesc_soup",localize "STRS_inv_item_nahrung_info", [["salzwasser", 2]] ],

["donut",["Item", "food"],["donut", localize "STRS_inv_item_name_donut"],[250, 150], [0.1, ""], [true, true, true,false,"hungerThirst.sqf"],localize "STRS_inv_item_shortdesc_donut",localize "STRS_inv_item_nahrung_info", [["getreide", 1], ["quellwasser", 1]] ],

["bread", ["Item", "food"], ["bread", localize "STRS_inv_item_name_bread"],[1000, 850], [1, ""],[true,true,true, false, "hungerThirst.sqf"], localize "STRS_inv_item_shortdesc_bread", localize "STRS_inv_item_nahrung_info", [["getreide", 5]] ],

//["cerealbar", ["Item", "food"], ["cerealbar", "Cereal bar"],[5000, 3500], [1, ""],[true,true,true, false, "hungerThirst.sqf"], localize "STRS_inv_item_shortdesc_cerealbar", localize "STRS_inv_item_nahrung_info", [["apple", 1],["getreide",1]] ],

["fish_filet", ["Item", "food"], ["fish_filet", localize "STRS_inv_item_name_fish_filet"],[1500, 1200], [1, ""],[true,true,true, false, "hungerThirst.sqf"], localize "STRS_inv_item_shortdesc_fishfilets", localize "STRS_inv_item_nahrung_info", [["fisch", 2]]],

["whale_filet", ["Item", "food"], ["whale_filet", localize "STRS_inv_item_name_whale_filet"],[3200, 2800], [1, ""],[true,true,true, false, "hungerThirst.sqf"], localize "STRS_inv_item_shortdesc_whalefilets", localize "STRS_inv_item_nahrung_info", [["Whale", 1]]],

["shark_filet", ["Item", "food"], ["shark_filet", localize "STRS_inv_item_name_shark_filet"],[2000, 1850], [1, ""],[true,true,true, false, "hungerThirst.sqf"], localize "STRS_inv_item_shortdesc_sharkfilets", localize "STRS_inv_item_nahrung_info", [["shark", 1]]],

["SpawnObj_Fortress",["Item", "object"],["SpawnObj_Fortress", "Fortress"],[4000, 2500], [10, "patrol_training", "swat_training"], [true, true, true,false,"placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["stahl", 10], ["sand", 20]]],

["SpawnObj_Danger",["Item", "object"],["SpawnObj_Danger", "Danger"],[250, 100], [1, "patrol_training", "swat_training"], [true, true, true,false,"placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["holz", 2], ["plastik", 1]]], 

["SpawnObj_Gate",["Item", "object"], ["SpawnObj_Gate", "Gate"], [1700, 500], [7, "patrol_training", "swat_training"],[true,true,true, false, "placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["holz", 10], ["plastik", 1]]],

["SpawnObj_Shed",["Item", "object"],["SpawnObj_Shed", "Shed"],[5000, 3500], [10, "patrol_training", "swat_training"], [true, true, true,false,"placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["stahl", 10], ["holz", 20]]], 

["SpawnObj_Wall",["Item", "object"], ["SpawnObj_Wall", "Wall"], [1800, 500], [10, "patrol_training", "swat_training"],[true,true,true, false, "placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["stone", 10]]],

["SpawnObj_Wire",["Item", "object"],["SpawnObj_Wire", "Wire"],[1250, 750], [15, "patrol_training", "swat_training"], [true, true, true,false,"placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["stahl", 15]]],

["SpawnObj_RoadCone",["Item", "object"],["SpawnObj_RoadCone", "Road Cone"],[100, 50], [1, "patrol_training", "response_training"], [true, true, true,false,"placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["plastik", 1]]], 

["SpawnObj_blinkbarrier",["Item", "object"],["SpawnObj_blinkbarrier", "Roadbarrier (blinking)"],[500, 100], [1, "patrol_training", "response_training"], [true, true, true,false,"placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["plastik", 1]]], 

["SpawnObj_Fire",["Item", "object"], ["SpawnObj_Fire", "Fire Place"], [200, 100], [1, "patrol_training", "swat_training"],[true,true,true, false, "placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["holz", 5]]], 

["SpawnObj_FenceWood", ["Item", "object"], ["SpawnObj_FenceWood", "Sandbag Wall"],[1000, 500], [5, "patrol_training", "swat_training"],[true,true,true, false, "placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["sand", 5], ["plastik", 5]]],

["SpawnObj_WireFence",["Item", "object"],["SpawnObj_WireFence", "Fence"],[1500, 750], [10, "patrol_training", "swat_training"], [true, true, true,false,"placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["holz", 10],["stahl", 10]]],

["SpawnObj_RoadBarrier_long",["Item", "object"],["SpawnObj_RoadBarrier_long", "Roadbarrier"],[1500, 750], [5, ""], [true, true, true,false,"placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["stahl", 15]]],

["SpawnObj_MgPillbox", ["Item", "object"], ["SpawnObj_MgPillbox", "MG Pillbox (M240G)"],[35000, 22000], [15, "swat_training", "swat_training"],[true,true,true, false, "placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["holz", 10], ["stahl", 5]]],

["SpawnObj_MgPillboxE", ["Item", "object"], ["SpawnObj_MgPillboxE", "MG Pillbox (PK)"],[95000, 29000], [15, "swat_training", "swat_training"],[true,true,true, false, "placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["holz", 10], ["stahl", 5]]],

["SpawnObj_minibunker", ["Item", "object"], ["SpawnObj_minibunker", "Mini-Bunker(unarmed)"],[12000, 7000], [10, "patrol_training", "response_training"],[true,true,true, false, "placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["holz", 10]]],

["SpawnObj_stall1",["Item", "object"],["SpawnObj_stall1", "Market Stall"],[3500, 750], [15, "", "", ""], [true, true, true,false,"placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["holz", 5], ["stahl", 10]]],

["SpawnObj_houses",["Item", "object"],["SpawnObj_houses", "Small House"],[80000, 13000], [40, "realestate_license", "patrol_training"], [true, true, true,false,"placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["holz", 50], ["bricks", 25]] ],

["SpawnObj_housem",["Item", "object"],["SpawnObj_housem", "Medium sized house"],[300000, 230000], [40, "realestate_license", "patrol_training"], [true, true, true,false,"placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["holz", 90], ["bricks", 70]] ],

["SpawnObj_apartment",["Item", "object"],["SpawnObj_apartment", "Apartment Block"],[550000, 75000], [40, "realestate_license", "patrol_training"], [true, true, true,false,"placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["holz", 200], ["bricks", 200]] ],

["SpawnObj_mansion",["Item", "object"],["SpawnObj_mansion", "Mansion"],[760000, 200000], [40, "realestate_license", "patrol_training"], [true, true, true,false,"placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["holz", 150], ["bricks", 100]] ],

["SpawnObj_hotel",["Item", "object"],["SpawnObj_hotel", "Hotel Complex"],[840000, 200000], [40, "realestate_license", "patrol_training"], [true, true, true,false,"placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["holz", 500], ["bricks", 350]] ],

["SpawnObj_villa",["Item", "object"],["SpawnObj_villa", "Villa"],[300000, 50000], [40, "realestate_license", "patrol_training"], [true, true, true,false,"placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["holz", 180], ["bricks", 150]] ],

["SpawnObj_Ramp", ["Item", "object"], ["SpawnObj_Ramp", "Ramp"],[20000, 12500], [20, "patrol_training", "swat_training"],[true,true,true, false, "placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["holz", 10], ["stone", 5]]],

["SpawnObj_SearchLight", ["Item", "object"], ["SpawnObj_SearchLight", "SearchLight"],[1500, 500], [10, "patrol_training", "swat_training"],[true,true,true, false, "placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["stahl", 5], ["plastik", 5]]],

["SpawnObj_Ladder", ["Item", "object"], ["SpawnObj_Ladder", "Ladder"],[900, 500], [10, "patrol_training", "swat_training"],[true,true,true, false, "placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["stahl", 5], ["holz", 5]]],

["SpawnObj_CampEmpty", ["Item", "object"], ["SpawnObj_CampEmpty", "Tent big"],[2000, 500], [10, "patrol_training", "swat_training"],[true,true,true, false, "placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["sand", 5], ["plastik", 5]]],

["SpawnObj_CampEast", ["Item", "object"], ["SpawnObj_CampEast", "Tent small"],[1500, 500], [10, "patrol_training", "swat_training"],[true,true,true, false, "placeObj.sqf"],localize "STRS_inv_item_objs",localize "STRS_inv_item_objs_info", [["sand", 5], ["plastik", 5]]],

["holz",["Item", "ressource"],["holz", "Mixed Wood"],[250, 100], [1, ""], [true, true, true,false,"useResource.sqf"],localize "STRS_item_holz",localize "STRS_item_farmitem_info", [] ],

["stone",["Item", "ressource"],["stone", "Stone"],[200, 100], [2, ""], [true, true, true,false,"useResource.sqf"],localize "STRS_item_stone",localize "STRS_item_farmitem_info", [] ],

["bricks",["Item", "ressource"],["bricks", "Bricks"], [1500, 400],[2, ""],[true,true,true, false, "useResource.sqf"], localize "STRS_item_bricks", localize "STRS_item_farmitem_info", [["stone", 1]] ],

["eisenerz",["Item", "ressource"],["eisenerz", "Iron ore"], [700, 100],[2, ""],[true,true,true, false, "useResource.sqf"], localize "STRS_item_eisenerz",localize "STRS_item_farmitem_info", []],

["gold_nugget",["Item", "ressource"],["gold_nugget", "Gold-Nugget"], [2400, 600],[1, ""],[true,true,true, false, "useResource.sqf"], localize "STRS_item_gold",localize "STRS_item_farmitem_info", []],

["gold_barren",["Item", "ressource"],["gold_barren", "Gold Bar"], [80000, 45000],[5, ""],[true,true,true, false, "useResource.sqf"], localize "STRS_item_goldbarren",localize "STRS_item_farmitem_info", [["gold_nugget", 20], ["kohle", 5]]],

["Diamond",["Item", "ressource"],["Diamond", "Diamond"],[2500, 800], [2, ""], [true, true, true,false,"useResource.sqf"],localize "STRS_item_Diamond",localize "STRS_item_farmitem_info", []],

["mineraloel",["Item", "ressource"],["mineraloel", "Mineral oil"],[500, 250], [2, ""], [true, true, true,false,"useResource.sqf"],localize "STRS_item_mineraloel",localize "STRS_item_farmitem_info", [["erdoel", 1]]], 

["ebauteile", ["Item", "ressource"],["ebauteile", "Electronic components"],[50, 25],[3, ""],[true,true,true, false, "useResource.sqf"], localize "STRS_item_ebauteile",localize "STRS_item_farmitem_info", [["silizium", 1],["kupfer", 1]] ],

["silizium", ["Item", "ressource"],["silizium", "Silicon"], [25, 10],[2, ""],[true,true,true, false, "useResource.sqf"], localize "STRS_item_silizium",localize "STRS_item_farmitem_info", []],

["kupfer",["Item", "ressource"], ["kupfer", "Copper"],[1500, 250],[2, ""],[true,true,true, false, "useResource.sqf"], localize "STRS_item_kupfer",localize "STRS_item_farmitem_info", []],

["stahl",["Item", "ressource"],["stahl", "Steel"], [1500, 400],[2, ""],[true,true,true, false, "useResource.sqf"], localize "STRS_item_stahl", localize "STRS_item_farmitem_info", [["eisenerz", 1],["kohle", 1]] ],

["schwarzpulver",["Item", "ressource"],["schwarzpulver", "Black powder"],[50, 25], [2, ""], [true, true, true,false,"useResource.sqf"],localize "STRS_item_schwarzpulver",localize "STRS_item_farmitem_info", [["kohle", 1],["schwefel", 1]]], 

["schwefel", ["Item", "ressource"],["schwefel", "Sulfur"],[1500, 350],[2, ""],[true,true,true, false, "useResource.sqf"], localize "STRS_item_schwefel",localize "STRS_item_farmitem_info", []],

["kohle",["Item", "ressource"],["kohle", "Coal"],[1800, 400], [2, ""], [true, true, true,false,"useResource.sqf"],localize "STRS_item_kohle",localize "STRS_item_farmitem_info", [["holz", 1]]],

["erdoel",["Item", "ressource"],["erdoel", "Petroleum"], [1200, 350],[2, ""],[true,true,true, false, "useResource.sqf"], localize "STRS_item_erdoel",localize "STRS_item_farmitem_info", []],

["glas",["Item", "ressource"],["glas", "Glass"], [4500, 450],[3, ""],[true,true,true, false, "useResource.sqf"], localize "STRS_item_glas", localize "STRS_item_farmitem_info", [["sand", 2],["kohle", 1],["silizium", 1]] ],

["plastik",["Item", "ressource"],["plastik", "Plastic"],[7000, 700], [2, ""], [true, true, true,false,"useResource.sqf"],localize "STRS_item_plastik",localize "STRS_item_farmitem_info", [["mineraloel", 1], ["sand", 1]]],

["sand",["Item", "ressource"],["sand", "Sand"],[25, 10], [2, ""], [true, true, true,false,"useResource.sqf"],localize "STRS_item_sand",localize "STRS_item_farmitem_info", [] ],

["stahlwolle", ["Item", "ressource"],["stahlwolle", "Steel wool"],[5000, 500],[2, ""],[true,true,true, false, "useResource.sqf"], localize "STRS_item_stahlwolle", localize "STRS_item_farmitem_info", [["stahl", 1]]],

["selbstmordbombe",["Item", "bomb"],["selbstmordbombe", "Suicide Bomb"],[120000, 1500], [15, ""], [true, true, true,true,"suicideBomb.sqf"],localize "STRS_inv_item_selbstmordbombe",localize "STRS_inv_item_selbstmordbombe_info", [["schwarzpulver", 10],["ebauteile", 5],["plastik", 10]]],

["kokain",["Item", "drug"],["kokain", "Finest Quality Cocaine"],[35000, 35000],[1, ""], [true, true, true,true,"drugs.sqf"],localize "STRS_inv_item_cocain",localize "STRS_inv_item_drogen_info", [] ],

["kokain_low",["Item", "drug"],["kokain_low", "Low Quality Cocaine"],[12000, 20000],[1, ""], [true, true, true,true,"drugs.sqf"],localize "STRS_inv_item_cocain_low",localize "STRS_inv_item_drogen_info", [] ],

["marihuana",["Item", "drug"],["marihuana", "Marihuana"],[5500, 18000], [1, ""], [true, true, true,true,"drugs.sqf"],localize "STRS_inv_item_marihuana",localize "STRS_inv_item_drogen_info", [] ],

["lsd", ["Item", "drug"], ["lsd", "LSD"],[5000, 13000], [1, ""],[true,true,true, true, "drugs.sqf"], localize "STRS_inv_item_lsd",localize "STRS_inv_item_drogen_info", []  ],

["handy",["Item", "misc"], ["handy", "Mobile Phone"], [300, 150], [1, ""],[true,true,true, false, "cellPhone.sqf"], localize "STRS_inv_item_handy",localize "STRS_inv_item_handy_info", [["kupfer", 1],["plastik", 1],["ebauteile", 1]]],

["strassensperre",["Item", "misc"],["strassensperre", "Roadblock"],[0, 0], [0, ""], [false, false, false,false,"roadblock.sqf"],localize "STRS_inv_item_roadblock",localize "STRS_inv_item_roadblock_info", [] ],

["vclammo",["Item", "carobjects"],["vclammo", "Vehicle Ammo"],[17500, 11250], [50, "engineer"], [true, true, true,!(iscop),"rearmVeh.sqf"],localize "STRS_inv_item_vclammo",localize "STRS_inv_item_vclammo_info", [["stahl", 10],["kupfer", 5], ["schwarzpulver", 10]] ],

["hideout",["Item", "misc"],["hideout", "Hideout"],[1, 1], [0, ""], [false, true, false,false,"hideout.sqf"],localize "STRS_item_hideout",localize "STRS_item_hideout_info", [] ],

["stoersender",["Item", ",misc"],["stoersender", "Radio jammer"],[15000, 7500],[15, ""], [true, true, true,true,"markerJammer.sqf"],localize "STRS_item_stoersender",localize "STRS_item_stoersender_info", [["kupfer", 4],["plastik", 4],["ebauteile", 4]] ],

["stoersender_improved",["Item", ",misc"],["stoersender_improved", "Radio jammer (improved)"],[15000, 7500],[15, ""], [true, true, true,true,"markerJammer.sqf"],localize "STRS_item_stoersender",localize "STRS_item_stoersender_info", [["kupfer", 4],["plastik", 4],["ebauteile", 4]] ],

["lockpick", ["Item", "carobjects"],["Dietrich", "Lock Pick"], [1000, 500], [1, "lockpick", "patrol_training"],[true,true,true, false, "lockpick.sqf"],localize "STRS_item_lockpick",localize "STRS_item_lockpick_info", [["stahl", 3],["kupfer", 2]] ],

["Diamondring",["Item", "misc"],["Diamond Ring", "Diamond Ring"],[500000, 250000], [1, ""], [true, true, true, false,"useResource.sqf"],localize "STRS_inv_item_Diamond",localize "STRS_inv_item_Diamond", [["Diamond", 20], ["gold_barren", 1]]],

["EDiamondring",["Item", "misc"],["Expensive Diamond Ring", "Expensive Diamond Ring"],[1000000, 500000], [1, ""], [true, true, true, false,"useResource.sqf"],localize "STRS_inv_item_Diamond",localize "STRS_inv_item_Diamond", [["Diamond", 40], ["gold_barren", 2]]],

["impound", ["Item", "service"],["Impound Ticket", localize "STRS_item_impound"], [100, 100], [1, "", ""],[true,true,true, false, "impound.sqf"], localize "STRS_item_impound", localize "STRS_item_impound_info",[["plastik", 20],["mineraloel", 10]] ],

["MarijuanaSeed", ["Item", "drug"], ["Marijuana Seed", "Marijuana Seed"], [40000, 0], [0, "", ""], [true, true, true, true, "DrugFarming\Drugs.sqf"], localize "STRS_inv_item_marijuanaseed", localize "STRS_item_marijuanaseed_info", [] ],

["CocaineSeed", ["Item", "Drug"], ["Cocaine Seed", "Cocaine Seed"], [70000, 0], [0, "", ""], [true, true, true, true, "DrugFarming\Drugs.sqf"], localize "STRS_inv_item_cocaineseed", localize "STRS_item_cocaineseed_info", [] ],

["MarijuanaUP", ["Item", "drug"], ["Marijuana (Unprocessed)", "Marijuana (Unprocessed)"], [0, 0], [1, "", ""], [true, true, true, true, ""], localize "STRS_inv_item_marijuanaUP", localize "STRS_item_marijuanaUP_info", [] ],

["CocaineUP", ["Item", "Drug"], ["Cocaine (Unprocessed)", "Cocaine (Unprocessed)"], [0, 0], [1, "", ""], [true, true, true, true, ""], localize "STRS_inv_item_CocaineUP", localize "STRS_Item_cocaineUP_info", [] ],

["Olives", ["Item", "misc"], ["Olives", "Olives"], [550, 450], [1, "", ""], [true, true, true, false, "hungerThirst.sqf"], localize "STRS_inv_item_olives", localize "STRS_item_olives_info", [] ],

["OliveSeed", ["Item", "misc"], ["Olive seed", "Olive seed"], [250, 200], [0, "", ""], [true, true, true, false, "DrugFarming\Drugs.sqf"], localize "STRS_inv_item_olive", localize "STRS_item_olive_info", [] ],

["AppleSeed", ["Item", "misc"], ["Apple seed", "Apple seed"], [400, 300], [0, "", ""], [true, true, true, false, "DrugFarming\Drugs.sqf"], localize "STRS_inv_item_appleseed", localize "STRS_item_appleseed_info", [] ],

["Apple", ["Item", "misc"], ["Apfel", "Apple"], [700, 450], [1, "", ""], [true, true, true, false, "hungerThirst.sqf"], localize "STRS_inv_item_apple", localize "STRS_item_apple_info", [] ],

["OliveOil",["Item", "drink"],["Oilve oil", "Olive oil"],[3500, 2200], [1, ""], [true, true, true,false,"alkeffekt.sqf"],localize "STRS_inv_item_shortdesc_alkohol_generic",localize "STRS_inv_item_alkohol_info", [["olives", 2]] ],

["DrugShed", ["Item", "misc"], ["Drug Shed", "Drug Shed"], [150000, 0], [30, "", ""], [true, true, true, true, "DrugFarming\Drugs.sqf"], localize "STRS_inv_item_drugshed", localize "STRS_item_drugshed_info", [["stahl", 15], ["plastik", 15]] ],

["SpeedCam", ["Item", "misc"], ["Speed Cam", "Speed Cam"], [1000, 600], [3, "", ""], [true, true, true, false, "speedCam.sqf"], localize "STRS_inv_item_speedcam", localize "STRS_inv_item_speedcam_info", [] ],

["ucasiren", ["Item", "carobjects"], ["UCA Siren", "UCA Siren"], [2500, 900], [3, "", ""], [true, true, true, false, ""], localize "STRS_inv_item_ucasiren", localize "STRS_inv_item_ucasiren_info", [] ],

//RP items?

["Propaganda", ["Item", "misc"], ["Propaganda", "Propaganda"],[1000, 1000], [1, ""],[true,true,true, false, ""], localize "STRS_item_versicherung", localize "STRS_item_versicherung_info",[]],

["Magic_beans", ["Item", "misc"], ["Magic beans", "Magic beans"],[1000, 1000], [1, ""],[true,true,true, false, ""], localize "STRS_item_versicherung", localize "STRS_item_versicherung_info",[]],

["Treasure_map", ["Item", "misc"], ["Treasure Map", "Treasure Map"],[1000, 1000], [1, ""],[true,true,true, false, ""], localize "STRS_item_versicherung", localize "STRS_item_versicherung_info",[]],

["Plane_Ticket", ["Item", "misc"], ["Plane Ticket", "Plane Ticket"],[1000, 1000], [1, ""],[true,true,true, false, ""], localize "STRS_item_versicherung", localize "STRS_item_versicherung_info",[]]

];

INV_VehicleWeightArray = 
[
 
 ["MH6", 90],
 ["S1203_TK_CIV_EP1", 150],
 ["Zodiac", 200],
 ["Mi17_Civilian", 200],
 ["Smallboat_2", 200],
 ["PBX", 200],
 ["RHIB", 300],
 ["RHIB2Turret", 300],
 ["Skoda", 90], 
 ["SkodaBlue", 90],
 ["SkodaRed", 90],
 ["SkodaGreen", 90],
 ["LadaLM", 100],
 ["Car_hatchback", 100],
 ["Car_Sedan", 110],
 ["Tractor", 150],
 ["M1030", 10],
 ["TT650_Civ", 10],
 ["LandRover_CZ_EP1", 220],
 ["S1203_ambulance_EP1", 240],
 ["HMMWV_M2", 160],
 ["hilux1_civil_1_open", 250],
 ["hilux1_civil_2_covered", 250],
 ["hilux1_civil_3_open", 250],
 ["datsun1_civil_1_open", 300],
 ["datsun1_civil_2_covered", 300],
 ["datsun1_civil_3_open", 300],
 ["HMMWV", 300],
 ["UAZ_CDF", 150],
 ["UAZ_MG_CDF", 150],
 ["MTVR", 800],
 ["Ikarus", 400],
 ["Ural_CDF", 625],
 ["Ural_TK_CIV_EP1", 625],
 ["V3S_Civ", 625],
 ["Lada1", 100],
 ["ATV_US_EP1", 10],
 ["rpp_hilux", 250], 
 ["rpp_hatch", 100], 
 ["rpp_sedan", 100],
 ["rpp_skoda", 90],
 ["An2_1_TK_CIV_EP1",750],
 ["An2_2_TK_CIV_EP1",750],
 ["SUV_TK_CIV_EP1",750]
 ]; 
 
 // Script names, placable Objects
 INV_objItemScriptNames = [
	["SpawnObj_Fortress", "Fortress1",[5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_Danger", "Danger",[5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_Gate", "ZavoraAnim",[5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_Shed", "ShedSmall",[5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_Wall", "Wall1", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_Wire", "Wire", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_RoadCone", "RoadCone", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_Fire", "Fire", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_FenceWood","FenceWood", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_WireFence", "WireFence", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_RoadBarrier_long", "RoadBarrier_long", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_blinkbarrier", "RoadBarrier_light", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_MgPillbox", "WarfareBWestMGNest_M240", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_MgPillboxE", "WarfareBEastMGNest_PK", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_minibunker", "WarfareBNest", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_hospitaldoor", 	"Land_kasarna_prujezd", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_hospitalwall", 	"Land_kasarna", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_hospitalcorner", 	"Land_kasarna_rohova", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_bridge", 	"Land_molo_drevo_bs", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_hotel", 	"Land_Hotel", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_largetent", 	"CampEastC", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_mansion", 	"Land_dum_mesto_in", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_apartment", 	"Land_Panelak3", [10, 3, 10], [0, -0.5, 0], [180, 5]],
	["SpawnObj_housem", 	"Land_sara_zluty_statek_in", [6, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_houses", 	"Land_sara_Domek_sedy", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_tower",	"Land_helfenburk", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_villa", 	"Land_sara_domek05", [10, 9, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_pub", 	"Land_hospoda_mesto", [5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_stall1", 	"Land_stanek_1C",[5, 3, 10], [0, -0.5, 0]],
	["SpawnObj_Ramp", "RampConcrete",[7, 7, 10], [0, -0.5, 0], [180, 5]],
	["SpawnObj_SearchLight", "SearchLight",[5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_Ladder", "Land_ladder_half",[5, 3, 10], [0, -0.5, 0], [0, 5]],
	["SpawnObj_CampEmpty", "CampEmpty",[5, 3, 10], [0, -0.5, 0], [180, 5]],
	["SpawnObj_CampEast", "CampEast",[5, 3, 10], [0, -0.5, 0], [0, 5]]
];

_clothes = [ 
	["sah_civilian1_pants", "Samova shirt (Pants)"],
    ["sah_civilian2_pants", "Hammer of doom shirt (Pants)"],
    ["sah_civilian3_pants", "Bannana shirt (Pants)"],
    ["sah_civilian4_pants", "Woodland cowboy shirt (Pants)"],
    ["sah_civilian5_pants", "Nogova shirt (Pants)"],
    ["sah_civilian6_pants", "Viveres De Pepe shirt (Pants)"],
    ["sah_civilian7_pants", "SI shirt (Pants)"],
    ["sah_civilian1_shorts", "Samova shirt (Shorts)"],
    ["sah_civilian2_shorts", "Hammer of doom shirt (Shorts)"],
    ["sah_civilian3_shorts", "Bannana shirt (Shorts)"],
    ["sah_civilian4_shorts", "Woodland cowboy shirt (Shorts)"],
    ["sah_civilian5_shorts", "Nogova shirt (Shorts)"],
    ["sah_civilian6_shorts", "Viveres De Pepe shirt (Shorts)"],
    ["sah_civilian7_shorts", "SI shirt (Shorts)"],
    ["SL_pol_traffic", "Traffic Officer (Clothing)"],
    ["SL_pol_patrol", "Patrol Officer (Clothing)"]
];
/*
{
    INV_AlleItemsArray set[(count INV_AlleItemsArray), [(_x select 0), ["Item", "Clothes"], [(_x select 0), (_x select 1)], [5000,2500], [0,""], [true, true, true, false, "useClothing.sqf"], "Clothing", "Clothing", []]];
} forEach _clothes;
*/
	
    
// Create an Array of Everything
AlleMissionsObjekte = INV_AlleWaffenObjekte + INV_AlleMagazinObjekte + INV_AlleFahrzeugeArray + INV_AlleItemsArray;


