// Bail Details
// jailBail.sqf


_bail = _this select 0;
_Art = _this select 1;

if (_Art == "BailCash") then
{

if (!(_bail call ISSE_str_isInteger)) exitWith 
{
	player groupChat localize "STRS_inv_no_valid_number";
};

_bail = _bail call ISSE_str_StrToInt;

if (_bail <= 0) exitWith {};

_copbail = round(_bail/copscount);
_money = 'money' call INV_GetItemAmount;

if (_money < _bail) exitWith 
{
	player groupChat localize "STRS_bail_cantpay";
};

['money', -(_bail)] call INV_AddInventoryItem;
player groupChat format [localize "STRS_bail_self", (_bail call ISSE_str_IntToStr)];
format ["if (iscop) then {[""money"", %2] call INV_AddInventoryItem; player groupChat format [localize ""STRS_bail_addbail"", %2, ""%3""];}; titletext [format[localize ""STRS_bail_payed"",%3, %1], ""plain""];", (_bail call ISSE_str_IntToStr), (_copbail call ISSE_str_IntToStr), rolenumber] call ISSE_pub_execPstr;

};


if (_Art == "BailBank") then
{
	
	if (!(_bail call ISSE_str_isInteger)) exitWith 
	{
	player groupChat localize "STRS_inv_no_valid_number";
	};

_bail = _bail call ISSE_str_StrToInt;

if (_bail <= 0) exitWith {};

_copbail = round(_bail/copscount);
_money = kontostand;

if (_money < _bail) exitWith 
{
	player groupChat localize "STRS_bail_cantpay";
};

kontostand = kontostand - _bail;
player groupChat format [localize "STRS_bail_self", (_bail call ISSE_str_IntToStr)];
format ["if (iscop) then {[""money"", %2] call INV_AddInventoryItem; player groupChat format [localize ""STRS_bail_addbail"", %2, ""%3""];}; titletext [format[localize ""STRS_bail_payed"",%3, %1], ""plain""];", (_bail call ISSE_str_IntToStr), (_copbail call ISSE_str_IntToStr), rolenumber] call ISSE_pub_execPstr;

	
};