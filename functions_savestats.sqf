if (isNil "debug") then
{
	debug      = false;
	debugarray = [];
};
ClientSaveVar =
{
	if (!(JIP_Stats_Ready)) exitWith {};
	private ["_Fvarname", "_Fvarvalue"];
	_Fvarname  = _this select 0;
	_Fvarvalue = _this select 1;

	if (! (isNull player)) then
	{
		format ["if (isServer) then {[""%1"", ""%2"", %3] spawn ServerSaveVar;};", login_code, _Fvarname, _Fvarvalue] call ISSE_pub_execPstr;
	}
	else
	{
		hint "Error: player is Null.";
	};
	
	if (debug) then
	{
		debugarray = debugarray + [ format["Client Saved %1 to %2.", _Fvarname, _Fvarvalue] ];
	};
    
    

	true
};

ClientRequestVar =
{
	login_code = _this select 0;
	if (JIP_Stats_Ready) exitWith
	{
		player groupChat "Your stats are already loaded, play!";
	};
	if (JIP_Stats_Wait) exitWith
	{
		player groupChat "Waiting for stats";
	};
	player groupChat "Stats requested, waiting...";
	format ["if (isServer) then {[%1, ""%2""] spawn ServerLoadVar;};", player, login_code] call ISSE_pub_execPstr;
	true
};

ClientLoadVar = 
{
	private ["_c", "_Fvararray"];
	_Fvararray = _this;
	for [{_c=0}, {_c < (count _Fvararray)}, {_c=_c+1}] do {
		call compile format ['%1 = %2;', ((_Fvararray select _c) select 0), ((_Fvararray select _c) select 1)];
	};
	if (debug) then {debugarray = debugarray + [ format["Variables loaded. %1",_Fvararray] ];};
    player groupchat "Stats loaded!";
    JIP_Stats_Wait = true;
    JIP_Stats_Ready = true;
    
    closeDialog 0;
	true
};