waitUntil {(alive player)};

format["if (isServer) then {[%1, %2] execVM ""\scripts\publicVar.sqf"";};", player, longrolenumber] call ISSE_pub_execPstr;

if (debug) then {debugarray = debugarray + [ format["Requesting Stats: %1", longrolenumber] ];};
if (debug) then {debugarray = debugarray + [ "Waiting for Arrays..." ];};

waitUntil {JIP_PublicArray_ready};

if (debug) then {debugarray = debugarray + [ "Arrays arrived." ];};

if (iscop) then 
{		

} 
else 
{													

call compile format 
["																						
%1_arrest           = 0;																
%1_wanted           = 0;																
bounty_%1         = 0;																				
%1_markerjammed     = 0;				
publicVariable ""%1_arrest"";										
publicVariable ""%1_wanted"";																														
publicVariable ""bounty_%1"";								
publicVariable ""%1_markerjammed"";																														
", player								
];
};

_arbeiterarray = call compile format ["%1", JIP_Arbeiter_Action_Array];

{											
if (not(isNull(_x select 0))) then
{														
 call compile format ['%1 addaction [localize "STRS_arbeiter_copaction", "someCompile.sqf", ["player groupChat format[localize ""STRS_arbeiter_meister"", %2];"]]', _x select 0, _x select 1];					
 };
 } forEach _arbeiterarray;

 if (debug) then {debugarray = debugarray + [ format["Requesting Stats: %1", longrolenumber] ];};
 if (debug) then {debugarray = debugarray + [ "Waiting for Stats..." ];};
 
 waitUntil {JIP_Stats_Ready};
 
 if (debug) then {debugarray = debugarray + [ "Stats arrived." ];};
 
 if (local_arrest == 1) then 
 {									
 format ["if (isServer) then {[""arrestserver"", %1, %2, %3] execVM ""civMenuActions.sqf"";};", player, (20), player] call ISSE_pub_execPstr;
 };
 
 if (hideout_arraynumber > -1) then
 {						
 ['hideout', 1] call INV_AddInventoryItem;
 };