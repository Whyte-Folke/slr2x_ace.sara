 _art = _this select 0;
 
 //There is no real use for trying to use bank insurance....
 if (_art == "use") then
 {												
 _item   = _this select 1;															
 _anzahl = _this select 2;		
 player groupChat localize "STRS_inventar_bankversicherung";
 };