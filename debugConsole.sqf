_art = _this select 0;
if (_art == "create") then 
{																						
closeDialog 0;					
sleep 0.2;														
_ok = createDialog "Commanddialog";																										
{lbAdd [2,   _x];} forEach CON_console_SavedCommands;										
{lbAdd [100, _x];} forEach debugarray;																																	

_index = lbAdd [3, "Local"];				
lbSetData [3, _index, "Local"];		
_index = lbAdd [3, "Global"];										
lbSetData [3, _index, "Global"];							
lbSetCurSel [3, 0];																					

{																
ctrlSetText     [(_x select 0), (_x select 1)];																		
buttonSetAction [(_x select 0), (_x select 2)];			
} forEach CON_Console_Actions;																					

_commandcounter = count CON_console_SavedCommands;		
_debugcounter   = count debugarray;												

while {ctrlVisible 3} do 
{																																						

if ((count CON_console_SavedCommands > _commandcounter)) then 
{																																				

for [{_i=(_arraycounter)}, {_i < (count CON_console_SavedCommands)}, {_i=_i+1}] do 
{																
	lbAdd [2, (CON_console_SavedCommands select _i)];																																																												
	_arraycounter = count CON_console_SavedCommands;															
	};												
};																																																		

if ((count debugarray > _debugcounter)) then 
{																														

for [{_i=(_debugcounter)}, {_i < (count debugarray)}, {_i=_i+1}] do 
{												
	lbAdd [100, (debugarray select _i)];								
	_debugcounter = count debugarray;									
};																														
};																																														

sleep 0.5;													
};};

if (_art == "exec") then 
{								
_befehl = _this select 1;					
_public = _this select 2;		
player groupChat format ["%1, %2", _befehl, _public];					

if (_befehl != "") then 
{
	CON_console_SavedCommands = CON_console_SavedCommands + [_befehl];
};		
		
if (_public == "Global") then 
{																												
(format ["%1", _befehl]) call ISSE_pub_execPstr;									

}
else 
{								

call compile format ["%1", _befehl];											
};
};