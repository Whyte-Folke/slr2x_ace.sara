//Unflip vehicle script for SLR by MAD T (year 2010)
_vehicle = _this select 0;
_unflip = 0;
if (unflip_active) exitWith {player groupChat localize "STRS_unflip_cant";};
if (!(player == vehicle player)) exitWith {player groupChat localize "STRS_in_car"};
 {
 if (not(isNull(_x))) then 
 {						
 if ( ((_vehicle distance _x) < 7) and (_x isKindOf "cooter" )) exitWith 
 {
 _unflip = 1
 }							
 };								
 } forEach INV_ServerVclArray;
 
 if (_unflip == 1) then 
 {
 if (player == vehicle player) then {format ["%1 playMove ""AmovPercMstpSnonWnonDnon_carCheckWash"";", player] call ISSE_pub_execPstr;};
 unflip_active = true;
 sleep 15;
 unflip_active = false;
 _vehicle setPos getPos _vehicle;
 player groupChat localize "STRS_unflipped"; 
 } 
 else 
 {
 player groupChat localize "STRS_unflip_no_cooter";
 };
 