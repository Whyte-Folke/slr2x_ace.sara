hint "mission 4 End";

_pos = getPos player;


["ace_sys_wounds_rev", {
   // This code will be executed when PMR enabled, and killed (countdown ended)
   // _this select 0  contains the unit
}] call CBA_fnc_addEventhandler;


["ace_sys_wounds_rev2", {
   // This code will be executed when PMR enabled, and killed (countdown ended)
   // _this select 0  contains the unit
}] call CBA_fnc_addEventhandler;



_SideHQ = createCenter civilian;
_civgroup = createGroup civilian;

_victim1 = "Worker1" createUnit [_pos,_civgroup];
_victim2 = "Worker2" createUnit [_pos,_civgroup];

hint "TEST";
sleep 2;

[_victim1,0.7] call ace_sys_wounds_fnc_addDamage;
[_victim1, 1] call ace_blackoutAll;
_victim1 setDamage 0.9;

[_victim1,1] call ace_sys_wounds_fnc_addDamage;

[_victim2,0.7] call ace_sys_wounds_fnc_addDamage;
[_victim2, 1] call ace_blackoutAll;

mission4End = true;