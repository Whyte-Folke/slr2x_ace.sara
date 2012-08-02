// Impound Vehicles by UN4 2008

//impound = 1000;
_art = _this select 0;

if (_art == "use") then {		
	//_item   = _this select 1;			
	//_anzahl = _this select 2;																	
	_closeVcl   = dummyobj;			
	_closest    = -1;	
	{ if (not(isNull(_x))) then {	
		if ( ((player distance _x) < 7) and ( ((player distance _x) < _closest) or (_closest == -1) ) ) then {																												
			_closest  = (player distance _x);																																				
			_closeVcl = _x;
		};					
	};		
	} forEach INV_ServerVclArray;			
	
	_passengers = crew _closeVcl;
	
	if (not(_closest == -1)) then {																						
		if (_closeVcl in INV_VehicleArray) then {
			player groupchat localize "STRS_inventar_impound_already";		
		} else {
			if (count _passengers > 0) exitWith {player groupChat localize "STRS_inventar_impound_cant"};
			if ((random 100) > 5) then { 
				format ["%1 lock false;", _closeVcl] call ISSE_pub_execPstr;
				_closeVcl setpos [(getpos impoundlot select 0)+(random 4)-(random 4), (getpos impoundlot select 1)+(random 4)-(random 4), (getpos impoundlot select 2)];
				sleep 0.5;
				_closeVcl setdir 180;
				//kontostand = kontostand + impound; 
				//impound call ISSE_str_IntToStr;
				player groupChat localize "STRS_inventar_impound_success"; 																																																				
			} else {																																												
				player groupChat localize "STRS_inventar_impound_noluck";		
			};								
			//[_item, -1] call INV_AddInventoryItem;										
		};													
	} else {
		player groupChat localize "STRS_inventar_impound_zuweit";	
	};
};
