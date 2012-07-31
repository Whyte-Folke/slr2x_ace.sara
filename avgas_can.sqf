// Air Refuel Kit Script
// avgas_can.sqf
_art = _this select 0;
_item   = _this select 1;
_anzahl = _this select 2;

if (_art == "use") then 
{
	if !(vehicle player iskindof "air") exitWith {player groupChat localize "STRS_inv_items_refuel_Noairvehicle";};
	if (isEngineOn vehicle player) exitWith {player groupChat localize "STRS_inv_items_refuel_AIRengineoff";};
	if (fuelkitinuse == 1) exitWith {player groupChat localize "STRS_inv_items_refuel_already";};
	if ((fuel vehicle player) == 1) exitWith {player groupChat localize "STRS_inv_items_refuel_notneeded";};
	if (player == vehicle player) exitWith {player groupChat localize "STRS_inv_items_repair_refuel_notincar";};
	if (!(player == driver vehicle player)) exitWith {player groupChat localize "STRS_inv_items_repair_refuel_notdriver";};
	[_item, -1] call INV_AddInventoryItem;
	fuelkitinuse = 1;
	player groupChat localize "STRS_inv_items_refuel_AVGASinprogress";
	sleep 5;
	sleep 70.0 + (random 75);
	fuelkitinuse = 0;
	_fuel = fuel vehicle player;
	_refuelgas = 0.11 + (random 0.06);
	vehicle player setFuel (_fuel + _refuelgas);
	player groupChat localize "STRS_inv_items_refuel_AVGASrefueled";
};