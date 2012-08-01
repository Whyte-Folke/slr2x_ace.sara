INV_CreateGunboxLocal = {};

INV_DialogPlayers = 
{		
	private ["_c", "_Fid", "_Fname", "_Fingame", "_Findex", "_Flistlen", "_Feigenenum", "_FgovernmentOnlist"];						
	_Fid        = _this select 0;									
	_Fname      = _this select 1;						
	_Fingame    = _this select 2;
	_FgovernmentOnlist = _this select 3;
	_Findex     = 0;			
	_Flistlen   = 0;									
	_Feigenenum = -1;														

	for [{_c=0}, {_c < (count playerstringarray)}, {_c=_c+1}] do {																		
		_Fspieler = playerstringarray select _c;												
 
		if ( ((_Fingame) or (_Fspieler call ISSE_UnitExists)) ) then {						
 			if (_Fname) then {																																												
				_Findex = lbAdd [_Fid, format ["%1 - (%2)", _Fspieler, name (call compile _Fspieler)]];									
			} else {																																												
				_Findex = lbAdd [_Fid, _Fspieler];																																							
			};																														
			lbSetData [_Fid, _Findex, format["%1", _c]];																																	
			if (_Fspieler == INV_ROLESTRING) then {_Feigenenum = _Flistlen;};												
			_Flistlen = _Flistlen + 1;																								
		};							
	};
	if (_FgovernmentOnlist) then {
		_Findex = lbAdd [_Fid, localize "STRS_bankgov_add"];
		lbSetData [_Fid, _Findex, "33"];
		_Flistlen = _Flistlen + 1;
	};
 [_Flistlen, _Feigenenum]
};
 
 INV_CreateVehicle = 
 {				
 private ["_classname", "_position"];				
 _classname = _this select 0;											
 _position  = _this select 1;
 _INVMaxWeight = 0;
 
 for [{_c=0}, {_c < (count INV_VehicleWeightArray)}, {_c=_c+1}] do
 {								
  _INVClass = ((INV_VehicleWeightArray select _c) select 0);
  
  if (_INVClass == _classname) exitwith { _INVMaxWeight = ((INV_VehicleWeightArray select _c) select 1); };
	  
 };
 																						
 call compile format ['	
 vehicle_%1_%2_MaxWeight = %5;
 vehicle_%1_%2_Weight = 0;								
 vehicle_%1_%2 = _classname createVehicle %4;
  vehicle_%1_%2 setVehicleInit "this setVehicleVarName ""vehicle_%1_%2""; 
  vehicle_%1_%2 = this; 
  clearWeaponCargo this; 
  clearMagazineCargo this;
  this lock true;";																												
  processInitCommands;						
  INV_VehicleArray = INV_VehicleArray + [vehicle_%1_%2]; " 																																										
  INV_ServerVclArray = INV_ServerVclArray + [vehicle_%1_%2];												
  if (""%3"" != """") then {[""CreatedVehicle"", vehicle_%1_%2, typeOf vehicle_%1_%2, %4] execVM ""%3""; };
  " call ISSE_pub_execPstr;', player, round(time), INV_CALL_CREATVEHICLE, getpos _position, _INVMaxWeight];
  
  };
  
  INV_CreateWeapon = 
  {													
  private["_class", "_menge", "_crate"];												
  _class = _this select 0;				
  _menge = _this select 1;														
  _crate = _this select 2;													
  _crate setDamage 0; 						
  _crate addWeaponCargo [_class, _menge];																														
  
  if (INV_CALL_CREATEDWEAPON != "") then
   {																						
   call compile format ['" if (""%3"" != """") then {[""CreatedWeapon"", ""%4""] execVM ""%3""; };" call ISSE_pub_execPstr; ', player, round(time), INV_CALL_CREATEDWEAPON, _class, _menge, _crate];					
   };
   };
   
   INV_CreateMag = 
   {						
   private["_class", "_menge", "_crate"];						
   _class = _this select 0;										
   _menge = _this select 1;						
   _crate = _this select 2;				
   _crate setDamage 0; 															
   _crate addMagazineCargo [_class, _menge];															
   
   
  if (INV_CALL_CREATEDWEAPON != "") then 
  {												
  call compile format ['" if (""%3"" != """") then {[""CreatedMag"", ""%4""] execVM ""%3""; };" call ISSE_pub_execPstr;', player, round(time), INV_CALL_CREATEDWEAPON, _class, _menge, _crate];								
  };};
  
  INV_CreateItem = 
  {											
  private["_class", "_menge", "_stor"];												
  _class = _this select 0;						
  _menge = _this select 1;		
  _stor  = _this select 2;														
  [_class, _menge, _stor] call INV_AddItemStorage;																								
  
  if (INV_CALL_CREATEDITEM != "") then
   {																														
   call compile format ['						
   " if (""%3"" != """") then {[""CreatedItem"", ""%4""] execVM ""%3""; };" call ISSE_pub_execPstr;														
   ', player, round(time), INV_CALL_CREATEDITEM, _class, _menge, _stor];															
   
   };};
   
   INV_CreateObject = 
   {													
   private ["_classname", "_position", "_dir", "_objname"];												
   _classname = _this select 0;							
   _position  = _this select 1;							
   _dir       = 0; 
   if (count _this > 2) then {_dir = _this select 2;};				
   _objname   = "";																										
   call compile format ['				
   object_%1_%2 = _classname createVehicle [0,0,0]; 
   object_%1_%2 setVehicleInit "this setVehicleVarName ""object_%1_%2""; object_%1_%2 = this; clearWeaponCargo this; clearMagazineCargo this;"; 										
   _objname = "object_%1_%2";																										
   processInitCommands;												
   object_%1_%2 setdir %4;																				
   object_%1_%2 setPos %3;														
   INV_ObjectsArray = INV_ObjectsArray + [object_%1_%2];						
   "INV_ServerObjArray = INV_ServerObjArray + [object_%1_%2];" call ISSE_pub_execPstr;															
   ', player, round(time), _position, _dir];		
   
   _objname
   };
   
   INV_DeleteObject = 
   {										
   format ["								
   if (not (isNil ""%1"")) then 
   {						
   if (not(isNull %1)) then 
   {																								
if (isServer) then {%1 setVehicleInit """";};																
INV_ObjectsArray   = INV_ObjectsArray - [%1]; 																																								
INV_ServerObjArray = INV_ServerObjArray - [%1];																																																								
if (isServer) then {deleteVehicle %1;};																					
};																																	
%1 = nil;																
};								
", _this] call ISSE_pub_execPstr;};