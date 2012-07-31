// Vehicle Despawn
// vehDespawn.sqf

_art = _this select 0;


if (_art == "CreatedVehicle") then {
	["respawn", (_this select 1), -1, 120, ""] execVM "vehDespawn.sqf";
};


if ((_art == "respawn") and (isServer)) then {
	_vcl        = _this select 1;
	_spawnzeit  = _this select 2;
	_deletewait = _this select 3;
	_vclname    = _this select 4;
	_vcltype    = typeOf(_vcl);
	_spawnpos   = getpos(_vcl);
	_spawndir   = getdir(_vcl);
	_idlepos    = _spawnpos;
	if (debug) then {
		debugarray = debugarray + [ format["Checking Vehicle: %1 (%3) - %2.", _vcl, _spawnzeit, _vcltype] ];
	};
	while {true} do {
		_deleted    = false;
		_exit       = false;
		_idle       = 0;
		while {true} do {
			if (_idle > (INV_inactive_vcl_maxtime*60)) then {
				for [{_i=0}, {_i < (count playerstringarray)}, {_i=_i+1}] do {
					if ((playerstringarray select _i) call ISSE_UnitExists) then {
						if (((playerarray select _i) in _vcl) or ((playerarray select _i) distance _vcl < 150)) then {
							_idle = (_idle/2);
						};
					};
					{
						if ((_vcl distance (_x select 0)) < (_x select 1)) then 
						{
							_idle = 0;
						};
					} forEach INV_VehicleGaragen;
				};

				if (_idle > (INV_inactive_vcl_maxtime*60)) then {_exit = true;};
			};
			
			sleep 10;
			
			if (isNull _vcl) exitWith {_deleted = true;};
			if ((not(alive _vcl)) or (_exit)) exitWith {};
			if ( (((_vcl distance _spawnpos) > 20) or (locked _vcl)) and (_vcl distance _idlepos < 150) and (count(crew _vcl) == 0) ) then {
				_idle = _idle + 10;
			} else {
				_idlepos = (getpos _vcl);
				_idle = 0;
			};
		};
		
		if (debug) then {
			debugarray = debugarray + [ format["Deleting/Respawning Vehicle: %1 (%3) - %2.", _vcl, _spawnzeit, _vcltype] ];
		};
		
		if (not(_deleted)) then {
			if (not(alive _vcl)) then {sleep _deletewait;};
		};
		
		if (_spawnzeit == -1) exitWith {
			if (not(isNull _vcl)) then {
				call compile format ["if (!(isNil ""%1"")) then {%1 = []; PublicVariable ""%1"";};", format["%1_storage", _vcl]];
				call compile format ["if (!(isNil ""%1"")) then {%1 = []; publicvariable ""%1"";};", format["%1_maxWeight", _vcl]];
				call compile format ["if (!(isNil ""%1"")) then {%1 = []; publicvariable ""%1"";};", format["%1_Weight", _vcl]];
				_vcl setVehicleInit "";
				call compile format["%1 = nil;", _vcl];
				deleteVehicle _vcl;
			};
		};
		
		sleep _spawnzeit;
		call compile format ["%1 = _vcltype createVehicle _spawnpos; %1 setVehicleInit ""this setVehicleVarName """"%1"""";""; processInitCommands; %1 setpos _spawnpos; %1 setdir _spawndir;_vcl = %1;", _vclname];
	};
};
