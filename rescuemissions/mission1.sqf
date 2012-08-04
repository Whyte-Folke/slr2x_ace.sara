_heli = _this;
_iswater = false;
_j = 0;
_k = 0;
_x = 0;
_y = 0;

while {!_iswater} do{
        _x = round(random 1500)+500;
	_y = round(random 1500)+3900;
	
        _iswater = surfaceIsWater [_x,_y];
	_j = _j + 1;
	hint format["_j = %1 \n _iswater = %2 \n _x = %3 \n _y = %4", _j,_iswater,_x,_y];
	sleep 3;
	
};

_boat = "Fishing_Boat" createVehicle [_x, _y, -1];
_boat setVectorUp[0.2,-0.3,0];

_marker = createMarker ["Emergency", [_x,_y]];
_marker setMarkerColor "ColorRed";
_marker setMarkerType "Warning";
_marker setMarkerText "Emergency here!";

_SideHQ = createCenter civilian;
_civgroup = createGroup civilian;
_boatpos = getPos _boat;

_fisher1 = "Worker1" createUnit [[(_boatpos select 0) + 5, (_boatpos select 1) - 8, _boatpos select 2],_civgroup];
_fisher2 = "Worker2" createUnit [[(_boatpos select 0) - 7, (_boatpos select 1) + 13, _boatpos select 2],_civgroup];
_fisher1 join _civgroup;
_fisher2 join _civgroup;

waitUntil{sleep 0.2; _heli distance _boat <= 1000};

hint "--- ANGEL 60 --- \n ANGEL HQ, ANGEL 60. We have arrived near the estimated location of accident.\n We are beginning with the search. \n ANGEL 60, out!";

waitUntil{sleep 0.3; _heli distance _boat <= 400};

hint "--- ANGEL 60 --- \n ANGEL HQ, ANGEL 60. We have found the boat. \n Beginning rescue of the fishers. \n ANGEL 60, out!";

waitUntil{sleep 1;_heli distance helipad <= 20};
hint "--- ANGEL 60 --- \ ANGEL HQ, ANGEL 60 has arrived at Kinsella Hospital. Unloading patients. \n ANGEL 60, over and out!";
sleep 30;

if(_fisher1 in crew _heli)then
{
_fisher1 action ["eject",_heli];
_fisher2 action ["eject",_heli];
sleep 10;
mission1End = true;
};