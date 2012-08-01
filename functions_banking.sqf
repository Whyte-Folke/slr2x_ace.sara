// functions_banking.sqf
// Banking functions 

_taxtopay = 0;
_oldAccountValue = 0;

BANK_zinsen = {	
	if (Kontostand > 0) then {
		Kontostand = round(Kontostand+(Kontostand/100*zinsen_prozent));
		player groupChat format [localize "STRS_bank_zinsen", (Kontostand call ISSE_str_IntToStr), (zinsen_prozent call ISSE_str_IntToStr)];							
	};
};


BANK_wealthtax = {
	_taxtopay = 0;
	_oldAccountValue = 0;
	if (Kontostand > GblWealthTaxLimit) then {
		_oldAccountValue = Kontostand;
		_taxtopay = round((Kontostand/100)*GblWealthTax);
		INV_SteuernGezahlt = INV_SteuernGezahlt + _taxtopay;
		Kontostand = Kontostand - _taxtopay;
		player groupChat format [localize "STRS_bank_wealthtax_message", (_oldAccountValue call ISSE_str_IntToStr), (GblWealthTaxLimit call ISSE_str_IntToStr), (_taxtopay call ISSE_str_IntToStr), (GblWealthTax call ISSE_str_IntToStr)];
		_oldAccountValue = 0;
		_taxtopay = 0;		
	};
};

GOVNMT_Interest = {	
	if ((GovernmentTaxAccount > 0) and (GovernmentTaxAccount < 150000)) then {
		GovernmentTaxAccount = round(GovernmentTaxAccount+(GovernmentTaxAccount/100*zinsen_prozent));
		 if (Moneydebug) then {
			publicvariable "GovernmentTaxAccount";
			format["if (MoneyDebug) then {debugarray = debugarray + [ format[""Gov got %2 percent interest - saved gov: %1$"", %2, %1] ];};", (GovernmentTaxAccount call ISSE_str_IntToStr), (zinsen_prozent call ISSE_str_IntToStr)] call ISSE_pub_execPstr;
			// " hint format [""Government got %2 percent Interest too. New account value is %1"", (GovernmentTaxAccount call ISSE_str_IntToStr), (zinsen_prozent call ISSE_str_IntToStr)];" call ISSE_pub_execPstr;
		};
	};
};

RNDM_BlackmarketMulti = {
	blackmarketrandommultiplier = (random 10);
	if (blackmarketrandommultiplier <= 2.5) then {blackmarketrandommultiplier = 2.5};
	publicvariable "blackmarketrandommultiplier";
	if (debug) then {
		format["if (debug) then {debugarray = debugarray + [ format[""The new Black Market Price-Multiplier is: %1"", %1] ];};", blackmarketrandommultiplier] call ISSE_pub_execPstr;
	};
};

DLT_debugarray = {	
	debugarray = [];
	debugarray = nil;
	debugarray = [];
	if (debug) then {
		debugarray = debugarray + ["Debugarray reset on client, 30mins until next reset..."];
		if (isServer) then {
			"debugarray = debugarray + [""Debugarray reset on the Server, 30mins until next reset...""];" call ISSE_pub_execPstr;
		};
		//format["if (isServer) then {debugarray = debugarray + [""Debugarray reset on the Server, 30mins until next reset...""];};"] call ISSE_pub_execPstr;
	};
};

Bank_Rob_Start_Script =
{
titleText [localize "STRS_bank_rob_titlemsg", "plain"];
if (player distance MainBank < 500) then
	{
		MainBank say ["bank_alarm", 500];
	};
};

Bank_Rob_End_Script = 
{
	_money = _this select 0;
	(format ["[0,1,2,[""opfer""]] execVM ""bankRob.sqf"";;civ%1_wanted = 1; bounty_civ%1 = bounty_civ%1 + 25000; [""Bank"", %2, %3] spawn Isse_AddCrimeLogEntry;", rolenumber, player, _money]) call ISSE_pub_execPstr;
};

Bank_Rob_Server_looses_money = 
{	
	if (GovernmentTaxAccount > 0) then {
		GovmentLooses = round(GovernmentTaxAccount/BankRaubProzentVerlust);
		GovernmentTaxAccount = GovernmentTaxAccount - GovmentLooses;
		Publicvariable "GovernmentTaxAccount";
		Publicvariable "GovmentLooses";
		"hint format [localize ""STRS_bank_serverrobmessage"", (GovmentLooses call ISSE_str_IntToStr)];" call ISSE_pub_execPstr;
	};
};
Bank_Gov_remove_money = {
	_removemoney = _this select 0;
	(format["if (isServer) then {GovernmentTaxAccount = GovernmentTaxAccount - %1; publicvariable ""GovernmentTaxAccount"";};", _removemoney]) call ISSE_pub_execPstr;
};

Bank_Gov_add_money = {
	_receivedmoney = _this select 0;
	(format["if (isServer) then {GovernmentTaxAccount = GovernmentTaxAccount + %1; publicvariable ""GovernmentTaxAccount"";};", _receivedmoney]) call ISSE_pub_execPstr;
};