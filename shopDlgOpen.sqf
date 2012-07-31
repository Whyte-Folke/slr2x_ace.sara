if (!(createDialog "itemkaufdialog"))exitWith {
	hint "Dialog Error!";
};
	
	
if (isNil "INV_ShopDialoge")then {
		INV_ShopDialoge = 0;
	}else{
		INV_ShopDialoge = INV_ShopDialoge + 1;
};
	
	
private["_item", "_preis", "_preisOhneTax", "_name", "_index", "_infos", "_shoptype", "_bmMultiplier", "_money"];
_this = _this select 3;
INV_ActiveShopNumber = (_this select 0);
INV_ActiveSellShopArray = [];
INV_ActiveBuyShopArray  = [];
_itembuyarray = ((INV_ItemShops select INV_ActiveShopNumber) select 4);
_itemsellarray = ((INV_ItemShops select INV_ActiveShopNumber) select 5);
_shoptype = ((INV_ItemShops select INV_ActiveShopNumber) select 7);
_bmMultiplier = blackmarketrandommultiplier;
_TerrorMultiplier = terrorshopmultiplier;
_money = 'money' call INV_GetItemAmount;

if (interndebug) then {hint format["Current Shoptype: %1", _shoptype]; };


for [{_i=0}, {_i < (count _itembuyarray)}, {_i=_i+1}] do {

	// Checks if you have overridden the price inside the shopDefine.sqf buy/sell aaray.
	if ((typeName (_itembuyarray select _i)) == "ARRAY") then {
		_item = (_itembuyarray select _i) select 0;
		_infos = _item call INV_getitemArray;
		_preisOhneTax = ((_itembuyarray select _i) select 1);
		
		// Check whether Shoptype is of normal kind, if not then its taxfree for buyer
		if (_shoptype == "normalshop") then {
			_preis = [_item, _preisOhneTax] call INV_getitemPreisSteuer;
		} else {
			_preis = _preisOhneTax;
		};
		_name = (_infos call INV_getitemName);
	} else {
	
		// Else its the regular price from goodsarray
		_item = (_itembuyarray select _i);
		_infos = _item call INV_getitemArray;
		_preisOhneTax = _item call INV_getitemBuyCost;
		
		// Check whether Shoptype is of normal kind, if not then its taxfree for buyer
		if (_shoptype == "normalshop") then {
			_preis = (_infos call INV_getitemCostWithTax);
		} else {
			_preis = _preisOhneTax;
		};
		_name = (_infos call INV_getitemName);
	};
	
	// Adds multiplier to generate random prices for the blackmarket
	if (_shoptype == "blackmarketshop") then {
		// Active Terrorists get discount at Blackmarket:p
		if ((isterrorist) OR (roleterrorist == 1)) then {
			_bmMultiplier = (blackmarketrandommultiplier/2);
		};
		_preis = round (_preis*_bmMultiplier);
	};
	
	// Increase Prices at terrorist shop by at least 250%, to compensate for loss of taxation.
	if (_shoptype == "terroristshop") then {
		_preis = round (_preis*_TerrorMultiplier);
	};
	
	if (_infos call INV_getitemType == "item")then {
		_index = lbAdd [1, format ["%1 ($%2, %3kg)", _name, (_preis), (_infos call INV_getitemTypeKg)] ];
	} else {
			_index = lbAdd [1, format ["%1 ($%2)", _name, (_preis call ISSE_str_IntToStr)] ];
	};
	
	lbSetData [1, _index, format ["%1", _item] ];
	INV_ActiveBuyShopArray = INV_ActiveBuyShopArray + [ [_item, _preisOhneTax, _preis] ];
};


for [{_i=0}, {_i < (count _itemsellarray)}, {_i=_i+1}] do {
	// Checks if you have overridden the price inside the shopsDefine.sqf buy/sell aaray.
	if (typeName (_itemsellarray select _i) == "ARRAY") then {
		_preisOhneTax = (_itemsellarray select _i) select 2;
		_preis = (_itemsellarray select _i) select 2;
		_name = (_infos call INV_getitemName);
	} else {
		_item = (_itemsellarray select _i);
		_infos = _item call INV_getitemArray;
		_preisOhneTax = (_infos call INV_getitemSellCost);
		_preis = (_infos call INV_getitemSellCost);
		_name = (_infos call INV_getitemName);
	};
	
	if (_shoptype == "blackmarketshop") then {
		_preis = round (_preis*_bmMultiplier);
	};
	
	if ((_infos call INV_getitemType) == "Waffe") then {
		if (player hasweapon (_infos call INV_getitemClassName)) then {
			INV_ActiveSellShopArray = INV_ActiveSellShopArray + [ [_item, _preisOhneTax, _preis] ];
			_index = lbAdd [101, format["%1 ($%2)", _name, _preis] ];
			lbSetData [101, _index, _item];						
		};		
	};
	
								
	if ((_infos call INV_getitemType) == "Magazin") then {
		if ((_infos call INV_getitemClassName) in (magazines player)) then {
			INV_ActiveSellShopArray = INV_ActiveSellShopArray + [ [_item, _preisOhneTax, _preis] ];
			_mags = {_x == (_infos call INV_getitemClassName)} count magazines player;
			_menge = _mags;
			_index = lbAdd [101, format["%1 ($%2 %3x)", _name, (_preis call ISSE_str_IntToStr), (_menge call ISSE_str_IntToStr)] ];
			lbSetData [101, _index, _item];
		};
	};
	
	
	if ((_infos call INV_getitemType) == "Item") then {
		if ( ((_item call INV_GetItemAmount) > 0) and (_item call INV_getitemDropable) ) then {
			INV_ActiveSellShopArray = INV_ActiveSellShopArray + [ [_item, _preisOhneTax, _preis] ];			
			_amount = (_item call INV_getItemAmount);
			index = lbAdd [101, format["%1 ($%2, %3kg, %4x)", _name, (_preis call ISSE_str_IntToStr), (_infos call INV_getitemTypeKg), _amount] ];
			lbSetData [101, _index, (format ["%1", _item])];
		};
	};
																					
	if ((_infos call INV_getitemType) == "Fahrzeug") then {
		for [{_j=0}, {_j < (count INV_VehicleArray)}, {_j=_j+1}] do {
			if (!(isNull(INV_VehicleArray select _j))) then {
				_vehicle = (INV_VehicleArray select _j);
				if ((typeOf _vehicle) == _item) then {
					INV_ActiveSellShopArray = INV_ActiveSellShopArray + [ [_item, _preisOhneTax, _preis] ];
					_index = lbAdd [101, format["%1 ($%2, %3)", _vehicle, (_preis call ISSE_str_IntToStr), _name] ];
					lbSetData [101, _index, format["%1", _vehicle] ];
				};						
			};
		};				
	};
	
};


buttonSetAction [3,   "[""itemkauf"",    lbCurSel 1,   ctrlText 2,   lbData [101, (lbCurSel 1)  ], INV_ActiveBuyShopArray select (lbCurSel 1)]    execVM ""buyStuff.sqf"";"];
buttonSetAction [103, "[""itemverkauf"", lbCurSel 101, ctrlText 102, lbData [101, (lbCurSel 101)], INV_ActiveSellShopArray select (lbCurSel 101)] execVM ""buyStuff.sqf"";"];
ctrlSetText [101,format [localize "STRS_inv_shopdialog_itemshop", (_money call ISSE_str_IntToStr)]];

while {ctrlVisible 1015} do {
	_cursel = (lbCurSel 1);
	if (_cursel >= 0) then {
		_item = (INV_ActiveBuyShopArray select (lbCurSel 1)) select 0;
		_preis = (INV_ActiveBuyShopArray select (lbCurSel 1)) select 2;
		_infos = _item call INV_getitemArray;
		_slider = ctrlText 2;
		if (!(_slider call ISSE_str_isInteger)) then {_slider = "0";};
		_slider = _slider call ISSE_str_StrToInt;
		if (_slider < 0) then {_slider = 0;};
		_moneyanzeige = ((_slider*_preis)call ISSE_str_IntToStr);
		// if (_moneyanzeige > 9999999) then {_moneyanzeige = " > 9999999";};
		if (_infos call INV_getitemType == "item") then {
			ctrlSetText [3, format ["Buy ($%1, %2kg)", _moneyanzeige, (_slider*(_infos call INV_getitemTypeKg))]];
		} else {
			ctrlSetText [3, format ["Buy ($%1)", _moneyanzeige]]; 
		};
	} else {
		ctrlSetText [3,  "/"];
	};
	
	_cursel = (lbCurSel 101);
	if (_cursel >= 0) then {
		_item = (INV_ActiveSellShopArray select (lbCurSel 101)) select 0;
		_preis = (INV_ActiveSellShopArray select (lbCurSel 101)) select 2;
		_infos = _item call INV_getitemArray;
		_slider = ctrlText 102;
		if (!(_slider call ISSE_str_isInteger)) then {_slider = "0";};
		_slider = _slider call ISSE_str_StrToInt; 
		if (_slider < 0) then {_slider = 0;};
		_moneyanzeige = ((_slider*_preis) call ISSE_str_IntToStr);
		if (_infos call INV_getitemType == "item") then {
			ctrlSetText [103, format ["Sell ($%1, %2kg)", _moneyanzeige, (_slider*(_infos call INV_getitemTypeKg))]];
		} else {
			ctrlSetText [103, format ["Sell ($%1)", _moneyanzeige]];
		};
	} else {
		ctrlSetText [103,  "/"];
	};
	
	CtrlSettext [100,  format[localize "STRS_inv_shopdialog_money", (_money call ISSE_str_IntToStr)]];
	sleep 0.1;
	if (INV_ShopDialoge > 1) exitWith {};
};

INV_ShopDialoge = INV_ShopDialoge - 1;
