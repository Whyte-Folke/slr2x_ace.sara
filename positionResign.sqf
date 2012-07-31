// positionResign.sqf
// Resign mayor or Chief Cop

_array = _this select 3;
_art  = _array select 0;
_rolenum = VehicleVarName player;

if (_art == "mayor") then
{
	if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!";};
	ctrlSetText [1, format["%1, do you realy want to resign from position as the mayor?", player]];
	waitUntil{(not(ctrlVisible 1023))};
	if (Antwort == 1) then {
	call mayorLoosePosition;}
	else {};
};

if (_art == "chief") then
{
	if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!";};
	ctrlSetText [1, format["%1, do you realy want to resign from the position as cop chief?", player]];
	waitUntil{(not(ctrlVisible 1023))};
	if (Antwort == 1) then {
	call ChiefLoosePosition;}
	else {};
};

if (_art == "bodyguard") then
{
	INV_LizenzOwner = INV_LizenzOwner - ["bodyguard_license"];
	["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar;
	isBodyguard = false;
	roleBodyguard = 0;
	hint format [localize "STRS_bodyguard_resigned_private"];
	sleep 5;
	format ["hint format [localize ""STRS_Bodyguard_resigned_public"", %1];", _rolenum] call ISSE_pub_execPstr;
};