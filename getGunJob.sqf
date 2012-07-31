/*
_art = ((_this select 3) select 0);

if (_art == "weaponjob") then 
{									

_label = ((_this select 3) select 1);																								

if (_label == "anfang") then 
{																						

if (workplacejob_waffe_active == 1) exitWith {player groupChat format [localize "STRS_workplacemission_weapon_alreadyhave",workplacejob_waffe];};																
if (workplacejob_waffe_sperre == 1) exitWith {player groupChat format [localize "STRS_workplacemission_weapon_zeitsperre",(workplacejob_waffe_sperrzeit call ISSE_str_IntToStr)];};										

_num 				= (ceil(random (count INV_AlleWaffenObjekte)));																		
workplacejob_waffe_active   	= 1;						
workplacejob_waffe          	= (((INV_AlleWaffenObjekte select _num) select 2) select 0);																												
workplacejob_waffe_addmoney   = (((workplacejob_waffe call GetObjektInfos) select 2)+workplacejob_waffe_bonus);												

player groupChat format [localize "STRS_workplacemission_weapon_startjob",workplacejob_waffe];												

};		

if (_label == "ende") then 
{						

if (player hasWeapon workplacejob_waffe) then
 {															
 
 if (workplacejob_waffe_active == 0) exitWith {player groupChat "STRS_workplacemission_weapon_donthave";};																																				
 
 workplacejob_waffe_sperre = 1;																																													
 workplacejob_waffe_active = 0;																		
 
 player removeWeapon workplacejob_waffe;																											
 ['money', workplacejob_waffe_addmoney] call INV_AddInventoryItem;																								
 player groupChat format [localize "STRS_workplacemission_weapon_finish", workplacejob_waffe, (workplacejob_waffe_addmoney call ISSE_str_IntToStr)];																					
 workplacejob_waffe = "";																																				
																			
sleep (workplacejob_waffe_sperrzeit*60);																																													
workplacejob_waffe_sperre = 0;														
																			
																			
	}
	else 
	{																											
	
player groupChat format [localize "STRS_workplacemission_weapon_cannotfinish",workplacejob_waffe];																														

		};								
      	};	
  };
*/