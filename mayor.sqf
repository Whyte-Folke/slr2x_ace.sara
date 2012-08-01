// Mayor voting & taxes + laws change

_voteMinLimit = 2; //The minimal number of votes for the voting to count




_this = _this select 3;
_art  = _this select 0;

_money = 'money' call INV_GetItemAmount;

// Zero Vars:
_mayorpay = 0;
_chiefpolpay = 0;
_copdefaultpay = 0;
_welfareamount = 0;
_welfareincomelimit = 0;
_welfarebanklimit = 0;
_wealthaxlimit = 0;


if (_art == "ClientWahl") then
{
	if (isNil("WahlSperre")) then {WahlSperre = false;};
	if (WahlSperre) exitWith {player groupChat "You just voted.";};
	_spielernum   = call compile (_this select 1);
	format["if (isServer) then {[0,1,2,[""ServerWahl"", %1, %2]] execVM ""mayor.sqf"";};", _spielernum, rolenumber] call ISSE_pub_execPstr;
	player groupChat format[localize "STRS_regierung_votedfor", (civstringarray select _spielernum)];
	WahlSperre = true;
	sleep 30;
	WahlSperre = false;
};

if (_art == "ClientChief") then
{
	if (isNil("VotedChief")) then {VotedChief = false;};
	if (VotedChief) exitWith {player groupChat "You just voted for a chief of police.";};
	_spielernum   = call compile (_this select 1);
	format["if (isServer) then {[0,1,2,[""ServerChief"", %1, %2]] execVM ""mayor.sqf"";};", _spielernum, rolenumber] call ISSE_pub_execPstr;
	player groupChat format[localize "STRS_chief_votedfor", (playerstringarray select _spielernum)];
	VotedChief = true;
	sleep 30;
	VotedChief = false;
};

if (_art == "ServerChief") then 
{
	_kandidatnum = (_this select 1);
	_waehlernum  = ((_this select 2)-1);
	for [{_i=0}, {_i < count(chiefarray)}, {_i=_i+1}] do
	{
		_arr = (chiefarray select _i);
		if (_waehlernum in _arr) exitWith
		{
			_arr = _arr - [_waehlernum];
			chiefarray SET [_i, _arr];
		};
	};
	chiefarray SET [_kandidatnum, ((chiefarray select _kandidatnum )+ [_waehlernum])];
};


if (_art == "ServerWahl") then
{
	_kandidatnum = (_this select 1);
	_waehlernum  = ((_this select 2)-1);
	for [{_i=0}, {_i < count(voteArray)}, {_i=_i+1}] do
	{
		_arr = (voteArray select _i);
		if (_waehlernum in _arr) exitWith
		{
			_arr = _arr - [_waehlernum];
			voteArray SET [_i, _arr];
		};
	};
	voteArray SET [_kandidatnum, ((voteArray select _kandidatnum )+ [_waehlernum])];
};

if (_art == "serverloop") then
{
	_currentMayor = -1;
	_currentChief = -1;
	while {true} do
	{
		for [{_i=0}, {_i < 30}, {_i=_i+1}] do
		{
			sleep 60;
			for [{_k=0}, {_k < count(voteArray)}, {_k=_k+1}] do
			{
				if (not((civstringarray select _k) call ISSE_UnitExists)) then
				{
					voteArray SET [_k, [] ];
				};
			};
			
			for [{_k=0}, {_k < count(chiefarray)}, {_k=_k+1}] do 
			{
				if (not((playerstringarray select _k) call ISSE_UnitExists)) then
				{
					chiefarray SET [_k, [] ];
				};
			};
		};
		_MaxStimmen = 1;
		_MaxChiefVote = 0;
		_MaxPos     = -1;
		_MaxChief = -1;
		for [{_i=0}, {_i < count(voteArray)}, {_i=_i+1}] do
		{
			if ( ((count (voteArray select _i)) > _MaxStimmen) && ((civstringarray select _i) call ISSE_UnitExists)) then
			{
				_MaxStimmen = (count (voteArray select _i));
				_MaxPos     = _i;
			};
		};
		
		for [{_i=0}, {_i < count(chiefarray)},{_i=_i+1}] do
		{
			if (((count (chiefarray select _i)) > _MaxChiefVote) && ((playerstringarray select _i) call ISSE_UnitExists)) then 
			{
				_MaxChiefVote = (count(chiefarray select _i));
				_MaxChief = _i;
			};
		};
	
		if (_MaxChief == -1) then
		{
			"hint localize ""STRS_chief_nochief"";" call ISSE_pub_execPstr;
			_Currentchief = -1;
		} else {
			if (_CurrentChief == _MaxChief) then
			{
				"hint localize ""STRS_chief_chiefstays"";" call ISSE_pub_execPstr;
			} else {
				_CurrentChief = _MaxChief;
				_ChiefString = (playerstringarray select _CurrentChief);
				// format["hint format[localize ""STRS_chief_new"", ""%3"", %2]; if ((rolenumber-1) == %1) then {IsChief = true; if (player in units basic_police_officers) then {basic_police_officers selectLeader player; player setunitrank ""COLONEL""};} else { IsChief = false; };", _MaxChief, _MaxchiefVote, _ChiefString] call ISSE_pub_execPstr;
				format["hint format[localize ""STRS_chief_new"", ""%3"", %2]; if ((rolenumber-1) == %1) then { IsChief = true; } else { IsChief = false; };", _MaxChief, _MaxchiefVote, _ChiefString] call ISSE_pub_execPstr;
			};
		};
	
		ChiefNumber = _CurrentChief;
		publicvariable "ChiefNumber";
		sleep 10;
		if (_MaxPos == -1) then
		{
			"hint localize ""STRS_regierung_nomajor"";" call ISSE_pub_execPstr;
			_currentMayor = -1;
		}
		else
		{	
			if (_currentMayor == _MaxPos) then
			{	
				"hint localize ""STRS_regierung_majorstays"";" call ISSE_pub_execPstr;
			}
			else
			{
				_currentMayor = _MaxPos;
				_MayorString  = (civstringarray select _currentMayor);
				format["hint format[localize ""STRS_mayor_new"", ""%3"", %2]; if ((rolenumber-1) == %1) then {isMayor = true;} else {isMayor = false;};", _MaxPos, _MaxStimmen, _MayorString] call ISSE_pub_execPstr;
			};
		};
		MayorNumber = _currentMayor;
		PUBLICVARIABLE "MayorNumber";
	};
};

if (_art == "clientgesetz") then
{
	_nummer = _this select 1;
	_text   = _this select 2;
	if (_nummer == -1) exitWith {};
	if ((_text call ISSE_str_Length) > 60) exitWith {player groupChat localize "STRS_text_zu_lang";};
	format ["GesetzArray SET [%1, ""%2""]; hint format [localize ""STRS_gilde_gesetze_public"", %1, ""%2""];", _nummer, _text] call ISSE_pub_execPstr;
};

// Taxes Set.
if (_art == "steuernMayor") then {
	_item = _this select 1;
	_mag  = _this select 2;
	_weap = _this select 3;
	_vcl  = _this select 4;
	_bank = _this select 5;
	_fueltaxes = _this select 6;
	_wealthaxlimit = _this select 7;
	_wealthtaxvalue = _this select 8;
	_ictax1 = _this select 9;
	_ictax2 = _this select 10;
	_ictax3 = _this select 11;
	_ictax4 = _this select 12;
	_ictax5 = _this select 13;
	_welfareincomelimit = _this select 14;
	_welfarebanklimit = _this select 15;
	_welfareamount = _this select 16;
	_mayorpay = _this select 17;
	_chiefpolpay = _this select 18;
	_interestrate = _this select 19;
	_copdefaultpay = _this select 20;
	
	// Set Vars
	GblFuelTaxes = _fueltaxes;
	GblWealthTaxLimit = _wealthaxlimit;
	GblWealthTax = _wealthtaxvalue;
	GblIncomeTaxClass1 = _ictax1;
	GblIncomeTaxClass2 = _ictax2;
	GblIncomeTaxClass3 = _ictax3;
	GblIncomeTaxClass4 = _ictax4;
	GblIncomeTaxClass5 = _ictax5;
	GblWelfareIncomeLimit = _welfareincomelimit;
	GblWelfareBankLimit = _welfarebanklimit;
	add_civmoney = _welfareamount;
	MayorExtraPay = _mayorpay;
	PoliceChiefExtraPay = _chiefpolpay;
	zinsen_prozent = _interestrate;
	add_copmoney = _copdefaultpay;
	
	// Publish them
	Publicvariable "GblFuelTaxes";
	Publicvariable "GblWealthTaxLimit";
	Publicvariable "GblWealthTax";
	Publicvariable "GblIncomeTaxClass1";
	Publicvariable "GblIncomeTaxClass2";
	Publicvariable "GblIncomeTaxClass3";
	Publicvariable "GblIncomeTaxClass4";
	Publicvariable "GblIncomeTaxClass5";
	Publicvariable "GblWelfareIncomeLimit";
	Publicvariable "GblWelfareBankLimit";
	Publicvariable "add_civmoney";
	Publicvariable "MayorExtraPay";
	Publicvariable "PoliceChiefExtraPay";
	Publicvariable "zinsen_prozent";
	Publicvariable "add_copmoney";
	format ["(INV_ItemTypenArray select 0) SET [2, %1]; (INV_ItemTypenArray select 1) SET [2, %2]; (INV_ItemTypenArray select 2) SET [2, %3]; (INV_ItemTypenArray select 3) SET [2, %4]; bank_steuer = %5; hint localize ""STRS_mayor_screams_out_changes""; ", _item, _vcl, _mag, _weap, _bank] call ISSE_pub_execPstr;
	sleep 10;
	"hint format[localize ""STRS_mayor_tax_changes_inDetail"", MayorExtraPay, PoliceChiefExtraPay, add_copmoney, add_civmoney, GblWelfareIncomeLimit, GblWelfareBankLimit, (GblWealthTaxLimit call ISSE_str_IntToStr), GblWealthTax, ((INV_ItemTypenArray select 0) select 2), ((INV_ItemTypenArray select 1) select 2), ((INV_ItemTypenArray select 2) select 2), ((INV_ItemTypenArray select 3) select 2), bank_steuer, GblFuelTaxes];" call ISSE_pub_execPstr;
};