// Cellphonecalls.sqf - Receives/Transmit Calls from/towards to Medic/Police/Taxi, G-C 2009


_rolestring = vehicleVarName player;


_array = _this select 3;
_basickind = _array select 0;
_subkind = _array select 1;


// Part when you click from within the Phone-Menu
if (_basickind == "sendcall") then {
	mydamnid = vehicleVarName player;
	
	if (_subkind == "callpolice") then {
		if (cellphoneinuse) exitwith {player sidechat format [localize "STRD_phone_alreadyinuse"];};
		TempMarkerPos = nil;
		if ((InternDebug) OR (!isCop)) then 
		{
			cellphoneinuse = true;
			sleep 1.5;
			titleText [ format[localize "STRD_phone_policCallTitleText"], "PLAIN DOWN"];
			onMapSingleClick "TempMarkerPos = _pos; onMapSingleClick ''; true";
			_startTime = time;
			waitUntil
			{
			_cond1 = !isNil ("Tempmarkerpos");
			_cond2 = time - _startTime > 5*60;
			_cond1 || _cond2
			};
			if (isNil ("Tempmarkerpos")) exitwith {Player Sidechat format [localize "STRD_phone_callTookToLong"]; cellphoneinuse = false;};
			if (interndebug) then {player sidechat format["Tempmarkerposition is: %1", TempMarkerPos];};
			sleep 1;
			titleText [ format[localize "STRD_phone_policCallTitleTextNextStep"], "PLAIN DOWN"];
			sleep 1;
			if (!(createDialog "Phonecalldescriptiondialog")) exitWith {hint "Dialog Error!";};
			buttonSetAction [3, 'format["if (isCop) then {[0,1,2,[""receivecall"", ""callpolice"", %1, %2, %3]] execVM ""CellPhoneCalls.sqf"";};", "ctrlText 1", mydamnid, TempMarkerPos] call ISSE_pub_execPstr; closedialog 0; TempMarkerPos = nil; player sidechat format[ localize "STRD_phone_callsuccesfull"];'];		
			if (phonedebug) then {
				format["if (phonedebug) then {debugarray = debugarray + [ format[""%1 called succesfully for the Police"", %1] ];};", _rolestring] call ISSE_pub_execPstr; 		
			};
		} else {
			player sidechat format[localize "STRD_phone_policeself"];
		};
		cellphoneinuse = false;
	};
	
	if (_subkind == "callambulance") then {
		if (cellphoneinuse) exitwith {player sidechat format [localize "STRD_phone_alreadyinuse"];};
		TempMarkerPos = nil;
		cellphoneinuse = true;
		sleep 1.5;
		titleText [ format[localize "STRD_phone_medicCallTitleText"], "PLAIN DOWN"];
		onMapSingleClick "TempMarkerPos = _pos; onMapSingleClick ''; true";
		_startTime = time;
		waitUntil
		{
		_cond1 = !isNil ("Tempmarkerpos");
		_cond2 = time - _startTime > 5*60;
		_cond1 || _cond2
		};
		if (isNil ("Tempmarkerpos")) exitwith {Player Sidechat format [localize "STRD_phone_callTookToLong"]; cellphoneinuse = false;};
		if (interndebug) then {player sidechat format["Tempmarkerposition is: %1", TempMarkerPos];};
		sleep 1;
		titleText [ format[localize "STRD_phone_medicCallTitleTextNextStep"], "PLAIN DOWN"];
		sleep 1;
		if (!(createDialog "Phonecalldescriptiondialog")) exitWith {hint "Dialog Error!";};
		buttonSetAction [3, 'format["if (isAmbulance) then {[0,1,2,[""receivecall"", ""callambulance"", %1, %2, %3]] execVM ""CellPhoneCalls.sqf"";};","ctrlText 1", mydamnid, TempMarkerPos] call ISSE_pub_execPstr; closedialog 0; TempMarkerPos = nil; player sidechat format[ localize "STRD_phone_callsuccesfull_medic"];'];		
		if (phonedebug) then {
		format["if (phonedebug) then {debugarray = debugarray + [ format[""%1 called for a Ambulance"", %1] ];};", _rolestring] call ISSE_pub_execPstr; 		
		};
		cellphoneinuse = false;
	};
	
	if (_subkind == "calltaxi") then {
		if (cellphoneinuse) exitwith {player sidechat format [localize "STRD_phone_alreadyinuse"];};
		TempMarkerPos = nil;
		cellphoneinuse = true;
		sleep 2;
		titleText [ format[localize "STRD_phone_taxiCallTitleText"], "PLAIN DOWN"];
		onMapSingleClick "TempMarkerPos = _pos; onMapSingleClick ''; true";
		_startTime = time;
		waitUntil
		{
		_cond1 = !isNil ("Tempmarkerpos");
		_cond2 = time - _startTime > 5*60;
		_cond1 || _cond2
		};
		if (isNil ("Tempmarkerpos")) exitwith {Player Sidechat format [localize "STRD_phone_callTookToLong"]; cellphoneinuse = false;};
		if (interndebug) then {player sidechat format["Tempmarkerposition is: %1", TempMarkerPos];};
		sleep 1;
		titleText [ format[localize "STRD_phone_taxiCallTitleTextNextStep"], "PLAIN DOWN"];
		sleep 1;
		if (!(createDialog "Phonecalldescriptiondialog")) exitWith {hint "Dialog Error!";};
		buttonSetAction [3, 'format["if (isTaxidriver) then {[0,1,2,[""receivecall"", ""calltaxi"", %1, %2, %3]] execVM ""CellPhoneCalls.sqf"";};","ctrlText 1", mydamnid, TempMarkerPos] call ISSE_pub_execPstr; closedialog 0; TempMarkerPos = nil; player sidechat format[ localize "STRD_phone_callsuccesfull_taxi"];'];		
		if (phonedebug) then {
			format["if (phonedebug) then {debugarray = debugarray + [ format[""%1 called for a Taxi"", %1] ];};", _rolestring] call ISSE_pub_execPstr; 		
		};
		cellphoneinuse = false;
	};
	
};


// Part on the message-receiver side
if (_basickind == "receivecall") then {
	mydamnid = nil;
	_transferedtext = _array select 2;
	_callersname = _array select 3;
	_markercreatepos = _array select 4;
	

	if (_subkind == "callpolice") then {
		_markername = call compile format["policecallmarker_%1", _callersname];
		if (phonedebug) then {
			player sidechat format["Call Received by %2: %1 <- at position: %3", _transferedtext, _callersname, _markercreatepos];
			player sidechat format["Markername is: %1", _markername];
		};
		_checkmarkerexistance = getMarkerType "_markername";
		if (_checkmarkerexistance != "") then {deleteMarkerLocal "_markername";};
		_markerrams = createMarkerLocal ["_markername", _markercreatepos];
		"_markername" setMarkershapeLocal "icon";
		"_markername" setMarkerColorLocal "ColorRed";
		"_markername" setMarkerSizeLocal [1, 1];
		"_markername" setMarkerTypeLocal "Marker";
		"_markername" setMarkerTextLocal "@STRD_phone_call_marker_desc_police";
		player sidechat format[localize "STRD_phone_call_alarm_msg_police", _callersname, _transferedtext];
		hint format [localize "STRD_phone_call_alarm_add_msg_police", _callersname];
		if (interndebug) then {
			sleep 120;
			deleteMarkerLocal "_markername";
		} else {
			sleep 600;
			deleteMarkerLocal "_markername";
		};
	};
	
	if (_subkind == "callambulance") then {
		// New to stop cops receiving civillian Medic calls (temporary) 2 Methodes choosebale - current activated way will not display calls on cop side. Other method will display medica calls from cops
		// if ((iscop) AND (_callersname in civarray) AND (not(_callersname in undercoverarray))) exitwith {};
		 if ((iscop) AND (not(player in undercoverarray))) exitwith {};
		_markernameambu = call compile format["ambulancemarker_%1", _callersname];
		if (phonedebug) then {
			player sidechat format["Call Received by %2: %1 <- at position: %3", _transferedtext, _callersname, _markercreatepos];
		};
		_checkmarkerexistance = getMarkerType "_markernameambu";
		if (_checkmarkerexistance != "") then {deleteMarkerLocal "_markernameambu";};
		_markerramsloht = createMarkerLocal ["_markernameambu", _markercreatepos];
		"_markernameambu" setMarkershapeLocal "icon";
		"_markernameambu" setMarkerColorLocal "ColorRed";
		"_markernameambu" setMarkerSizeLocal [2.3, 2.2];
		"_markernameambu" setMarkerTypeLocal "ACE_Icon_CarMedic";
		"_markernameambu" setMarkerTextLocal "@STRD_phone_call_marker_desc_medic";
		player sidechat format[localize "STRD_phone_call_alarm_msg_medic", _callersname, _transferedtext];
		if (interndebug) then {
			sleep 120;
			deleteMarkerLocal "_markernameambu";
		} else {
			sleep 600;
			deleteMarkerLocal "_markernameambu";
		};
	};
	
	if (_subkind == "calltaxi") then {
		_markernametaxi = call compile format["taxidrivermarker_%1", _callersname];
		if (phonedebug) then {
			player sidechat format["Taxi Call Received by %2: %1 <- at position: %3", _transferedtext, _callersname, _markercreatepos];
		};
		_checkmarkerexistance = getMarkerType "_markernametaxi";
		if (_checkmarkerexistance != "") then {deleteMarkerLocal "_markernametaxi";};
		_markerramsloht = createMarkerLocal ["_markernametaxi", _markercreatepos];
		"_markernametaxi" setMarkershapeLocal "icon";
		"_markernametaxi" setMarkerColorLocal "ColorYellow";
		"_markernametaxi" setMarkerSizeLocal [1.1, 1.1];
		"_markernametaxi" setMarkerTypeLocal "Destroy";
		"_markernametaxi" setMarkerTextLocal "@STRD_phone_call_marker_desc_taxi";
		player sidechat format[localize "STRD_phone_call_alarm_msg_taxi", _callersname, _transferedtext];
		hint format [localize "STRD_phone_call_alarm_add_msg_taxidriver", _callersname];
		if (interndebug) then {
			sleep 120;
			deleteMarkerLocal "_markernametaxi";
		} else {
			sleep 900;
			deleteMarkerLocal "_markernametaxi";
		};
	};


};