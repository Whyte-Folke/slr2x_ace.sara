// Drugs Scripts
// drugs.sqf

_art = _this select 0;
if (_art == "init") then {
	INV_drogenusesperre = 0;
	INV_drogen_usesperre = FALSE;
	INV_DrogenCounter = 0;
};
	if (_art == "use") then {
		_item   = _this select 1;
		_anzahl = _this select 2;
		if (INV_drogenusesperre == 1) exitWith {player groupChat localize "STRS_inv_item_druguse_toomany";};
		if (INV_drogen_usesperre) then {INV_drogenusesperre = 1;};
		INV_DrogenCounter =  INV_DrogenCounter + _anzahl;
		[_item, -(_anzahl)] call INV_AddInventoryItem;
		_endeZeit = time + 45 + (_anzahl * 10);
		_fadeInTime   = 0;
		_fadeOutTime  = 0;
		_faded = false;
		if (_item == "lsd") then {
			while {time < _endeZeit} do {
				_position = getpos player;
				_weite = 100;
				_x = _position select 0;
				_y = _position select 1;
				_z = _position select 2;
				_w1 = (random _weite) - (random _weite);
				_w2 = (random _weite) - (random _weite);
				_w3 = random 7;
				_f1 = random 1;
				_f2 = random 1;
				_f3 = random 1;
				_g1 = random 5;
				_g2 = random 10;
				_g3 = random 5;
				if (_w1 + _w2 > 100) then {
					_g1 = _g1 * 2;
					_g2 = _g2 * 2;
					_g3 = _g3 * 2;
				};
				_v1 = random 0.05;
				_v2 = random 0.05;
				_v3 = 0.1 - random 0.075;
				Drop ["\ca\data\cl_basic", "", "Billboard", 1, 60, [_x + _w1, _y + _w2, _z + _w3], [_v1, _v2, _v3], 1, 1.275, 1, 0, [_g1, _g2, _g3], [ [_f1, _f2, _f3, 1], [_f2, _f1, _f3, 1], [_f3, _f2, _f1, 1] ], [0, 0, 0], 3, 0.2, "", "", ""];
				if (time > _fadeInTime) then {
					titleCut ["","WHITE OUT",0];
					_fadeOutTime = time + 1;
					_fadeInTime  = time + 10;
					_faded  = false;
				};
				if ((time > _fadeOutTime) and (!_faded)) then {
					titleCut ["","WHITE IN",0];
					_faded = true;
				};
				sleep 0.001;
			};
		};
		if (_item == "kokain") then {
			while {time < _endeZeit} do {
				if (not(alive player)) exitWith {};
				player setdamage ((damage player) - 0.01);
				if (vehicle player == player) then {
					_v1 = velocity player select 0;
					_v2 = velocity player select 1;
					_v3 = velocity player select 2;
					_v1add = (random 5 - random 5); _v2add = (random 5 - random 5);
					player setVelocity [_v1+_v1add, _v2+_v2add, _v3];
				};
				if (time > _fadeInTime) then {
					titleCut ["","WHITE OUT",0];
					_fadeOutTime = time + 1;
					_fadeInTime  = time + 10;
					_faded = false;
				};	
				if ((time > _fadeOutTime) and (!_faded)) then {
					titleCut ["","WHITE IN",0];
					_faded = true;
				};
				sleep 1;
			};
		};
		if (_item == "kokain_low") then {
			while {time < _endeZeit} do {
				if (not(alive player)) exitWith {};
				player setdamage ((damage player) - 0.01);
				if (vehicle player == player) then {
					_v1 = velocity player select 0;
					_v2 = velocity player select 1;
					_v3 = velocity player select 2;
					_v1add = (random 4 - random 4); _v2add = (random 3 - random 3);
					player setVelocity [_v1+_v1add, _v2+_v2add, _v3];
				};
				if (time > _fadeInTime) then {
					titleCut ["","WHITE OUT",0];
					_fadeOutTime = time + 1;
					_fadeInTime  = time + 5;
					_faded = false;
				};	
				if ((time > _fadeOutTime) and (!_faded)) then {
					titleCut ["","WHITE IN",0];
					_faded = true;
				};
				sleep 1;
			};
		};
		if (_item == "marihuana") then 
		{
			while {time < _endeZeit} do 
			{
				if (not(alive player)) exitWith {};
				player setdamage ((damage player) - 0.01);

				if (vehicle player == player) then 
				{
					_v1 = velocity player select 0;
					_v2 = velocity player select 1;
					_v3 = velocity player select 2;
					_v1add = (random 5 - random 5); _v2add = (random 5 - random 5);
					player setVelocity [_v1+_v1add, _v2+_v2add, _v3];
				};
				
				if (time > _fadeInTime) then 
				{
					titleCut ["","WHITE OUT",0];
					_fadeOutTime = time + 1;
					_fadeInTime  = time + 10;
					_faded       = false;
				};	
				if ((time > _fadeOutTime) and (!_faded)) then 
				{
					titleCut ["","WHITE IN",0];
					_faded = true;
				};
				sleep 1;
			};
		};
		titleCut ["","WHITE IN",0];
		sleep 10;
		player groupChat localize "STRS_inv_item_druguse_ende";
		INV_drogenusesperre = 0;
		INV_DrogenCounter =  INV_DrogenCounter - _anzahl;
	};