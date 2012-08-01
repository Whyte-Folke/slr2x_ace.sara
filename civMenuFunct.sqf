// Civ Menu Functions
// civMenuFunct.sqf


_civmenuciv  = civmenuciv;
_civmenu_civ = civmenu_civ;
_art         = _this select 0;
_money        = 'money' call INV_GetItemAmount;


// Check Distance to Civ (Causes issues with clothing, will work on a fix later)
//if ((player distance _civmenuciv >= 25) or (!(alive _civmenuciv))) exitWith {player groupChat format[localize "STRS_civmenu_distance"];};


if (_art == 5) exitWith 
{
	sleep 0.3;
	closeDialog 0;
	(format ["%1 setdamage 0; if (%1 == player) then {player Groupchat localize ""STRS_civmenucheck_youarehealed"";};", _civmenuciv]) call ISSE_pub_execPstr;player groupChat format [localize "STRS_civmenu_heal", _civmenu_civ];
};


if ((count (weapons player)) == 0) exitWith {player groupChat localize "STRS_civmenu_copnotarmed";};


if (_art == 6) exitWith 
{
	sleep 0.3;
	closeDialog 0;
	(format ["if (rolestring == ""%1"") then {[""inventcheck"", ""%2""] execVM ""civMenuActions.sqf"";}", _civmenu_civ, rolestring]) call ISSE_pub_execPstr;
};


if (_art == 20) exitWith {
	sleep 0.3;
	closeDialog 0;
	if (StehlenAktiv) exitWith {};
	if ([player, coparray, 20] call ISSE_ArrayIsNear) exitWith {
		player groupChat localize "STRS_civmenu_stehlen_copzunah";
	};
	player groupChat localize "STRS_civmenu_stehlen";
	StehlenAktiv = true;
	sleep 5;
	StehlenAktiv = false;
	(format ["if (rolestring == ""%1"") then {[""stealmoney"", ""%2""] execVM ""civMenuActions.sqf"";};", _civmenu_civ, rolestring]) call ISSE_pub_execPstr;
};


_civbounty = call compile format ["bounty_%1", _civmenuciv];


if (_civbounty != 0) then 
{
	if (_civbounty > wantedbonus) then 
	{
		['money', wantedbonus] call INV_AddInventoryItem;
		player groupChat format[localize "STRS_civmenu_wantedbonus", (wantedbonus call ISSE_str_IntToStr)];
	};
	['money', _civbounty] call INV_AddInventoryItem;
	call compile format ["bounty_%1 = 0; publicVariable ""bounty_%1""; ", _civmenuciv];
	player groupChat format[localize "STRS_civmenu_bounty", (_civbounty call ISSE_str_IntToStr)];
};


call compile format ["%1_wanted = 0; publicVariable ""%1_wanted"";", _civmenuciv];


if (_art == 1) exitWith 
{
	sleep 0.3;
	closeDialog 0;
	(format ["if (player == %1) then {[""drugs"", %2] execVM ""civMenuActions.sqf"";};", _civmenuciv, player]) call ISSE_pub_execPstr;
};


if (_art == 2) exitWith {
	sleep 0.3;
	closeDialog 0;
   // if (_money < copdisarmcost) exitWith {
   //    player groupChat localize "STRS_civmenu_buy_disarm_nomoney";
   // };
   // ['money', -(copdisarmcost)] call INV_AddInventoryItem;
   (format ["if (player == %1) then {[""disarm""] execVM ""civMenuActions.sqf"";};", _civmenuciv]) call ISSE_pub_execPstr;
   player groupChat format [localize "STRS_civmenu_disarm", _civmenu_civ];
};


if (_art == 3) exitWith 
{
	sleep 0.3;
	closeDialog 0;
	_dauer = round(_this select 1);
	format ["if (isServer) then {[""arrestserver"", %1, %2, %3] execVM ""civMenuActions.sqf"";};", _civmenu_civ, _dauer, player] call ISSE_pub_execPstr;
	player groupChat format[localize "STRS_civmenu_arrested", _civmenu_civ];
};


if (_art == 4) exitWith 
{
	sleep 0.3;
	closeDialog 0;
	_strafe = _this select 1;
	if (!(_strafe call ISSE_str_isInteger)) exitWith {
		player groupChat localize "STRS_inv_no_valid_number";
	};
	_strafe = _strafe call ISSE_str_StrToInt;
	if (_strafe <= 0) exitWith {};
	(format ["if (player == %1) then {[""ticket"", %2, %3] execVM ""civMenuActions.sqf"";}; %3 globalchat format[localize ""STRS_civmenu_ticket_globalchat"", %1, %2];", _civmenuciv, (_strafe call ISSE_str_IntToStr), player]) call ISSE_pub_execPstr;
};
