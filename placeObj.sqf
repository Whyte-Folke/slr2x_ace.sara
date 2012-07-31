// Spawnable Object Scripts
// placeObj.sqf

_art = _this select 0;

// Item Variables
if (_art == "init") then
{
	_arr = [];
	// Spawn the Items if Ok to do so
	while {true} do {

		for [{_i=0}, {_i < count INV_objSpawned }, {_i=_i+1}] do
		{
			if (isNull(INV_objSpawned select _i)) then
			{
				INV_objSpawned set [_i, ""];
				INV_objSpawned = INV_objSpawned - [""];
			};
		};

		for [{_i=0}, {_i < count INV_objServerSpawned }, {_i=_i+1}] do
		{
			if ( isNull ((INV_objServerSpawned select _i) select 0) ) then
			{
				INV_objServerSpawned set [_i, ""];
				INV_objServerSpawned = INV_objServerSpawned - [""];
			};
		};

		for [{_i=0}, {_i < count _arr }, {_i=_i+1}] do
		{
			if (isNull(_arr select _i)) then
			{
				_arr set [_i, ""];
				_arr = _arr - [""];
			};
		};
		
		for [{_i=0}, {_i < count INV_objSpawned}, {_i=_i+1}] do
		{
			_obj = INV_objSpawned select _i;
			if (not(_obj in _arr)) then
			{
				call compile format ['%1 addAction [localize"STRS_inv_item_obj_take", "someCompile.sqf", ''["pack", %1] execVM "placeObj.sqf";'']; ', _obj];
				_arr = _arr + [_obj];
			};
		};
		sleep 10;
	};

};

// Serverloop
if (_art == "Serverloop") then
{
		while {true} do
		{
			for [{_i=0}, {_i < count INV_objServerSpawned}, {_i=_i+1}] do
			{
				if (! (isNull ((INV_objServerSpawned select _i) select 0)) ) then
				{
					_obj  = ((INV_objServerSpawned select _i) select 0);
					_idle = ((INV_objServerSpawned select _i) select 1);
					_near = false;_exit = false;
					
					{
						if (!( isNull _x)) then
						{
							if ((_x distance _obj) < 50) exitWith
							{
								_near = true; _exit = true;
							};
						};
						if (_exit) exitWith {};
					}
					
					forEach playerarray;
					
					if (!_near) then
					{
						_idle = _idle + 10;
					}
					else
					{
						_idle = 0;
					};
					
					(INV_objServerSpawned select _i) set [1, _idle];
					
					if (_idle > INV_objIdleTime) then
					{
						_obj call INV_DeleteObject;
					};
				};
			};
			sleep 15.095;
		};
};

// Place the Object
if (_art == "use") then
{
	_exitvar = 0;
	if (player != vehicle player) exitWith {player groupChat localize "STRS_inv_item_obj_invcl";};
	{	
		if (player distance (_x select 0) < (_x select 1)) exitWith {
			_exitvar = 1;
		};
	} forEach INV_PlacingVerbotArray;
	if (_exitvar == 1) exitWith {player groupChat localize "STRS_inv_item_obj_hiernicht";};
	_item    = _this select 1;
	
	if ((count INV_objSpawned) >= INV_objMaxObject) exitWith
	{
		player groupChat format[localize"STRS_inv_item_obj_toomany", INV_objMaxObject];
	};
	_className = "";
	_distance = [];
	_height = [];
	_other = [];
	
	{
		if (_item == (_x select 0)) exitWith
		{
			_className = _x select 1;
			_distance = _x select 2;
			_height = _x select 3;
			_other = _x select 4;
		};
	} forEach INV_objItemScriptNames;
	
	if (_className == "" OR count _distance == 0 OR count _height == 0 OR count _other == 0) exitWith {hint "Error in inv_objs.sqf"};
	
	player groupChat localize "STRS_inv_item_obj_bauen";

	
	[_distance, _height, _other, _className, _item] execVM "placing\objPlace.sqf";
};


// Pick-up the Object
if (_art == "pack") then {
	_object = _this select 1;
	_className = typeOf _object;
	_exitvar   = 0;
	_item = "";
	{  if (_className == (_x select 1)) exitWith {_item = _x select 0;}; }

	forEach INV_objItemScriptNames;
	if (_item == "") exitWith {hint "Error in inv_objs.sqf";};
	if (!([_item, 1] call INV_CanCarryItems)) exitWith {player groupChat localize "STRS_inv_item_obj_cantpack";};
	player groupChat localize "STRS_inv_item_obj_packed";
	[_item, 1] call INV_AddInventoryItem;_object call INV_DeleteObject;
};
