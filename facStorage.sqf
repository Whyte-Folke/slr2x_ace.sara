if (!(createDialog "factory_manifacture")) exitWith {hint "Dialog Error!";};

_facNum     = ((_this select 3) select 0);      
_facArray   = INV_ItemFabriken select _facNum;  
_facItems   = _facArray select 5;               
_facStorage = _facArray select 7;              
 _index = lbAdd [1, localize "STRS_inv_fac_dia_herstellen"];
 lbSetData [1, _index, ""];
 
 {														
 _index = lbAdd [1, (_x call INV_getitemName)];						
 lbSetData [1, _index, _x];
 } forEach _facItems;
 
 lbAdd [2, localize "STRS_inv_fac_dia_lager"];
 buttonSetAction [3, format["if ((lbCurSel 1) >= 0) then {[(lbData [1, (lbCurSel 1)]), %1, ctrlText 4] execVM ""factoryMakeItem.sqf""; closedialog 0; [0,0,0,[%1]] execVM ""facStorage.sqf"";};", _facNum] ];
 
 _selected = (lbCurSel 1);
 
 while {ctrlVisible 1030} do 
 {																		
 _slider      = ctrlText 4;                      
 
 if (!(_slider call ISSE_str_isInteger)) then {_slider = "0";};										
 _slider      = _slider call ISSE_str_StrToInt;  
 
 if (_slider < 0) then {_slider = 0;};											
 
 ctrlSetText [3, format [localize "STRS_inv_description_factory_manifacture", _slider] ];												
 
 if (not((lbCurSel 1) == _selected)) then 
 {														
 _item     = lbData [1, (lbCurSel 1)];														
 _selected = (lbCurSel 1);																								
 lbClear 2;				
 lbAdd [2, localize "STRS_inv_fac_dia_lager"];																																																								
 
 if (_item != "") then 
 {																											
 _benoetigteItems = (_item call INV_getitemMaterials);																																																																																	
 
{																																												
_aufLager = ([(_x select 0), _facStorage] call INV_GetStorageAmount);																																																								
_anzeige  = ((_x select 0) call INV_getitemName);																				
lbAdd [2, format[localize "STRS_inv_facdialog_menge", _anzeige, (_x select 1), _aufLager] ];																																	
} forEach _benoetigteItems;				

	};										
};																							

sleep 0.1;};