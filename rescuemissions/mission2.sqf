_args = _this;
_heli = _this select 0;
_pos = getPos player;

hint "--- ANGEL HQ --- \n ANGEL 60, this is HQ. We have a new mission for you! \n Pick up supplies at Kinsella airport and fly them to Mangomak Island. The island itself is cut off since 8 days and they are running low on food. ANGEL HQ, out!";
sleep 15;

_marker1pos = [8684.06,8757.34];
_marker2pos = [4265.34,2149.53];
_markerpos3d = [_marker1pos select 0, _marker1pos select 1, 0];

_marker1 = createMarker ["Delivery", _marker1pos];
_marker1 setMarkerColor "ColorBlue";
_marker1 setMarkerType "Warning";
_marker1 setMarkerText "Deliver goods here!";

_helipad = "HeliH" createVehicle (_markerpos3d);
_helipad setDir 255;

_marker2 = createMarker ["PickUp", [_x,_y]];
_marker2 setMarkerColor "ColorBlue";
_marker2 setMarkerType "Warning";
_marker2 setMarkerText "Pick up goods here!";

//hint "--- ANGEL 60 --- \n ANGEL HQ, ANGEL 60, Mission received. Over and out!";
//hint format ["_x = %1 \n _y = %2",_pos select 0, _pos select 1];

_bag1 = "Land_Bag_EP1" createVehicle [_marker2pos select 0 - 0.02, _marker2pos select 1,0];
_bag2 = "Land_Bag_EP1" createVehicle (getPos _bag1);
_bag3 = "Land_Bag_EP1" createVehicle (getPos _bag2);
_bag4 = "Land_Bag_EP1" createVehicle (getPos _bag3);
_bag5 = "Land_Bag_EP1" createVehicle (getPos _bag2);
_bag6 = "Land_Bag_EP1" createVehicle (getPos _bag1);

_action1 = _bag1 addAction["Pick up Bag", "rescuemissions\attachbags.sqf", [_heli], 6, false, true, "", ""];
_action2 = _bag2 addAction["Pick up Bag", "rescuemissions\attachbags.sqf", [_heli], 6, false, true, "", ""];
_action3 = _bag3 addAction["Pick up Bag", "rescuemissions\attachbags.sqf", [_heli], 6, false, true, "", ""];
_action4 = _bag4 addAction["Pick up Bag", "rescuemissions\attachbags.sqf", [_heli], 6, false, true, "", ""];
_action5 = _bag5 addAction["Pick up Bag", "rescuemissions\attachbags.sqf", [_heli], 6, false, true, "", ""];
_action6 = _bag6 addAction["Pick up Bag", "rescuemissions\attachbags.sqf", [_heli], 6, false, true, "", ""];

hint "HELI";
hint format ["heli = 1%",_heli];

waitUntil{_heli distance _helipad < 10};
sleep 8;
hint "Unloading goods!";
detach _bag1;
detach _bag2;
detach _bag3;
detach _bag4;
detach _bag5;
detach _bag6;
hint "Goods delivered!";
mission2End = true;

deleteMarker _marker1;
deleteMarker _marker2;
