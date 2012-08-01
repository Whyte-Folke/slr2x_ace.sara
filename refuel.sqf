// Refuel Script at Fuel Stations
// refuel.sqf

_fuel = fuel (vehicle player);
_fuelstartposition = getpos(vehicle player);
_exitvar = 0;
_finalfuelCost = TankenCost + TankenTaxCost;

if (_fuel >= 0.995) exitWith {player groupChat localize "STRS_gasstation_bereits_getankt";};
if (vehicle player iskindof "air") exitWith {player groupChat localize "STRS_inv_items_refuel_airvehicle";};
if (alreadytanken) exitWith {player groupchat localize "STRS_inv_items_refuel_already";};
while {((fuel (vehicle player)) < 0.995)} do {
	alreadytanken = true;
	_tankvehicle = vehicle player;
	if (not(['money', -(_finalfuelCost)] call INV_AddInventoryItem)) exitWith {player groupChat localize "STRS_gasstation_tanken_money"; _exitvar = 1;};
	INV_SteuernGezahlt = INV_SteuernGezahlt + TankenTaxCost;
	if (_tankvehicle == player) exitWith {player groupChat localize "STRS_gasstation_tanken_vclleft";  _exitvar = 1;};
	if (vehicle player distance _fuelstartposition > 4) exitWith {player groupChat localize "STRS_gasstation_tanken_vclmoved"; _exitvar = 1;};
	_tankvehicle setFuel ((fuel _tankvehicle)+0.02);
	titleText [ format[localize "STRS_gasstation_tanken_zwischenmsg",round(fuel _tankvehicle * 50)], "PLAIN DOWN"];
	sleep 2;
};
if (_exitvar == 1) exitWith {alreadytanken = false;};
if (_fuel >= 0.995)  then {
	player groupChat localize "STRS_gasstation_tanken_finished";
	};
alreadytanken = false;