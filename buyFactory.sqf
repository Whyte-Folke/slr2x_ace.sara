_num     = ((_this select 3) select 0);
_fabname = ((INV_ItemFabriken select _num) select 1);
_owner   = false; 

if (_fabname in INV_Fabrikowner) then 
{
	_owner = true
};
_cost    = ((INV_ItemFabriken select _num) select 6);
_money    = 'money' call INV_GetItemAmount;

if (_owner)        exitWith {player groupChat localize "STRS_inv_alreadygotshop";};
if (_money < _cost) exitWith {player groupChat localize "STRS_inv_kein_money";};
INV_Fabrikowner = INV_Fabrikowner + [ _fabname ];
['money', -(_cost)] call INV_AddInventoryItem;
player groupChat format[localize "STRS_inv_gotshop", player, (_cost call ISSE_str_IntToStr)];
["INV_Fabrikowner", INV_Fabrikowner] spawn ClientSaveVar;
[_cost] call Bank_Gov_add_money;