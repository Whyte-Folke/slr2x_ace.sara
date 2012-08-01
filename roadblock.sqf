 // Roadblock script
 // roadblock.sqf
 _art = _this select 0;
 
if (_art == "init") then
{
	//INV_polizeisperre_cost       = 500;
	INV_SperrenVerbotArray       = [
	[sperrenverbot1, 250],
	[sperrenverbot2, 25 ],
	[sperrenverbot3, 30 ]];
	
	if (isServer) then
	{
		for [{_i=1}, {_i <= count(playerarray)}, {_i=_i+1}] do {
			call compile format ['
			strassensperre%1 = "Wire" createvehicle [0, 0, 0];
			strassensperre%1 setVehicleInit "this setVehicleVarName ""strassensperre%1"";
			strassensperre%1 = this;";
			[strassensperre%1, 300] spawn {
				private["_obj", "_dis", "_Move", "_x"];
				_obj = (_this select 0);
				_dis = (_this select 1);
				while {true} do {
					_Move = true;
					sleep 20;
					{ 
						if (not(isNull _x)) then { if ((_x distance _obj) < _dis) exitWith {_Move = false;}; }; 
					} forEach playerarray;
					if (_Move) then { _obj setpos [0, 0, 0]; };
				};
			};
			', _i];
		};
		sleep 0.2;
		processInitCommands;
	};
};
if (_art == "use") then
{
	//_item    = _this select 1;
	//_anzahl  = _this select 2;
	_exitvar = 0;
	if (player != vehicle player) exitWith {player groupChat localize "STRS_inv_item_sperre_invcl";};
	{	
		if (player distance (_x select 0) < (_x select 1)) exitWith {
			_exitvar = 1;
			player groupChat localize "STRS_inv_item_sperre_hiernicht";	
		};
	} forEach INV_SperrenVerbotArray;
	if (_exitvar == 1) exitWith {};
	if (isNil "INV_local_hassperre") then {INV_local_hassperre = 0;};
	if (INV_local_hassperre == 1) then
	{
		player groupChat localize "STRS_inv_item_sperre_moved";								
	} else {
	//if (('money' call INV_GetItemAmount) < polizeisperre_cost) exitWith {_exitvar = 1; player groupChat localize "STRS_inv_item_sperre_nomoney";};
	player groupChat localize "STRS_inv_item_sperre_built";
	//['money', -(INV_polizeisperre_cost)] call INV_AddInventoryItem;
	INV_local_hassperre = 1;
	call compile format ["localstrassensperre_obj = strassensperre%1;", sidenumber];
	};
	if (_exitvar == 1) exitWith {};	
	sleep 5;
	_posi = [(position player select 0) + (sin(getdir player)*2), (position player select 1) + (cos(getdir player)*2), 0];
	format ["%1 setdir %2; %1 setpos %3;", localstrassensperre_obj, (getdir player), _posi] call ISSE_pub_execPstr;
};