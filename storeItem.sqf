if (isNil "INV_StorageSperre") then {INV_StorageSperre = false;};

if (INV_StorageSperre) exitWith {player groupChat localize "STRS_inv_storage_spam";};

INV_StorageSperre = true;
_art      = _this select 0; 
_arrname  = _this select 1; 
_menge    = _this select 2;       

_VclMaxWeight = _this select 6;
_VclWeight = _this select 7;    

if ((_VclMaxWeight == "NULL") || (_VclWeight == "NULL")) then {
	_vehicleWeight = 0;
    _MaxWeight = 0;  
} else {
	_VehicleWeight = call compile _VclWeight;  
	_MaxWeight = call compile _VclMaxWeight;
};

if (!(_menge call ISSE_str_isInteger)) exitWith 
{
	player groupChat localize "STRS_inv_no_valid_number"; 
	INV_StorageSperre = false;
};

_menge    = _menge call ISSE_str_StrToInt;  
  
if (_menge <= 0) exitWith 
{
	INV_StorageSperre = false;
};

_item     = _this select 3;         
_public   = _this select 4;         
_arr      = call compile _arrname;  
_vclStore = false;                 
_vclClass = "";                     
_packed   = false;                 
   
if (count (_this select 5) > 0) then
{									
	_extra = _this select 5; 						
	if (_extra select 0 == "vcl") then 
	{								
		_vclStore = true; 						
		_vclClass = _extra select 1;								
	};
};
     
//Take items from storage
if (_art == "nehmen") then
{				
	_itemType = (_item call INV_getitemType);
	
	if (_itemType == "Item") then
	{
		if (not([_item, _menge] call INV_CanCarryItems)) then 
		{																												
			player groupChat localize "STRS_inv_buyitems_get_zuschwer";								
 	 	} 
	  	else 
	  	{																																										
			if ([_item, -(_menge), _arrname] call INV_AddItemStorage) then 
			{																
				_infos  = (_item call INV_getitemArray);
				_Weight = (_infos call INV_getitemTypeKg);	
      			_VehicleWeight = _VehicleWeight - (_Weight * _Menge);		
        		_VclWeight = _vehicleWeight;
      	//call compile format ["%1 = %2", _VclWeight, _VehicleWeight];																																				
		      	[_item, _menge] call INV_AddInventoryItem; 						
		      	player groupChat format[localize "STRS_inv_storage_took", (_menge call ISSE_str_IntToStr)];																														
		      	_packed = true;						
			} 
			else 
			{									
     	 		player groupChat localize "STRS_inv_storage_toomuch";																
			};			
		};
	};
		
	if (_itemType == "Fahrzeug") then
	{
		if ([_item, -(_menge), _arrname] call INV_AddItemStorage) then 
		{
			[_x, "Take", [_item, -(_menge),_arrname, _vclClass]] call INV_AddVehicleStorage;
			player groupChat format[localize "STRS_inv_storage_took", (_menge call ISSE_str_IntToStr)];
		}
		else
		{								
			player groupChat localize "STRS_inv_storage_toomuch";							
		};
	};
};

//Drop items into storage
if (_art == "ablegen") then
{						
	if (((!(_arrname in vclStorage_array)) and (_item call INV_getitemType == "Fahrzeug"))) exitWith 
	{
		player groupChat localize "STRS_inv_storage_dropnotallowed";
	};																																				
           
	_infos  = (_item call INV_getitemArray);
	_Weight = (_infos call INV_getitemTypeKg);	
	_EstiWeight = _VehicleWeight + (_Weight * _Menge);
	_itemType = (_item call INV_getitemType);

	if (_EstiWeight >= _MaxWeight) exitwith 
	{ 
		player groupchat localize "STRS_inv_storage_weightmax"; 
	}; 
	
	if (_itemType == "Item") then
	{                
		if (not([_item, -(_menge)] call INV_AddInventoryItem)) then 
		{				
			player groupChat localize "STRS_inv_storage_dropunablesomuch";			
		}
		else
		{
			if ([_item, _menge, _arrname, _vclClass] call INV_AddItemStorage) then 
			{																																													
				player groupChat format[localize "STRS_inv_storage_dropped", (_menge call ISSE_str_IntToStr)];																																				
				_packed = true;																								
			} 
			else 
			{																									
				player groupChat localize "STRS_inv_storage_cannotdropsomuch";																									
			};		
		};
	};
	
	if (_itemType == "Fahrzeug") then
	{
		_dropped = false;
		{
			if (typeOf _x == _item) then
			{
				if (_x != (_this select 8)) then
				{
					if (player distance (getpos _x) <= 25) then 
					{
						if (!(_dropped)) then
						{
							_menge = 1;
							[_x, "Drop", [_item, _menge, _arrname, _vclClass]] call INV_AddVehicleStorage;
						};
						_packed = true;
						_dropped = true;
					}; 
					/*else
					{
						player groupchat "The vehicle is too far away, get it closer.";
					};*/
				};
			};
		} forEach INV_VehicleArray;
	};

};
        
if (_art == "delete") then
{			
	if ([_item, -(_menge), _arrname] call INV_AddItemStorage) then
  {																				
		player groupChat format[localize "STRS_inv_storage_deleted", (_menge call ISSE_str_IntToStr)];										
		_packed = true;														
	} 
	else 
	{																		
		player groupChat localize "STRS_inv_storage_toomuch";					
	};
};
         
if (_art == "add") then 
{													
	if ((_arrname call INV_StorageIsFactory) and (_item call INV_getitemKindOf != "money")) exitWith 
	{
		player groupChat localize "STRS_inv_storage_dropnotallowed";
	};																										
         
	if ([_item, _menge, _arrname, _vclClass] call INV_AddItemStorage) then 
  {																																		
		player groupChat format[localize "STRS_inv_storage_dropped", (_menge call ISSE_str_IntToStr)];																								
		_packed = true;													
	} 
	else 
	{																
		player groupChat localize "STRS_inv_storage_cannotdropsomuch";												
	};
};

if (_packed) then 
{				
	if ((isNil "_VclMaxWeight") || (isNil "_VclWeight")) then {
    	_VclMaxWeight = "NULL";
        _VclWeight = "NULL";   
    };
	_isVehicle = ((_VclMaxWeight == "NULL") || (_VclWeight == "NULL")); 
    							
	if (_public == "save") then
 	{							
    	if (!(_isVehicle)) then {
        	call compile format['["%1", %1] spawn ClientSaveVar;', _VclMaxWeight];
        	call compile format['["%1", %1] spawn ClientSaveVar;', _VclWeight];		 
      	}; 
                            									
 		call compile format['["%1", %1] spawn ClientSaveVar;', _arrname];												 
 	};								
 
 	if (_public == "public") then
	{																														
	  	publicVariable _arrname;	
        
        if (!(_isVehicle)) then {
		  	publicVariable _VclMaxWeight;
		  	publicVariable _VclWeight;		
        };										
  	};																		
  
  if (player == vehicle player) then 
  {
  	format ["%1 switchmove ""AinvPknlMstpSlayWrflDnon_medic"";", player] call ISSE_pub_execPstr;
  };		
  	
  sleep 2;
};
  
INV_StorageSperre = false;