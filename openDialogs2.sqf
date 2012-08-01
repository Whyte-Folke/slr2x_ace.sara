// Dialogue Settings
// openDialogs2.sqf

_array = _this select 3;
_art   = _array select 0;
_money  = 'money' call INV_GetItemAmount;
_zusatzString = "";

if ((count _array)>1) then {_zusatzString = _array select 1;};


// Bail Dialogue
if (_art == "bail") then {
	if (!(createDialog "baildialog")) exitWith {hint "Dialog Error!";};
	sliderSetRange [2, 100, 25000];
	sliderSetSpeed [2, 1, 50];
	while {(ctrlVisible 1008)} do {
		ctrlSetText [1, format["$%1", ((round(sliderPosition 2)) call ISSE_str_IntToStr)]];
		sleep 0.3;
	};
};

// Cellphone Menu
if (_art == "cellphonemenu") then 
{
	sleep 0.1;
	if (!(createDialog "CellPhoneMenu")) exitWith 
	{
		hint "Dialog Error!";
	};	
};

// Server News Menu
if (_art == "servernewsmenu") then 
{
	sleep 0.1;
	if (!(createDialog "NewsJoinDlg")) exitWith 
	{
		hint "Dialog Error!";
	};	
	
	// TEMPORARY CREATE NEWS ARRAY
	
	//serverNewsArray = [["Jason","01/06/10","<t size='1.4'>Wow? What is this?</t><br /><br />This window you see is a small news update system. You will find out about changes coming up, when the stats reset might next be etc. Please be sure to read it before closing it as it may have something important with it.<br /><br />Thanks,<br />Jason"]];
	
	_newsText = "";
	//_newsText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque commodo blandit convallis. Phasellus sit amet magna urna, ac consequat nulla. Praesent placerat tincidunt diam eu tempus. Maecenas fringilla vehicula quam, nec placerat diam consectetur mollis. Nulla eu erat quis nibh consectetur dignissim.<br /><br />Aenean volutpat lorem id sapien cursus ac aliquet dui placerat. Aliquam tincidunt risus vel libero tempor cursus. Ut nisi risus, imperdiet vel dictum id, elementum at risus. Ut lacus enim, condimentum id fermentum a, cursus at diam. Phasellus augue diam, aliquam vel tempor sed, tincidunt vel diam.<br /><br />Aliquam ac justo felis, a auctor enim. Nulla tellus leo, varius vel tincidunt non, dapibus in erat. Duis id interdum magna. Nunc nec justo vel lorem tincidunt dapibus. Suspendisse mattis aliquam pharetra. Sed volutpat erat id ligula consequat pharetra. Nam aliquam blandit magna, et convallis eros mattis eu. Aliquam erat volutpat.";
	
	_newsControl = findDisplay 1631618;
	{
		lbAdd[1562, format["%2 Posted by %1", _x select 0, _x select 1]];
	} forEach serverNewsArray;
	lbSetCurSel [1562, 0];
	
	JAS_NewsItemChange = 
	{
		_newsControl = findDisplay 1631618;
		_newsItemIndex = _this select 1;
		_newsText = (serverNewsArray select _newsItemIndex) select 2;
		(_newsControl displayCtrl 1564) ctrlSetStructuredText parseText _newsText;
	};
	["",lbCurSel 1562] call JAS_NewsItemChange;
	JAS_NewsAdd =
	{
		_submitName = name player;
		serverNewsArray = [[_submitName,_this select 0,_this select 1]] + serverNewsArray;
		publicVariable "serverNewsArray";
	};
};

// Copmenu-lite by Deadfast

if (_art == "copmenulite") then 
{
	if (!(createDialog "CopMenuLite")) exitWith 
	{
		hint "Dialog Error!";
	};	
};

// Civcam Dialogue
if (_art == "civcam") then {
	if (!(createDialog "civcamdialog")) exitWith {hint "Dialog Error!";};
	[0, 1, true, false] call DialogSpielerListe;
	lbSetCurSel    [1, 0];sliderSetRange [2, 5, 20];sliderSetSpeed [2, 1, 5];
	while {ctrlVisible 1002} do {
		ctrlSetText [3, format["%1$", (((round(sliderPosition 2))*100) call ISSE_str_IntToStr)]];
		ctrlSetText [5, format["%1s", ((round(sliderPosition 2)) call ISSE_str_IntToStr)]];
		sleep 0.3;
	};
};



// Release Prisoner Dialogue
if (_art == "wantedrelease") then {
	if (!(createDialog "wantedrelease")) exitWith {hint "Dialog Error!";};
	[2, 1, true, false] call DialogSpielerListe;
	lbSetCurSel [1, 0];
	[2, 11, true, false] call DialogSpielerListe;
	lbSetCurSel [11, 0];
	while {ctrlVisible 1007} do {sleep 0.3;};
};

if (_art == "hideout") then {
	if (!(createDialog "hideout")) exitWith {hint "Dialog Error!";};
	for [{_i=0}, {_i < (count hideoutHouseArray)}, {_i=_i+1}] do {
		lbAdd [2, format ["%1 - $%2", hideoutNameArray select _i, hideoutPriceArray select _i]];
	};	lbSetCurSel [2, 0];
	while {ctrlVisible 1014} do {
		ctrlSetText [1, hideoutHousePictureArray select lbCurSel 2];
		sleep 0.3;
	};
};


// Stats Dialogue
if (_art == "spielerliste") then {
	if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
	_trennlinie = "---------------------------------------------";
	lbAdd [1, format ["Date:     %3.%2.%1", (date select 0), (date select 1), (date select 2)]];
	lbAdd [1, format ["Playtime: %1", (round((time-eigene_zeit)/60))]];
	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_playerinfo"];
	lbAdd [1, format ["Money: $%2",   localize "STRS_statdialog_money", ('Money' call INV_GetItemAmount)]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_health", (round((1 - damage role) * 100))]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_thirst", round(INV_thirst)]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_hunger", round(INV_hunger)]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_nutrition", round(INV_nutrition)]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_speed", (round(speed role))]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_heigth", (round(getposASL role select 2))]];
	lbAdd [1, format ["%1: %2/%3", localize "STRS_statdialog_weight", (call INV_GetOwnWeight), INV_Tragfaehigkeit]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_rolenumber", sidenumber]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_copkills", CopsKilled]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_civkills", CivsKilled]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_selfkills", SelfKilled]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_deaths", deadtimes]];
	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_playerlist"];

	// Display Players in Stats Screen
	for [{_i=0}, {_i < (count playerarray)}, {_i=_i+1}] do {
		_spieler = playerarray select _i;
		if ((format["%1", (_spieler)]) call ISSE_UnitExists) then {
			if (_spieler in civarray) then {
				_spielergilde = "/";
				for [{_j=0}, {_j < (count GildenInfoArrays)}, {_j=_j+1}] do {
					_id          = ((GildenInfoArrays select _j) select 0);
					_memberarray = ((GildenInfoArrays select _j) select 5);
					if (_spieler in _memberarray) exitWith {_spielergilde = _id;};
				};
				_gesucht  = call compile format ["%1_wanted", _spieler];
				if (_gesucht == 1) then {_gesucht = localize "STRS_hints_ja";} else {_gesucht = localize "STRS_hints_nein";};
				_bounty = call compile format ["bounty_%1", _spieler];
				lbAdd [1, (format ["%1: %2 (%3: %4, %5: %6, %7: %8)", _spieler, name _spieler, localize "STRS_gildeid", _spielergilde, localize "STRS_statdialog_wanted", _gesucht, localize "STRS_statdialog_bounty", _bounty])];
			} else {
				lbAdd [1, (format ["%1: %2", _spieler, name _spieler])];
			};
		};
	};

	
	// Display Licences in Stats Screen
	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_licenselist"];

	for [{_i=0}, {_i < (count INV_Lizenzen)}, {_i=_i+1}] do {
		if (((INV_Lizenzen select _i) select 0) call INV_HasLicense) then {
			lbAdd [1, ((INV_Lizenzen select _i) select 2)];
		};
	};
	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_regierung"];
	if (not(MayorNumber == -1)) then 
	{
	 lbadd [1, localize "STRS_statdialog_mayor"];
	 lbAdd [1, (playerstringarray select MayorNumber)];
	 };
	
	if (not(ChiefNumber == -1)) then
	{
	lbAdd [1, localize "STRS_statdialog_chief"];
	lbAdd[1, (playerstringarray select ChiefNumber)];
	};
	
	lbAdd [1, _trennlinie];	lbAdd [1, localize "STRS_statdialog_gildenlist"];

	for [{_i=0}, {_i < (count GildenInfoArrays)}, {_i=_i+1}] do {
		_gildenarray = GildenInfoArrays select _i;
		lbAdd [1, format ["%1:", (_gildenarray select 1)]];
		lbAdd [1, format ["ID: %1 - Memberlist: %2 -  Points: %3", (_gildenarray select 0), (_gildenarray select 5), (_gildenarray select 4)]];
	};

	lbAdd [1, _trennlinie];

	if (iscop) then {} else {
		lbAdd [1, localize "STRS_statdialog_other"];
		_bounty = 0;call compile format ["_bounty == civ%1_bounty", rolenumber];
		if (_bounty == 0) then {_bounty = localize "STRS_hints_keins";};
		lbAdd [1, (format ["%1: %2", (localize "STRS_statdialog_bounty"), _bounty])];
		_bestzeit = 0;if (race_bestzeit_eigen == -1) then {_bestzeit = "/";} else {_bestzeit = race_bestzeit_eigen;};
		lbAdd [1, (format ["%1: %2", (localize "STRS_statdialog_bestrace"), _bestzeit])];
		lbAdd [1, (format ["%1: %2", (localize "STRS_statdialog_racewon"), race_gewonnen_anzahl])];

		if (not((workplacemissioninfos select 0) == "")) then {
			_workplacejob1_info = format ["WP job: %1 -> %2", (workplacemissioninfos select 0), (workplacemissioninfos select 1)];
			lbAdd [1, _workplacejob1_info];
		};
		
		if (isGildenMember) then {lbAdd [1, (format ["%1: %2", (localize "STRS_statdialog_gilde"), EigeneGildenId])];};
		_i = 0;if ((isGildenMember) and (EroberungenAktiv))then {
			while {_i < (count GildenInfoArrays)} do {
				_gildenarray = GildenInfoArrays select _i;
				{	lbAdd [1, (format ["%1: Owned by Guild #%2", (GangGebietsname select _x), (_gildenarray select 0)])];}
				forEach (_gildenarray select 6);_i = _i + 1;
			};
		};
		
		lbAdd [1, _trennlinie];
		lbAdd [1, (format ["S H O P S - W O R K P L A C E S"])];
		
		for [{_i=0}, {_i < (count BuyAbleBuildingsArray)}, {_i=_i+1}] do {
			if ( ((BuyAbleBuildingsArray select _i) select 0) in BuildingsOwnerArray ) then {
				lbAdd [1, (format ["%1", ((BuyAbleBuildingsArray select _i) select 1)])];
			};
		};
		
	lbAdd [1, _trennlinie];
	};
	
	lbAdd [1, localize "STRS_statdialog_laws"];_i = 0;
	{if (not(_x == "")) then {_i = _i + 1;	lbAdd [1, (format ["%1: %2", _i, _x])];};}
	forEach GesetzArray;
	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_taxes"];
	{if ((_x select 2) > 0) then {lbAdd [1, format["%1: %2", (_x select 1), (_x select 2)] ];};}
	foreach INV_ItemTypenArray;
	lbAdd [1, format["Transfer-Tax: %1", bank_steuer] ];
	lbAdd [1, format["Fuel-Tax: %1", GblFuelTaxes] ];
	lbAdd [1, format["Wealth-Tax: %1", GblWealthTax] ];
	lbAdd [1, format["IncomeTax (0-1000$): %1", GblIncomeTaxClass1] ];
	lbAdd [1, format["IncomeTax (1001-4000$): %1", GblIncomeTaxClass2] ];
	lbAdd [1, format["IncomeTax (4001-9999$): %1", GblIncomeTaxClass3] ];
	lbAdd [1, format["IncomeTax (10001-20000$): %1", GblIncomeTaxClass4] ];
	lbAdd [1, format["IncomeTax (>=20001$): %1", GblIncomeTaxClass5] ];
	lbAdd [1, format["Interest-Rate: %1", zinsen_prozent] ];
	

};


// Guild Dialogue
if (_art == "gildenmenu") then {
	if (!(createDialog "gilde_hauptmenu")) exitWith {hint "Dialog Error!";};
	
	for [{_i=0}, {_i < (count GildenInfoArrays)}, {_i=_i+1}] do {
		_gildenarray = GildenInfoArrays select _i;
		_index = lbAdd [202, format ["ID: %1 - Memberlist: %2 -  Points: %3 - Name: %4", (_gildenarray select 0), (_gildenarray select 5), (_gildenarray select 4), (_gildenarray select 1), (_gildenarray select 3)]];
		// lbSetData [202, _index, format ["%1", (_gildenarray select 0)]];
		lbSetData [202, _index, format["[%1,%2]", (_gildenarray select 0), (_gildenarray select 1)]];


	};
};


// Guild Leader Dialogue
if (_art == "gildenverwaltung") then {
	closedialog 0; If (NOT(isGildenLeader)) exitWith {
	role groupChat localize "STRS_dialogandere_gilden_keinleader";};

	if (!(createDialog "gilde_verwaltung")) exitWith {hint "Dialog Error!";};

	for [{_i=0}, {_i < (count GildenInfoArrays)}, {_i=_i+1}] do {
		if (EigeneGildenId == ((GildenInfoArrays select _i) select 0)) exitWith {};
	};

	_gildenarray  = (GildenInfoArrays select _i);
	_gildenmember = (_gildenarray select 5);
	_index = lbAdd [201, localize "STRS_hints_ja"];
	lbSetData [201, _index, "true"];
	_index = lbAdd [201, localize "STRS_hints_nein"];
	lbSetData [201, _index, "false"];

	for [{_i=0}, {_i < (count _gildenmember)}, {_i=_i+1}] do {
		_member = (_gildenmember select _i);
		_index = lbAdd [102, (format ["%1 (%2)", name _member, _member])];
		lbSetData [102, _index, (format ["%1", _member])];
	};
};


// Inventory-check Dialogue
if (_art == "inventorycheck") then {
	if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
	_licensearray  = (_array select 1);
	_inventararray = (_array select 2);
	_civobj        = (_array select 3);
	_waffenarray   = weapons   _civobj;
	_magazinarray  = magazines _civobj;
    
	_trennlinie = "---------------------------------------------";
	lbAdd [1, localize "STRS_statdialog_licenselist"];
	
	{
		_lizenz = _x;
        _licName = (_lizenz call INV_GetLicenseName);
		_index = lbAdd [1, format ["%1", _licName]];
	} forEach _licensearray;
	
	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_inventarlist"];
	
	for [{_i=0}, {_i < (count _inventararray)}, {_i=_i+1}] do {
		_objekt     = ((_inventararray select _i) select 0);
		_objektname = (_objekt call INV_getitemName);
		_anzahl     = ((_inventararray select _i) select 1);
		if (_anzahl > 0) then {lbAdd [1, format ["%1: %2", _objektname, _anzahl]];};
	};
	
	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_waffen"];

	for [{_i=0}, {_i < (count _waffenarray)}, {_i=_i+1}] do {
		_objekt     = _waffenarray select _i;
		_scriptname = _objekt call INV_GetScriptFromClass_Weap;
		_objektname = (_scriptname call INV_getitemName);
		lbAdd [1, format ["%1", _objektname]];	};
		lbAdd [1, _trennlinie];
		_index = lbAdd [1, localize "STRS_statdialog_magazine"];
		
		for [{_i=0}, {_i < (count _magazinarray)}, {_i=_i+1}] do {
			_objekt     = _magazinarray select _i;
			_scriptname = _objekt call INV_GetScriptFromClass_Mag;
			_objektname = (_scriptname call INV_getitemName);
			lbAdd [1, format ["%1", _objektname]];};
			lbAdd [1, _trennlinie];	
};
// Laws Dialogue
if (_art == "gesetz") then {
	if (!(createDialog "gesetzdialog")) exitWith {hint "Dialog Error!";};
	{_index = lbAdd [1, _x];lbSetData [1, _index, _x];} forEach GesetzArray;
	while {ctrlVisible 1020} do {
		_selected = lbCurSel 1;
		ctrlSetText [2, lbText [1, _selected]];
		waitUntil {((not(_selected == lbCurSel 1)) or (not(ctrlVisible 1020)))};
	};
};

//Buy points Dialogue			
if (_art == "punktekauf") then {
	if (!(createDialog "gilden_punktekaufdialog")) exitWith {hint "Dialog Error!";};
	sliderSetSpeed [1, 1, 50];
	while {ctrlVisible 1021} do {
		sliderSetRange [1, 1, (('money' call INV_GetItemAmount)/GildenPunktCost)];
		ctrlSetText [2, format[localize "STRS_dialogandere_punktekauf_anzeigetext", (round(sliderPosition 1)), ((round(sliderPosition 1))*GildenPunktCost)]];
		sleep 0.3;
	};
};

// Coplog Dialogue			
if (_art == "coplog") then {
	if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
	{_text  = format["%3: Player %1 --> %2", (_x select 0), (_x select 1), (round((_x select 3)/60))];_index = lbAdd [1, _text];}forEach CopLog;
};

// Vote Dialogue
if (_art == "wahlen") then {
	if (!(createDialog "wahldialog")) exitWith {hint "Dialog Error!";};
	_array = [0, 1, true, false] call DialogSpielerListe;
	lbSetCurSel [1, _array select 1];
};

// Tax Dialogue				
if (_art == "steuern") then {
	if (!(createDialog "steuerdialog")) exitWith {hint "Dialog Error!";};
	sliderSetSpeed [12, 1, 5];
	sliderSetRange [12, 1, 500];
	sliderSetPosition [12,((INV_ItemTypenArray select 0) select 2)];
	sliderSetSpeed [22, 1, 5];
	sliderSetRange [22, 1, 500];
	sliderSetPosition [22,((INV_ItemTypenArray select 1) select 2)];
	sliderSetSpeed [32, 1, 5];
	sliderSetRange [32, 1, 500];
	sliderSetPosition [32,((INV_ItemTypenArray select 2) select 2)];
	sliderSetSpeed [42, 1, 5];
	sliderSetRange [42, 1, 500];
	sliderSetPosition [42,((INV_ItemTypenArray select 3) select 2)];
	sliderSetSpeed [52, 1, 5];
	sliderSetRange [52, 1, 75];
	sliderSetPosition [52,bank_steuer];
	sliderSetRange [62, 1, 500];
	sliderSetPosition [62,GblFuelTaxes];
	sliderSetRange [72, 100000, 2000000];
	sliderSetPosition [72,GblWealthTaxLimit];
	sliderSetRange [82, 0, 75];
	sliderSetPosition [82,GblWealthTax];
	sliderSetRange [92, 0, 75];
	sliderSetPosition [92,GblIncomeTaxClass1];
	sliderSetRange [102, 0, 75];
	sliderSetPosition [102,GblIncomeTaxClass2];
	sliderSetRange [112, 0, 75];
	sliderSetPosition [112,GblIncomeTaxClass3];
	sliderSetRange [122, 0, 75];
	sliderSetPosition [122,GblIncomeTaxClass4];
	sliderSetRange [132, 0, 75];
	sliderSetPosition [132,GblIncomeTaxClass5];
	sliderSetRange [142, 100, 10000];
	sliderSetPosition [142,GblWelfareIncomeLimit];
	sliderSetRange [152, 1000, 100000];
	sliderSetPosition [152,GblWelfareBankLimit];
	sliderSetRange [162, 10, 5000];
	sliderSetPosition [162,add_civmoney];
	sliderSetRange [172, 500, 50000];
	sliderSetPosition [172,MayorExtraPay];
	sliderSetRange [182, 500, 50000];
	sliderSetPosition [182,PoliceChiefExtraPay];
	sliderSetRange [192, 0, 10];
	sliderSetPosition [192,zinsen_prozent];
	sliderSetRange [202, 0, 10000];
	sliderSetPosition [202,add_copmoney];
	
	while {ctrlVisible 1032} do {
		ctrlSetText [11, format[localize "STRS_dialogandere_steuerdialog_itemsteuer", ((round(sliderPosition 12)) call ISSE_str_IntToStr)]];
		ctrlSetText [21, format[localize "STRS_dialogandere_steuerdialog_fahrzeugsteuer", ((round(sliderPosition 22)) call ISSE_str_IntToStr)]];
		ctrlSetText [31, format[localize "STRS_dialogandere_steuerdialog_magazinsteuer", ((round(sliderPosition 32)) call ISSE_str_IntToStr)]];
		ctrlSetText [41, format[localize "STRS_dialogandere_steuerdialog_waffesteuer", ((round(sliderPosition 42)) call ISSE_str_IntToStr)]];
		ctrlSetText [51, format[localize "STRS_dialogandere_steuerdialog_banksteuer", ((round(sliderPosition 52)) call ISSE_str_IntToStr)]];
		ctrlSetText [61, format[localize "STRS_dialogandere_steuerdialog_fuelsteuer", ((round(sliderPosition 62)) call ISSE_str_IntToStr)]];
		ctrlSetText [71, format[localize "STRS_dialogandere_steuerdialog_wealthtaxlimit", ((round(sliderPosition 72)) call ISSE_str_IntToStr)]];
		ctrlSetText [81, format[localize "STRS_dialogandere_steuerdialog_wealthtaxpercent", ((round(sliderPosition 82)) call ISSE_str_IntToStr)]];
		ctrlSetText [91, format[localize "STRS_dialogandere_steuerdialog_ictaxclass1", ((round(sliderPosition 92)) call ISSE_str_IntToStr)]];
		ctrlSetText [101, format[localize "STRS_dialogandere_steuerdialog_ictaxclass2", ((round(sliderPosition 102)) call ISSE_str_IntToStr)]];
		ctrlSetText [111, format[localize "STRS_dialogandere_steuerdialog_ictaxclass3", ((round(sliderPosition 112)) call ISSE_str_IntToStr)]];
		ctrlSetText [121, format[localize "STRS_dialogandere_steuerdialog_ictaxclass4", ((round(sliderPosition 122)) call ISSE_str_IntToStr)]];
		ctrlSetText [131, format[localize "STRS_dialogandere_steuerdialog_ictaxclass5", ((round(sliderPosition 132)) call ISSE_str_IntToStr)]];
		ctrlSetText [141, format[localize "STRS_dialogandere_steuerdialog_welfareIncomelimit", ((round(sliderPosition 142)) call ISSE_str_IntToStr)]];
		ctrlSetText [151, format[localize "STRS_dialogandere_steuerdialog_welfareBanklimit", ((round(sliderPosition 152)) call ISSE_str_IntToStr)]];
		ctrlSetText [161, format[localize "STRS_dialogandere_steuerdialog_welfareAmount", ((round(sliderPosition 162)) call ISSE_str_IntToStr)]];
		ctrlSetText [171, format[localize "STRS_dialogandere_steuerdialog_MayorIncome", ((round(sliderPosition 172)) call ISSE_str_IntToStr)]];
		ctrlSetText [181, format[localize "STRS_dialogandere_steuerdialog_PolChiefIncome", ((round(sliderPosition 182)) call ISSE_str_IntToStr)]];
		ctrlSetText [191, format[localize "STRS_dialogandere_steuerdialog_InterestRates", ((round(sliderPosition 192)) call ISSE_str_IntToStr)]];
		ctrlSetText [201, format[localize "STRS_dialogandere_steuerdialog_PoliceIncome", ((round(sliderPosition 202)) call ISSE_str_IntToStr)]];
		CtrlSetText [6661, localize "STRS_bank_dialoge_taxaccountgovtext"];
		CtrlSetText [6662, format[localize "STRS_bank_dialoge_taxaccountgovValue",  (GovernmentTaxAccount  call ISSE_str_IntToStr)]];
		sleep 0.1;
	};
};
// Copmenu Dialogue				
if (_art == "copmenu") then {
	if (!(createDialog "CopMenu")) exitWith {hint "Dialog Error!";};
};

//Remove license dialog
if (_art == "RemoveLicense") then 
{
	if (!(createdialog "RemoveLicense")) exitwith { hint "RemoveLicense Dialog Error!"; };
	
	lbclear 5002;
	
	for [{_i=0}, {_i < (count civstringarray)}, {_i=_i+1}] do 
	{
		_Player = playerarray select _i;
		_Name = playerstringarray select _i;
		
		lbAdd [5002, format["%1", _Name]];
		lbSetData [5002, _i, _Name];
		lbSetValue [5002, _i, _i];
		lbSetCurSel [5002, _i];
	
	};
	
	
};

//Check civilian bank accounts
if (_art == "CheckAccounts") then
{
	if (!(createdialog "CheckBanks")) exitwith { hint "CheckBanks Dialog Error!"; };
	
	lbclear 5005;
	
	
	
	 
	 WAIT_RDY = FALSE;
	
		for [{_i=0}, {_i < (count civstringarray)}, {_i=_i+1}] do 
		{
		_civ = civstringarray select _i;
		(format['if (player == %1) then { [0,1,2,["GetAccounts", _i]] execVM "CheckAccounts.sqf"; };', _civ]) call ISSE_pub_execPstr;
		};
		
		waitUntil {WAIT_RDY};

		for [{_i = 0}, {_i < (count civstringarray)}, {_i=_i+1}] do
		{
		_Cash = 0;
		call compile format['_Cash = Civ%1_account', (_i + 1)];

		lbadd [5005, format['$%1 --- Civ%2', _Cash, (_i + 1)]];	
		};
	
	WAIT_RDY = FALSE;
};
		
	