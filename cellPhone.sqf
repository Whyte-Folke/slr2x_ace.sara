 // Mobile-Phones (Handy's)
 // cellPhone.sqf
_art = _this select 0;
if (_art == "use") then 
{
	_item   = _this select 1;
	_anzahl = _this select 2;
	if (!(createDialog "handydialog")) exitWith {hint "Dialog Error!";};
	[2, true, false] call INV_DialogPlayers;
	lbSetCurSel [99, 0];
	ctrlSetText [4, format[localize "STRD_description_handy_cost", INV_smscost]];
	buttonSetAction [3, "[""handy2"", ctrlText 1, call compile lbData [2, lbCurSel 2]] execVM ""cellPhone.sqf""; closedialog 0;"];
	};
if (_art == "handy2") then 
{
	_smstext = _this select 1;
	_smsplayernumber = _this select 2;
	_smsplayer       = playerarray select _smsplayernumber;
	if (_smstext == "")	exitWith {player groupChat localize "STRS_inv_item_handy_leermsg";};
	if (not((format["%1", (_smsplayer)]) call ISSE_UnitExists)) exitWith {player groupChat localize "STRS_inv_item_handy_noplayer";};
	if (_money < INV_smscost) exitWith {player groupChat localize "STRS_inv_item_handy_keinmoney";};
	if ((_smstext call ISSE_str_Length) > 500) exitWith {player groupChat localize "STRS_inv_item_handy_text_zu_lang";};
	['money', -(INV_smscost)] call INV_AddInventoryItem;
	player groupChat format [localize "STRS_inv_item_handy_gesendet", _smsplayer];
	
	format ["_amount = ""handy"" call INV_GetItemAmount; if ((%2 == player) and ((_amount) >  0)) then {player groupchat format [localize ""STRS_inv_item_handy_nachricht"", ""%1"", %3]; player say [""sms_incoming"",1];};
	if ((%2 == player) and ((_amount) == 0)) then { 
		""if (%3 == player) then {
			player groupChat format [localize """"STRS_inv_item_handy_nichterreicht"""", %2];
			};
		"" call ISSE_pub_execPstr;
		};				
	", _smstext, _smsplayer, player	] call ISSE_pub_execPstr;
};