CON_console_SavedCommands = [];

CON_Console_Actions = 
[					
[10,	"Check Variable",		'(ctrlText 1) call CON_console_VarCheck;'],												
[11,	"Repair Vehicle",		'call CON_console_RepairRefuel'],				
[12,	"New Vehicle []",		'[(ctrlText 1), player] call CON_CreateVehicle;'],					
[13,	"Map Random Bomb",	'onMapSingleClick "nil = _pos spawn CON_console_Bomb1;";'],		
[14,	"Map System Bomb",	'onMapSingleClick "nil = _pos spawn CON_console_Bomb2;";'],				
[15,	"Map Single Bomb",	'onMapSingleClick "nil = _pos spawn CON_console_Bomb3;";'],									
[16,	"Map Teleport",		'onMapSingleClick "(vehicle player) setpos _pos;";'],													
[17,	"Map End",			'onMapSingleClick "";'],						
[18,	"Harrier",			'1200 spawn CON_console_Harrier;'],							
[19,	"Weapons",			'call CON_console_Weapons;'],					
[20,	"Player setPos []",	'(vehicle player) setPos (getPos (call compile (ctrlText 1)));'],			
[21,	"",				''],					
[22,	"",				''],					
[23,  "",				''],																						
[24,	"Get Item []",		'[(ctrlText 1), 1] call INV_addInventoryItem;'],
[25,	"Inventory Vcl []",	'[(ctrlText 1), player] call INV_CreateVehicle;'],
[26,	"+1000000 Money",		'["money", 1000000] call INV_AddInventoryItem;'],				
[27,	"All Licenses",		'{INV_LizenzOwner=INV_LizenzOwner+[_x select 0];} forEach INV_Lizenzen;'],											
[28,	"",				''],													
[29,	"",				''],															
[30,	"",				''],														
[31,	"",				''],												
[32,	"",				''],															
[33,	"",				''],								
[34,	"",				''],								
[35,	"",				''],			
[37,	"",		            '']
];

CON_console_VarCheck = 
{														

if (isNil _this) then 
{				
hint "The Variable does not exist.";												

} 
else 
{																										

call compile format ['hint ''The Variable "%1" has the value: \n%2'';', _this, (call compile _this)];						
};};

CON_console_RepairRefuel = 
{									
vehicle player setDamage 0; 				
vehicle player setFuel 1;
};

CON_console_Harrier = 
{					

if (player == vehicle player) then 
{														
_h = "AV8B" createvehicle (getPos player); 																								
player moveindriver _h; 																
_h setPos [getpos player select 0, getpos player select 1, 1250];							

} 
else 
{																										

vehicle player addMagazine "6Rnd_GBU12_AV8B";													
};};

CON_console_Bomb1 = 
{									

private["_pos", "_c"];												
_pos = _this;								

for [{_c=0}, {_c < 500}, {_c=_c+1}] do 
{				
sleep (random 0.5);																																																												
_x = ((_pos select 0) + (random 500) - (random 500));																														
_y = ((_pos select 1) + (random 500) - (random 500));												
_z = ((_pos select 2) + 500);																																		

if ((random 2) < 1.5) then 
{
	"Sh_125_SABOT" createvehicle [_x, _y, _z];
	
	} 
	else 
	{
		
	"Bo_GBU12_LGB" createvehicle [_x, _y, _z];};													
};};




_posX = (position _plane) select 0;
_posZ = (position _plane) select 1;
_posY = (position _plane) select 2;

_velX = (velocity _plane) select 0;
_velZ = (velocity _plane) select 0;
sleep 0.2;
_bomb = "Bo_GBU12_LGB" createvehicle [_posX,_posZ,_posY];
_bomb setvelocity [_velX,_velZ, 93];

CON_console_Bomb2 = 
{												
private["_pos", "_c", "_k"];			
[] spawn {					
_pos    = getpos player;					
_weiter = 1000;									
_breite = 1000;				
_hoehe  = 400;												
_abstand= 25;												

for [{_c=0}, {_c < (_weiter/_abstand)}, {_c=_c+1}] do 
{																				

for [{_k=0}, {_k < (_breite/_abstand)}, {_k=_k+1}] do 
{																																							

_x = (_pos select 0)-(_weiter/2)+(_c*_abstand);																																										
_y = (_pos select 1)-(_breite/2)+(_k*_abstand);																														
_z = _hoehe;			
												
_vcl = "Bo_GBU12_LGB" createvehicle [_x, _y, _z];										
};																
sleep 2;														
};};
};





CON_console_Bomb3 = 
{			
private["_pos"];									
_pos = _this;										
"Bo_GBU12_LGB" createVehicle _pos;
};

CON_console_Weapons = 
{														
removeAllWeapons player;		
{player addMagazine _x;} forEach ["ACE_30Rnd_556x45_B_Stanag", "ACE_30Rnd_556x45_B_Stanag", "ACE_30Rnd_556x45_B_Stanag", "ACE_30Rnd_556x45_B_Stanag", "PG7V", "PG7V", "PG7V", "ACE_HandGrenadeRGO", "SmokeShellRed", "8Rnd_9x18_MakarovSD", "8Rnd_9x18_MakarovSD", "8Rnd_9x18_MakarovSD", "8Rnd_9x18_MakarovSD", "8Rnd_9x18_MakarovSD", "8Rnd_9x18_MakarovSD", "8Rnd_9x18_MakarovSD", "8Rnd_9x18_MakarovSD"];														
{player addWeapon   _x;} forEach ["M16A2", "RPG7V", "MakarovSD", "Binocular", "NVGoggles"];
};

CON_CreateVehicle = 
{									
private ["_classname", "_position"];											
_classname = _this select 0;							
_position  = _this select 1;																	

call compile format ['vehicle_%1_%2 = _classname createVehicle %4; vehicle_%1_%2 setVehicleInit "this setVehicleVarName ""vehicle_%1_%2""; vehicle_%1_%2 = this; clearWeaponCargo this; clearMagazineCargo this;"; processInitCommands;', player, round(time), getpos _position];
};