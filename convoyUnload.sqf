// Convoy Weapon Dropoff
// convoyUnload.sqf

if (!(isserver)) exitWith {};
_crate			= konvoybox;
_art				= _this select 1;
_respawn			= _this select 2;
_copcrate			= _this select 3;
_rezeitcrate		= 1;
crateweaponarray		= [];
cratemagarray		= [];


if (not(_crate == dummyobj)) then 
{
	format ["
	ClearMagazineCargo %1;
	ClearWeaponCargo %1;
	", konvoybox] call Isse_Pub_execPstr;
};


if ((_art == 1) or (_art == 2) or (_art == 3) or (_art == 4) or (_art == 5)) then 
{
	_randomNumWeapons = ceil random 20;
    _randomNumMags = ceil random 30;
    
    _i = 0; 
    /* Get random weapons */
    while {_i < _randomNumWeapons} do {
       	_weapon = INV_AlleWaffenObjekte select (random(count INV_AlleWaffenObjekte-1));
        _class = _weapon select 0;
        _randomAmount = ceil random 10;
        
        crateweaponarray set[(count crateweaponarray), [_class, _randomAmount]];
      
        _i = _i + 1;  
    };
    
     _i = 0; 
    /* Get random Magazines  */
    while {_i < _randomNumMags} do {
       	_mag = INV_AlleMagazinObjekte select (random(count INV_AlleMagazinObjekte-1));
        _class = _mag select 0;
        _randomAmount = 5 + (ceil random 25);
        
        cratemagarray set[(count cratemagarray), [_class, _randomAmount]];
      
        _i = _i + 1;  
    };
	
	while {true} do 
	{
		sleep _rezeitcrate;
		ClearMagazineCargo _crate;
		ClearWeaponCargo   _crate;
		_crate SETDAMAGE 0;
		{_crate addWeaponCargo   [(_x select 0), (_x select 1)];}forEach crateweaponarray;
		{_crate addMagazineCargo [(_x select 0), (_x select 1)];}forEach cratemagarray;
		if (_respawn == 0) exitWith {};
		if (_copcrate != 1) then {_rezeitcrate = 300;};
		waituntil {(konvoytruck distance copbase1 <= 250) or (_copcrate != 1)};
	};
};


// For Terrorbase Convoy drop-off
if (_art == 6) then 
{
    _randomNumWeapons = ceil random 20;
    _randomNumMags = ceil random 40;
    
    _i = 0; 
    /* Get random weapons */
    while {_i < _randomNumWeapons} do {
       	_weapon = INV_AlleWaffenObjekte select (random(count INV_AlleWaffenObjekte-1));
        _class = _weapon select 0;
        _randomAmount = ceil random 10;
        
        crateweaponarray set[(count crateweaponarray), [_class, _randomAmount]];
      
        _i = _i + 1;  
    };
    
     _i = 0; 
    /* Get random Magazines  */
    while {_i < _randomNumMags} do {
       	_mag = INV_AlleMagazinObjekte select (random(count INV_AlleMagazinObjekte-1));
        _class = _weapon select 0;
        _randomAmount = 5 + (ceil random 25);
        
        cratemagarray set[(count cratemagarray), [_class, _randomAmount]];
      
        _i = _i + 1;  
    };

	publicVariable "crateweaponarray";
	publicVariable "cratemagarray";
	konvoybox setdamage 0;
	sleep 3;
	format ["
	ClearMagazineCargo %1;
	ClearWeaponCargo %1;
	{%1 addWeaponCargo   [(_x select 0), (_x select 1)];} forEach crateweaponarray;
	{%1 addMagazineCargo [(_x select 0), (_x select 1)];} forEach cratemagarray;
	", konvoybox] call Isse_Pub_execPstr;
};
