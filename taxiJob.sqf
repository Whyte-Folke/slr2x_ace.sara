// Taxi Missions
// taxiJob.sqf

_art = ((_this select 3) select 0);

if (isNil "INV_LocalTaxiKunde") then {INV_LocalTaxiKunde = player; };
if (isNil "workplacejob_taxi_sperre") then {workplacejob_taxi_sperre = false;};
if (isNil "workplacejob_taxi_kundebeginn") then {workplacejob_taxi_kundebeginn = false;};
if (isNil "workplacejob_taxi_kundeactive" ) then {	workplacejob_taxi_kundeactive = false;	};
if (isNil "workplacejob_taxi_active") then { workplacejob_taxi_active = false;};
if (isNil "workplacejob_taxi_serverarray") then { workplacejob_taxi_serverarray = [];};

if (_art == "serverloop") then {
	while {true} do {
		for [{_i=0}, {_i < (count workplacejob_taxi_serverarray)}, {_i=_i+1}] do {
			if (isNull ((workplacejob_taxi_serverarray select _i) select 0)) then {
				if (!(isNull ((workplacejob_taxi_serverarray select _i) select 1))) then {
					deleteVehicle ((workplacejob_taxi_serverarray select _i) select 1);
				};
				workplacejob_taxi_serverarray set [_i,""];
				workplacejob_taxi_serverarray = workplacejob_taxi_serverarray - [""];
			};
		};
		sleep 10;
	};
};

if (_art == "getajob_taxi") then {
	if (workplacejob_taxi_sperre) exitWith {
		player groupChat format [localize "STRS_workplacemission_taxi_alreadyinuse",workplacejob_taxi_sperrzeit]
	};
	if (!isTaxidriver) exitwith {player groupchat format [localize "STRS_workplacemission_taxi_no_license"];};
	workplacejob_taxi_active = true;
	workplacejob_taxi_sperre = true;
	while {true} do {
		_startzahl  = (floor(random(count workplacejob_taxi_zielarray)));
		_start		= (workplacejob_taxi_zielarray select _startzahl);
		_ziel		= (workplacejob_taxi_zielarray select _startzahl);
		_spielerstart	= getPos (vehicle player);
		while {true} do {
			_zielzahl = (floor(random(count workplacejob_taxi_zielarray)));
			if (_zielzahl != _startzahl) exitWith {_ziel = (workplacejob_taxi_zielarray select _zielzahl);};
		};
		_taxizeit = time;
		call compile format [" ""Civilian%1"" createUnit [[(_start select 0),(_start select 1),0], group civ_logicunit, ""%2taxikunde = this; this setVehicleVarName """"%2taxikunde""""; this disableAI """"MOVE""""; this disableAI """"TARGET"""";""]; [%2taxikunde] join grpNull; ", ((ceil(random(19)))+1), player];
		processInitCommands;
		format["workplacejob_taxi_serverarray + [%1, %1taxikunde];", player] call ISSE_pub_execPstr;
		_markerobj = createMarkerLocal ["taxikundenmarker",[0,0]];
		_markername= "taxikundenmarker";
		_markerobj setMarkerShapeLocal "ICON";
		"taxikundenmarker" setMarkerTypeLocal "Marker";
		"taxikundenmarker" setMarkerColorLocal "ColorYellow";
		"taxikundenmarker" setMarkerTextLocal localize "STRS_workplacemission_taxi_marker_kunde";
		_markername SetMarkerPosLocal _start;_action = 0;
		player groupChat localize "STRS_workplacemission_taxi_begin";


		while {true} do {
			sleep 1;
			INV_LocalTaxiKunde = player;
			call compile format["INV_LocalTaxiKunde = %1taxikunde", player];

			if ((player != (vehicle player)) and (((vehicle player)) distance INV_LocalTaxiKunde < 30) and ((speed ((vehicle player))) < 2) and (not(workplacejob_taxi_kundeactive))) then {
				player groupChat localize "STRS_workplacemission_taxi_wannagetin";

				if (((vehicle player) emptyPositions "cargo")>0) then {
					format["%1 assignAsCargo %2; [%1] orderGetIn true;", INV_LocalTaxiKunde, (vehicle player) ] call ISSE_pub_execPstr;
					workplacejob_taxi_kundeactive = true;
					_warte = time;
					waitUntil {(INV_LocalTaxiKunde in vehicle player) or ((_warte+10)<time) or (INV_LocalTaxiKunde distance (vehicle player) <3)};

					if ((not(INV_LocalTaxiKunde in vehicle player)) and (player != (vehicle player))) then {
						format["%1 moveInCargo %2",INV_LocalTaxiKunde, vehicle player] call ISSE_pub_execPstr;
					};
					
					if (not(workplacejob_taxi_kundebeginn)) then {
						player groupChat localize "STRS_workplacemission_taxi_target";
						workplacejob_taxi_kundebeginn = true;
						_markername setMarkerPosLocal _ziel;
						"taxikundenmarker" setMarkerTextLocal localize "STRS_workplacemission_taxi_marker_ziel";
					};
				} else {
					player groupChat localize "STRS_workplacemission_taxi_nospace";
					
				};
				
			};
			
			if ((player == (vehicle player)) and (workplacejob_taxi_kundeactive)) then {format["%1 action [""getOut"", (%2)]; unassignVehicle %1;",INV_LocalTaxiKunde,(vehicle player)] call ISSE_pub_execPstr;
			workplacejob_taxi_kundeactive = false;};
			if ((not(player == (vehicle player))) and (((vehicle player)) distance _ziel < 30) and ((speed ((vehicle player))) < 2) and (workplacejob_taxi_kundeactive) and (INV_LocalTaxiKunde in ((vehicle player)))) exitWith {
				_money = (( 750 max ( round((((_spielerstart distance _start)+(_start distance _ziel))*workplacejob_taxi_multiplikator)-(time-_taxizeit)) ) ) min workplacejob_taxi_maxmoney );
				if (_money < 0) then {
					_money = 0;
				};
				
								// Old Moneyadd
				// ['geld', _geld] call INV_AddInventoryItem;
				// player groupChat format [localize "STRS_workplacemission_taxi_success",_geld];
				
				// New Moneyadd (taxed... hihi)
				TaxiMissionReward = TaxiMissionReward + _money;
				player groupChat format [localize "STRS_workplacemission_taxi_success",_money];

				format["%1 action [""getOut"", (%2)]; unassignVehicle %1;",INV_LocalTaxiKunde,(vehicle player)] call ISSE_pub_execPstr;
				sleep 5;
				format["%1 doMove [(%2 select 0),(%2 select 1),0];", INV_LocalTaxiKunde, _ziel] call ISSE_pub_execPstr;
				sleep ((random 10)+5);	
			};
		
			if ((not(alive player)) or (not(alive INV_LocalTaxiKunde))) exitWith {
				player groupChat localize "STRS_workplacemission_taxi_failure";
				sleep 10;
			};
					
			if (not(workplacejob_taxi_active)) exitWith {
				player groupChat localize "STRS_workplacemission_taxi_canceled";
				sleep 10;
			};
					
			if (!workplacejob_taxi_kundebeginn) then {_markername SetMarkerPosLocal getPos INV_LocalTaxiKunde; };

			if (((player distance workplacejob_actionflag_search <= 5) or (player distance workplace_getjobflag_2 <= 5) or (player distance workplace_getjobflag_3 <= 5)) and (_action == 0))  then {
				workplace_gettaxicancelaction = player addAction [localize "STRS_workplacemission_taxi_cancelaction", "taxiJob.sqf", ["canceljob_taxi"]]; _action = 1;
			};
					
			if ((((player distance workplacejob_actionflag_search > 5) and (player distance workplace_getjobflag_2 > 5) and (player distance workplace_getjobflag_3 > 5)) and (_action == 1))) then {
				player removeAction workplace_gettaxicancelaction; _action = 0;
			};
		};
				
		deleteVehicle INV_LocalTaxiKunde;
		deleteMarkerLocal _markername;
		workplacejob_taxi_kundeactive = false;
		workplacejob_taxi_kundebeginn = false;
		if (isNull(INV_LocalTaxiKunde)) exitWith {};
		if ((not(alive player)) or (not(alive INV_LocalTaxiKunde)) or (not(workplacejob_taxi_active))) exitWith {};
	};
			
	player removeAction workplace_gettaxicancelaction;
	sleep ((workplacejob_taxi_sperrzeit)*60);
	workplacejob_taxi_active = false;
	workplacejob_taxi_sperre = false;
};
		
if (_art == "canceljob_taxi") then {
	player removeAction workplace_gettaxicancelaction;
	workplacejob_taxi_active = false;
};
