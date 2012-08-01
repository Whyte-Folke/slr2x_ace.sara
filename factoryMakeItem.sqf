if ((_this select 0) == "") exitWith {player groupChat localize "STRS_inv_no_selection";};

_item        = _this select 0;
_fabriknum   = _this select 1;
_menge       = _this select 2;                

 if (!(_menge call ISSE_str_isInteger)) exitWith {player groupChat localize "STRS_inv_no_valid_number";};
 
 _menge       = _menge call ISSE_str_StrToInt;  
 
 if (_menge <= 0) exitWith {};
 
 _ablage      = (INV_ItemFabriken select _fabriknum) select 7;
 _spawn       = (INV_ItemFabriken select _fabriknum) select 4;
 _crate       = (INV_ItemFabriken select _fabriknum) select 3;
 _BauMaterial = (_item call INV_getitemMaterials);
 _infos       = _item call INV_getitemArray; 
 _itemart     = _infos call INV_getitemType; 											
 _GenugItems  = true;
 
 {													
 if ( ([(_x select 0), _ablage] call INV_GetStorageAmount) < ((_x select 1) * _menge) ) exitWith 
 {
	 _GenugItems = false;
 };
 } forEach _Baumaterial;
 
 if (!_GenugItems) exitWith {player groupChat localize "STRS_inv_fac_not_enough";};														
 
 {				
 [(_x select 0), -((_x select 1) * _menge), (_ablage)] call INV_AddItemStorage;
 } forEach _Baumaterial;
 
 if (_itemart == "Item") then 
 { 
 [_item, _menge, _ablage] spawn INV_CreateItem;                                                 
 };
 
 if (_itemart == "waffe") then 
 { 
 [(_infos call INV_getitemClassName), _menge, _crate] spawn INV_CreateWeapon;                   
 };
 
 if (_itemart == "magazin")  then 
 { 
 [(_infos call INV_getitemClassName), _menge, _crate] spawn INV_CreateMag;                      
 };
  
 if (_itemart == "Fahrzeug") then 
 { 
  while {_menge > 0} do 
  {
	  [_item, _spawn] spawn INV_CreateVehicle; 
	  sleep 6; 
	  _menge = _menge - 1;
  }; 
};
 
 player groupChat localize "STRS_inv_fac_success";
 call compile format['["%1", %1] spawn ClientSaveVar;', _ablage];