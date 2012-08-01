_a1 = 0; 
_a2 = 0; 
_a3 = 0; 
_a4 = 0; 
_a5 = 0;
_a6 = 0;
_f1 = 0;

// Workplace job actions

while {true} do 
{												

// Courier Job
if ((((player distance workplacejob_actionflag_delivery <= 5) or 
      (player distance workplace_getjobflag_2 <= 5) or 
      (player distance workplace_getjobflag_3 <= 5)) and (_a1 == 0)) and (rolecop == 0)) then 
{
	workplace_getjobaction = player addAction [localize "STRS_addAction_courierjob", "deliveryJob.sqf", ["getajob_delivery"]]; 
	_a1 = 1;
};														

if ((((player distance workplacejob_actionflag_delivery > 5) and (player distance workplace_getjobflag_2 > 5) and (player distance workplace_getjobflag_3 > 5)) ) and (_a1 == 1)) then 
{
	player removeAction workplace_getjobaction; 
	_a1 = 0;
};				
	 
// Search Job
// Add Search job action
if ((player distance workplacejob_actionflag_search <= 5) and (_a2 == 0) and (rolecop == 0)) then 
{
	workplace_getsearchaction = player addAction [localize "STRS_workplacemission_addaction_searchjob", "searchJob.sqf", ["getajob_search"]]; 
	_a2 = 1;
};											

// Remove Search job action
if (((player distance workplacejob_actionflag_search > 5) and (_a2 == 1))) then 
{
	player removeAction workplace_getsearchaction; 
	_a2 = 0;
};											

// Weapon Delivery Job (UNUSED)
// Add weapon delivery job action
if ((player distance workplacejob_actionflag_weapons1 <= 5) and (workplacejob_waffe_active == 0) and (_a3 == 0) and (rolecop == 0)) then 
{
	workplacejob_waffe_anfangen = player addAction [localize "STRS_workplacemission_weaponjob_anfang", "getGunJob.sqf", ["weaponjob","anfang"]]; 
	_a3 = 1;
};												
	
//Remove weapon delivery job action
if (((player distance workplacejob_actionflag_weapons1 > 5) or (workplacejob_waffe_active == 1)) and (_a3 == 1)) then 
{
	player removeAction workplacejob_waffe_anfangen; 
	_a3 = 0;
};									


if ((player distance workplacejob_actionflag_weapons2 <= 5) and (workplacejob_waffe_active == 1) and (_a4 == 0) and (rolecop == 0)) then 
{
	workplacejob_waffe_ende = player addAction [localize "STRS_workplacemission_weaponjob_ende", "getGunJob.sqf", ["weaponjob","ende"]]; 
	_a4 = 1;
};													

if (((player distance workplacejob_actionflag_weapons2 > 5) or (workplacejob_waffe_active == 0)) and (_a4 == 1)) then 
{
	player removeAction workplacejob_waffe_ende; 
	_a4 = 0;
};						

//Taxi Missions action

if ((player distance workplacejob_actionflag_search <= 5) and (_a5 == 0) and (rolecop == 0)) then 
{
	workplace_gettaxiaction = player addAction [localize "STRS_workplacemission_taxi_action", "taxiJob.sqf", ["getajob_taxi"]]; 
	_a5 = 1;
};														

if (((player distance workplacejob_actionflag_search > 5) and (_a5 == 1))) then 
{
	player removeAction workplace_gettaxiaction; 
	_a5 = 0;
};				

// Airline Job
if ((player distance workplacejob_actionflag_search <= 5) and (_a6 == 0)) then 
{
workplace_getplaneaction = player addAction [localize "STRS_workplacemission_plane_action", "airline.sqf", ["getajob_plane"]]; 
_a6 = 1;
};														
if ((player distance workplacejob_actionflag_search > 5) and (_a6 == 1)) then 
{
player removeAction workplace_getplaneaction; 
_a6 = 0;
};
sleep 3.098;
};