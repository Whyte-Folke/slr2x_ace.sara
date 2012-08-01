_a1 = 0; 
_a2 = 0;
_a3 = 0;
_a4 = 0;
_f1 = 0;
_LetzterKontostand = 0;

while {true} do 
{					
	if ((_LetzterKontostand != Kontostand) and (Kontostand != Startmoney)) then 
	{								
	["Kontostand", Kontostand] spawn ClientSaveVar;												
	_LetzterKontostand = Kontostand;														
	};					
	
	for [{_i=0}, {_i < (count bankflagarray)}, {_i=_i+1}] do 
	{										
	_flag = (bankflagarray select _i);																																																																				
	
	if ( ((_flag == MainBank) and (robb_possible == 0)) or (not(local_useBankPossible)) ) then 
	{																																				
	if ( (_a1 == 1) and (player distance _flag <= 5) ) then
	{
		 player removeAction deposit; 
		 player removeAction balance; 
		 _a1 = 0;
	};																				
	
	} 
	else 
	{																		
	
	if ((player distance _flag <= 5) and (_a1 == 0)) then 
	{																																
	deposit = player addAction [localize "STRS_bank_addaction_dialog","moneyTransaction.sqf", ["normalbank"]]; 																
	balance = player addAction [localize "STRS_bank_addaction_balance", "someCompile.sqf", "hint format[localize ""STRS_bank_hints_account_balance"", Kontostand];"]; 																																
	
	_a1 = 1; 
	_f1 = _i;																								
	};																														
	
	if ((player distance _flag > 5) and (_i == _f1) and (_a1 == 1)) then 
	{
		player removeAction deposit; 																				
		player removeAction balance; 																																																				
		_a1 = 0;																																				
	};																		
    };									
  };										
  
  if ((player distance MainBank <= 5) and (!isCop) and (_a2 == 0)) then 
  {
	  bank_robb = player addAction [localize "STRS_bank_addaction_robb","bankRob.sqf", ["ausrauben"]]; 
	  _a2 = 1;
  };											
   
   if ((player distance MainBank > 5) and (_a2 == 1)) then 
   {
	   player removeAction 	bank_robb; 
	   _a2 = 0;
   };
	if ((isMayor) and (player distance regierungsflag <=2) and (_a3 == 0)) then {
		deposit_gov = player addAction [localize "STRD_bankgov_description_title","moneyTransaction.sqf", ["govbank"]];
		_a3 = 1;
	};
	if ((!ismayor) or ((player distance regierungsflag >2) and (_a3 == 1))) then {
		player removeAction deposit_gov;
		_a3 = 0;
	};
	sleep 3;
};