if (iscop) exitWith {player groupChat "Cops are not allowed to use the moneydealer";};
_erbeutet = 'illegal_money' call INV_GetItemAmount;
if (_erbeutet <= 0) exitWith {player groupChat "You have no illegal money to exchange";};
['illegal_money', 0] call INV_SetItemAmount;
['money', (_erbeutet)] call INV_AddInventoryItem;
player groupChat "You successfully exchanged the illegal money to legal money";