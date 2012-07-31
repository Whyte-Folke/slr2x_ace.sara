 //Rearming vehicles
 //What the hell is with the var names BTW?!
 //Also why are diamond rings calling this script?!?
 
 _art = _this select 0;
 if (_art == "use") then
 {
	 _item   = _this select 1;
	 _anzahl = _this select 2;
	 _vcl = vehicle player;
	 if (player == _vcl) exitWith {player groupChat localize "STRS_inv_item_vclammo_novehicle";};
	 _vehiclepimpweapons = ["DSHKM","M2","M134","M134_2"];
	 _vehiclepimpammos   = ["50Rnd_127x107_DSHKM","100Rnd_127x99_M2","2000Rnd_762x51_M134","2000Rnd_762x51_M134"];
	 _hasRearmableWeapon = 0;
	 _rearmWeaponarray   = [];
	 for [{_i=0}, {_i < (count _vehiclepimpweapons)}, {_i=_i+1}] do
	 {
		if ((_vehiclepimpweapons select _x) in (weapons _vcl)) then
		{
			_rearmWeaponarray = _rearmWeaponarray + [ [(_vehiclepimpweapons select _x), _x] ];
			_hasRearmableWeapon = 1;
		};
	};

	if (_hasRearmableWeapon == 0) exitWith {player groupChat localize "STRS_inv_item_vclammo_nomg";};
	{
		_waffe = _x select 0;
		_muni = _vehiclepimpammos select (_x select 1);
		format ["%1 RemoveMagazines ""%2""; %1 AddMagazine ""%3"";", _vcl, _waffe, _muni] call ISSE_pub_execPstr;
		sleep 0.1;
	} forEach _rearmWeaponarray;
	player groupChat localize "STRS_inv_item_vclammo_rearmed";
	[_item, -1] call INV_AddInventoryItem;
};