// Give command to holster Pistol in holster script

_artarray = _this select 3;
_art = _artarray select 0;

if (_art == "holster") then
 {
	["animation", "holsterPistol"] execVM "holsterGuns.sqf";
	//holstervar = true;
};
	
if (_art == "unholster") then 
{
	["animation", "unholsterPistol"] execVM "holsterGuns.sqf";
	//holstervar = false;
};