_killedopfer   = _this select 0;
_nearVehicles  = nearestObjects [_killedopfer, ["Land"], 10];
_killedkiller  = _this select 1;
_killerstring  = format ["%1", _killedkiller];

if (player == _killedopfer) then {
	["killed", _this, _killedopfer] execVM "forensicInvestigation.sqf";
    
};

if (isNil "DynBr_Men") then {
	DynBr_Men = [];  
    
};

if (not(_killerstring call ISSE_UnitExists)) then 
{																
(format ["[""Died"", ""%1""] spawn Isse_AddCrimeLogEntry; bounty_%1 = 0;", rolestring]) call ISSE_pub_execPstr;

} 
else
{																			

_killedByVehicle = false;														

if (_killerstring == rolestring) then 
{																						

{																																				
if (  (speed _x > 10) and (!(isNull(driver _x)))  ) then
 {																																																												
 _killedkiller    = driver _x;																																								
 _killerstring    = format ["%1", _killedkiller];																																
 _killedByVehicle = true;															
 };												
 
 } forEach _nearVehicles;															
 
 };				
 
 
 (call compile format ["
 if (""%5"" == rolestring) then 
 { 
 [%1, ""%3"", bounty_%3] execVM ""setWanted.sqf""; 
 };			
 																							
 if ((%7) and (isServer)) then 
 {
	 [0, 0, 0, [""serverpunkte"", %8, %9] ] execVM ""guildsTerrorMisc.sqf"";
};				
																				
 [""Died"", ""%3""] spawn Isse_AddCrimeLogEntry;														
 bounty_%3 = 0;	
 																								
 if (%6) then 
 {
	 player globalChat ""%4 hit %3 with his vehicle."";
 };				
 ", _killedopfer, _killedkiller, rolestring, _killerstring, _killerstring, _killedByVehicle, isGildenLeader, GildenLeaderTotPt, EigeneGildenId]);
 
 };
 
if (isServer) then {
	DynBr_Men = DynBr_Men + [_killedopfer];
    publicVariable "DynBr_Men";
};


