_opfer         = _this select 0;
_opferstring   = _this select 1;
_opferbounty = _this select 2;
_money          = 'money' call INV_GetItemAmount;

if (rolestring == _opferstring) exitWith {player groupChat localize "STRS_handlerdeadpub_suicide"; SelfKilled = SelfKilled + 1;};

if (_opferstring in civstringarray) then
 {																		
 CivsKilled = CivsKilled + 1;													
 player groupChat format [localize "STRS_handlerdeadpub_bounty_youkilled", _opferstring, (_opferbounty call ISSE_str_IntToStr)];											
 _gesucht = 0; call compile format ["_gesucht = %1_wanted;", _opferstring];																													
 
 if ((_opferbounty > 0) and ("bounty" call INV_HasLicense)) then 
 {								
 ['money', _opferbounty] call INV_AddInventoryItem;																														
 player groupChat format [localize "STRS_handlerdeadpub_bounty_kill", (_opferbounty call ISSE_str_IntToStr)];															
 };							
 
 if (iscop) then 
 {																						
 DeadWaitSec = DeadWaitSec + deadcoptimewait;								
 ["DeadWaitSec", DeadWaitSec] spawn ClientSaveVar;																
 
 if (_gesucht == 0) then
  {																													
  player groupChat format [localize "STRS_handlerdeadpub_civkilled", _opferstring, (killstrafe call ISSE_str_IntToStr)];																																										
  ['money', -(killstrafe)] call INV_AddInventoryItem;																												
  };				
  
  } else {																								
  
  if (_gesucht == 0) then 
  {						
  true call TurnWantedFunc;																			
  };											
  
  };																								
  
  sleep 1;													
  
  (format ["[""KilledCiv"", %1, ""%2""] spawn Isse_AddCrimeLogEntry;", player, _opferstring]) call ISSE_pub_execPstr;};
  
  if (_opferstring in copstringarray) then 
  {		
  CopsKilled = CopsKilled + 1;															
  
  if (iscop) then
   {				
   DeadWaitSec = DeadWaitSec + deadcoptimewait;														
   ["DeadWaitSec", DeadWaitSec] spawn ClientSaveVar;																								
   
   player groupChat format [localize "STRS_handlerdeadpub_copkilledbycop", _opferstring];																
   ['money', -(copteamkillstrafe)] call INV_AddInventoryItem;								
   
   if ( (player distance copbase1 <= 400) or (_opfer distance copbase1 <= 400) or (CopsKilled > 5) ) then
    {												
    [] execVM "jailCop.sqf";																				
    };													
    
    } else {														
    
    player groupChat format [localize "STRS_handlerdeadpub_copkilled", _opferstring];						
    true call TurnWantedFunc;						
    };																		
    sleep 1;												
    
    (format ["[""KilledCop"", %1, ""%2""] spawn Isse_AddCrimeLogEntry;", player,  _opferstring]) call ISSE_pub_execPstr;};