 _art = _this select 0;
 
 if (_art == "use") then 
 {										
 
 _item   = _this select 1;					
 _anzahl = _this select 2;															
 _vcl  = vehicle player;											
 _type = typeOf _vcl;																							
 
 if (player == _vcl)                  exitWith {player groupChat localize "STRS_inv_items_speed_car";};							
 if ((_type call INV_GetFahrzeugTyp) > 2) exitWith {player groupChat localize "STRS_inv_items_speed_no";};																						
 
 player groupChat localize "STRS_inv_items_speed_tuned";			
 format ["INV_Speed_SpeedVehicles = INV_Speed_SpeedVehicles + [%1]", _vcl] call ISSE_pub_execPstr;			
 [_item, -1] call INV_AddInventoryItem;};
 
 if (_art == "activate") then 
 {										
 _vehicle = _this select 1;								
 _type    = typeOf _vehicle;								
 
 if (!(_caller in _vehicle))       exitWith {player groupChat localize "STRS_inv_items_speed_nocar";};		
 
 if (speed _vehicle < 1)           exitWith {player groupChat localize "STRS_inv_items_speed_notmoving";};											
 if (!(player == driver _vehicle)) exitWith {player groupChat localize "STRS_inv_items_speed_nodriver";};			
 
 player groupChat localize "STRS_inv_items_speed_nitroenabled";																	
 
 _schleifendurchlauf = 180; 					
 
 for [{_i=0}, {_i < _schleifendurchlauf}, {_i=_i+1}] do 
 {														
 _vel = velocity _vehicle;														
 _dir = getdir _vehicle;																						
 _vehicle setVelocity [(_vel select 0) * 1.01, (_vel select 1) * 1.01, (_vel select 2) * 0.99];						
 _vehicle setfuel ((fuel _vehicle) - (0.01/_schleifendurchlauf));																				
 
 sleep 0.01;							
 
 };};
 
 if (_art == "init") then 
 {									
 
 if (isNil "INV_Speed_SpeedVehicles") then {INV_Speed_SpeedVehicles = [];};						
 
 INV_Speed_SpeedAllowed  = true;																						
 _added  = 0;															
 _vcl    = 0;														
 _action = 1;															
 
 while {true} do 
 {																																																
 
 for [{_i=0}, {(_i < (count INV_Speed_SpeedVehicles) and (_added == 0))}, {_i=_i+1}] do 
 {																																							
 
 if (not(isNull(INV_Speed_SpeedVehicles select _i))) then 
 {																
 
 _vcl = (INV_Speed_SpeedVehicles select _i);																												
 
 if (player == driver _vcl) then 
 {										
 _action = _vcl addAction [localize "STRS_inv_items_speed_action", "someCompile.sqf", [ format['["activate", %1] execVM "nitro.sqf";', _vcl] ] ];																				
 _added  = 1;																				
 };																																							
 
 } else {																												
 
 INV_Speed_SpeedVehicles set [_i, ""];																																												
 INV_Speed_SpeedVehicles = INV_Speed_SpeedVehicles - [""];																											
 
 };												
 
 };																																
 
 if (_added == 1) then 
 {																																																				
 
 if (player != driver _vcl) then 
 {								
 _vcl removeAction _action;																																																				
 _added = 0;																																							
 };												
 
 };																																																
 
 sleep 1;							
 };};