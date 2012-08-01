// Car Refuel Kit Script
// refuelCan.sqf

_art = _this select 0;
_item   = _this select 1;
_anzahl = _this select 2;
 
if (_art == "use") then
{
	if (vehicle player iskindof "air") exitWith {player groupChat localize "STRS_inv_items_refuel_airvehicle";};
	if (fuelkitinuse == 1) exitWith {player groupChat localize "STRS_inv_items_refuel_already";};
	if (player == vehicle player) exitWith {player groupChat localize "STRS_inv_items_repair_refuel_notincar";};
	if (!(player == driver vehicle player)) exitWith {player groupChat localize "STRS_inv_items_repair_refuel_notdriver";};
	if ((fuel vehicle player) == 1) exitWith {player groupChat localize "STRS_inv_items_refuel_notneeded";};
	fuelkitinuse = 1;
	["kanister", -(1)] call INV_AddInventoryItem;
	player groupChat localize "STRS_inv_items_refuel_inprogress";
	sleep 20.0;
	fuelkitinuse = 0;
	_fuel = fuel vehicle player;
	vehicle player setFuel (_fuel + 0.12);;
	player groupChat localize "STRS_inv_items_refuel_refueled";
};
