_array = _this select 3;
_player = _array select 1;
_art  = _array select 0;

 if (_art == "GetAccounts") then
 { 
	 WAIT_RDY = FALSE;
 	[0,0,0,["ReturnMoney"]] execVM "CheckAccounts.sqf";
};

if (_art == "ReturnMoney") then
{
	_Money = kontostand;
	_Player = _array select 1;
	_Player = _Player + 1;
	call compile format['Civ%1_account = %2;', _player, _Money];
	call compile format['publicvariable "Civ%1_account";',_Player];
	
	 WAIT_RDY = TRUE;
	 publicvariable "WAIT_RDY";
};