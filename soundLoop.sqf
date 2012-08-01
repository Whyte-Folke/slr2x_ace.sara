// JBOY_soundLoop.sqf 
// Version 0.6
// by johnnboy, modified and used for the Car Alarm of SLR by MAD T (year 2010)

_obj = _this select 0;
_sound = _this select 1;
_lengthInSeconds = _this select 2;
_maxPlays = _this select 3;
_exitvar = false;

call compile format ["if (%1_alarm_active) exitWith {_exitvar = true}", _obj];
if (_exitvar) exitWith {};
call compile format ["%1_alarm_active = true", _obj];

// We won't play the sound if player is further than this away.
_toggleOffDistance = 500;

_i = 0;

while { (alive _obj) and ((_i < _maxPlays) or (_maxPlays == -1)) } do
{
	
	if ((_obj distance player) < _toggleOffDistance) then
	{
		_obj say _sound;
		sleep _lengthInSeconds;
	};
	_i = _i + 1;
};
sleep 90;
call compile format ["%1_alarm_active = false", _obj];

