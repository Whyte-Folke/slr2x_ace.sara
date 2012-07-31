_art  = _this select 2;
_money = 'money' call INV_GetItemAmount;
if (_art == "deposit") then {																									
	_transfer      = _this select 0; 														
	_transfermoney = _this select 1;
	
	if (!(_transfermoney call ISSE_str_isInteger)) exitWith {player groupChat localize "STRS_bank_no_valid_number";};								
	_transfermoney = _transfermoney call ISSE_str_StrToInt;  
	if (_transfermoney <= 0) exitWith {};
	
	// If target transfer is government
	if (_transfer == 33) exitwith 
	{
		if (KontoStand < _transfermoney) then {																		
			player groupChat format[localize "STRS_bank_no_money"];			
		} else {
			Kontostand = Kontostand - _transfermoney;
			[_transfermoney] call Bank_Gov_add_money;
			player groupchat format[localize "STRS_bank_deposit_gov", (_transfermoney call ISSE_str_IntToStr)];
			(format["if (isMayor) then {hint format[localize ""STRS_bank_deposit_gov_mayormsg"", %1, %2]};", player, (_transfermoney call ISSE_str_IntToStr)]) call ISSE_pub_execPstr;
		};
	};
	
	_steuern       = round((_transfermoney*100)/(100-bank_steuer));												
	_targetString  = playerarray select _transfer;
	// If the transfer Target is player himself
	if (playerarray select _transfer == player) exitWith 
	{																										
		if (_money < _transfermoney) then 
		{																														
			player groupChat format[localize "STRS_bank_deposit_self_no", (_transfermoney call ISSE_str_IntToStr)];				
		} else {	
 			player groupChat format[localize "STRS_bank_deposit_self_yes", (_transfermoney call ISSE_str_IntToStr)];																											
			Kontostand = Kontostand + _transfermoney;															
			['money', -(_transfermoney)] call INV_AddInventoryItem;																					
		};		
	};																					
	// If unit not exists
	if ((not((format["%1", (playerarray select _transfer)]) call ISSE_UnitExists)) AND (!_TargetIsGov)) exitWith 
	{
		player groupChat localize "STRS_bank_player_not_ingame";
	};			
	
	if (KontoStand < _steuern) then {																		
		player groupChat format[localize "STRS_bank_no_money"];			
	} 
	else {														
		Kontostand = Kontostand - _steuern;																		
		INV_SteuernGezahlt = (INV_SteuernGezahlt + (_steuern - _transfermoney));																												
		(format ["if (INV_ROLESTRING == ""%1"") then {Kontostand = Kontostand + %2; player groupChat format[localize ""STRS_bank_account_getmoney"", %2, %3];};", _targetString, (_transfermoney call ISSE_str_IntToStr), player]) call ISSE_pub_execPstr;																								
		player groupChat format[localize "STRS_bank_deposit_yes", (_transfermoney call ISSE_str_IntToStr), (bank_steuer call ISSE_str_IntToStr), (_steuern call ISSE_str_IntToStr)];														
	};
};
 
 if (_art == "withdraw") then 
 {															
 _withdraw = _this select 0;                   
 
  if (!(_withdraw call ISSE_str_isInteger)) exitWith {player groupChat localize "STRS_bank_no_valid_number";};													
  _withdraw = _withdraw call ISSE_str_StrToInt;  
  
  if (_withdraw <= 0) exitWith {};	
  						
  if (Kontostand >= _withdraw) then 
  {	
  																											
  Kontostand = Kontostand - _withdraw;																										
  ['money', (_withdraw)] call INV_AddInventoryItem;																								
  player groupChat format[localize "STRS_bank_withdraw_yes", (_withdraw call ISSE_str_IntToStr)];											
  
  }
  else 
  {																				
  
  player groupChat localize "STRS_bank_no_money";														
  };
};

if (_art == "deposit_gov") then {																									
	_transfer      = _this select 0; 														
	_transfermoney = _this select 1;
	
	if (!(_transfermoney call ISSE_str_isInteger)) exitWith {player groupChat localize "STRS_bank_no_valid_number";};								
	_transfermoney = _transfermoney call ISSE_str_StrToInt;  
	if (_transfermoney <= 0) exitWith {};										
	_targetString  = playerarray select _transfer;
	if (not((format["%1", (playerarray select _transfer)]) call ISSE_UnitExists)) exitWith 
	{
		player groupChat localize "STRS_bank_player_not_ingame";
	};			
	if (Governmenttaxaccount < _transfermoney) then {																		
		player groupChat format[localize "STRS_bankgov_no_money"];			
	} else {														
		[_transfermoney] call Bank_Gov_remove_money; 
		(format ["if (INV_ROLESTRING == ""%1"") then {Kontostand = Kontostand + %2; player groupChat format[localize ""STRS_bankgov_account_getmoney"", %2];};", _targetString, (_transfermoney call ISSE_str_IntToStr)]) call ISSE_pub_execPstr;																								
		player groupChat format[localize "STRS_bankgov_deposit_yes", (_transfermoney call ISSE_str_IntToStr)];
		
		if (_transfermoney <= 5000) then {
			"player globalchat format[localize ""STRS_bankgov_transfered_small""]" call ISSE_pub_execPstr;
		};
		if ((_transfermoney >= 5001) and (_transfermoney <= 50000)) then {
			"player globalchat format[localize ""STRS_bankgov_transfered_medium""]" call ISSE_pub_execPstr;
		};
		if ((_transfermoney >= 50001) and (_transfermoney <= 100000)) then {
			"player globalchat format[localize ""STRS_bankgov_transfered_big""]" call ISSE_pub_execPstr;
		};
		if ((_transfermoney >= 100001) and (_transfermoney <= 500000)) then {
			"player globalchat format[localize ""STRS_bankgov_transfered_huge""]" call ISSE_pub_execPstr;
		};
		if (_transfermoney >= 500001) then {
			"player globalchat format[localize ""STRS_bankgov_transfered_extra_huge""]" call ISSE_pub_execPstr;
		};
	};
};