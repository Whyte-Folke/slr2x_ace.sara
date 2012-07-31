_money  = 'money' call INV_GetItemAmount;

if ((_this select 1) == -1) exitWith {};

_art = _this select 0;
_itemauswahl= _this select 1;
_menge = _this select 2;

if (!(_menge call ISSE_str_isInteger)) exitWith {player groupChat localize "STRS_inv_no_valid_number";};

_menge = _menge call ISSE_str_StrToInt;

if (_menge <= 0) exitWith {};

_extrainfo  = _this select 3;
_extraArr   = _this select 4;
_item       = _extraArr select 0;
_einzelCost = _extraArr select 1;
_CostMitTax = _extraArr select 2;
_cost       = _menge*_CostMitTax;
_infos      = _item  call INV_getitemArray;
_itemart    = _infos call INV_getitemType;
_classname  = _infos call INV_getitemClassName;
_shopnumber = INV_ActiveShopNumber;
_fahne      = ((INV_ItemShops select _shopnumber) select 0);
_crate      = ((INV_ItemShops select _shopnumber) select 2);
_logic      = ((INV_ItemShops select _shopnumber) select 3);
_license    = ((INV_ItemShops select _shopnumber) select 6);
_shoptype = ((INV_ItemShops select INV_ActiveShopNumber) select 7);
_exitvar    = 0;
_einzelSteuer = 0;
_gesamtSteuer = 0;

if (_art == "itemkauf") then {
	
	// Tax freedom for the illegal buff....
	if (_shoptype == "normalshop") then {
		_einzelSteuer = ( _CostMitTax - _einzelCost );
		_gesamtSteuer = _einzelSteuer*_menge;
	};
	if (interndebug) then {hint format["Shoptype on buy: %1\nSingle-Tax: %2\nComplete-Tax: %3", _shoptype, _einzelSteuer ,_gesamtSteuer]; };
	
	if (_itemart == "Item") then 
	{
		if ((not((_infos call INV_getitemLicense) call INV_HasLicense)) and (not((_infos call INV_getitemLicense2) call INV_HasLicense)) and (_license)) exitWith {player groupChat localize "STRS_inv_buyitems_nolicense";};
	
		_amtragen          = (_item call INV_GetItemAmount);
		_gesamtmenge       = _amtragen + _menge;
		_gesamtgewicht     = (_infos call INV_getitemTypeKg)*_menge;
		_inventargewicht   = call INV_GetOwnWeight;
		
		if (((_infos call INV_getitemIsIllegal)) and (! !isCop)) exitWith { player groupChat localize "STRS_inv_buyitems_notallowed";};
		
		if ((_gesamtgewicht + _inventargewicht) > INV_Tragfaehigkeit) then 
		{
			_menge = (floor((INV_Tragfaehigkeit - _inventargewicht) / (_infos call INV_getitemTypeKg)));
			_cost  = _menge*_CostMitTax;
			if (_menge <= 0) exitWith {player groupChat localize "STRS_inv_buyitems_maxgewicht"; _exitvar = 1;};
		};
		
		if (_money < _cost) then 
		{
			_menge = (floor(_money/_CostMitTax));
			_cost  = _menge*_CostMitTax;
			if (_menge <= 0) exitWith {
				player groupChat localize "STRS_inv_buyitems_keinmoney";
				_exitvar = 1;
			};
		};
		
		if (_exitvar == 1) exitWith {};
		[_item, _menge, "INV_InventarArray"] call INV_CreateItem;
		['money', -(_cost)] call INV_AddInventoryItem;
		INV_SteuernGezahlt = (INV_SteuernGezahlt + (_menge*_einzelSteuer));
		player groupChat format [localize "STRS_inv_buyitems_gekauft", (_menge call ISSE_str_IntToStr), (_infos call INV_getitemName), (_cost call ISSE_str_IntToStr)];
	};
	
	if ((_itemart == "waffe") or (_itemart == "magazin")) then 
	{
		if ((not((_infos call INV_getitemLicense) call INV_HasLicense)) and (not((_infos call INV_getitemLicense2) call INV_HasLicense)) and (_license)) exitWith {player groupChat localize "STRS_inv_buyitems_nolicense";};
		if (_money < _cost) exitWith {player groupChat localize "STRS_inv_buyitems_keinmoney";};
		
		['money', -(_cost)] call INV_AddInventoryItem;
		INV_SteuernGezahlt = (INV_SteuernGezahlt + _gesamtSteuer);
	
		if (_itemart == "Waffe") then 
		{
			player groupChat format[localize "STRS_inv_buyitems_gekauft", (_menge call ISSE_str_IntToStr), (_infos call INV_getitemName), (_cost call ISSE_str_IntToStr)];
			[(_infos call INV_getitemClassName), _menge, _crate] spawn INV_CreateWeapon;
		}
		else
		{
			player groupChat format [localize "STRS_inv_buyitems_gekauft", (_menge call ISSE_str_IntToStr), (_infos call INV_getitemName), (_cost call ISSE_str_IntToStr)];
			[(_infos call INV_getitemClassName), _menge, _crate] spawn INV_CreateMag;
		};
	};
	
	if (_itemart == "fahrzeug") then 
	{
		if ((not((_infos call INV_getitemLicense) call INV_HasLicense)) and (not((_infos call INV_getitemLicense2) call INV_HasLicense)) and  (_license))  exitWith {player groupChat localize "STRS_inv_buyitems_nolicense";};
		if (INV_UsingCarshop == 1)  exitWith {player groupChat localize "STRS_inv_buyvehicles_store_in_use";};
		if (_money < _CostMitTax) exitWith {player groupChat localize "STRS_inv_buyitems_keinmoney";};
		['money', -(_CostMitTax)] call INV_AddInventoryItem;
		INV_SteuernGezahlt = (INV_SteuernGezahlt + _einzelSteuer);
		player groupChat format [localize "STRS_inv_buyvehicles_buy_car", (_infos call INV_getitemName), (_CostMitTax call ISSE_str_IntToStr)];
		INV_UsingCarshop = 1;
		sleep 5;
		INV_UsingCarshop = 0;
		if (not(alive player)) exitWith {};
		[_item, _logic] spawn INV_CreateVehicle;
	};
};

if (_art == "itemverkauf") then 
{
	if (_itemart == "item") then 
	{
		if (_item call INV_GetItemAmount == 0) exitWith {player groupChat localize "STRS_inv_buyitems_sell_notenough";};
		if (_item call INV_GetItemAmount < _menge) then {_menge = (_item call INV_GetItemAmount);
		_cost = _CostMitTax*_menge;};
		['money', _cost] call INV_AddInventoryItem;
		[_item, -(_menge)] call INV_AddInventoryItem;
		player groupChat format [localize "STRS_inv_shop_sold", (_menge call ISSE_str_IntToStr), (_infos call INV_getitemName), (_cost call ISSE_str_IntToStr)];
	};																		

	if (_itemart == "waffe") then 
	{
		_verkauft  = 0;
		_gewinn    = 0;
		_weaps     = {_x == (_infos call INV_getitemClassName)} count weapons player;
		if (_weaps == 0) exitWith {player groupChat localize "STRS_inv_buyitems_sell_notenough";};
		if (_weaps < _menge) then {_menge = _weaps;};
		_cost = _CostMitTax;
		['money', _cost] call INV_AddInventoryItem;
		
		for [{_i=0}, {_i < _menge}, {_i=_i+1}] do 
		{
			player removeWeapon (_infos call INV_getitemClassName);
		};

		player groupChat format [localize "STRS_inv_buyitems_verkauft", 1, (_infos call INV_getitemName), (_CostMitTax call ISSE_str_IntToStr)];
	};
	
	if (_itemart == "magazin") then 
	{
		_verkauft  = 0;
		_gewinn    = 0;
		_mags      = {_x == (_infos call INV_getitemClassName)} count magazines player;
		if (_mags == 0) exitWith {player groupChat localize "STRS_inv_buyitems_sell_notenough";};
		if (_mags < _menge) then {_menge = _mags;};
		_cost = _menge*_CostMitTax;
		['money', _cost] call INV_AddInventoryItem;
		for [{_i=0}, {_i < _menge}, {_i=_i+1}] do {
			player removeMagazine (_infos call INV_getitemClassName);
		};
		
		player groupChat format [localize "STRS_inv_buyitems_verkauft", (_menge call ISSE_str_IntToStr), (_infos call INV_getitemName), (_cost call ISSE_str_IntToStr)];
	};
																
	if (_itemart == "fahrzeug") then 
	{
		_menge = 1;
		_vehicle = call compile format ["%1", _extrainfo];
		_posInVclArray = INV_VehicleArray find _vehicle;
		if (_posInVclArray == -1) exitWith {player groupChat localize "STRS_inv_buyvehicles_noowner";};
	
		if (not (alive _vehicle)) exitWith {player groupChat localize "STRS_inv_buyvehicles_destroyed";};
		if ((_vehicle distance player) > 25) exitWith {player groupChat localize "STRS_inv_buyitems_sell_toofar";};
		['money', (_infos call INV_getitemSellCost)] call INV_AddInventoryItem;
		player groupChat format [localize "STRS_inv_shop_vehiclesold", (_CostMitTax call ISSE_str_IntToStr)];
		INV_VehicleArray = INV_VehicleArray - [_vehicle];
		deleteVehicle _vehicle;
	};

}; 
