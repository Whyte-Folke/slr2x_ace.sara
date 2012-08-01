 _art = _this select 0;
 
 if (_art == "use") then 
 {		
 _item   = _this select 1;						
 _anzahl = _this select 2;																		
 
 _closeVcl   = dummyobj;			
 _closest    = -1;			
 if (lockpick_active) exitWith {player groupChat localize "STRS_inventar_lockpick_cant";};
 {																														
 
 if (not(isNull(_x))) then 
 {																																	
 if ( ((player distance _x) < 7) and ( ((player distance _x) < _closest) or (_closest == -1) ) ) then 
 {																												
 _closest  = (player distance _x);																																				
 _closeVcl = _x;																																													
 };								
 };								
 } forEach INV_ServerVclArray;											
 
 if (not(_closest == -1)) then 
 {																						
 
 if (_closeVcl in INV_VehicleArray) then
  {									
 
 player groupchat localize "STRS_inventar_lockpick_already";										
 
 }
  else 
 {						
 if (player == vehicle player) then {format ["%1 playMove ""AinvPknlMstpSlayWrflDnon_medic"";", player] call ISSE_pub_execPstr;};
 lockpick_active = true;
 sleep 15;
 lockpick_active = false;
 if ((random 100) > 70) then 
 {
 INV_VehicleArray = INV_VehicleArray + [_closeVcl];				
 player groupChat localize "STRS_inventar_lockpick_success"; 
 if ([player, coparray, 20] call ISSE_ArrayIsNear) then 
 {
 format 
 ["
 [""StoleVcl"", %1, %3] spawn Isse_AddCrimeLogEntry;
 hint format[localize ""STRS_inventar_lockpick_gesehen"", %1, %3];
 %1_wanted = 1;", player, longrolenumber, _closeVcl] call ISSE_pub_execPstr;
 };
  if ((random 100) < 85) then
 {	
 if ((_closeVcl isKindOf "sahco") or (_closeVcl isKindOf "barcuda") or (_closeVcl isKindOf "ffs_felicia_pol") or (_closeVcl isKindOf "slr_HiluxPolice") or (_closeVcl isKindOf "slr_HiluxSwat") or (_closeVcl isKindOf "slr_HiluxPolice_covered") or (_closeVcl isKindOf "slr_landroverPolice") or (_closeVcl isKindOf "slr_datsunPolice") or (_closeVcl isKindOf "slr_policeSkoda") or (_closeVcl isKindOf "slr_landroverRescue") or (_closeVcl isKindOf "fury") or (_closeVcl isKindOf "roadrunner2") or (_closeVcl isKindOf "440cuda") or (_closeVcl isKindOf "chargerrt") or (_closeVcl isKindOf "hemicuda") or (_closeVcl isKindOf "challenger") or (_closeVcl isKindOf "challenger_b") or (_closeVcl isKindOf "challenger_c")) then 
 {
 format ["if (!(isserver)) then {[%1, ""car_alarm"", 1.080 , 90] execVM ""soundLoop.sqf""};",_closeVcl] call ISSE_pub_execPstr;
 _b = 0;
 while { ((alive _closeVcl) and (_b < 90)) } do 
		{
			player action ["lightOn", _closeVcl]; 
			sleep 1.080;
			player action ["lightOff", _closeVcl]; 
			sleep 1.080;
			_b = _b + 2;
		};
 };
 };
 } 
 else 
 {
 player groupChat localize "STRS_inventar_lockpick_noluck";												
 };												
 
 [_item, -1] call INV_AddInventoryItem;										
 };													
 
 }
  else 
 {																						
 
 player groupChat localize "STRS_inventar_lockpick_zuweit";												
 
 };};