// Add collectable items to your inventory. Look in flagActions.sqf for the action.
_this    = _this select 3;
_item    = _this select 0;
_chance  = _this select 1;
_maxzahl = _this select 2;

if (isNil("INV_FarmSpamSchutz")) then 
{
	INV_FarmSpamSchutz = false;
};

if (INV_FarmSpamSchutz) exitWith {};
INV_FarmSpamSchutz = true;

if ( (_chance >= (random 100)) ) then 
{
	_anzahl = (ceil(random(_maxzahl)));
	
		if ([_item, _anzahl] call INV_AddInventoryItem) then 
		{
			player groupChat format[localize "STRS_inv_buyitems_get_erhalten", (_anzahl call ISSE_str_IntToStr), (_item call INV_getitemName)]														
		} 
		else 
		{																				
			player groupChat localize "STRS_inv_buyitems_get_zuschwer";				
		};
    };
    
sleep 0.2;
INV_FarmSpamSchutz = false;