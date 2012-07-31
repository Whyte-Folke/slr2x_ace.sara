 _art = _this select 0;
 
 if (_art == "use") then 
 {		
 _exitvar = 0;
	if (player != vehicle player) exitWith {player groupChat localize "STRS_inv_item_obj_invcl";};
	{	
		if (player distance (_x select 0) < (_x select 1)) exitWith {
			_exitvar = 1;
		};
	} forEach INV_PlacingVerbotArray;
	if (_exitvar == 1) exitWith {player groupChat localize "STRS_inv_item_obj_hiernicht";}; 
 _item   = _this select 1;		
 _anzahl = _this select 2;				
 
 if (INV_local_hashideout == 1) exitWith {player groupChat localize "STRS_item_alreadygothideout";};	
 
 _zunah = 0;			
 
 {																												
 if (player distance (_x select 0) < (_x select 1)) exitWith {_zunah = 1;};							
 } forEach HideoutLocationArray;						
 
 if (_zunah == 1) exitWith {player groupChat localize "STRS_inventar_hideout_wrongplace";};													
 
 player groupChat format[localize "STRS_inventar_bought_hideout", rolestring];																			
 
 _rolepos    = position player;			
 _roledir    = getdir player;							
 _pos        = [(_rolepos select 0) + ((sin _roledir) * 20), (_rolepos select 1) + ((cos _roledir) * 20),(_rolepos select 2)];															
 
 call compile format 
 ['
 hideoutflag%1%2 = "FlagCarrierWest" createVehicle %3;
 hideoutflag%1%2 setVehicleInit "this setVehicleVarName ""hideoutflag%1%2""; 
 hideoutflag%1%2 = this; 
 %1hideoutowner = hideoutflag%1%2 addaction [localize ""STRS_action_hideoutowner"", ""vehHidoutInfo.sqf"", [""hideout_besitzer"", ""%1""]];"; 																																	
 hideout%1%2 = "%5" CreateVehicle %3; 															
 hideout%1%2 setVehicleInit "this setVehicleVarName ""hideout%1%2"";
 hideout%1%2 = this;
 this setDir %4"; 												
 hideoutbox%1%2 = "AmmoBoxWest" createVehicle (hideout%1%2 buildingPos 0);												
 hideoutbox%1%2 setVehicleInit "this setVehicleVarName ""hideoutbox%1%2"";
 hideoutbox%1%2 = this; 
 ClearMagazineCargo this;
 ClearWeaponCargo this;"; 																		
 hideoutfire%1%2 = "Fire" createVehicle (hideout%1%2 buildingPos 0);																																													
 hideoutfire%1%2 setVehicleInit "this setVehicleVarName ""hideoutfire%1%2"";
 hideoutfire%1%2 = this;"; 																																							
 processInitCommands;																														
 hideout_objarray = hideout_objarray + [hideoutflag%1%2, hideout%1%2, hideoutbox%1%2, hideoutfire%1%2];						
 if (%6 == 2) then 
 {																																								
 hideoutextra%1%2 = "ShedSmall" createVehicle (hideout%1%2 buildingPos 0);																								
 hideoutextra%1%2 setVehicleInit "this setVehicleVarName ""hideoutextra%1%2""; hideoutextra%1%2 = this;"; 																																												
 processInitCommands;																												
 hideout_objarray = hideout_objarray + [hideoutextra%1%2];																																							
 };																				
 ', rolestring, round(time), _pos, _roledir, (hideoutHouseArray select hideout_arraynumber), hideout_arraynumber ];																																			
 
 format ["if (isServer) then {publichideoutarray = publichideoutarray + [ [""%1"", %2 ] ];};", rolestring, hideout_objarray] call ISSE_pub_execPstr;																				
 INV_local_hashideout = 1;									
 INV_HideoutAblage    = [];																											
 localhideoutmarker = (([(hideout_objarray select 0), (localize "STRS_hideout_marker"), "Destroy", "ColorWhite", "ICON", [0.7, 0.7], HideoutMarkerName] call ISSE_CreateMarkerArray) select 1);									
 [_item, -1] call INV_AddInventoryItem;};
 
 if (_art == "addons") then 
 {			
 _addon = _this select 1;											
 _money  = 'money' call INV_GetItemAmount;																					
 
 if (_addon == 4) then 
 {								
 
 if (hideout_abgeschlossen) then 
 {																																				
 hideout_abgeschlossen = false;																																							
 player groupChat localize "STRS_hideout_unlocked";																														
 
 } 
 else 
 {																																										
 hideout_abgeschlossen = true;																								
 player groupChat localize "STRS_hideout_locked";																
 
 };														
 };																
 
 if (_addon == 3) then
 {																										
	_damage = 0;														
	{_damage = _damage + (damage _x);} forEach hideout_objarray; 																				
	
	if (_damage > 0) then 
	{						
	_cost = hideout_addons_cost select _addon;																								
	
	if (_money < _cost) exitWith {role groupChat localize "STRS_hideoutaddons_nobuy";};																					
	['money', -(_cost)] call INV_AddInventoryItem;																																							
	{_x setdamage 0;} forEach hideout_objarray; 									
	player groupChat localize "STRS_hideoutaddons_repaired";												
	} 
	else 
	{															
	player groupChat localize "STRS_hideoutaddons_norepair";										
	};														
};														

if (_addon == 5) then
{						
if ((DAMAGE player) == 0) exitWith {player groupChat format[localize "STRS_hideoutheal_nouse"];};																																										
player groupChat format[localize "STRS_hideoutheal_use"];																				
player switchmove "AinvPknlMstpSlayWrflDnon_medic";																														
if (NOT(alive player)) exitWith {};																				
sleep 2;																				
if (NOT(alive player)) exitWith {};																										
player SETDAMAGE _damage/2;																
sleep 1;												
if (NOT(alive player)) exitWith {};																										

player SETDAMAGE _damage/4;																								
sleep 1;																		
if (NOT(alive player)) exitWith {};																																		
player SETDAMAGE 0;								
player groupChat format[localize "STRS_hideoutheal_used"];												
          
};																			
           
if (_addon == 6) then 
{				
{if (not(isNull _x)) then {deletevehicle _x;};} forEach hideout_objarray;																												
deleteMarker HideoutMarkerName;										
INV_local_hashideout 	 = 0;																				
hideout_objarray	 = [];														
INV_HideoutAblage    	 = [];								
['hideout', 1] call INV_AddInventoryItem;					
};																

if (_addon == 6) then 
{																										
if (SpawnAtHideout) then
{																																				
SpawnAtHideout = false;																						
} 
else 
{																											
SpawnAtHideout = true;										
};													
};																

if ((_addon == 0) or (_addon == 1) or (_addon == 2)) then 
{																										
_cost = hideout_addons_cost select _addon;																														
if (_money < _cost) exitWith {player groupChat localize "STRS_hideoutaddons_nobuy";};																								
['money', -(_cost)] call INV_AddInventoryItem;										
hideout_addons_active  SET [_addon, 1];				
player groupChat format[localize "STRS_hideoutaddons_buy", (_cost call ISSE_str_IntToStr)];																																		

/*
if (_addon == 1) then 
{																		
"teleport1" setMarkerPosLocal [getpos player select 0, getpos player select 1, 0]; 																																										
teleport_cost = 5000;																								
};
*/														
};
};

if (_art == "action") then 
{												
_hideoutnummer = _this select 1;		
_money          = 'money' call INV_GetItemAmount;		
_hideoutname   = hideoutNameArray  select _hideoutnummer;					
_cost          = hideoutPriceArray select _hideoutnummer;																
if ((('hideout' call INV_GetItemAmount) > 0) or (INV_local_hashideout == 1)) exitWith {player groupChat localize "STRS_hideoutaction_already";};								
if (_money < _cost) exitWith {player groupChat localize "STRS_hideoutaction_nobuy";};																			
['hideout', 1]     call INV_AddInventoryItem;										
['money', -(_cost)] call INV_AddInventoryItem;													
player groupChat localize "STRS_hideoutaction_info";													
hideout_arraynumber = _hideoutnummer;												
["hideout_arraynumber", hideout_arraynumber] spawn ClientSaveVar;};

if (_art == "init") then
{					
INV_local_hashideout = 0;	
                                     					
_a1 = 0; 
_a2 = 0; 
_a3 = 0; 
_a4 = 0; 
_a5 = 0; 
_a6 = 0; 
_a7 = 0; 
_a8 = 0; 
_a9 = 0;			
hideout_addons_active = [0,0,0,0];

           													

while {true} do
 {																														
 if (INV_local_hashideout == 1) then 
 {																														
 _flag = (hideout_objarray select 0);																																																																																											
 if ((player distance _flag <= 5) and (hideout_addons_active select 0 == 0) and (_a1 == 0)) then 
 {
	 hideout_action1 = player addaction [format [localize "STRS_addaction_hideout_addon1", hideout_addons_cost select 0], "someCompile.sqf", [format ["[""addons"", %1] execVM ""hideout.sqf"";",  0]]]; 
	 _a1 = 1;
};																																				

if (((player distance _flag > 5) or (hideout_addons_active select 0 == 1)) and (_a1 == 1)) then 
{
	player removeaction hideout_action1; 
	_a1 = 0;
};																																																												

if ((player distance _flag <= 5) and (hideout_addons_active select 2 == 0) and (_a3 == 0)) then 
{
	hideout_action3 = player addaction [format [localize "STRS_addaction_hideout_addon3", hideout_addons_cost select 2], "someCompile.sqf", [format ["[""addons"", %1] execVM ""hideout.sqf"";",  2]]]; 
	_a3 = 1;
};																																																

if (((player distance _flag > 5) or (hideout_addons_active select 2 == 1)) and (_a3 == 1)) then 
{
	player removeaction hideout_action3; 
	_a3 = 0;
};																																																																																												

if ((player distance _flag <= 5) and (_a4 == 0)) then 
{
	hideout_action4 = player addaction [format [localize "STRS_addaction_hideout_addon4", hideout_addons_cost select 3], "someCompile.sqf", [format ["[""addons"", %1] execVM ""hideout.sqf"";",  3]]]; 
	_a4 = 1;
};	
																																																											
if ((player distance _flag >  5) and (_a4 == 1)) then 
{
	player removeaction hideout_action4; 
	_a4 = 0;
};		
																																																																										
if ((player distance _flag <= 5) and (_a5 == 0)) then
{
	hideout_action5 = player addaction [format [localize "STRS_addaction_hideout_addon5"], "someCompile.sqf", [format ["[""addons"", %1] execVM ""hideout.sqf"";",  4]]]; 
	_a5 = 1;
};																																

if ((player distance _flag >  5) and (_a5 == 1)) then
{
	 player removeaction hideout_action5; 
	 _a5 = 0;
};																																																																														

if ((player distance _flag <= 5) and (_a8 == 0)) then 
{
	hideoutstorage = player addaction [format [localize "STRS_addaction_hideout_ablage"], "storage.sqf", ["INV_HideoutAblage", "save"]]; 
	_a8 = 1;
};																																																
																																																																										
if ((player distance _flag >  5) and (_a8 == 1)) then 
{
	player removeaction hideoutstorage; 
	_a8 = 0;
};																																																																																							

if ((player distance _flag <=5) and (hideout_addons_active select 0 == 1) and (_a7 == 0)) then 
{
	hideoutheal = player addaction [format[localize "STRS_addaction_hideout_healaddon_use"], "someCompile.sqf", [format ["[""addons"", %1] execVM ""hideout.sqf"";",  5]]]; 
	_a7 = 1;
};								

if ((player distance _flag > 5) and (_a7 == 1)) then
{
	player removeaction hideoutheal; 
	_a7 = 0;
};																																																							

if ((player distance _flag <= 5) and (_a9 == 0) and (hideout_addons_active select 2 == 1)) then 
{																																																												
hdeposit = player addAction [localize "STRS_bank_addaction_dialog","moneyTransaction.sqf", ["normalbank"]]; 																																																		
hbalance = player addAction [localize "STRS_addAction_bank_balance", "someCompile.sqf", "hint format[localize ""STRS_hints_account_balance"", Kontostand];"]; 																				
_a9 = 1;																																
};																																

if ((player distance _flag > 5) and (_a9 == 1)) then 
{																									
player removeaction hdeposit; 																																																												
player removeaction hbalance; 																																													
_a9 = 0;																				
};																																													

if ((player distance _flag <= 5) and (_a6 == 0)) then
{
	hideout_action6 = player addaction ["Delete your hideout", "someCompile.sqf", [format ["[""addons"", %1] execVM ""hideout.sqf"";",  6]]]; 
	_a6 = 1;
};																																												

if ((player distance _flag > 5) and (_a6 == 1)) then 
{
	player removeaction hideout_action6; 
	_a6 = 0;
};																												

} 
else 
{																																										
	player removeaction hideout_action1;
	player removeaction hideout_action2;
	player removeaction hideout_action3;
	player removeaction hideout_action4;
	player removeaction hideout_action5;
	player removeaction hideout_action6;
	player removeaction hideoutheal;
	player removeaction hideoutstorage;
	player removeaction hbalance;
	player removeaction hdeposit;
};																												
sleep 1;				
};};