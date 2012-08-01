// Intro Details
// introCam.sqf

//noIntro = true;
if (noIntro) exitWith {};
_label = _this select 0;

playmusic "Track08_Harvest_Red";
0 fadeMusic 1;
2 fadeSound 0;

// Set up Camera Locations
supporterarray = [localize "STRS_mission_supporter1", 	localize "STRS_mission_supporter2", localize "STRS_mission_supporter3", localize "STRS_mission_supporter4", localize "STRS_mission_supporter5",	localize "STRS_mission_supporter6",localize "STRS_mission_supporter7",localize "STRS_mission_supporter8",localize "STRS_mission_supporter9",localize "STRS_mission_supporter10"];
supporterarray = supporterarray + [localize "STRS_mission_supporter_ende"];
_camposarray    = [[[14330.06,12642.61,2.00],[14328.93,12642.81,2.00],[14311.31,12539.76,2.00]],[[14602.66,11895.83,1.34],[14603.30,11896.25,1.35],[14458.85,12146.24,6.27]],[[14017.98,12810.55,3.39],[14017.81,12810.36,5.40],[14393.25,12295.34,6.93]],[[13364.71,12444.43,1.46],[13479.10,12439.78,25.47],[13997.24,12433.71,71.45]],[[14168.17,12533.66,21.09],[14216.27,12494.76,12.74],[14304.31,12489.49,12.74]]];
_camtargetarray = [[[-2502.96,-85926.08,970.89],[-2502.96,-85926.08,970.71],[-2502.96,-85926.08,970.83]],[[-7752.22,109364.09,499.85],[-33128.34,99772.45,500.01],[-54998.69,84083.87,501.86]],[[72733.41,-67737.70,-7943.34],[72734.69,-67739.45,-7943.49],[72734.69,-67739.45,-7943.56]],[[104921.23,50366.22,-13277.30],[112563.41,11279.45,-13291.00],[112563.41,11279.45,-13290.99]],[[54192.77,-20235.30,85642.07],[91240.93,-50567.42,-8775.37],[1861.32,-86401.73,-8076.16]]];
_camfovarray    = [[0.700,0.700,0.700],[0.010,0.172,0.700],[0.010,0.700,0.700],[0.084,0.700,0.700],[0.010,0.700,0.700]];
_camcivarray    = [[[-40971.42,-64103.16,-32871.61],[14295.46,12454.12,21.87],0.700],[[8997.33,12363.52,-99728.00],[14279.08,12408.92,93.38],0.700],[[-1799.84,28351.52,-97285.40],[14275.97,12411.63,78.75],0.700],[[61063.85,-7505.19,-85960.38],[14234.92,12424.32,71.69],0.700],[[-32148.02,-60874.53,-49581.26],[14305.14,12458.95,32.41],0.700]];
_camcoparray    = [[[-48895.43,89310.20,-11492.14],[13963.40,12404.30,34.35],0.665],[[-48895.43,89310.20,-11492.14],[13963.40,12404.30,34.35],0.665],[[-48895.43,89310.20,-11492.14],[13963.40,12404.30,34.35],0.665],[[-48895.43,89310.20,-11492.14],[13963.40,12404.30,34.35],0.665],[[-48895.43,89310.20,-11492.14],[13963.40,12404.30,34.35],0.665]];

if (_label == "texte") then
{
	sleep 5;
	call compile format ["%1", "disableUserInput false"];
	titletext ["Server forums located at NSS-gamers.forumatic.com","plain"];
	sleep 5;
	titletext [localize "STRS_anfang_03","plain"];
	sleep 3;
	titletext [localize "STRS_anfang_04","plain"];
	sleep 11;
	if (isCop) then
	{
		titletext [localize "STRS_anfang_05_cop","plain"];
	}
	else
	{
		titletext [localize "STRS_anfang_05_civ","plain"];
	};
};

if (_label == "kamera") then
{	
	private ["_camTargets", "_camPos", "_camPrepared"];
	//_camTargets = [];
	//_camPos = [];
	//_camPrepared = [];
	if (side player == west) then //Cop intro
	{
		_camTargets = [[32400.45,111175.85,39.85],[32400.45,111175.85,39.88],[32101.47,111267.72,-660.48],[2884.49,112434.31,-661.18],[18589.04,113076.88,6050.01],[10376.27,113147.66,6051.50]];
		_camPos = [[13939.60,12894.64,2.22],[13939.60,12894.64,1.28],[13935.38,12934.07,1.56],[13937.93,13073.28,9.84],[13906.42,13368.66,1.19],[13906.70,13396.90,1.25]];
		_camPrepared = [10,1,3,4,5,5];
	}
	else //Civ intro
	{
		_camTargets = [[9316.13,112099.52,57.36],[9316.13,112099.52,57.61],[-45833.03,92063.84,59.74],[-45388.75,91476.32,-12601.53],[-85659.60,14968.68,390.50],[-85659.60,14968.68,390.49]];
		_camPos = [[14416.69,12229.60,2.22],[14416.69,12229.60,1.28],[14417.79,12254.18,13.53],[14315.13,12394.42,6.24],[14307.00,12408.06,2.67],[14287.84,12408.50,2.67]];
		_camPrepared = [10, 1, 3, 5, 3, 5];
	};
	//titleCut ["","Black out",0];
	//titleText [localize "STRS_anfang_laden","plain"];
	waitUntil {alive player};
	_camera = "camera" camCreate (_camPos select 0);
	_camera cameraEffect ["internal", "back"];
	//sleep 5;
	titlecut ["","Black in", 20];
		
	for [{_i=0}, {_i < (count _camTargets -1)}, {_i=_i+1}] do
	{
		
		_camera camPrepareTarget (_camTargets select _i);
		_camera camPreparePos (_camPos select _i);
		_camera camPrepareFOV 0.700;
		_camera camCommitPrepared (_camPrepared select _i);
		waitUntil {camCommitted _camera};
	};

	_camera camPrepareTarget (_camTargets select (count _camTargets -1));
	_camera camPreparePos (_camPos select (count _camPos -1));
	_camera camPrepareFOV 0.700;
	_camera camCommitPrepared (_camPrepared select (count _camPrepared -1));

	sleep 5;
 if (!(createDialog "Login_Dialog")) exitWith 
 {
 hint "Dialog Error!";
 };
 
 
	sleep 2;
	_camera cameraeffect ["terminate","back"];
	camDestroy _camera;
	titlecut [" ","Black in",5];
    SLR_gIntroFinished = true;
    10 fadeMusic 0;
    2 fadeSound 1;
};





