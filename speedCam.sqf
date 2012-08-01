//Speedcam for SLR by MAD T (year 2010)
_art = _this select 0;

if (_art == "use") then 
{
if (!(iscop)) exitWith {player groupChat "Only cops have the ability to use speed cams"};
if (!(createDialog "speedcam_dialog")) exitWith {hint "Dialog Error!";};
		sliderSetRange [1, 10, 125];
		sliderSetSpeed [1, 1, 10];
		buttonSetAction [4, "[""place"", sliderPosition 1] execVM ""speedCam.sqf""; closedialog 0;"];
		while {ctrlVisible 1011} do {
		ctrlSetText [3, format["%1 KM/H", (round(sliderPosition 1))]];
		sleep 0.3;
		};
};

if (_art == "place") then 
{
if (player != vehicle player) exitWith {player groupChat "You have to be on food"};
player groupChat "You have placed a speed camera. If you previously had one before it has now been deactivated.";
['SpeedCam', -1] call INV_SetItemAmount;
speedlimit = round(_this select 1);
speedcam_triggered = false;
speedcam_active = false;
deleteVehicle speedcam_trigger;
_pos_cam = [0,1,0];
speedcam = "Camera1" createVehicle (player modelToWorld _pos_cam);
speedcam setVehicleInit "this addaction [""Take Speed Cam"", ""somecompile.sqf"", ""[""""take""""] execVM """"speedCam.sqf""""""]";
processInitCommands;
speedcam setDir (getDir player - 180);
speedcam setPos (player modelToWorld _pos_cam);
format ["%1 playMove ""AinvPknlMstpSlayWrflDnon_medic""", player] call ISSE_pub_execPstr;
_pos_trigger = [0,6,0];
speedcam_trigger = createTrigger["EmptyDetector", player modelToWorld _pos_trigger];
speedcam_trigger setPos (player modelToWorld _pos_trigger);
speedcam_trigger setDir (getDir player);
speedcam_trigger setTriggerArea[5,10,0,false];
speedcam_trigger setTriggerActivation["ANY","PRESENT",true];
speedcam_trigger setTriggerStatements["call {if (count thislist > 0) then {{if (speed vehicle _x > speedlimit) then {car = vehicle _x; speed_car = speed vehicle _x; [""trigger"", speed_car, car] execVM ""speedCam.sqf"";}} forEach thislist};false};", "", ""];
speedcam_active = true;
while {speedcam_active} do 
{
if ((getDammage speedcam > 0) or (!(alive speedcam))) then 
{
deleteVehicle speedcam_trigger;
speedcam_active = false;
};
sleep 1;
};
};

if (_art == "trigger") then 
{
if (speedcam_triggered) exitWith {};
_speed = round (_this select 1);
_vehicle = _this select 2;
_driver = driver (_this select 2);
if ((_driver != vehicle _driver) and (side _driver != west) and ((getpos _vehicle select 2) < 2)) then {
format ["server globalchat ""CAMERA %5 CAUGHT %1 DOING %2 KM/H IN A %3 KM/H AREA""; if (player in %4) then {[""victim""] execVM ""speedCam.sqf""};", name(_driver), round(_speed), speedlimit, _vehicle, rolenumber-(20)] call Isse_Pub_execPstr;
speedcam_triggered = true;
sleep 10;
speedcam_triggered = false;
};
};

if (_art == "victim") then 
{
cutText ["","WHITE IN",1];
};

if (_art == "take") then 
{
if (!(speedcam_take)) then
{
speedcam_take = true;
_speedcam = nearestObject [player, "Camera1"];
deletevehicle _speedcam;
['SpeedCam', 1] call INV_SetItemAmount;
sleep 5;
speedcam_take = false;
};
};