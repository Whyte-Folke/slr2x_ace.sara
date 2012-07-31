_arg = _this select 0;
_item = _this select 1;
_amount = _this select 2;

if (player == vehicle player) then {
    [_item,-1] call INV_addInventoryItem;
    [(typeOf player),1] call INV_addInventoryItem;
	[_item,1] call SLR_fnc_changeUnit;
};