_art = ((_this select 3) select 0);

if (_art == "getajob_search") then 
{										

if (alreadygotaworkplacejob == 2)    exitWith {player groupChat localize "STRS_workplacemission_searchalready";};					
if (alreadygotaworkplacejob == 1)    exitWith {player groupChat localize "STRS_workplacemission_search_alreadydelivery";};										
if (workplacejob_search_cancel == 1) exitWith {player groupChat localize "STRS_workplacemission_nochgesperrt";};				
alreadygotaworkplacejob = 2;																									

_searchjob      = floor(random(count workplacejob_searchmessages));						
_searchmsg      = (workplacejob_searchmessages select _searchjob);					
_searchobj      = (workplacejob_searchobjects  select _searchjob);																										
_objposarray    = workplacejob_searchpos select (floor(random(count workplacejob_searchpos)));								
_objectlogic    = _objposarray select 0;									
_objectposition = getpos (_objectlogic);												
_objectradius   = _objposarray select 1;										
_searchobject = _searchobj createVehicleLocal [((_objectposition select 0)+(random(_objectradius)-random(_objectradius))), ((_objectposition select 1)+(random(_objectradius)-random(_objectradius))), _objectposition select 2];															

player groupChat _searchmsg;																
_action            = 0; 				
_distancenachricht = 0;								
_money             = searchjobsuccess;		

while {true} do
 {														
 
 if ((player distance workplace_getjobflag_1 <= 5) and (alreadygotaworkplacejob == 2) and (_action == 0)) then 
 {																																	
 workplace_searchaction_cancel = player addAction [localize "STRS_workplacemission_addaction_searchjob_cancel", "searchJob.sqf", ["canceljob_search", _searchobject]]; 						
 _action = 1;																														
 };																
 
 if ((((player distance workplace_getjobflag_1 > 5) or (alreadygotaworkplacejob == 0)) and (_action == 1))) then 
 {																					
 player removeAction workplace_searchaction_cancel;												
 _action = 0;						
 };																										
 
 if ((player distance _searchobject < 15) and (_distancenachricht == 0)) then 
 {																																													
 player groupChat localize "STRS_workplacemission_searchjob_targetreached";																																													
 _distancenachricht = 1;																				
 };												
 
 if (player distance _searchobject >= 15) then 
 {																								
 _distancenachricht = 0;																										
 };						
 
 if ((player distance _searchobject) < 7) exitWith 
 {																								
 player removeaction finishsearchjobaction;												
 deletevehicle _searchobject;						
 player groupChat format[localize "STRS_workplacemission_search_finish", (_money call ISSE_str_IntToStr)];																								
 // ['money', _money] call INV_AddInventoryItem;
 SearchjobMissionReward = _money;															
 alreadygotaworkplacejob = 0;																										
 };																																				
 
 if (_money > searchjobmin) then {_money = _money - 10;};								
 if (alreadygotaworkplacejob == 0) exitWith {};																																														
 
 sleep 1;													
 
 };};
 
 if (_art == "canceljob_search") then 
 {							
 deletevehicle ((_this select 3) select 1);							
 player groupChat format[localize "STRS_workplacemission_search_cancel", (workplacejob_search_cancelsperre call ISSE_str_IntToStr)];														
 alreadygotaworkplacejob = 0;											
 player REMOVEACTION workplace_searchaction_cancel;											
 workplacejob_search_cancel = 1;															
 sleep (workplacejob_search_cancel*60);				
 workplacejob_search_cancel = 0;
 };