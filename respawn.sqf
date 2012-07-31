// Respawn Script
// respawn.sqf

_rolenumb = VehicleVarName player; 

if (isNil "SLR_gIntroFinished") then { SLR_gIntroFinished = false; };

waitUntil {SLR_gIntroFinished};
while {true} do {
	waituntil {alive player};
	player removeAction playanimationaction;
	player removeAction statdialogaction;
	player removeAction action_inventar;
	statdialogaction    = player addAction [localize "STRS_dead_menuentry_hints",     "openDialogs2.sqf", ["spielerliste"]];
	
	if (!iscop) then
 	 {	
 		action_inventar = player addAction [localize "STRS_dead_menuentry_inventar", "invOpen.sqf", []];
	 } 
	 else 
	 {
	    action_inventar_cop = player addAction [localize "STRS_dead_menuentry_inventar", "cop_inventory_dialog.sqf", []];   
     };
     
	playanimationaction = player addAction [localize "STRS_dead_menuentry_animation", "animDlgOpen.sqf", []];
	if ((iscop) OR (rolecop == 1)) then {
		player removeAction action_copmenulite;
		action_copmenulite = player addAction [format[localize "STRS_addAction_copmenulite"], "openDialogs2.sqf",["copmenulite"]];
	};
	// Gear for Cops after respawn or when joining
	if (iscop) then {
		removeAllWeapons player;
		if (count lostWeapons == 0) then {
			{player addMagazine _x;} forEach CopStartGear_Mags;
			{player addWeapon   _x;} forEach CopStartGear_Weap;
		} else {
			{player addMagazine _x;} forEach lostMagazines;
			{player addWeapon   _x;} forEach lostWeapons;
		};
	};
	// Gear for SWAT after Respawn or when joining
	if (isswat) then {
		removeAllWeapons player;
		if (count lostWeapons == 0) then {
			{player addMagazine _x;} forEach SWATStartGear_Mags;
			{player addWeapon   _x;} forEach SWATStartGear_Weap;
		} else {
			{player addMagazine _x;} forEach lostMagazines;
			{player addWeapon   _x;} forEach lostWeapons;
		};
	};
	// Gear for Undercover after Respawn or when joining
	if (isundercover) then {
		removeAllWeapons player;
		if (count lostWeapons == 0) then {
			{player addMagazine _x;} forEach UndercoverStartMags;
			{player addWeapon   _x;} forEach UndercoverStartWeap;
		} else {
			{player addMagazine _x;} forEach lostMagazines;
			{player addWeapon   _x;} forEach lostWeapons;
		};
	
	};

	waituntil {!(alive player)};
	sleep 0.5;
	closeDialog 0;
	INV_hunger = 5;
	INV_thirst = 5;
	INV_Nutrition = 100;
	localhuren = 0;
	deadtimes  = deadtimes + 1;
	["deadtimes", deadtimes] spawn ClientSaveVar;
	call compile format ["%1", "disableUserInput false"];
	if ((iscop) OR (rolecop == 1)) then {} else {call INV_InventarLeeren};
	lostWeapons   = weapons role;
	lostMagazines = magazines role;
	removeAllWeapons role;
	if (isMayor) then {
		call mayorLoosePosition;
		"hint format [localize ""STRS_mayor_died"", _rolenumb];" call ISSE_pub_execPstr;
	};
	/*if (isChief) then {
		call ChiefLoosePosition;
		"hint format [localize ""STRS_chief_died"", _rolenumb];" call ISSE_pub_execPstr;
		player setunitrank "CORPORAL";
	};*/
	if ((rolecop == 0) || (roleundercover == 1)) then {
		if (roleterrorist == 1) then {
			// Respawn for the active by training terrorist
			DeadWaitSec = DeadWaitSec + deadtimewait;
			if (DeadWaitSec > DeadTimeMax) then {DeadWaitSec = DeadTimeMax;};
			[] execVM "respawnCam.sqf";
			player groupChat format [localize "STRS_dead_player_is_dead_terrorist", (round(respawnzeit+(DeadWaitSec)) call ISSE_str_IntToStr)];
			sleep 3;
			["DeadWaitSec", DeadWaitSec] spawn ClientSaveVar;
			call compile format ['%1_arrest = 0; %1_wanted = 0; %1_markerjammed = 0; publicVariable "%1_arrest"; publicVariable "%1_wanted"; publicVariable "%1_markerjammed";', rolestring];
			showMap true;
			sleep respawnzeit-5;
			waituntil {alive player};
			removeAllWeapons player;
			//deleteVehicle role;
			role = player;
			waituntil {deadcam == 0};
			holstervar = false;
			unholstervar = false;
			['handy', 1] call INV_SetItemAmount;
			if (local_arrest == 0) then {
			_respawncityhall = getpos rathaus;
			player setpos _respawncityhall;
			//if('terrorist' call INV_haslicense) then {execVM "clone.sqf"};
			} else {
			(format ["if (isServer) then {[""arrestserver"", %1, %2, %4] execVM ""civMenuActions.sqf"";};", player, CivTimeInPrison, longrolenumber, player]) call ISSE_pub_execPstr;
			//if('terrorist' call INV_haslicense) then {execVM "clone.sqf"};
			};
		
		} else {	
				// Respawn for all other Civs
				DeadWaitSec = DeadWaitSec + deadtimewait;
				if (DeadWaitSec > DeadTimeMax) then {DeadWaitSec = DeadTimeMax;};
				[] execVM "respawnCam.sqf";
				player groupChat format [localize "STRS_dead_player_is_dead_civ", (round(respawnzeit+(DeadWaitSec)) call ISSE_str_IntToStr)];
				sleep 3;
				["DeadWaitSec", DeadWaitSec] spawn ClientSaveVar;
				call compile format ['%1_arrest = 0; %1_wanted = 0; %1_markerjammed = 0; publicVariable "%1_arrest"; publicVariable "%1_wanted"; publicVariable "%1_markerjammed";', rolestring];
				showMap true;
				sleep respawnzeit-5;
				waituntil {alive player};
				removeAllWeapons player;
				//deleteVehicle role;
				role = player;
				waituntil {deadcam == 0};
				holstervar = false;
				unholstervar = false;
				['handy', 1] call INV_SetItemAmount;
				if (local_arrest == 0) then {
					if ((isBodyguard) or (roleBodyguard == 1)) then {
						_respawncityhall = getpos rathaus;
						player setpos _respawncityhall;
					} else {
						_targetnumber  = (floor(random(count respawnarray_mark)));
						_targetpos 	   = (respawnarray_mark select _targetnumber);
						player setpos _targetpos;
					};	
                    
                    if (INV_local_hashideout > 0) then {
                    	player setpos getpos (hideout_objarray select 0);  
                    }; 
				} else {
					(format ["if (isServer) then {[""arrestserver"", %1, %2, %4] execVM ""civMenuActions.sqf"";};", player, CivTimeInPrison, longrolenumber, player]) call ISSE_pub_execPstr;
				};
			};		
	} else {
		// Respawn for the cops
		if (DeadWaitSec > DeadTimeMax) then {DeadWaitSec = DeadTimeMax;};
		player groupChat format [localize "STRS_dead_player_is_dead_cop", (round(DeadWaitSec) call ISSE_str_IntToStr)];
		[] execVM "respawnCam.sqf";
		sleep respawnzeit-5;
		waitUntil {alive player};
		removeAllWeapons player;
		//deleteVehicle role;
		role = player;
		holstervar = false;
		unholstervar = false;
		['handy', 1] call INV_SetItemAmount;
		if ((isborderpatrol) or (roleborderpatrol == 1)) then {
			_borderprespawn = getpos borderpatrol_flag;
			player setpos _borderprespawn;
		};
	};
sleep 1;
};