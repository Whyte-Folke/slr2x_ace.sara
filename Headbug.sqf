// enhanced version from killjoy, modified for SLR by MAD T (27th February 2010)
private ["_dir","_pos", "_vehicle"];
if (isServer and !(local player)) exitWith {};

if (vehicle player != player) exitWith {hint "Not possible in a vehicle";};
if ((getPos player select 2) >= 1) exitwith {hint "You must be on foot"};
if ((isstunned) or (playerpunched)) exitWith {hint "Your not allowed to do this while stunned"};
titleCut ["... Fixing head bug ...","black faded", 0];

_pos = Player modeltoWorld [0,0,0];
_dir = direction player;
_vehicle = "UAZ" createVehicleLocal _pos;
player moveincargo _vehicle;
waitUntil {vehicle player != player};
unassignVehicle player;
player action ["Eject", vehicle player];
waitUntil {vehicle player == player};
deleteVehicle _vehicle;
player setpos _pos;
player setDir _dir;

titleCut["", "BLACK in", 2];

if (true) exitWith {};