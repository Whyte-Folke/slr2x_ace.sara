_heli = _this;
mission1End = false;
mission2End = false;
mission3End = false;
mission4End = false;
mission5End = false;
mission6End = false;
mission7End = false;
ace_sys_wounds_enabled = true;
publicVariable 'ace_sys_wounds_enabled';
ace_wounds_prevtime = 300;
ace_sys_wounds_all_medics = true;


_missioncounter = 0;

getRandomMission=
{
		_missioncounter = round(random 7);
		hint format ["missioncounter=%1",_missioncounter];
		publicVariable 'missioncounter';
};

while{true}do{

	call getRandomMission;

	switch (_missioncounter) do {
		case 0: {hint "mission0";[] call getRandomMission;};
		case 1: {dummy = [_heli] execVM "rescuemissions\mission1.sqf";hint "mission1";waitUntil{mission1End};};
		case 2: {dummy = [_heli] execVM "rescuemissions\mission2.sqf";hint "mission2";waitUntil{mission2End};};
		case 3: {dummy = [_heli] execVM "rescuemissions\mission3.sqf";hint "mission3";waitUntil{mission3End};};
		case 4: {dummy = [_heli] execVM "rescuemissions\mission4.sqf";hint "mission4";waitUntil{mission4End};};
		case 5: {dummy = [_heli] execVM "rescuemissions\mission5.sqf";hint "mission5";waitUntil{mission5End};};
		case 6: {dummy = [_heli] execVM "rescuemissions\mission6.sqf";hint "mission6";waitUntil{mission6End};};
		case 7: {dummy = [_heli] execVM "rescuemissions\mission7.sqf";hint "mission7";waitUntil{mission7End};};
	};
};