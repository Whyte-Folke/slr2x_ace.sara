_args = _this select 3;
_heli = _args select 0;
_bag  = _this select 0;
_actionid = _this select 2;

_bag attachTo [player,[0,0.75,1.2]];

_bag removeaction _actionid;

waitUntil{player distance _heli < 5};
_action = _heli addAction["Drop Bag in Heli","rescuemissions\detachbags.sqf",[_bag],6,false,true,"",""];