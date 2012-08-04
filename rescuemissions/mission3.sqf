_heli = _this;

_randomnumber = round(random 3000) + 100;

_roadlist = player nearRoads 5000;

_roadobject = _roadlist select _randomnumber;

_SideHQ = createCenter civilian;
_civgroup = createGroup civilian;
_boatpos = getPos _boat;

_roadobjpos = getPos _roadobject;

_marker1 = createMarker ["ROAD", _roadobjpos];
_marker1 setMarkerColor "ColorRed";
_marker1 setMarkerType "Warning";
_marker1 setMarkerText "ROAD ACCIDENT";

_vehiclelist = [
		"Ikarus",
		"Lada1",
		"Lada2",
		"SkodaGreen",
		"SkodaRed",
		"SkodaBlue",
		"Skoda",
		"UralCivil",
		"car_sedan",
		"hilux1_civil_1_open",
		"hilux1_civil_3_open",
		"Ikarus_TK_CIV_EP1",
		"LandRover_TK_CIV_EP1",
		"S1203_TK_CIV_EP1",
		"V3S_Open_TK_CIV_EP1",
		"hilux1_civil_3_open_EP1"
               ];

_i = round(random 15);

_car1 = _vehiclelist select _i;

_x = _roadobjpos select 0;
_y = _roadobjpos select 1;
_z = _roadobjpos select 2;

_car1obj = _car1 createVehicle[_x,_y,_z];
_car1obj setDir round(random 360);
_car1obj setVectorUp[0,0.2,0];
_car1obj engineOn true;

[_car1obj, "BombCore", (getPosATL _car1obj), 250, 10, 10] spawn ACE_fnc_setVehicleDamage;


// dynamically create Units
_victim1 = _civgroup createUnit ["Worker1",_roadobjpos, [], 10, "FORM"];
_victim2 = _civgroup createUnit ["Worker2",_roadobjpos, [], 10, "FORM"];

waitUntil{sleep 0.5; _heli distance _car1obj <= 1000};

//[_victim1,0.5] call ace_sys_wounds_fnc_addDamage;
[_victim1, -1] call ace_blackoutAll;

//[_victim2,0.5] call ace_sys_wounds_fnc_addDamage;
[_victim2, -1] call ace_blackoutAll;


hint "victims injured";

waitUntil{((_heli distance (getMarkerPos "hospital1") <= 40)||(_heli distance (getMarkerPos "hospital2") <= 40)||(_heli distance (getMarkerPos "hospital3") <= 40)||(_heli distance (getMarkerPos "hospital4") <= 40)||(_heli distance (getMarkerPos "hospital5") <= 40)||(_heli distance (getMarkerPos "hospital6") <= 40)||(_heli distance (getMarkerPos "hospital7") <= 40)) AND ((_victim1 in _heli == false) && (_victim2 in _heli == false))};
hint "NEAR HOSPITAL";
mission3End = true;



