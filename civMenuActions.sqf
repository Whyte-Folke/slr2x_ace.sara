// Civ Menu Actions
// civMenuActions.sqf


_loopart = _this select 0;
_money    = 'money' call INV_GetItemAmount;


// Disarm a Civilian
if (_loopart == "disarm") then 
{
	call INV_EntferneIllegales;
	player groupChat localize "STRS_civmenucheck_beendisarmed";
};


// Ticket Civilian
if (_loopart == "ticket") then 
{
	_strafe = _this select 1;
	_cop    = _this select 2;
	_didpay = 0;
	if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!";};
	ctrlSetText [1, format["%1 gave you a ticket of $%2. Do you want to pay?", _cop, (_strafe call ISSE_str_IntToStr)]];
	waitUntil{(not(ctrlVisible 1023))};
	if (Antwort == 1) then {
		if (kontostand < _strafe) then {
			_didnotpay = _strafe - kontostand;
			INV_SteuernGezahlt = INV_SteuernGezahlt + kontostand;
			kontostand = 0;
			(format ["if (player == %1) then {player groupChat format [localize ""STRS_civmenu_didnotpayticket"", %2, %3, %4];};", _cop, player, (_strafe call ISSE_str_IntToStr), (_didnotpay call ISSE_str_IntToStr)]) call ISSE_pub_execPstr;
		} else {
			_didpay = _strafe;
			kontostand = kontostand - _strafe;
			INV_SteuernGezahlt = INV_SteuernGezahlt + _strafe;
			(format ["if (player == %1) then {player groupChat format [localize ""STRS_civmenu_didpayticket"", %2, %3];}; [""Ticket"", %2, %3] spawn Isse_AddCrimeLogEntry;", _cop, player, (_strafe call ISSE_str_IntToStr)]) call ISSE_pub_execPstr;
		};
		false call TurnWantedFunc;
		player groupChat format [localize "STRS_civmenucheck_ticketself", (_strafe call ISSE_str_IntToStr), (_didpay call ISSE_str_IntToStr)];
	} else {
		(format ["if (player == %1) then {player groupChat format [localize ""STRS_civmenu_didpaynothing"", %2, %3];};", _cop, player, (_strafe call ISSE_str_IntToStr)]) call ISSE_pub_execPstr;
		player groupChat localize "STRS_civmenu_youdidnotpay";
	};
};


// Check Civilian for Drugs
if (_loopart == "drugs") then 
{
	_checkcop = _this select 1;
	if (["INV_InventarArray", "drug"] call INV_StorageHasKindOf) then {
		["INV_InventarArray", "drug"] call INV_StorageRemoveKindOf;
		(format ["if (player == %2) then {player groupChat format[localize ""STRS_civmenu_hasdrugs"", %1];}; titletext [format[localize ""STRS_civmenucheck_haddrugs"", %1], ""plain""];", player, _checkcop]) call ISSE_pub_execPstr;
		player groupChat localize "STRS_civmenucheck_beendrugsearched";
	} else {
		(format ["if (player == %2) then {player groupChat localize ""STRS_civmenu_hasnodrugs"";};", player, _checkcop]) call ISSE_pub_execPstr;
	};
};


if (_loopart == "arrestserver") then 
{
	_civobj      = _this select 1;
	_prisondauer = (_this select 2)*60;
	_copobj      = _this select 3;
	_exitart     = "";
	call compile format ['%1_arrest = 1;       publicVariable "%1_arrest";%1_markerjammed = 0; publicVariable "%1_markerjammed";', _civobj];
	showMap true;
	_civobj setpos getmarkerpos "prisonspawn";
	waitUntil {_civobj Distance prison_logic < 100};
	(format ["if (player == %1) then {[""arrest"", %2] execVM ""civMenuActions.sqf"";}; %3 GLOBALCHAT format [localize ""STRS_civmenucheck_arrested_global"", %1]; [""PrisonIn"", %1, %3] spawn Isse_AddCrimeLogEntry;", _civobj, ((_prisondauer/60) call ISSE_str_IntToStr), _copobj]) call ISSE_pub_execPstr;
	_counter = 0;
	while {true} do {
		_freigelassen = call compile format ["%1_arrest", _civobj];
		if (isNull(_civobj)) exitWith {_exitart = "";};
		if (!(alive _civobj)) exitWith {_exitart = "tot";};
		if (_counter >= _prisondauer) exitWith {_exitart = "frei";};
		if (_freigelassen == 0) exitWith {_exitart = "freigelassen";};
		if (_civobj Distance prison_logic >= 100) exitWith {_exitart = "ausbruch";};
		sleep 5;
		_counter = _counter + 5;
	};
	if ((_exitart == "frei") or (_exitart == "freigelassen")) then {
		call compile format ["%1_arrest = 0; publicVariable ""%1_arrest""", _civobj];
		_civobj setPos getMarkerPos "jail_freemarker";
		(format ["if (player == %1) then {local_arrest = 0; [""local_arrest"", local_arrest] spawn ClientSaveVar; player groupChat localize ""STRS_civmenucheck_free_self"";}; %1 GLOBALCHAT format [localize ""STRS_civmenucheck_free_global"", %1]; [""PrisonOut"", %1] spawn Isse_AddCrimeLogEntry;", _civobj]) call ISSE_pub_execPstr;
	};
	if (_exitart == "ausbruch") then {
		(format ["if (player == %1) then {local_arrest = 0; [""local_arrest"", local_arrest] spawn ClientSaveVar;}; %1_arrest = 0; %1_wanted = 1; %1 GLOBALCHAT format [localize ""STRS_civmenucheck_breakout"", %1]; [""PrisonEsc"", %1] spawn Isse_AddCrimeLogEntry;", _civobj]) call ISSE_pub_execPstr;
	};
};


// Arrest Civilan
if (_loopart == "arrest") then 
{
	call INV_EntferneIllegales;
	local_arrest    = 1;
	["local_arrest", local_arrest] spawn ClientSaveVar;
	// Set Civ Hunger + Thirst to 0, Nutrition to 100 so they Cannot Starve in Jail
	INV_hunger      = 0;
	INV_Thirst      = 0;
	INV_Nutrition   = 100;
	player setDamage 0;
	//Stop ACE bleeding
	player setVariable ["ACE_bleeding", 0];
	player setVariable ["ACE_pain", 0];
	player setVariable ["ACE_heartstopped", false];
	player setVariable ["ACE_stunned", false];
	player setVariable ["ACE_passOutThreshold", 0.15];
	holstervar = false;
	unholstervar = false;
	player removeAction action_holsterpistol;
	CivTimeInPrison = (_this select 1);
	player groupChat format [localize "STRS_civmenucheck_arrested_self", (CivTimeInPrison call ISSE_str_IntToStr)];
};

// Check Civilian's Inventory
if (_loopart == "inventcheck") then 
{
	_aktionsStarter = _this select 1;
	if (!(player call ISSE_IsVictim)) then {
		(format ["if (rolestring == ""%1"") then {hint localize ""STRS_inventory_checknohands"";};", _aktionsStarter]) call ISSE_pub_execPstr;
	} else {
		(format ['if (rolestring == "%1") then {[0, 0, 0, ["inventorycheck", %2, %3, %4]] execVM "openDialogs2.sqf";};',_aktionsStarter, INV_LizenzOwner, INV_InventarArray, player]) call ISSE_pub_execPstr;
	};
};

// Civilian Money Theft
if (_loopart == "stealmoney") then 
{
	_aktionsStarter = _this select 1;
	_geklaut        = (floor(random(moneyStehlenMax)))+1;
	if (_money < _geklaut) then {_geklaut = _money;};
	if (!(player call ISSE_IsVictim)) then {
		(format ["if (rolestring == ""%1"") then {hint localize ""STRS_inventory_checknohands"";};", _aktionsStarter]) call ISSE_pub_execPstr;
	} else {
		(format ["if (rolestring == ""%1"") then {player groupChat format[localize ""STRS_civmenucheck_stolen"", %2]; [""money"", %2] call INV_AddInventoryItem;}; hint format [localize ""STRS_civmenucheck_stolenpub"", ""%1"", %2, %3]; [""Stole"", %1] spawn Isse_AddCrimeLogEntry;", _aktionsStarter, (_geklaut call ISSE_str_IntToStr), player]) call ISSE_pub_execPstr;
	['money', -(_geklaut)] call INV_AddInventoryItem;
	player groupChat format[localize "STRS_civmenucheck_stolen_fromciv"];
	};
};

// Default Backup

/*
if (_loopart == "stealmoney") then {
	_aktionsStarter = _this select 1;
	_geklaut        = (floor(random(moneyStehlenMax)))+1;
	if (_money < _geklaut) then {_geklaut = _money;};
	['money', -(_geklaut)] call INV_AddInventoryItem;											
	if (!(player call ISSE_IsVictim)) then {
		(format ["if (rolestring == ""%1"") then {hint localize ""STRS_inventory_checknohands"";};", _aktionsStarter]) call ISSE_pub_execPstr;			
	} else {	
		(format ["if (rolestring == ""%1"") then {player groupChat format[localize ""STRS_civmenucheck_stolen"", %2]; [""money"", %2] call INV_AddInventoryItem;}; hint format [localize ""STRS_civmenucheck_stolenpub"", ""%1"", %2, %3]; [""Stole"", %3] spawn Isse_AddCrimeLogEntry;", _aktionsStarter, (_geklaut call ISSE_str_IntToStr), player]) call ISSE_pub_execPstr;						
	};
};
*/