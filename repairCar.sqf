// Car Repair Kit Script, rewritten by MAD T (year 2010)
// repairCar.sqf

_art = _this select 0;
_item   = _this select 1;
_anzahl = _this select 2;

_closeVcl   = dummyobj;
 _closest    = -1;
 
if (_art == "use") then {
if (repkitinuse == 1) exitWith {player groupChat localize "STRS_inv_items_repair_already";};
if (!(player == vehicle player)) exitWith {player groupChat "You must be on foot"};
{
if (not(isNull(_x))) then 
 {
 if ( ((player distance _x) < 7) and ( ((player distance _x) < _closest) or (_closest == -1) ) ) then 
 {
 _closest  = (player distance _x);
 _closeVcl = _x;
 };
 };
 } forEach INV_ServerVclArray;
 
 if ((damage _closeVcl) == 0) exitWith {player groupChat localize "STRS_inv_items_repair_notneeded";};
 [_item, -1] call INV_AddInventoryItem;
 repkitinuse = 1;
 player groupChat localize "STRS_inv_items_repair_inprogress";
 _i = 0;
 _b = 0;
 while {(player == vehicle player) and (_b < 2) and (player distance _closeVcl < 7)} do 
 {
 _anim_random = repair_anims select random 1;
 format ["%1 switchmove ""%2""", player, _anim_random] call ISSE_pub_execPstr;
 sleep 15;
 if ((player == vehicle player) and (player distance _closeVcl < 7)) then {
 _i = _i + 1;
 };
 _b = _b + 1;
 };
 if (_i >= 2) then {_closeVcl setDamage 0; player groupChat localize "STRS_inv_items_repair_repaired"; repkitinuse = 0;};
 if (_i < 2) then {[_item, 1] call INV_AddInventoryItem; repkitinuse = 0;};
};
