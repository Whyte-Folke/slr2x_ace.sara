_radiotrackarray = ["Ambient02_Vague_Shapes"];

_tracknumber     = (floor(random (count _radiotrackarray)));
_track           = _radiotrackarray select _tracknumber;

playMusic "Ambient02_Vague_Shapes";
2 fadeSound 0;
10 fadeMusic 1;
_kameraende = 0;
deadcam     = 1;
_deadtime   = (time+DeadWaitSec);
_camera = "camera" camcreate [(getpos role select 0),(getpos role select 1)+10,(getpos role select 2)];
_camera cameraEffect ["internal", "back"];
_camera camSetPos [(getpos role select 0),((getpos role select 1)+10),(getpos role select 2)];
_camera camSetTarget role;
_camera camSetFOV 0.700;
_camera camCommit 0;
waitUntil {camCommitted _camera};
_camera camSetPos [(getpos role select 0),((getpos role select 1)+10),(getpos role select 2)];
_camera camSetTarget role;
_camera camSetFOV 0.700;
_camera camCommit 10;

waitUntil {camCommitted _camera};

camera camPreload 5;
waitUntil {camPreloaded _camera};
_camera camSetPos (deadcam_position_array select deadcam_kameraposition);
_camera camSetTarget (deadcam_target_array select deadcam_kameraposition);
_camera camSetFOV 0.700;
_camera camCommit 0;
waitUntil {camCommitted _camera};

if (iscop) then 
{														

titleText [format[localize "STRS_deadcam_deadwait_cop", CivsKilled+CopsKilled, round(DeadWaitSec)], "plain"];

} else {				

titleText [format[localize "STRS_deadcam_deadwait_civ", deadtimes, round(DeadWaitSec)], "plain"];

};

while {true} do 
{									
deadcam_kameraposition = deadcam_kameraposition + 1;			

if (count deadcam_position_array <= deadcam_kameraposition) then 
{								
deadcam_kameraposition = 0;				
};											

_kamerapos    = deadcam_position_array select deadcam_kameraposition;											
_kameratarget = deadcam_target_array   select deadcam_kameraposition;											

if (_deadtime < time) exitWith {deadcam = 0;};								
_camera camSetPos _kamerapos;							
_camera camSetTarget _kameratarget;											
_camera camSetFOV 0.700;				
_camera camCommit deadcam_wechsel_dauer;										

	waitUntil {(camCommitted _camera) or (_deadtime < time)};};
	
	_camera cameraEffect ["terminate","back"];
	titleCut [" ","Black in",1];
	camDestroy _camera;
	10 fadeMusic 0;
     2 fadeSound 1;