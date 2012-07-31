// saveObjVeh.sqf
// Obj and Vehicle Arrays Loops for Publishing
// Split for Server and cleint G-C 15.05.09, Server-Part not called and added to JIP-Script.
_arrStr1 = "";
_arrStr2 = "";
_arrStr3 = "";
_arrStr4 = "";

_kind = _this select 0;

if (_kind == "clientloop") then {
while {true} do 
{																																																																																							

	for [{_i=0}, {_i < (count playerstringarray)}, {_i=_i+1}] do 
	{								
		playerarray SET [_i, call compile (playerstringarray select _i)]				
	};																																																																								

	for [{_i=0}, {_i < (count INV_VehicleArray)}, {_i=_i+1}] do 
	{																														
		if (isNull (INV_VehicleArray select _i)) then 
		{						
			INV_VehicleArray set [_i, ""];																								
			INV_VehicleArray = INV_VehicleArray - [""];																
		};														

	};																														
	if (INV_SaveVclArray) then 
	{				
		if ((_arrStr3 != format["%1", INV_VehicleArray]) and ((count INV_VehicleArray) > 0)) then 
		{																																				
		_arrStr3 = format["%1", INV_VehicleArray];									
		["INV_VehicleArray", INV_VehicleArray] call ClientSaveVar;																				
		};					
	};																																				

	for [{_i=0}, {_i < (count INV_ServerVclArray)}, {_i=_i+1}] do 
	{										
		if (isNull (INV_ServerVclArray select _i)) then 
		{															
			INV_ServerVclArray set [_i, ""];																																											    
			INV_ServerVclArray = INV_ServerVclArray - [""];																												
		};													
	};
    for [{_i=0}, {_i < (count INV_ObjectsArray)}, {_i=_i+1}] do 
	{																		
 
		if (isNull (INV_ObjectsArray select _i)) then 
		{																														
			INV_ObjectsArray SET [_i, ""];																																										
			INV_ObjectsArray = INV_ObjectsArray - [""];																				
		};				
 	};																	
 
	if (INV_SaveObjArray) then
	{																		
		if (  (_arrStr4 != format["%1", INV_ObjectsArray]) and ((count INV_ObjectsArray) > 0)  ) then 
	   {						
			_arrStr4 = format["%1", INV_ObjectsArray];																														
			["INV_SaveObjArray", INV_ObjectsArray] call ClientSaveVar;				
	   };														
    };																				
  
    for [{_i=0}, {_i < (count INV_ServerObjArray)}, {_i=_i+1}] do 
    {																							
		if (isNull (INV_ServerObjArray select _i)) then
	    {									
			INV_ServerObjArray set [_i, ""];																																										
			INV_ServerObjArray = INV_ServerObjArray - [""];														
		};								
   	};																														
   sleep 5;
};
};

/*
if (_kind == "serverloop") then {
	while {true} do 
	{	
		if (INV_JIP) then 
		{															
				_arrStr1 = format["%1", INV_ServerVclArray];												
				publicVariable "INV_ServerVclArray";																												
		};		
	
		if (INV_JIP) then 
		{												
				_arrStr2 = format["%1", INV_ServerObjArray];															
				publicVariable "INV_ServerObjArray";														
		};
		if (INV_JIP) then 
		{
			INV_JIP = false;
		};			
	};
	sleep 5;
};
*/