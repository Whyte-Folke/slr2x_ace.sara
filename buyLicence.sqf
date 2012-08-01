// Licence Purchasing
// buyLicence.sqf

_this    = _this select 3;
_number  = _this select 0;
_art     = _this select 1;


if ((_art == "remove") or (_art == "add")) then 
{

	// Existing Licence Check and Purchase
	if (_art == "add") then 
	{
		_license = ((INV_Lizenzen select _number) select 0);
		_name    = ((INV_Lizenzen select _number) select 2);
		_cost    = ((INV_Lizenzen select _number) select 3);
		if (_license call INV_HasLicense) exitWith {player groupChat localize "STRS_inv_buylicense_alreadytrue";};
		if (('money' call INV_GetItemAmount) < _cost) exitWith {player groupChat localize "STRS_inv_buylicense_nomoney";};
		['money', -(_cost)] call INV_AddInventoryItem;
		[_cost] call Bank_Gov_add_money;
		INV_LizenzOwner = INV_LizenzOwner + [_license];
		player groupChat format[localize "STRS_inv_buylicense_gottraining", (_cost call ISSE_str_IntToStr), _name];

	} 
	else 
	{

		_license = ((INV_Lizenzen select _number) select 0);
		_name    = ((INV_Lizenzen select _number) select 2);
		if (not(_license call INV_HasLicense)) exitWith {player groupChat localize "STRS_inv_buylicense_alreadyfalse";};
		INV_LizenzOwner = INV_LizenzOwner - [_license];
		player groupChat format[localize "STRS_inv_buylicense_losttraining", _name];

	};

	["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar;

};
