// Guild and Misc Area
// guildsTerrorMisc.sqf

_array= _this select 3;
_art  = _array select 0;
_money = 'money' call INV_GetItemAmount;


if (_art == "clienterstellen") then 
{
	_gildenname = _array select 1;
	if (iscop) exitWith {player groupChat localize "STRS_gilde_cop";};
	if (_gildenname == "") exitWith {player groupChat localize "STRS_gilde_keinname";};
	if (isGildenMember)  exitWith {player groupChat localize "STRS_gilde_schonmember";};

	if (_money < GildenErstellenCost) exitWith {
		player groupChat format [localize "STRS_gilde_keinmoney", (GildenErstellenCost call ISSE_str_IntToStr)];
	};
	
	if ((_gildenname call ISSE_str_Length) > 60) exitWith {player groupChat localize "STRS_text_zu_lang";};
	['money', -(GildenErstellenCost)] call INV_AddInventoryItem;
	[GildenErstellenCost] call Bank_Gov_add_money;
	(format ["if (local server) then {GildenInfoArrays = GildenInfoArrays + [ [GildenAnzahl, ""%2"", """", %3, 0, [%1], [], false, true] ]; GildenAnzahl = GildenAnzahl + 1;}; if (player == %1) then {isGildenMember = true; isGildenLeader = true;};", player, _gildenname, round(time)]) call ISSE_pub_execPstr;
	sleep 2;
	player groupChat format [localize "STRS_gilde_erstellt", _gildenname, (GildenAnzahl call ISSE_str_IntToStr)];
};

if (_art == "clientbeitreten") then 

//original line "_gildenid= call compile (_array select 1);"
//maybe call needed, compile appears to make no sense
{
	_gildenid = _array select 1;
	_dialogauswahl = _array select 2;
	_gildenname = _array select 3; // Temp added
	if (_dialogauswahl == -1)  exitWith {player groupChat localize "STRS_gilde_keinegewaehlt";};
	if (iscop)  exitWith {player groupChat localize "STRS_gilde_cop";};
	if (isGildenMember)  exitWith {player groupChat localize "STRS_gilde_schonmember";};

	if (_money < GildenEintrittCost)  exitWith {
		player groupChat format [localize "STRS_gilde_beitreten_keinmoney", (GildenEintrittCost call ISSE_str_IntToStr)];
	};
	(format ["if (isServer) then {[0, 0, 0, [""serverbeitreten"", %1, ""%2"", ""%3""]] execVM ""guildsTerrorMisc.sqf""};", player, _gildenid, _gildenname]) call ISSE_pub_execPstr;
};

if (_art == "serverbeitreten") then 
{
	_spieler= _array select 1;
	_gildenid  = _array select 2;
	_gildenname = _array select 3;
	_gildenpos = _gildenid call GetGildenPos;
	if (_gildenpos == -1) exitWith {};

	if (((count ((GildenInfoArrays select _gildenpos) select 5)) > MaxPlayersProGilde) or ((count ((GildenInfoArrays select _gildenpos) select 5)) == 0) or (not((GildenInfoArrays select _gildenpos) select 8))) then {
		(format ["if (player == %1) then {player Groupchat localize ""STRS_gilde_zuviele"";};", _spieler]) call ISSE_pub_execPstr;
	} else {
		_memberarray = (((GildenInfoArrays select _gildenpos) select 5) + [_spieler]);
		(GildenInfoArrays select _gildenpos) SET [5, _memberarray];
		(format ["if (player == %1) then {player groupChat format [localize ""STRS_gilde_beigetreten"", GildenEintrittCost]; [""money"", -(GildenErstellenCost)] call INV_AddInventoryItem; isGildenMember = true; isGildenLeader = false; EigeneGildenId = %3; [player] join %5;}; if (player == %2) then {player groupChat format [localize ""STRS_gilde_beigetreten_leader"", %1, %4]; [""money"", GildenErstellenCost] call INV_AddInventoryItem;};", _spieler, (_memberarray select 0), _gildenid, (GildenEintrittCost call ISSE_str_IntToStr), _gildenname]) call ISSE_pub_execPstr;
	};
};

if (_art == "clientverlassen") then 
{
	if (iscop)exitWith {player groupChat localize "STRS_gilde_cop";};
	if (not(isGildenMember)) exitWith {player groupChat localize "STRS_gilde_keinegilde";};
	(format ["if (isServer) then {[0, 0, 0, [""serververlassen"", (%1), (%2)]] execVM ""guildsTerrorMisc.sqf"";}; if (player == %1) then {isGildenMember = false; isGildenLeader = false; EigeneGildenId = -1; [player] join grpNull;};", player, EigeneGildenId]) call ISSE_pub_execPstr;player groupChat localize "STRS_gilde_verlassen";
};

if (_art == "clientkick") then 
{
	_spielerstr = _array select 1;_auswahlnum = _array select 2;
	if (_auswahlnum == -1) exitWith {};
	_spieler = call compile format ["%1", _spielerstr];
	(format ["if (isServer) then {[0, 0, 0, [""serververlassen"", (%1), (%2)]] execVM ""guildsTerrorMisc.sqf"";}; if (player == %1) then {isGildenMember = false; isGildenLeader = false; EigeneGildenId = -1; player groupChat localize ""STRS_gilde_rausgeworfen""; [player] join grpNull;};", _spieler, EigeneGildenId]) call ISSE_pub_execPstr;
};

if (_art == "serververlassen") then 
{
	_spieler  = _array select 1;
	_gildenid = _array select 2;
	_altergildenleader = "";
	_gildenleader= "";
	_gildenpos= _gildenid call GetGildenPos;
	if (_gildenpos == -1) exitWith {};
	_altergildenleader = (((GildenInfoArrays select _gildenpos) select 5) select 0);_memberarray = (((GildenInfoArrays select _gildenpos) select 5) - [_spieler]); (GildenInfoArrays select _gildenpos) SET [5, _memberarray];
	if ((count _memberarray) > 0) then {_gildenleader = (_memberarray select 0);
		if (_gildenleader == _altergildenleader) then {
			(format ["if (player == %1) then {player Groupchat localize ""STRS_gilde_verlassen_leader"";};", _gildenleader]) call ISSE_pub_execPstr;
		} else {
			(format ["if (player == %1) then {player Groupchat localize ""STRS_gilde_newleader""; isGildenLeader = true;};", _gildenleader]) call ISSE_pub_execPstr;
		};
	};
};


// Crazy Nested Statements for Terrorists
if (_art == "clientloop") then 
{
	NeueGildenInfoArrays = "";
	while {true} do{
		waitUntil {(not(NeueGildenInfoArrays == ""))};
		call compile format ['GildenInfoArrays = %1', NeueGildenInfoArrays];
		if (isGildenMember) then {
			for [{_i=0}, {_i < (count GildenInfoArrays)}, {_i=_i+1}] do {
				_gilde = (GildenInfoArrays select _i);
				if (player in (_gilde select 5)) then {
					EigeneGildenId = (_gilde select 0);
					if (_gilde select 7) then {
						isRegierung = true;
						if (isGildenLeader) then {
							isTerrorleader = true;
						}else{
							isTerrorleader = false;
						};
					} else {
						isRegierung = false;
						isTerrorleader  = false;
					};
					
					EigenesGildenArray = (GildenInfoArrays select _i);
				};
			};
		} else {
			isRegierung = false;
			isTerrorleader = false;
		};
		NeueGildenInfoArrays = "";
		sleep 3.012;
	};
};

if (_art == "serverloop") then 
{
	_alterArrayString = "";
	while {true} do {
		sleep 7;
		for [{_i=0}, {_i < (count GildenInfoArrays)}, {_i=_i+1}] do {
			_jemandgeloescht = false;
			_memberarray = ((GildenInfoArrays select _i) select 5);
			_y = 0;
			while {_y < (count _memberarray)} do {
				_member = call compile format ["%1", (_memberarray select _y)];
				if (not((format["%1", (_member)]) call ISSE_UnitExists)) then {
					_memberarray SET [_y, "loeschstring"];
					_memberarray  = _memberarray - ["loeschstring"];
					_jemandgeloescht = true;
					_gildenleader = (_memberarray select 0);
					if ((count _memberarray) > 0) then {
						if (_y == 0) then {
							(format ["if (player == %1) then {player Groupchat localize ""STRS_gilde_newleader""; isGildenLeader = true;};", _gildenleader]) call ISSE_pub_execPstr;
						} else {
							(format ["if (player == %1) then {player Groupchat localize ""STRS_gilde_verlassen_leader"";};", _gildenleader]) call ISSE_pub_execPstr;
						};
					};
				};
				_y = _y + 1;
			};

			if (_jemandgeloescht) then {(GildenInfoArrays select _i) SET [5, _memberarray];};
		};
		// If no Members in guild, delete it
		for [{_i=0}, {_i < (count GildenInfoArrays)}, {_i=_i+1}] do {
			if ((count ((GildenInfoArrays select _i) select 5)) == 0) then {
				GildenInfoArrays SET [_i, "loeschstring"];
				GildenInfoArrays = GildenInfoArrays - ["loeschstring"]; 
			};
		};

		_Punkte = 0;
		_PunkteId = 0;

		for [{_i=0}, {_i < (count GildenInfoArrays)}, {_i=_i+1}] do {
			_gilde = GildenInfoArrays select _i;
			if ((_gilde select 4) > _Punkte) then {
				_Punkte = (_gilde select 4);
				_PunkteId = (_gilde select 0);
			};
		};
		
		if ((not(RegierungsID == _PunkteID)) and (_Punkte >= MinRegierungsPunkte)) then {
			RegierungsID = _PunkteID;
			for [{_i=0}, {_i < (count GildenInfoArrays)}, {_i=_i+1}] do {
				_gilde = GildenInfoArrays select _i;
				if ((_gilde select 0) == RegierungsID) then {
					(GildenInfoArrays select _i) SET [7, true];
				} else {
					(GildenInfoArrays select _i) SET [7, false];
				};
			};
			
			("hint localize ""STRS_gilde_neueregierung"";") call ISSE_pub_execPstr;
		};
		
		if ((not(RegierungsID == _PunkteID)) and (_Punkte < MinRegierungsPunkte) and (RegierungsID >= 0)) then {
			RegierungsID = -1; for [{_i=0}, {_i < (count GildenInfoArrays)}, {_i=_i+1}] do {
				(GildenInfoArrays select _i) SET [7, false];
			};
			
			("hint localize ""STRS_gilde_keineregierung"";") call ISSE_pub_execPstr;
		};
		
		_neusgildenarray = format ["%1", GildenInfoArrays];

		if (not(_neusgildenarray == _alterArrayString)) then {
			NeueGildenInfoArrays = format ["%1", GildenInfoArrays];
			publicVariable "NeueGildenInfoArrays";
			publicVariable "GildenAnzahl";
			_alterArrayString = NeueGildenInfoArrays;
		};

	};
};


if (_art == "serverpunkte") then {
	_punkte= _array select 1;
	_gildenid = _array select 2;
	for [{_i=0}, {_i < (count GildenInfoArrays)}, {_i=_i+1}] do {
		if (_gildenid == ((GildenInfoArrays select _i) select 0)) then {
			(GildenInfoArrays select _i) SET [4, (((GildenInfoArrays select _i) select 4) + _punkte)];
		};
	};
};


if (_art == "clientpunktekauf") then {
	_punkte = _array select 1;
	_kosten =(GildenPunktCost*_punkte);
	if (_money < _kosten) exitWith {player groupChat localize "STRS_kein_money";};
	['money', -(_kosten)] call INV_AddInventoryItem;
	(format ["if (isServer) then {[0, 0, 0, [""serverpunkte"", (%1), (%2)]] execVM ""guildsTerrorMisc.sqf"";};", _punkte, EigeneGildenId]) call ISSE_pub_execPstr;
	player groupChat format [localize "STRS_gilde_punktegekauft", (_punkte call ISSE_str_IntToStr), (_kosten call ISSE_str_IntToStr)];
};


if (_art == "clientjoinerlauben") then {
	_erlauben = call compile format ["%1", _array select 1];
	if ((_array select 2) == -1) exitWith {};
	(format ["if (isServer) then {[0, 0, 0, [""serverjoinerlauben"", (%1), (%2)]] execVM ""guildsTerrorMisc.sqf"";};", _erlauben, EigeneGildenId]) call ISSE_pub_execPstr;
};


if (_art == "serverjoinerlauben") then {
	_erlauben = _array select 1;
	_gildenid = _array select 2;
	for [{_i=0}, {_i < (count GildenInfoArrays)}, {_i=_i+1}] do {
		if (_gildenid == ((GildenInfoArrays select _i) select 0)) then {
			(GildenInfoArrays select _i) SET [8, _erlauben];
		};
	};
};
