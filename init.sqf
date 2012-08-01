Server_Client = false;
ace_sys_network_WeatherSync_Disabled = true;
HAMM_obj_placing = 0;
GameEnd = false;

waitUntil { ( (time > 1) and ((alive player) or (isServer)) ) };
if (isServer) then {
	if (!(isNull player)) then {Server_Client = true;};
};
_h = [] execVM "defineVars.sqf";
waitUntil{scriptDone _h};

if ((!isServer) or (Server_Client)) then 
{
	["kamera"] execVM "introCam.sqf";
	["texte"]  execVM "introCam.sqf";
};

_h = [] execVM "handler_functions.sqf";
waitUntil{scriptDone _h};

_h = [32, rolenumber] execVM "functions_public.sqf";
waitUntil{scriptDone _h};

_h = [] execVM "handler_goodsbuysell.sqf";
waitUntil{scriptDone _h};

pulledout = [];
"pulledout" addPublicVariableEventhandler { if(player == (_this select 1)) then { execVM "pulledout.sqf";}; };

if (isServer) then 
{	
	_h = [] execVM "\serverLoad.sqf";
	waitUntil {scriptDone _h};

	_h = []execVM "\scripts\server_init.sqf";
    waitUntil {scriptDone _h};
};

sleep 5;


if ((!isServer) or (Server_Client)) then 
{
    SLR_gPlayer = player;
	[]execVM "advancetime.sqf";
	[]execVM "loadStats.sqf";
	sleep 5;
	["clientloop"] execVM "saveObjVeh.sqf";
	[]execVM "setGraphics.sqf";						
	[]execVM "weather\weatherrec2.sqf";
	[]execVM "weather\weather_clientloop.sqf";
	[]execVM "unitgear.sqf";
	[]execVM "respawn.sqf";
	[2]execVM "markers.sqf";
	[3]execVM "markers.sqf";
	[]execVM "loopActions.sqf";
	[0, 0, 0, ["clientloop"]] execVM "guildsTerrorMisc.sqf";
	[]execVM "terrorist_shop.sqf";
	["clientloop2"]execVM "loopChecks.sqf";
    ["clientStateLoop"] execVM "loopChecks.sqf";
	[]execVM "animList.sqf";
	[]execVM "atmBankActions.sqf";
	[]execVM "someTrigger.sqf";
    [] execVM "restrain.sqf";
	[]execVM "someTrigger2.sqf";
	[]execVM "lottoFlagActions.sqf";
	[]execVM "refuelActions.sqf";
	[]execVM "addJobApplyActions.sqf";
	[]execVM "avgasrefuel_action.sqf";
	[]execVM "flagActions.sqf";
	[]execVM "salaries.sqf";
	["client"]execVM "bombs.sqf";
	["init"]execVM "forensicInvestigation.sqf";
	[]execVM "fadeToBlack.sqf";
	[]execVM "itemactions.sqf";
    [] execVM "clothing.sqf";
    ["init"] execVM "hideout.sqf";
    [] execVM "fun\fun.sqf";
	sleep 3;
	if (iscop) then 
	{
		for [{_i=1}, {_i <= copscount}, {_i=_i+1}] do 
		{
			call compile format ["actionstrassensperre%1 = strassensperre%1 addaction [localize ""STRS_addaction_removesperre"", ""someCompile.sqf"", [""strassensperre%1 setpos [0, 0, 0];""] ];", _i];
		};
	};
    
   // ["MPKilled", {_this execVM "killedScript.sqf"; ["killed", _this] execVM "forensicInvestigation.sqf"}] call CBA_fnc_addEventHandler;
    player addMPEventHandler ["MPKilled", {_this execVM "killedScript.sqf";}];
	player addEventHandler ["handleDamage",  { ["hit", _this] execVM "stun.sqf"; }];
};

/* Ace settings */
ace_sys_tracking_markers_enabled = false;
ace_sys_wounds_all_medics = true;
ace_sys_wounds_enabled = true;
ace_sys_wounds_leftdam = 0;

if (isCop) then {
	ace_wounds_prevtime = 150; 
} else {
	ace_wounds_prevtime = 300;    
};

waitUntil {SLR_gIntroFinished};

/* Sneaky stuff */
[] spawn {
    waitUntil {(!(isNil "UN4_Execute"))};
    [{ server globalchat format ["Player %1 is running the admin console!", (_this select 0)]; }, [name player]] call SLR_fnet_execPublic;  
    
    /* Monitor console usage */
    SLR_oc_execute = { _this spawn UN4_old_execute; [{ server globalchat format["%1 executed: %2", (_this select 0), (_this select 1)]; }, [name player, (_this select 0)]] call SLR_fnet_execPublic; };
    UN4_old_execute = UN4_Execute;
    UN4_Execute = SLR_oc_execute;
    
    SLR_oc_monitor = { _this spawn UN4_old_monitor; [{ server globalchat format["%1 is monitoring a player.", (_this select 0)]; }, [name player]] call SLR_fnet_execPublic; };
    UN4_old_monitor = UN4_MonitorPlayer;
    UN4_MonitorPlayer = SLR_oc_monitor;
	
	if (name player != "Unforgiven") then {
		//UN4_Execute = { };
	    //UN4_MonitorPlayer = { };
	    //UN4_PopulatePlayers = { };
	    
	    /* Disabled as admins can abuse */
	    UN4_ViewAllVariables = { };
		UN4_ViewVariable = { };
	    //UN4_Message_Send = { };  
	};
};


SLR_fnc_captainTom = {
	if ((name player == "Captain_English") || (name player == "Captain English")) then {
	    [] spawn {
		    
	        _objects = (nearestObjects[player,["STATIC"], 2500]);
	         _vcl = "FloorMop" createVehicleLocal getpos player;
		    _vcl attachTo[player,[0,0,1]];
	        hideObject player;
		    {
		        hideObject _x;
		        "MetalBucket" createVehicleLocal getpos _x;
		    } forEach _objects;
	 
	    };
	};
};

//Delete the units in the players group
_units = units group player;
{
    if (_x != player) then {
       	_x setPos [0,0,0];
    	deleteVehicle _x;
     	[{ if (isServer) then { deleteVehicle (_this select 0); }; }, [_x]] call SLR_fnet_execPublic; 
    };
} forEach _units;

//Stop ACE from moving my damn ammo crates.
[] spawn {
    sleep 30;
    
	_arr = [];
	{
	    _arr set[(count _arr), [_x, getPosATL _x]];
        _x addEventHandler ["handledamage", {0}];
	} forEach (nearestObjects[player,["ReammoBox"], 4000]);
    
    while {true} do {
		{
            _obj = (_x select 0);
            _pos = (_x select 1);
            
            if (_obj distance _pos > 5) then {
            	_obj setPos _pos;
            };
	    } forEach (_arr);   
        sleep 30;
    };
};