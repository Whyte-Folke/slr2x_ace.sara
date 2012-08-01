// AVGas Refuel Script at AVGas Fuel Stations
// avgasrefuel.sqf

_fuel = fuel (vehicle player);
_fuelstartposition = getpos(vehicle player);
_exitvar = 0;

_finalfuelCost = AVGAS_TankenCost + AVGAS_TaxTankenCost;

if (_fuel >= 0.995) exitWith {player groupChat localize "STRS_gasstation_bereits_getankt_avgas";};
if !(vehicle player iskindof "air") exitWith {player groupChat localize "STRS_inv_items_refuel_Noairvehicle";};
if (isEngineOn vehicle player) exitWith {player groupChat localize "STRS_inv_items_refuel_AIRengineoff";};
if (alreadytankenAVGas) exitWith {player groupchat localize "STRS_inv_items_refuel_already";};
while {((fuel (vehicle player)) < 0.995)} do {
	alreadytankenAVGas = true;
	_tankvehicle = vehicle player;
	if (not(['money', -(_finalfuelCost)] call INV_AddInventoryItem)) exitWith {player groupChat localize "STRS_gasstation_tanken_money"; _exitvar = 1;};
	INV_SteuernGezahlt = INV_SteuernGezahlt + AVGAS_TaxTankenCost;
	if (_tankvehicle == player) exitWith {player groupChat localize "STRS_gasstation_tanken_airleft";  _exitvar = 1;};
	if (vehicle player distance _fuelstartposition > 4) exitWith {player groupChat localize "STRS_gasstation_tanken_vclmoved"; _exitvar = 1;};

	_tankvehicle setFuel ((fuel _tankvehicle)+0.02);
	titleText [ format[localize "STRS_gasstation_avgastanken_zwischenmsg",round(fuel _tankvehicle * 50)], "PLAIN DOWN"];
	sleep 9;
};

if (_exitvar == 1) exitWith {alreadytankenAVGas = false;};
player groupChat localize "STRS_gasstation_tanken_avgasfinished";
alreadytankenAVGas = false;
