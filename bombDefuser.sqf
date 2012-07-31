 _art = _this select 0;
 
 if (_art == "use") then 
 {							
 _item   = _this select 1;		
 _anzahl = _this select 2;										
 _DefuseBombArray = ["PipeBomb", "TimeBomb", "Mine", "MineE"];																											
 
 if (isNil "INV_BombDefuserInUse") then 
 {
	 INV_BombDefuserInUse = false;
 };												
 
 if (not(INV_BombDefuserInUse)) then 
 {						
 INV_BombDefuserInUse = true;																																								

														
_bombs = [];															
{ _bombs = _bombs + ( (position player) nearObjects  [_x, 8] ); } forEach _DefuseBombArray;																														

if (count _bombs > 0) then 
{																				

if (random 100 < 99) then 
{																																																																						
player groupChat localize "STRS_inv_items_defuser_success";																																																		
deletevehicle (_bombs select 0);																																

} 
else 
{																																																																											

player groupChat localize "STRS_inv_items_defuser_failed";																																																												
[(position player)] spawn Bomb_Vehicle;																																												
};																																				

} 
else 
{																																

player groupChat localize "STRS_inv_items_defuser_nobomb";																																										
};																																										

																																													

for [{_i=0}, {_i < (count INV_ServerBombArray)}, {_i=_i+1}] do 
{																																								
	_bombVehicle = ((INV_ServerBombArray select _i) select 1);
	if (player distance _bombVehicle < 25) exitWith 
	{																																																																											
	format["%1 call INV_BombDefuse;", (INV_ServerBombArray select _i)] call ISSE_pub_execPstr;																																																																											
																		
	player groupChat localize "STRS_inv_items_defuser_success";																																																								
		};																								
	};										
																																							INV_BombDefuserInUse = false;			} else {																};};