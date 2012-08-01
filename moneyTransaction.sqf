
_array = _this select 3;
_kind = _array select 0;

if (_kind == "normalbank") then {
if (local_robbsperre == 1)  exitWith {player groupChat format [localize "STRS_bank_dialoge_robbsperre",(local_robbsperre_zeit call ISSE_str_IntToStr)]};

if (!(createDialog "bank")) exitWith {hint "Dialog Error!";};

_liste = [1, true, false, true] call INV_DialogPlayers;
if (interndebug) then {hint format["Dialoglist:\n %1", _liste];};

// Set start selection always to own id/name
if ((_liste select 1) >= 0) then 
{
	lbSetCurSel [1, (_liste select 1)];
};

_money = 'money' call INV_GetItemAmount;

CtrlSetText [101, format [localize "STRS_bank_dialog_inventarmoney", (_money call ISSE_str_IntToStr)]];
CtrlSetText [102, format [localize "STRS_bank_dialoge_accountmoney",  (Kontostand call ISSE_str_IntToStr)]];
buttonSetAction [10, format["[call compile lbData [1, lbCurSel 1], ctrlText 2, ""deposit""]  execVM ""atmBankTransactions.sqf""; closedialog 0;"] ];
buttonSetAction [11, format["[ctrlText 6,  0,   ""withdraw""] execVM ""atmBankTransactions.sqf""; closedialog 0;"] ];


while {ctrlVisible 1003} do 
{						
	_money   = 'money' call INV_GetItemAmount;															
	_slider = ctrlText 2;                    

	if (!(_slider call ISSE_str_isInteger)) then {_slider = 0;};						
	_slider = _slider call ISSE_str_StrToInt; if (_slider < 0) then {_slider = 0;};																			
	_targetid = call compile lbData [1, lbCurSel 1];
	if ((lbCurSel 1 == (_liste select 1)) OR (_targetid == 33)) then 
	{
		if (interndebug) then {
			hint format["Selected %1 as target", _targetid];
		};
		CtrlSetText [4,""];																														
		CtrlSetText [5,""];											
	} else {
		if (interndebug) then {
			hint format["Selected %1 as target", _targetid];
		};
		CtrlSetText [4, localize "STRS_bank_dialoge_tax"];              																														
		CtrlSetText [5, format ["$%1", ((round((_slider*100)/(100-bank_steuer))) call ISSE_str_IntToStr)]]; 										
	};														
	sleep 0.3;
};

};

if (_kind == "govbank") then {
	if (!(createDialog "bank_govern")) exitWith {hint "Dialog Error!";};
	_liste = [1, true, false, false] call INV_DialogPlayers;
	if (interndebug) then {hint format["Dialoglist:\n %1", _liste];};
	
	buttonSetAction [10, format["[call compile lbData [1, lbCurSel 1], ctrlText 2, ""deposit_gov""]  execVM ""atmBankTransactions.sqf""; closedialog 0;"] ];
	CtrlSetText [102, format [localize "STRS_bankgov_dialoge_accountmoney",  (Governmenttaxaccount call ISSE_str_IntToStr)]];
	
	while {ctrlVisible 1067} do 
	{																				
		_slider = ctrlText 2;                    
		if (!(_slider call ISSE_str_isInteger)) then {_slider = 0;};						
		_slider = _slider call ISSE_str_StrToInt; if (_slider < 0) then {_slider = 0;};																			
		_targetid = call compile lbData [1, lbCurSel 1];													
		sleep 0.3;
	};
};