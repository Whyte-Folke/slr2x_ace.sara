// Shop Triggers and Distances + Farmable/Collectable items
// flagActions.sqf
// Version 2

_a1 = 0; 
_a2 = 0; 
_a3 = 0;
_h1 = 0; 
_h2 = 0; 
_h3 = 0; 
_h3 = 0; 
_h4 = 0;
_f1 = 0; 
_f2 = 0;
_Arr1 = []; 
_removeterrortrain = 0;
_removeambulance = 0;
_removetaxidriver = 0;
_moneydealer = 0;
_civstorage = 0;
_terrorclothes = 0;
_NSPD_shop = 0;
_NSPD_shop_password = 0;

for [{_i=0}, {_i < (count INV_FarmItemArray)}, {_i=_i+1}] do {_Arr1 = _Arr1 + [0];};

_Arr2 = [];

for [{_i=0}, {_i < (count INV_Lizenzen)}, {_i=_i+1}] do {_Arr2 = _Arr2 + [0];};


while {true} do {
	for [{_i=0}, {_i < (count INV_ItemShops)}, {_i=_i+1}] do {
		_flag   = ((INV_ItemShops select _i) select 0);
		_action = ((INV_ItemShops select _i) select 1);
		if ((player distance _flag <= 5) and (_a1 == 0)) then {
			_h1 = player addaction [_action, "shopDlgOpen.sqf", [_i]];
			_a1 = 1;
			_f1 = _i;
		};
		if ((player distance _flag > 5) and (_i == _f1) and (_a1 == 1)) then {player removeaction _h1; _a1 = 0; _f1 = 0;};
	};


	for [{_i = 0}, {_i < (count INV_FarmItemArray)}, {_i = _i + 1}] do {
		_arr    = (INV_FarmItemArray select _i);
		_added  = (_Arr1 select _i);
		_isInArea = false;
		{if (((vehicle player) distance (getMarkerPos (_x select 0))) < (_x select 1)) then {_isInArea = true;};} forEach (_arr select 0);
		_hasVehicle = false;
		{if ((vehicle player) isKindOf _x) then {_hasVehicle = true;};} forEach (_arr select 4);
		if ((_arr select 5) == "click") then {
			if ((_isInArea) and (_hasVehicle) and (_added == 0)) then {
			call compile format ["action_farmer%1 = player addaction [localize ""STRS_inv_actions_itemgather"", ""farmStuff.sqf"", [""%2"", %3, %4]];", _i, (_arr select 1), (_arr select 2), (_arr select 3)];
			_Arr1 set [_i, 1];
			};
			if ( ((not(_isInArea)) or (not(_hasVehicle)) or (NOT(alive player))) and (_added == 1)) then {
				call compile format ["player removeaction action_farmer%1;", _i];
				_Arr1 set [_i, 0];
			};
		} else {
			if ((_isInArea) and (_hasVehicle)) then {
				[0,1,2, [(_arr select 1), (_arr select 2), (_arr select 3)]] execVM "farmStuff.sqf";
			};
		};
	};


	for [{_i=0}, {_i < (count INV_ItemFabriken)}, {_i=_i+1}] do {
		_flag   = (INV_ItemFabriken select _i) select 0;
		_name   = (INV_ItemFabriken select _i) select 1;
		_cost   = (INV_ItemFabriken select _i) select 6;
		_ablage = (INV_ItemFabriken select _i) select 7;
		_owner   = false;
		if (_name in INV_Fabrikowner) then {_owner = true};
		if (player distance _flag <= 5) then {
			if ( (_owner) and (_a2 == 0) ) then {
				INV_action_facablage     = player addaction [localize "STRS_inv_fac_storage", "storage.sqf", [_ablage, "save"]];
				INV_action_facherstellen = player addaction [localize "STRS_inv_fac_mani", "facStorage.sqf", [_i]];
				if (_a3 == 1) then {player removeaction INV_action_facbuy;};
				_a2 = 1;
				_f2 = _i;
			};
			if ( (not(_owner)) and (_a3 == 0) ) then {
				INV_action_facbuy = player addaction [format[localize "STRS_inv_fac_buy", (_cost call ISSE_str_IntToStr)], "buyFactory.sqf", [_i]];
				_a3 = 1;
				_f2 = _i;
			};
		};
		if ((player distance _flag >  5) and (_a2 == 1) and (_f2 == _i)) then {
			player removeaction INV_action_facablage;
			player removeaction INV_action_facherstellen;
			_a2 = 0;
		};
		if ((player distance _flag >  5) and (_a3 == 1) and (_f2 == _i)) then {
			player removeaction INV_action_facbuy;
			_a3 = 0;
		};
	};


	for [{_i = 0}, {_i <= (count INV_Lizenzen)}, {_i = _i + 1}] do {
		_flag        = ((INV_Lizenzen select _i) select 1);
		_licensename = ((INV_Lizenzen select _i) select 2);
		_cost        = ((INV_Lizenzen select _i) select 3);
		_added       = _Arr2 select _i;
		if ((player distance _flag <= 5) and (_added == 0)) then {
			call compile format ["a_license%1 = player addaction [format[localize ""STRS_inv_actions_buy"", ""%2"", %3], ""buyLicence.sqf"", [%1, ""add""]];", _i, _licensename, (_cost call ISSE_str_IntToStr)];
			_Arr2 set [_i, 1];
		};
		if ((player distance _flag > 5) and (_added == 1)) then {
			call compile format ["player removeaction a_license%1; ", _i];
			_Arr2 set [_i,0];
		};
	};

	// Remove Terror-Training custom
	if ((isTerrorist) and (_removeterrortrain == 0) and ((player distance terrorlicence <= 5) or (player distance bailflag <= 5) or (player distance rathaus <= 5))) then {
			call compile format ["dropterrorlic = player addaction [format[localize ""STRS_inv_actions_remove"", ""%2""], ""buyLicence.sqf"", [%1, ""remove""]];", 0, ((INV_Lizenzen select 0) select 2)];
			_removeterrortrain = 1;
	};
		
	if ((!isTerrorist) or (_removeterrortrain == 1) and ((player distance terrorlicence > 5) and (player distance bailflag > 5) and (player distance rathaus > 5))) then {
		call compile format ["player removeaction dropterrorlic;"];
		_removeterrortrain = 0;
	};

	// Remove Medic License
	if ((player distance rathaus <= 5) and (isAmbulance) and (_removeambulance == 0) ) then {
		call compile format ["dropMediclic = player addaction [format[localize ""STRS_inv_actions_remove"", ""%2""], ""buyLicence.sqf"", [%1, ""remove""]];", 17, ((INV_Lizenzen select 17) select 2)];
		_removeambulance = 1;
	};
	
	if ((player distance rathaus > 5) or (!isAmbulance) and (_removeambulance == 1) ) then {
		player removeaction dropMediclic;
		_removeambulance = 0;
	};
	
		// Remove TaxiDriver License
	if ((player distance rathaus <= 5) and (isTaxidriver) and (_removetaxidriver == 0) ) then {
		call compile format ["dropTaxilic = player addaction [format[localize ""STRS_inv_actions_remove"", ""%2""], ""buyLicence.sqf"", [%1, ""remove""]];", 25, ((INV_Lizenzen select 25) select 2)];
		_removetaxidriver = 1;
	};
	
	if ((player distance rathaus > 5) or (!isTaxidriver) and (_removetaxidriver == 1) ) then {
		player removeaction dropTaxilic;
		_removetaxidriver = 0;
	};
	
	//Money Dealer
	if ((player distance moneydealer < 5) and (_moneydealer == 0) ) then {
		exchange = player addAction ["Exchange Money", "moneydealer.sqf"];
		_moneydealer = 1;
	};
	
	if ((player distance moneydealer > 5) and (_moneydealer == 1) ) then {
		player removeaction exchange;
		_moneydealer = 0;
	};
	
	//Civ Storage
	if ((player distance civstorage < 5) and (_civstorage == 0) and (!(iscop)) ) then {
		action_civstorage1 = player addAction["Civ Storage","storage.sqf", ["civstorage1_local",  "save"]];
		_civstorage = 1;
	};
	
	if ((player distance civstorage > 5) and (_civstorage == 1) and (!(iscop)) ) then {
		player removeAction action_civstorage1;
		_civstorage = 0;
	};
	
	//NSPD Shop
	if ((player distance copbuy_air < 5) and (_NSPD_shop == 0) and (NSPD_shop_unlocked)) then {
		NSPD_Shop = player addaction [">>NSPD Shop<<", "shopDlgOpen.sqf", [77]];
		_NSPD_shop = 1;
	};
	
	if ((player distance copbuy_air > 5) and (_NSPD_shop == 1) and (NSPD_shop_unlocked)) then {
		player removeAction NSPD_Shop;
		_NSPD_shop = 0;
	};
	
	//NSPD Shop Password
	if ((player distance copbuy_air < 5) and (_NSPD_shop_password == 0) and (!(NSPD_shop_unlocked))) then {
		NSPD_Shop_Passwort = player addaction [">>Unlock NSPD Shop<<","someCompile.sqf" ,"[""Password""]call NSPD_Shop_System"];
		_NSPD_shop_password = 1;
	};
	
	if ((player distance copbuy_air > 5) and (_NSPD_shop_password == 1)) then {
		player removeAction NSPD_Shop_Passwort;
		_NSPD_shop_password = 0;
	};
	sleep 3;
};
