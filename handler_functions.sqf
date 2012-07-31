[] execVM "functions_savestats.sqf";
[] execVM "functions_custom1.sqf";
[] execVM "functions_str_vars.sqf";
[] execVM "functions_custom2.sqf";
[] execVM "functions_banking.sqf";
[] execVM "functions_inventory.sqf";
[] execVM "functions_weapons.sqf";
[] execVM "functions_arrays.sqf";
[] execVM "functions_configinfos.sqf";
[] execVM "lightbar.sqf";


// non-server 
/*
if ((!isServer) or (Server_Client)) then {
[] execVM "functions_arrays.sqf";
[] execVM "functions_configinfos.sqf";
};
*/