// thirst stuff
// thirst.sqf

_art = _this select 0;
if (_art == "init") then {
	_thirstnachricht   = 0;
	_sleepTime         = 10;
	if (interndebug) then {
		debugarray = debugarray + [ "Thirst script init successfully called once" ];
	};
	while {true} do {
		if (INV_thirst < 100) then {
			INV_thirst = INV_thirst + (INV_thirstProSek*_sleepTime);
			if ((_thirstnachricht == 0) and (INV_thirst > 90)) then {
				titleText [localize "STRS_inv_item_nahrung_verdursten", "plain"];
				_thirstnachricht = 1;
			};
			if ((_thirstnachricht == 1) and (INV_thirst <= 90)) then {
				_thirstnachricht = 0;
			};
			if (!alive player) then {
				INV_thirst = 5;
			};
		} else {
			titleText [localize "STRS_inv_item_nahrung_verdursten", "plain"];
			player setDamage ((damage player) + (INV_ThirstSchaden*1));
			INV_thirst = 100;
		};																		
		sleep _sleepTime;													
	};
};
if (_art == "use") then {
	_item   = _this select 1;
	_anzahl = _this select 2;
	_thirstStillen = 0;
	switch _item do {
		case "lowqualitywater":     { _thirstStillen = 5;  };
		case "normqualitywater1":     { _thirstStillen = 15;  };
		case "normqualitywater2":     { _thirstStillen = 17;  };
		case "highqualitywater":     { _thirstStillen = 30;  };
		case "quellwasserhq":     { _thirstStillen = 7;  };
		case "quellwasser":     { _thirstStillen = 5;  };
	};
	INV_Thirst = INV_Thirst - (_thirstStillen*_anzahl);
	if (INV_Thirst < 0) then {INV_Thirst = 0;};
	player groupChat format[localize "STRS_inv_item_getreank_getrunken", ((round (INV_Thirst)) call ISSE_str_IntToStr)];
	[_item, -(_anzahl)] call INV_AddInventoryItem;
};
