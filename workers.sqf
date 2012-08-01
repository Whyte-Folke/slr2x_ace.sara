// Worker Script
// workers.sqf

_art  = ((_this select 3) select 0);
_money = 'money' call INV_GetItemAmount;

if (_art == "holen") exitWith {
	if (localhuren >= maxhuren) exitWith {role groupChat localize "STRS_arbeiter_zuviele";};
	if (_money <= huren_cost)    exitWith {role groupChat localize "STRS_arbeiter_nomoney";};
	['money', -(huren_cost)] call INV_AddInventoryItem;
	player groupChat format[localize "STRS_arbeiter_gekauft", rolestring, (huren_cost call ISSE_str_IntToStr)];
	_arbeiternummer   = localhurencounter; 
	localhurencounter = localhurencounter + 1;
	localhuren        = localhuren + 1;
	_hoenumber        = localhurencounter;
	_hoename          = player;
	call compile format [" ""SoldierGCaptive"" createUnit [position player, group player, ""%1hure%2 = this; this setVehicleVarName """"%1hure%2"""";""]; _hoename = %1hure%2;", rolestring, _hoenumber];
	processInitCommands;							
	(format ["if (iscop) then {%2hure%3 addaction [localize ""STRS_arbeiter_copaction"", ""someCompile.sqf"", [""player groupChat format[localize """"STRS_arbeiter_meister"""", %2];""]];};
	if (isServer) then {
		publicarbeiterarctionarray = publicarbeiterarctionarray + [ [%2hure%3, %4] ];
	};", _hoename, rolestring, _hoenumber, player]) call ISSE_pub_execPstr;
	call compile format ["arbeitermoney%1 = 0;", _arbeiternummer];
	_hoemoney = 0; 
	_exitvar = 0; 
	_a1 = 0; 
	_action = 0;					
	while {true} do {
		if (_exitvar == 1) exitWith {}; 
		{if ((player distance (_x select 0)) < (_x select 1)) then {call compile format ["arbeitermoney%1 = arbeitermoney%1 + (round(random hoemoneyprosekunde));", _arbeiternummer];};} forEach workplacearray;
		for [{_i=0}, {_i < 60}, {_i=_i+1}] do {

			if ((player distance _hoename >= 5) and (_a1 == 1)) then {
				player removeaction _action; _a1 = 0;
			};
			if ((player distance _hoename <  5) and (_a1 == 0)) then {
				_action = player addaction [localize "STRS_arbeiter_moneyaction", "workers.sqf",["money", _arbeiternummer]]; ; _a1 = 1;
			};
			if ((rolecop == 0) and ((vehicle _hoename) DISTANCE copbase1 <= 75) and (alive _hoename)) then {
				player groupChat localize "STRS_arbeiter_in_copbase";
				if (not((vehicle _hoename) == _hoename)) then {
					_hoename action ["eject", (vehicle _hoename)];
				}; 
				_hoename setpos getpos hospitaltent;
			};
			if ((rolecop == 1) and ((vehicle _hoename) DISTANCE terrorhideoutlogic <= 250) and (alive _hoename)) then {
				player groupChat localize "STRS_arbeiter_in_terrorbase"; 
				if (not((vehicle _hoename) == _hoename)) then {
					_hoename action ["eject", (vehicle _hoename)];
				}; 
			_hoename setpos getmarkerpos "cophospitaltent";
			
			};	
			if (not(alive _hoename)) then {
				player removeaction _action;
				sleep 600;
				deletevehicle _hoename;
			};
		sleep 1;
		};					
	};
};

if (_art == "money") exitWith {
	_arbeiternummer = (_this select 3) select 1;
	_arbeitermoney   = call compile format ["arbeitermoney%1;", _arbeiternummer];
	if (_arbeitermoney > 0) then {
		//['money', _arbeitermoney] call INV_AddInventoryItem;
		WorkerHoeEarnings = WorkerHoeEarnings + _arbeitermoney;
		call compile format ["arbeitermoney%1 = 0;", _arbeiternummer];
		player groupChat format [localize "STRS_arbeiter_moneyabnahme_ja", (_arbeitermoney call ISSE_str_IntToStr)];
	} else {
		player groupChat localize "STRS_arbeiter_moneyabnahme_nein";
	};
};
