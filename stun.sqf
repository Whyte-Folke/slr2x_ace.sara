// Stun.sqf Fired Eventhandler execution

_event = _this select 0;
_unit = "";
_anim = "";

if (_event == "fired") then {	
	_ammo   = _this select 1;
	_bullet = nearestObject  [player, _ammo];
	
	/* No longer used */
	
};


if (_event == "hit") then {
	private ["_array", "_unit", "_selection", "_damage", "_source", "_projectile", "_tazer"];
    _array = _this select 1;
	_unit = _array select 0;
	_selection = _array select 1;
	_damage = _array select 2;
	_source = _array select 3;
	_projectile = _array select 4;
    _handled = false;
    
    _tazer = ["B_9x18_SD"];
    
    if (_projectile in _tazer) then {
        if (_selection != "body") exitWith
        {
            /* Ignore this one */
        };
        
        if (_projectile == "B_9x18_SD") exitWith
        {
            //if (player == _unit) then {
            	["xrep_hit"] execVM "stun.sqf";
           // };
        };
        
        _handled = true;
    };
    
    if !(_handled) exitWith {
        
      _damage	  
    };
};


// Beanbag Hit
if (_event == "beanbag_hit") then
{
	_inflictedpain = (random 0.07);
	if (_inflictedpain <= 0.02) then {_inflictedpain = 0.05};
	if ( (isstunned) or (not (alive player)) or (playerpunched) or ((not(vehicle player == player)) and ((speed (vehicle player)) > 1)) ) exitWith {};
	playerpunched = true;
	closeDialog 0;
	// (format ["%1 switchmove ""%2"";", player, "AdthPercMstpSnonWnonDnon_3"]) call ISSE_pub_execPstr; 
	(format ["%1 switchmove ""%2"";", player, "AmovPercMrunSlowWrflDf_AmovPpneMstpSrasWrflDnon"]) call ISSE_pub_execPstr;
	cutText ["","BLACK OUT",1];
	sleep 1;
	cutText ["","BLACK IN",1];
	[player, "", _inflictedpain] call ACE_Sys_Wound_HitEH;
	player setdamage ((getdammage player) + (random 0.05));
	player setUnitPos "DOWN";
	// (format ["%1 switchmove ""%2"";", player, "AmovPpneMstpSnonWnonDnon"]) call ISSE_pub_execPstr;
	sleep 2;
	playerpunched = false;
};

// Tazer XREP hit
if (_event == "xrep_hit") then 
{
	private ["_anim","_unit"];
	if ( (isstunned) or (not (alive player)) or ((not(vehicle player == player)) and ((speed (vehicle player)) > 1)) ) exitWith {};
	_inflictedpain = (random 0.13);
	if (_inflictedpain <= 0.06) then {_inflictedpain = 0.06};
	isstunned = true;
	closeDialog 0;
	_weapons = [] call INV_getWeapons;
	
	if (not(playerpunched)) then {
		(format ["%1 switchmove ""%2"";", player, "AdthPercMstpSnonWnonDnon_3"]) call ISSE_pub_execPstr;
	};
	titleText [localize "STRS_stunned_enabled","plain"];
	disableUserInput true;
    _camera = "camera" camCreate (player modelToWorld [0,0,5]);  
    _camera cameraEffect ["internal", "back"]; 
    _camera camSetTarget player; 
    _camera camCommit 0;
    
    
	if (count _weapons > 0) then 
	{
		{player removeWeapon _x;} forEach _weapons;
		call compile format ['waffenhalter%1 = "weaponholder" createVehicle getpos(abstellkammer); waffenhalter%1 setVehicleInit "this setVehicleVarName ""waffenhalter%1""; waffenhalter%1 = this;"; processInitCommands;', rolenumber];
		sleep 0.5;
		(format ["{waffenhalter%2 ADDWEAPONCARGO [_x, 1];} forEach %3; waffenhalter%2 setpos %4; if (isServer) then {[waffenhalter%2, 300] spawn ISSE_DeleteVehicle;};", player, rolenumber, _weapons, (getpos player)]) call ISSE_pub_execPstr;
		sleep 0.5;
	};
	for [{_x=1},{_x<=18},{_x=_x+1}] do {
		0 fadesound 0;
		cutText ["","WHITE OUT",0.25];
		0.1 fadesound 0.2;
		cutText ["","WHITE IN",0.25];
		sleep 1;
	};
    
    

	cutText ["","WHITE OUT", 0.25];
	sleep (4+(random 8));
	player setdamage ((getdammage player) + (random 0.20));
	cutText ["","WHITE IN", 5];
	40 fadesound 1;
	(format ["%1 switchmove ""%2"";", player, "AmovPpneMstpSnonWnonDnon"]) call ISSE_pub_execPstr;
	disableUserInput false;
    _camera cameraeffect ["terminate","back"];
	camDestroy _camera;
	isstunned = false;
};


//In proximity of a teargas nade
if (_event == "gassed") then 
{
	if (interndebug) then {player groupchat "Effect Script for Gasgrenade called";};
	if (player hasweapon "arpg_gasmask") exitwith{};
	_gasNade = _this select 1;
	if (interndebug) then {sleep 2; player groupchat format["Gasegrenades id: %1", _gasnade];};
	if (isNil "DFS_gasNade") then {DFS_gasNade = []};
	if (_gasNade in DFS_gasNade) exitWith {}; //Player is already being blinded by this grenade
	DFS_gasNade = DFS_gasNade + [_gasNade];
	if (interndebug) then {hint "Somebody threw a gas nade";};
	_sleep = 0.5;
	
	while {(alive _gasNade)} do
	{
		_inflictedpain = (random 0.05);
		if (_inflictedpain <= 0.01) then {_inflictedpain = 0.01};
		if (player distance _gasNade <= 8) then
		{
			sleep (_sleep / 2);
			titleCut ["","White out", 1];
			sleep _sleep;
			[player, "", _inflictedpain] call ACE_Sys_Wound_HitEH;
			titleCut ["","White in", 1];
			
			_sleep = _sleep + 0.25;
		};
		if (! alive player) exitWith
		{
			titleCut ["",""];
		};
		sleep 0.1;
	};
};