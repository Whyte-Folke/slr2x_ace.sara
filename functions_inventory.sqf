// "Function-Call" Script.
// functions_inventory.sqf


// Add Item to Inventory
INV_AddInventoryItem = 
{
	private ["_c", "_Fitem", "_Famount", "_Finfos", "_Fgesamtgewicht"];
	_Fitem          = _this select 0;
	_Famount        = _this select 1;
	_Finfos         = _Fitem call INV_getitemArray;
	_Fgesamtgewicht = 0;
	_Fgesamtgewicht = ((call INV_GetOwnWeight) + (_Famount * (_Finfos call INV_getitemTypeKg)));
	if (_Famount > 0) then 
	{
		if (_Fgesamtgewicht <= INV_Tragfaehigkeit) then 
		{
			([_Fitem, _Famount, "INV_InventarArray"] call INV_AddItemStorage);
		} 
		else 
		{
			false
		};
	} 
	else 
	{
		([_Fitem, _Famount, "INV_InventarArray"] call INV_AddItemStorage);
	};
};

INV_AddVehicleStorage = 
{
	private ["_vehicle", "_type",  "_array"];
	_vehicle = (_this select 0);
	_type = (_this select 1);
	_array = (_this select 2);
	
	if (_type == "Drop") then
	{
		deleteVehicle _vehicle;
		INV_VehicleArray = INV_VehicleArray - [_vehicle];
		_array call INV_AddItemStorage;
	}
	else
	{
		if (_type == "Take") then
		{
			for [{_i=0}, {_i > (_array select 1)}, {_i=_i-1}] do 
			{
				_storagePlace = (_array select 2);
				call compile format ["[_item, %1_spawn] call INV_CreateVehicle;", _storagePlace];	
				sleep 2;
			};
		};
	};
};


// Add Items to Storage
INV_AddItemStorage = 
{
	private ["_c", "_Fitem", "_Fmenge", "_Farrname", "_Farr", "_Farraynum", "_Fanzahl", "_Fextra", "_maxGewicht", "_curGewicht", "_addGewicht"];
	_Fitem      = _this select 0;
	_Fmenge     = _this select 1;
	_Farrname   = _this select 2;
	if (isNil(_Farrname)) then 
	{
		_Farrname call INV_StorageLeeren;
	};
	_Farr       = call compile _Farrname;
	_Farraynum  = -1;
	_Fanzahl    = 0;
	_maxGewicht = -1;
	_curGewicht = 0;
	_addGewicht = 0;
	_itemType = (_item call INV_getitemType);
	
	if (count _this > 3) then 
	{
		if (_Fextra != "") then 
		{
			_Fextra     = _this select 3;
			_maxGewicht = ((_Fextra call INV_getitemOtherStuff) select 0);
			_curGewicht = _Farrname call INV_GetStorageWeight;
			_addGewicht = (_Fitem call INV_getitemTypeKg) * _Fmenge;
		};
	};
	
	if ( (_maxGewicht < 0) or (_maxGewicht >= (_curGewicht+_addGewicht)) ) then 
	{
		for [{_i=0}, {_i < (count _Farr)}, {_i=_i+1}] do 
		{
			if (((_Farr select _i) select 0) == _Fitem) exitWith 
			{
				_Farraynum = _i;
				_Fanzahl   = ((_Farr select _i) select 1);
			};
		};
		
		if (_Fmenge > 0) then 
		{
			if (_Farraynum == -1) then 
			{
				call compile format ['%1 = %1 + [ [_Fitem, _Fmenge] ];', _Farrname];
				true
			} 
			else 
			{
				call compile format ['%1 SET [_Farraynum, [_Fitem, (_Fanzahl+_Fmenge)] ];', _Farrname];
				true
			};
		} 
		else 
		{
			if (_Farraynum == -1) then 
			{
				false
			} 
			else 
			{
				if ((_Fanzahl+_Fmenge) < 0) then 
				{
					false
				}
				else 
				{
					call compile format ['%1 SET [_Farraynum, [_Fitem, (_Fanzahl+_Fmenge)] ];', _Farrname];
					true
				};
			};
		};
	} 
	else 
	{
		false
	};
};


// Calculate How Many Items are Stored.
INV_GetStorageAmount = {
	private ["_c", "_Result", "_arrname", "_Array", "_Itemname"];
	_Itemname = _this select 0;
	_arrname  = _this select 1;
	if (isNil(_arrname)) then {_arrname call INV_StorageLeeren};
	_Array    = call compile (_this select 1);
	_Result = 0;
	{
		if ((_x select 0) == _Itemname) exitWith {
			_Result = (_x select 1);
		};
	} forEach _Array;
	_Result
};


// Storage (probably factories)
INV_ReturnAblage = {
	private ["_Result", "_arrname"];
	if (isNil(_this)) then {_this call INV_StorageLeeren};
	_Result = call compile _this;
	_Result};
	

// Find Quantity of Items
INV_getitemAmount = {([_this, "INV_InventarArray"] call INV_GetStorageAmount)};


// Change Amount of Items
INV_SetStorageAmount = {
	private ["_c", "_Result", "_Itemname", "_Array", "_Arrayname", "_Anzahl"];
	_Result    = false;
	_Itemname  = _this select 0;
	_Anzahl    = _this select 1;
	_Arrayname = _this select 2;
	if (isNil(_Arrayname)) then {_Arrayname call INV_StorageLeeren};
	_Array = call compile (_Arrayname);
	for [{_c=0}, {_c < (count _Array)}, {_c=_c+1}] do {
		if (((_Array select _c) select 0) == (_this select 0)) exitWith {
			call compile format ["(%1 select %2) SET [1, %3];", _Arrayname, _c, _Anzahl];
			_Result = true;
		};
	};
		
	if ( (!(_Result)) and (_Anzahl != 0) ) then {
		_Result = [_Itemname, _Anzahl, _Arrayname] call INV_AddItemStorage;
	};
		
	_Result
};
		
	
// Change Amount of Items
INV_SetItemAmount = {
	([(_this select 0), (_this select 1), "INV_InventarArray"] call INV_SetStorageAmount)};
	INV_InventarLeeren = {
		private ["_FremoveItemInfos"];
		{
			if ((_x select 0) call INV_getitemLooseable) then {[(_x select 0), 0] call INV_SetItemAmount;};
		}
		forEach INV_InventarArray;
	};
				

// Check for a Type of Item in Storage
INV_StorageHasKindOf = {
					private ["_c", "_Itemart", "_Arrayname", "_Array", "_re"];
					_Arrayname = _this select 0;
					_Itemart   = _this select 1;
					_re         = false;
					if (isNil(_Arrayname)) then {_Arrayname call INV_StorageLeeren};
					_Array = call compile (_Arrayname);
					for [{_c=0}, {_c < (count _Array)}, {_c=_c+1}] do {
						if (  ( (((_Array select _c) select 0) call INV_getitemKindOf)  == _Itemart ) and (((_Array select _c) select 1) > 0)  ) exitWith {
							_re = true;
						};
					};
					_re
};


// Remove One Type of Item From Storage
INV_StorageRemoveKindOf = {
	private ["_c", "_Itemart", "_Arrayname", "_Array"];
	_Arrayname = _this select 0;
	_Itemart   = _this select 1;
	if (isNil(_Arrayname)) then {_Arrayname call INV_StorageLeeren};
	_Array = call compile (_Arrayname);
	for [{_c=0}, {_c < (count _Array)}, {_c=_c+1}] do {
		if ( (((_Array select _c) select 0) call INV_getitemKindOf)  == _Itemart ) then {
			call compile format ["(%1 select %2) SET [1, 0];", _Arrayname, _c];
		};
	};
	true
};


// Unknown
INV_StorageLeeren = {
	call compile format ["%1 = [];", _this];};
	

// Check Stored Item Weight
INV_GetStorageWeight = {
	private ["_c", "_Gewichtinfos", "_Feigengewicht", "_Arrayname", "_Array"];
	_Fgewicht     = 0;
	_Gewichtinfos = 0;
	_Arrayname    = _this;
	_Array        = [];
	if ((typeName _this) == "STRING") then {
		if (isNil(_Arrayname)) then {_Arrayname call INV_StorageLeeren};
		_Array = call compile (_Arrayname);
	} else {
		_Array = _Arrayname;
	};
	for [{_c=0}, {_c < (count _Array)}, {_c=_c+1}] do {
		_Fgewicht = _Fgewicht + ( ((_Array select _c) select 1) * (((_Array select _c) select 0) call INV_getitemTypeKg) );
	};
	_Fgewicht
};
	
	
// Get Current Weight
INV_GetOwnWeight = {("INV_InventarArray" call INV_GetStorageWeight)};


// Check if you are Allowed This Item
INV_CheckIllegalStorage = {
	private ["_c", "_Arrayname", "_Array", "_re"];
	_Arrayname = _this;		_re        = false;
	if (isNil(_Arrayname)) then {_Arrayname call INV_StorageLeeren};
	_Array = call compile (_Arrayname);
	{
		if
		( ((_x select 1) > 0) and ((_x select 0) call INV_getitemIsIllegal) ) exitWith {
			_re = true;
		};
	}
	forEach _Array;
	_re
};


// Remove Items that Cannot Exist
INV_RemoveIllegalStorage = {
	private ["_c", "_Arrayname", "_Array", "_re"];
	_Arrayname = _this;
	_re        = false;
	if (isNil(_Arrayname)) then {_Arrayname call INV_StorageLeeren};
	_Array = call compile (_Arrayname);
	{
		if ( ((_x select 1) > 0) and ((_x select 0) call INV_getitemIsIllegal) ) then {
			[(_x select 0), 0, _Arrayname] call INV_SetStorageAmount;
			_re = true;
		};
	} 
	forEach _Array;
	_re
};


// Remove Illegal Items
INV_EntferneIllegales = {
   private["_illegalinfos", "_illwArray", "_illmags"];
   _illwArray = [] call INV_getWeapons;
   _illmags = magazines player;
   (format ['{copbase_crate addWeaponCargo [_x, 1];} forEach %1; {copbase_crate addMagazineCargo [_x, 1];} forEach %2;', _illwArray, _illmags]) call ISSE_pub_execPstr;
   
   {
       player removeWeapon _x;
   } forEach _illwArray;
   
   {
       player removeMagazines _x;
   } forEach _illMags;
 

   {
      if ( ((_x select 0) call INV_getitemAmount) > 0) then {
         if ((_x select 0) call INV_getitemIsIllegal) then {[(_x select 0), 0] call INV_SetItemAmount;};
      };
   } forEach INV_InventarArray;
};


// Check if Storage is a Factory
INV_StorageIsFactory = {
	private ["_result"];
	_result = false;
	for [{_i=0}, {_i < (count INV_ItemFabriken)}, {_i=_i+1}] do {
		if (((INV_ItemFabriken select _i) select 7) == _this) exitWith {
			_result = true;	
		};
	};
	_result
};

// Check if Player Can Carry More
INV_CanCarryItems = {
	private ["_Fcheckitem", "_Fcheckzahl"];
	_Fcheckitem = _this select 0;
	_Fcheckzahl = _this select 1;
	if ( ((_Fcheckitem call INV_getitemTypeKg)*_Fcheckzahl) > (INV_Tragfaehigkeit-(call INV_GetOwnWeight)) ) then {
		false
	} else {
		true
	};
};


// Function Object Taxes
INV_GetObjectSteuer = {
	private ["_c", "_result"];
	_result = 0;
    
    {
        _type = _x select 0;
        _tax = _x select 2;
        
         if (_type == _this) exitWith {
         	_result = _tax;  
         };
    } forEach INV_ItemTypenArray;
    
	_result
};


// Fuction Add Percent (Taxes)
INV_AddProzent = {
	private ["_wert", "_prozent", "_result"];
	_wert    = _this select 0;
	_prozent = _this select 1;
	_runden  = true;
	if (count _this > 2) then {_runden = _this select 2};
	if (_runden) then {
		_result  = round (  _wert + ((_wert / 100) * _prozent)  );
	} else {
		_result  = (  _wert + ((_wert / 100) * _prozent)  );
	};
	_result
};

INV_getWeaponItems = {
	["Binocular", "NVGoggles", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio", "ItemGPS"]
};

INV_getWeapons = {
    private ["_arr", "_remove"];
    _arr = [];
    _remove = [] call INV_getWeaponItems;
    
	{
	    if (!(_x in _remove)) then
	    {
	        _arr set[(count _arr), _x];
	    };
	} forEach (weapons player);
    
    _arr
};

INV_isArmedWith = {
	private ["_Fresult", "_weapons"];
	_Fresult = [false, false, false];
    _weapons = [] call INV_getWeapons;
	{
		if ( (((_x select 2) select 0) in (_weapons)) and (((_x select 4) select 0) > 0) ) then {
			if (((_x select 4) select 0) == 1) then {_Fresult SET [0, true];};
			if (((_x select 4) select 0) == 2) then {_Fresult SET [1, true];};
			if (((_x select 4) select 0) == 3) then {_Fresult SET [2, true];};
		};
	}
	forEach INV_AlleWaffenObjekte;
	_Fresult
};


// Find Player Weapon Type, is either 1,2 or 3. See in INV_AlleWaffenObjekte, select 4 then select 0. Handgun is "1", rifle "2", explosives "3".
INV_GetWeaponTyp = {
	private ["_Fresult"];
	_Fresult = -1;
	{
		if (((_x select 2) select 0) == _this) then {
			_Fresult = ((_x select 4) select 0);
		};
	}
	forEach AlleMissionsObjekte;
	_Fresult
};


// Get Kind of Vehicle
INV_GetFahrzeugTyp = {
	private ["_Fresult"];
	_Fresult = -1;
	{
		if (((_x select 2) select 0) == _this) then {
			_Fresult = ((_x select 4) select 0);
		};
	}
	forEach AlleMissionsObjekte;
	_Fresult
};


// Check if Player is Armed
INV_isArmed = {
	_Fwaffenarten = [] call INV_isArmedWith;
	if ( (_Fwaffenarten select 0) or (_Fwaffenarten select 1) or (_Fwaffenarten select 2) ) then {
		true
	} else {
		false
	}
};


//Function Item Taxes
INV_getitemSteuer= {
	private ["_type", "_item", "_result"];
	_type = _this call INV_getitemType;
	_item = _this call INV_getitemScriptName;
	[_item call INV_getitemBuyCost, (_type call INV_GetObjectSteuer)] call INV_AddProzent;
};
	

//Function Price Taxes
INV_getitemPreisSteuer= {
	private ["_type", "_preis", "_result"];
	_type  = (_this select 0) call INV_getitemType;
	_preis = (_this select 1);
	[_preis, (_type call INV_GetObjectSteuer)] call INV_AddProzent;
};
	

// Add Items to Storage Window Box
INV_AddStorageToDialog = {
	private ["_c", "_item", "_anzahl", "_infos", "_KindOf", "_CrctlID", "_Findex", "_Arrayname", "_Array"];
	_Arrayname = _this select 0;
	_CrctlID   = _this select 1;
	_KindsOf   = "";
	if (count _this > 2) then {_KindOf = _this select 2;};
	if (isNil(_Arrayname)) then {_Arrayname call INV_StorageLeeren};
	_Array = call compile (_Arrayname);
	for [{_c=0}, {_c < (count _Array)}, {_c=_c+1}] do {
		_item   = ((_array select c) select 0);
		_anzahl = ((_array select c) select 1);
		_infos  = _item call INV_getitemArray;
		if ( ((_KindsOf == "") or (_infos call INV_getitemKindOf == _KindsOf)) and (_anzahl > 0) ) then {
			_Findex = lbAdd [_CrctlID, format ["%1 - (%2)", _infos call INV_getitemName, _anzahl]];
			lbSetData [_CrctlID, _Findex, _item];
		};
	};
	true
};

// Check if Player Owns Licence
INV_HasLicense = {
	if ( (_this == "") or (_this in INV_LizenzOwner) ) then {
		true
	} else {
		false
	};
};


// Get Name of Licence
INV_GetLicenseName = {
	private ["_c", "_license"];
    _license = "ERROR";
	{
        if ((_x select 0) == _this) exitWith {
        	_license = (_x select 2);  
        };
    } forEach INV_Lizenzen;
    
    _license
};


// Unknown
INV_GetScriptFromClass_Mag = {
	private ["_c", "_result"];
	_result = "";
	for [{_c=0}, {_c < (count INV_AlleMagazinObjekte)}, {_c=_c+1}] do {
		if ((((INV_AlleMagazinObjekte select _c) select 2) select 0) == _this) exitWith {
			_result = ((INV_AlleMagazinObjekte select _c) select 0);
		};
	};
	_result
};


// Unknown
INV_GetScriptFromClass_Weap = {
	private ["_c", "_result"];
	_result = "";
	for [{_c=0}, {_c < (count INV_AlleWaffenObjekte)}, {_c=_c+1}] do {
		if ((((INV_AlleWaffenObjekte select _c) select 2) select 0) == _this) exitWith {
			_result = ((INV_AlleWaffenObjekte select _c) select 0);
		};
	};
	_result
};


// Get Job Array
INV_getitemArray = {
	private ["_c", "_Fobjarray"];
	_Fobjarray = [];
    
    if ((typeName _this) == "STRING") then {
	    {
	        if (_x select 0 == _this) exitWith {
	        	_Fobjarray = _x;  
	        };
	    } forEach AlleMissionsObjekte;
    } else {
      _Fobjarray = _this;  
        
    };
    
    if ((typeName _Fobjarray != "ARRAY") || (count _Fobjarray == 0)) then {
      diag_log format["%1 does not exist in the goods array!", _this];  
      
      _Fobjarray = [0,[0,0],[0,0],["NILL","NILL"],[0,0,0],[0,0,0,0,0,0],0,0,0];
        
    };

	_Fobjarray
};


// Get Object Details
INV_getitemScriptName = { ((_this call INV_getitemArray) select 0)};
INV_getitemType = { ((_this call INV_getitemArray) select 1) select 0};
INV_getitemKindOf = { ((_this call INV_getitemArray) select 1) select 1	 };
INV_getitemClassName = { ((_this call INV_getitemArray) select 2) select 0 };
INV_getitemName = { ((_this call INV_getitemArray) select 2) select 1 };
INV_getitemBuyCost = { ((_this call INV_getitemArray) select 3) select 0 };
INV_getitemSellCost = { ((_this call INV_getitemArray) select 3) select 1 };
INV_getitemTypeKg = { ((_this call INV_getitemArray) select 4) select 0 };
INV_getitemLicense = { ((_this call INV_getitemArray) select 4) select 1 };
INV_getitemLicense2 = { ((_this call INV_getitemArray) select 4) select 2};
INV_getitemOtherStuff = { ((_this call INV_getitemArray) select 5) };
INV_getitemDescription1 = { ((_this call INV_getitemArray) select 6) };
INV_getitemDescription2 = { ((_this call INV_getitemArray) select 7) };
INV_getitemMaterials = { ((_this call INV_getitemArray) select 8) };
INV_getitemCostWithTax  = { ((_this call INV_getitemArray) call INV_getitemSteuer) };
INV_getitemGiveable = { ((_this call INV_getitemArray) select 5) select 0 };
INV_getitemDropable = { ((_this call INV_getitemArray) select 5) select 1 };
INV_getitemLooseable = { ((_this call INV_getitemArray) select 5) select 2 };
INV_getitemIsIllegal = { ((_this call INV_getitemArray) select 5) select 3 };
INV_getitemFilename = { ((_this call INV_getitemArray) select 5) select 4 };
INV_getVehicleCanCarry = { ((_this call INV_getitemArray) select 5) select 0 };
INV_getVehicleSeats = { ((_this call INV_getitemArray) select 5) select 1 };
