_art = ((_this select 3) select 0);

if (_art == "getajob_delivery") then 
{																													

if (alreadygotaworkplacejob == 2) exitWith {player groupChat localize "STRS_workplacemission_searchalready";};											
if (alreadygotaworkplacejob == 1) exitWith {player groupChat format [localize "STRS_workplacemission_already", workplacejob_deliveryname];};													
alreadygotaworkplacejob     = 1;																							
_whereto                    = floor(random (count workplacejob_deliveryflagarray));									
_msg                        = (workplacejob_deliverymsg select (round(random((count workplacejob_deliverymsg)-1))));											
workplacejob_deliveryflag   = workplacejob_deliveryflagarray select (_whereto);			
workplacejob_deliveryname   = workplacejob_deliverynamearray select (_whereto);														
workplacejob_deliverymoney  = ((round((player Distance workplacejob_deliveryflag)))*deliveryjobmulti);
				
player groupChat format[localize _msg, workplacejob_deliveryname];									
workplacemissioninfos = ["Delivery Mission", format["%1", (_whereto+1)]];																												

_action1_added = 0;										

while {true} do 
{																								

if ((player distance workplacejob_deliveryflag <= 5) and (_action1_added == 0) and (alreadygotaworkplacejob == 1)) then 
{																		
finishdeliveryaction = player addAction [localize "STRS_workplacemission_delivery_finishaction", "deliveryJob.sqf", ["finish_delivery"]];																					
_action1_added = 1;																		};																		

if (((player distance workplacejob_deliveryflag > 5) or (alreadygotaworkplacejob == 0)) and (_action1_added == 1)) then 
{																																										
player removeAction finishdeliveryaction;																																										
_action1_added = 0;								
};																														

if (alreadygotaworkplacejob == 0) exitWith 
{																																													
player removeAction finishdeliveryaction;																								
};																														

sleep 1;					
	};
};

if (_art == "finish_delivery") then 
{					
player removeAction finishdeliveryaction;										
player groupChat format[localize "STRS_workplacemission_delivery_finish", (workplacejob_deliverymoney call ISSE_str_IntToStr)];									
// ['money', workplacejob_deliverymoney] call INV_AddInventoryItem;	
Deliverymissionreward = Deliverymissionreward + workplacejob_deliverymoney;											
alreadygotaworkplacejob = 0;									
workplacemissioninfos = ["", ""];
};