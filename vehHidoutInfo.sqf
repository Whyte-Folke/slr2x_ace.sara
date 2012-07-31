// Vehicle-Informaton and Hideout Info script
// vehHidoutInfo.sqf

_array = _this select 3;
_art   = _array select 0;

if (_art == "vehicle_info") then {
	_vehicle = _this select 0;
	_caller  = _this select 1;
	_type    = typeOf _vehicle;
	_driver  = "No driver";
	if ((_vehicle emptyPositions "Driver") == 0) then {_driver = driver _vehicle;};
	hint format[localize "STRS_hints_vehicle_information", (round(Speed _vehicle)),  (round((1 - Damage _vehicle) * 100)),  (round((Fuel _vehicle) * 50)),  _type,  (round(getdir _vehicle)),  (round(getposASL _vehicle select 2)),  _vehicle,  _driver,  (_vehicle emptyPositions "cargo"),  (round((sizeOf _type)*10)/10)];
	};
	
	if (_art == "hideout_besitzer") then {
	hint format[localize "STRS_hideout_flagowner", (_array select 1)];};
	