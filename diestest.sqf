while {true} do 
{
waitUntil {(!(alive player))};
{
_exitVar = false;
if ((player distance (_x select 0)) < (_x select 1) and (!(_exitVar))) exitWith
{
	call compile format ["server globalChat ""A person died in %1""", (_x select 2)] call ISSE_pub_execPstr;
	_exitVar = true;
};
} forEach CityLocationArray;
waitUntil {(alive player)};
};

CityLocationArray = 
[
[CityLogic1, 500, "Bagango"], 
[CityLogic2, 250, "Obregan"], 
[CityLogic3, 250, "Mercalilo"], 
[CityLogic4, 250], 
[CityLogic5, 250], 
[CityLogic6, 250], 
[CityLogic7, 300], 
[CityLogic8, 350]	
];