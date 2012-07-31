// Weaponbag.sqf

_art = _this select 0;
 if (_art == "use") then {
   if (vehicle player == player) then {
      _deleted = 0;
      _deleteds = 0;
      {deleteVehicle _x; _deleted = _deleted + 1;} forEach (player nearObjects ["weaponholder", 5]);
      _deleteds = _deleted * 4;
      player groupChat format[localize "STRS_inv_items_weapondeleted", _deleted, _deleteds];
      ["stahl", _deleteds, "coplager_global", ""] call INV_AddItemStorage;
   } else {
      if (meltsperre) exitWith{player groupChat "You have to wait 5 minutes until another weapons impound";};
      format ["clearWeaponCargo %1; clearMagazineCargo %1;", (vehicle player)] call ISSE_pub_execPstr;
      ["stahl", 2, "coplager_global", ""] call INV_AddItemStorage;
      player groupChat localize "STRS_inv_items_weaponcargocleared";
      meltsperre = true;
      publicvariable "meltsperre";
      sleep 300;
      meltsperre = false;
      publicvariable "meltsperre";
   };
};