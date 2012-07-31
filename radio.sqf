_radiotrackarray    = ["ATrack1","ATrack2","ATrack3","ATrack4","ATrack5","ATrack6","ATrack7","ATrack8","ATrack23","ATrack23B","ATrack24","ATrack25","ATrack27","ATrack18"];

if (isNil "RADIO_radioan") then {RADIO_radioan = 0;};

if (RADIO_radioan == 0) then 
{		
RADIO_radioan = 1;								
_radioposition = getpos player;											
playmusic ( _radiotrackarray select (floor(random(count _radiotrackarray))) );;							
3 FadeMusic 1;													
_x = time;					
waituntil {(RADIO_radioan == 0) or (_x+300<time) or (vehicle player distance _radioposition > 75)};									
playmusic "";									
RADIO_radioan = 0;

} else {														

RADIO_radioan = 0
;};