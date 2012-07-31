_item  = _this select 0; 
_menge = _this select 1; 


if ((!INV_CanUseInventory) or (!INV_CanDropItem)) exitWith {player groupChat localize "STRS_inv_inventar_cannotdrop";};

if(!isnull (nearestobjects[player,["Pipebomb"], 1] select 0))exitwith{player groupchat "You cannot drop items on top of each other. move and try again."};

if (_item call INV_getitemDropable) then 
{
	if ([_item, -(_menge)] call INV_AddInventoryItem) then 
	{
		player groupChat localize "STRS_inv_inventar_weggeworfen";
		if (player == vehicle player) then 
		{
			format ["%1 switchmove ""AinvPknlMstpSlayWrflDnon_medic"";", player] call ISSE_pub_execPstr;
			_class = "AAMI282";
			call compile format ["
			civ%1_%2_item = ""%5"" createVehicle (getpos player);
			civ%1_%2_item setpos getpos player;
			civ%1_%2_item setVehicleInit ""this setVariable [""""droparray"""", [%3, """"%4""""]]"";
			processInitCommands;
			", rolenumber, round(time), _menge, _item, _class];		
		};
	}
	else 
	{
		player groupChat localize "STRS_inv_inventar_drop_zuwenig";										
	};
}
else 
{
	player groupChat localize "STRS_inv_inventar_ablege_verbot";
};