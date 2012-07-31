// Unitgear.sqf
// Equips Units with Weapons and IV_Items. Called after main item add funtion is defined

removeAllWeapons player;

if (iscop) then 
{
	['SpawnObj_RoadCone', 2] call INV_SetItemAmount;
	//['SpeedCam', 1] call INV_SetItemAmount;
	['schluesselbund', 1] call INV_SetItemAmount;
	['handy', 1] call INV_SetItemAmount;
	INV_LizenzOwner = INV_LizenzOwner + ["basic_police"];
	//["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar;
} 
else 
{
	['schluesselbund', 1] call INV_SetItemAmount;
	['handy', 1] call INV_SetItemAmount;
    player addWeapon "ItemMap";
};

if (isundercover) then 
{
	['schluesselbund', 1] call INV_SetItemAmount;
	['handy', 1] call INV_SetItemAmount;
};

if (isborderpatrol) then 
{
	['SpawnObj_RoadBarrier_long', 2] call INV_SetItemAmount;
};

// Add Swat License at start
if (isswat) then 
{
	INV_LizenzOwner = INV_LizenzOwner + ["swat_training"];
	//["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar;
};

lostWeapons              = [];
lostMagazines            = [];

// StartGear for Cops
CopStartGear_Mags = 
[
"x26_mag",
"x26_mag",
"x26_mag",
"x26_mag"
];

CopStartGear_Weap = 
[
"Binocular", 
"x26",
"ItemMap", 
"ItemCompass",
"ItemWatch",
"ItemRadio",
"ItemGPS"
];

// StartGear for SWAT Units
SWATStartGear_Mags = CopStartGear_Mags;

SWATStartGear_Weap = CopStartGear_Weap;

// Start gear for Undercover Units
UndercoverStartMags = CopStartGear_Mags;
UndercoverStartWeap  = CopStartGear_Weap;

BodyguardStartMags 	 = [];
BodyguardStartWeap 	 = [];

//if (not(iscop)) then {showGPS false;};