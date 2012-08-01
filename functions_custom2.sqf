// Misc Functions and Speech Shortcuts
// functions_custom2.sqf


// Teleport Player to Home
TeleBackFunction = 
{
	if (vehicle player iskindof "air") then 
	{
		vehicle player setpos [ getPos player select 0, (getPos player select 1) -350, getPos player select 2];
	} 
	else 
	{
		player setpos [ getPos player select 0, (getPos player select 1) +50, getPos player select 2];
	};
	player groupChat localize "STRS_verbotene_zone_teleport";
};


// Unwant Civilian
TurnWantedFunc = {
	if (_this) then 
{
		call compile format ["civ%1_wanted = 1; publicVariable ""civ%1_wanted"";", rolenumber];
	} 
	else 
	{
		call compile format ["civ%1_wanted = 0; publicVariable ""civ%1_wanted"";", rolenumber];
	};
};


// Fart Dialogue?
DialogSpielerListe =
 {
	private ["_Fart", "_Fid", "_Fname", "_Fingame", "_Findex", "_Flistlen", "_Feigenenum"];
	_Fart       = _this select 0;
	_Fid        = _this select 1;
	_Fname      = _this select 2;
	_Fingame    = _this select 3;
	_Findex     = 0;
	_Cindex = 0;
	_Flistlen   = 0;
	_Feigenenum = -1;

	for [{_c=0}, {_c < (count playerstringarray)}, {_c=_c+1}] do 
	{
		_Fspieler = playerstringarray select _c;
		if ( ((_Fart == 0) or ((_Fart == 1) and (_c > civscount)) or ((_Fart == 2) and (_c < civscount))) and ((_Fingame) or (_Fspieler call ISSE_UnitExists)) ) then 
		{
			if (_Fname) then 
			{
				
				if (_Fspieler in civstringarray) then
				{
				_Findex = lbAdd [_Fid, format ["%1 - (%2)", _Fspieler, name (call compile _Fspieler)]];
				lbSetData [_Fid, _Findex, format["%1", _c]];
				};
	
	 			  if (_Fspieler in copstringarray) then 
	 			  {
				_Cindex = lbadd[5000, format["%1 - (%2)", _Fspieler, name(call compile _Fspieler)]];
				lbsetData[5000, _Cindex, format["%1", _c]];
				  };
				
			} 
			else 
			{
				_Findex = lbAdd [_Fid, _Fspieler];
			};
			
			
			
			if (_Fspieler == rolestring) then 
			{
				_Feigenenum = _Flistlen;
			};
			_Flistlen = _Flistlen + 1;
		};
	};

	[_Flistlen, _Feigenenum]
};


// Get Guild Position Function
GetGildenPos = 
{ 
private ["_c", "_Fpos"];
	_Fpos = -1;

	for [{_c=0}, {_c < (count GildenInfoArrays)}, {_c=_c+1}] do 
	{
		if (((GildenInfoArrays select _c) select 0) == _this) exitWith {_Fpos = _c;};
	};
	
	_Fpos
};


// Write Entries Into the Crime Log
Isse_AddCrimeLogEntry = 
{ 
private ["_logtime", "_logdate", "_logtext", "_logart", "_logplayer", "_zusatzinfo"];
	_logart     = _this select 0;
	_logplayer  = format["%1", _this select 1];
	_zusatzinfo = "";
	
	if (count _this > 2) then 
	{
	_zusatzinfo = _this select 2};
	_logtime    = time;
	_logdate    = date;
	_logtext    = "";

	switch (_logart) do 
	{
		case "Bank":      {_logtext = format[localize "STRS_functions_crimelog_msg1", _zusatzinfo];};
		case "Stole":     {_logtext = format[localize "STRS_functions_crimelog_msg2"];};
		case "KilledCiv": {_logtext = format[localize "STRS_functions_crimelog_msg3", _zusatzinfo];};
		case "KilledCop": {_logtext = format[localize "STRS_functions_crimelog_msg4", _zusatzinfo];};
		case "PrisonIn":  {_logtext = format[localize "STRS_functions_crimelog_msg5"];};
		case "PrisonOut": {_logtext = format[localize "STRS_functions_crimelog_msg6"];};
		case "PrisonEsc": {_logtext = format[localize "STRS_functions_crimelog_msg7"];};
		case "Died":      {_logtext = format[localize "STRS_functions_crimelog_msg8"];};
		case "Ticket":    {_logtext = format[localize "STRS_functions_crimelog_msg9", _zusatzinfo];};
		case "Bomb":      {_logtext = format[localize "STRS_functions_crimelog_msg10"];};
		case "terrorIn":  {_logtext = format[localize "STRS_functions_crimelog_msg11"];};
	};

	CopLog = CopLog + [ [_logplayer, _logtext, _logdate, _logtime] ];
};

// Create and Deploy the Bomb
Bomb_Vehicle = 
{ 
if (count _this > 1) then 
{
	
		if (not(isNull (_this select 1))) then 
		{
			_obj = _this select 1;
			
			if (((getPos _obj) select 2) > 5) then 
			{
				_obj setDamage 1;
			} 
			else 
			{
				"Bo_GBU12_LGB" createVehicle (_this select 0);
				_obj setDamage 1;
			};
		};
	} 
	else 
	{
		"Bo_GBU12_LGB" createVehicle (_this select 0);
	};
	
	if (count _this > 2) then 
	{
		format ["if ((random 100) < 10) then {hint format[localize ""STRS_vehiclebomb_public_explode"", %1];[""Bomb"", %1] spawn Isse_AddCrimeLogEntry;};", player, longrolenumber] call ISSE_pub_execPstr;
	};
};
	
	
// Function GetRandomObjectName
GetRandomObjectName = 
{
	private ["_name"];

	if (isNil("GespawnteObjekteCounter")) then 
	{
		GespawnteObjekteCounter = 0;
	};

	_name = format["SpawnedObject_%1_%2_%3", round(time), rolenumber, GespawnteObjekteCounter];
	GespawnteObjekteCounter = GespawnteObjekteCounter + 1;
	_name
};


// Get Object Client Function
CreateObjectClient = 
{
	private ["_classname", "_position", "_dir", "_obj", "_extraInit", "_objname"];
	_classname = _this select 0;
	_pos       = _this select 1;
	_dir       = _this select 2;
	_extraInit = _this select 3;
	_objname   = (call GetRandomObjectName);
	_obj       = dummyobj;
	call compile format['%4 = "%1" CreateVehicle %2;%4 setVehicleInit ''this setVehicleVarName "%4"; %4 = this; this setDir %3; call compile ''''%5'''';''; ', _classname, _pos, round(_dir), _objname, _extraInit];
	processInitCommands;_objname
};


// Quick-Speech Function
SayDirectSpeach = 
{
	private ["_text", "_dis"];
	_text = _this select 0;
	_art  = _this select 1;
	
	if (not ((_text == "") or (_text == " ")) ) then 
	{
		_text = format["%1 shouts: %2", player, _text];

		if (_art == "direct") then 
		{
			_dis  = 50;
			format ["if ((player distance %1) < %3) then {titleText[""%2"", ""PLAIN""];};", player, _text, _dis] call ISSE_pub_execPstr;
		};
		
		if (_art == "side") then 
		{
			format ["%1 sideChat ""%2"";", player, _text] call ISSE_pub_execPstr;
		};
		
		if (_art == "global") then 
		{
			format ["%1 globalChat ""%2"";", player, _text] call ISSE_pub_execPstr;
		};
	};
};

// Function for Server to add taxes together and send them out when complete
FinalTaxToServer = {
    private ["_rolestring", "_debugmoney"];
    _rolestring = _this;
    call compile format ["
        GovernmentTaxAccount = GovernmentTaxAccount + FinalTax_%1;
        publicVariable ""GovernmentTaxAccount"";
		_debugmoney = FinalTax_%1;
        FinalTax_%1 = 0;
     ", _rolestring];
	if (moneydebug) then {
		(format["if (MoneyDebug) then {debugarray = debugarray + [ format[""Player %1 payed/got %2$ from/to the governmenttaxaccount"", %1, %2], format[""Saved Governments Account to: %3$"", %3] ];};", _rolestring, _debugmoney, (GovernmentTaxAccount call ISSE_str_IntToStr)]) call ISSE_pub_execPstr;
	};
};

// Function for mayor and chief to loose their positions
mayorLoosePosition = {
	isMayor = false;
	_rolenum = player;
	format ["hint format [localize ""STRS_mayor_resigned"", %1]; MayorNumber = -1; votearray = []; for [{_i=0}, {_i < civscount}, {_i=_i+1}] do {voteArray = voteArray + [ [] ];  };", _rolenum] call Isse_Pub_execPstr;
};

ChiefLoosePosition = {
	IsChief = false;
	_rolenum = player;
	format ["hint format [localize ""STRS_chief_resigned"", %1]; ChiefNumber = -1; chiefarray = []; for [{_i=0}, {_i < playercount}, {_i=_i+1}] do { chiefarray = chiefarray + [ [] ]; };", _rolenum] call Isse_Pub_execPstr;
};

// Lotto Array function
GetLottoArray = 
{
private ["_c", "_lotto"];
_lotto = [];

for [{_c=0}, {_c < (count LottoArray)}, {_c=_c+1}] do
 {						
 if (((LottoArray select _c) select 0) == _this) exitWith { _lotto = (LottoArray select _c); };				
 };
 
 _lotto
};

//NSPD Password Protected Shop System by MAD T
NSPD_Shop_System = {
_art = _this select 0;
if (_art == "Password") then 
{
if (!(createDialog "NSPD_Shop_Password_Dialog")) exitWith 
{
hint "Dialog Error!";
};
};

if (_art == "Unlock") then 
{
_NSPD_Passwort = _this select 1;
if ((_NSPD_Passwort == NSPD_Password) and (!(NSPD_shop_unlocked))) then
{
player groupchat "You unlocked the NSPD shop";
closeDialog 0;
NSPD_shop_unlocked = true;
player removeAction NSPD_Shop_Passwort;
}
else
{
player groupchat "Wrong Password";
};
};
};