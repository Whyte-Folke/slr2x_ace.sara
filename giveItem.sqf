_art         = _this select 0;
_item        = _this select 1;
_menge       = _this select 2;
_itemanzeige = (_item call INV_getitemName);

if (_art == "uebergabe") then 
{							
_spielernum   	= call compile (_this select 3); 															
_spieler      	= playerstringarray select _spielernum;											
_playerobject 	= playerarray       select _spielernum;																				

if (!(_spieler call ISSE_UnitExists))            exitWith {player groupChat localize "STRS_inv_not_ingame";};					
if (_playerobject == player)                     exitWith {player groupChat localize "STRS_inv_inventar_uebergabe_self";};													
if (player distance _playerobject > 20)      exitWith {player groupChat localize "STRS_inv_inventar_uebergabe_distance";};													
if (!(_item call INV_getitemGiveable))        exitWith {player groupChat localize "STRS_inv_inventar_uebergabe_verbot";};												
if (!([_item, -(_menge)] call INV_AddInventoryItem)) exitWith {player groupChat localize "STRS_inv_inventar_uebergabe_zuwenig";};													

format ["if (player == %1) then {[""bekommen"", ""%2"", %3, %4] execVM ""giveItem.sqf"";};", _playerobject, _item, _menge, player] call ISSE_pub_execPstr;													

player groupChat format [localize "STRS_inv_inventar_uebergabe_success_self", name _playerobject, (_menge call ISSE_str_IntToStr), _itemanzeige];};

if (_art == "bekommen") then
 {											
 _spieler = _this select 3;								
 
 if ([_item, _menge] call INV_AddInventoryItem) then 
 {												
 player groupChat format[localize "STRS_inv_inventar_gotfromotherplayer", (_menge call ISSE_str_IntToStr), _itemanzeige, name _spieler];														
 } 
 else 
 {																												
 format ["if (player == %1) then {[""%2"", %3] call INV_AddInventoryItem;};", _spieler, _item, _menge] call ISSE_pub_execPstr;												
 
 	};
 };