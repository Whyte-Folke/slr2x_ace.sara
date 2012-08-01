private ["_fog","_pos","_rain","_rainmarkt","_rainy_height","_rainy_width","_rainy2_height","_rainy2_width","_rainy3_height","_rainy3_width","_trigger_side","_world_center","_x","_y"];
if (!d_weather) exitWith {};

if (d_weather_sandstorm) then {
	d_weather_fog = false;
	if (isNil "x_sandstorm_type") then {x_sandstorm_type = 1;};
};

if (isNil "x_weather_array") then {
	waitUntil {!isNil "x_weather_array"};
};

_world_center = getArray(configFile>>"CfgWorlds">>worldName>>"centerPosition");
_x = (_world_center select 0) * 2;
_y = (_world_center select 1) * 2;

_pos = [0,0,0]; // defining pos out of a closed statement.

_trigger_side = format ["%1",playerSide];

_rainy_height = floor (_y / 7);
_rainy_width = floor (_x / 9);
_rainy2_height = floor (_y / 9);
_rainy2_width = floor (_x / 21);
_rainy3_height = _rainy2_height;
_rainy3_width = _rainy2_width;
	
// Weather triggers
rainy = createTrigger["EmptyDetector" ,(x_weather_array select 0)];
rainy setTriggerArea [_rainy_width, _rainy_height, 148.438, false];
rainy setTriggerActivation [_trigger_side, "PRESENT", false];
rainy setTriggerStatements["this", "", ""];

rainy2 = createTrigger["EmptyDetector" ,(x_weather_array select 1)];
rainy2 setTriggerArea [_rainy2_width, _rainy2_height, -413.41, false];
rainy2 setTriggerActivation [_trigger_side, "PRESENT", false];
rainy2 setTriggerStatements["this", "", ""];

rainy3 = createTrigger["EmptyDetector" ,(x_weather_array select 2)];
rainy3 setTriggerArea [_rainy3_width, _rainy3_height, 45, false];
rainy3 setTriggerActivation [_trigger_side, "PRESENT", false];
rainy3 setTriggerStatements["this", "", ""];

if (d_weather_fog) then {
	foggy = createTrigger["EmptyDetector" ,(x_weather_array select 3)];
	foggy setTriggerArea [_rainy3_width, _rainy3_height, 0, false];
	foggy setTriggerActivation [_trigger_side, "PRESENT", false];
	foggy setTriggerStatements["this", "", ""];
};

_color = (
	if (!d_weather_sandstorm) then {
		"ColorBlack"
	} else {
		"ColorYellow"
	}
);
["rainmark", (x_weather_array select 0),"ELLIPSE",_color,[_rainy_width, _rainy_height],"",148.438,"","Solid"] call XfCreateMarkerLocal;
_text = (
	if (!d_weather_sandstorm) then {
		"Cloudy"
	} else {
		"Sandstorm"
	}
);
["rainmarkt", _pos,"ICON","ColorBlack",[0, 0],_text,0,"DOT"] call XfCreateMarkerLocal;

["rainmark2", (x_weather_array select 1),"ELLIPSE",_color,[_rainy2_width, _rainy2_height],"",-413.41,"","Solid"] call XfCreateMarkerLocal;
["rainmarkt2", _pos,"ICON","ColorBlack",[0, 0],_text,0,"DOT"] call XfCreateMarkerLocal;

["rainmark3", (x_weather_array select 2),"ELLIPSE",_color,[_rainy3_width, _rainy3_height],"",45,"","Solid"] call XfCreateMarkerLocal;
["rainmarkt3", _pos,"ICON","ColorBlack",[0, 0],_text,0,"DOT"] call XfCreateMarkerLocal;

//if (d_weather_fog) then {
//	["fogmark", (x_weather_array select 3),"ELLIPSE","ColorWhite",[_rainy3_width, _rainy3_height],"",0,"","Solid"] call XfCreateMarkerLocal;
//	["fogmarkt", _pos,"ICON","ColorBlack",[0, 0],"Fog",0,"DOT"] call XfCreateMarkerLocal;
//	execVM "weather\fog.sqf";
//};
if (!d_weather_sandstorm) then {
	execVM "weather\rain.sqf";
} else {
	x_dosandstorm = compile preprocessFile "weather\x_dosandstorm.sqf";
	switch (x_sandstorm_type) do {
		case 1: {execVM "weather\x_sandstorm.sqf";};
		case 2: {execVM "weather\x_sandstorm1.sqf";};
		case 3: {execVM "weather\x_sandstorm2.sqf";};
		case 4: {execVM "weather\x_sandstorm3.sqf";};
	}
};

if (true) exitWith {};