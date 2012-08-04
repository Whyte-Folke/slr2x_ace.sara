_heli = _this select 0;
_args = _this select 3;
_bag = _args select 0;
_actionid = _this select 2;

hint "DETACH started";

detach _bag;
sleep 1;

_bag attachTo [_heli,[0,4,-1.3]];

_heli removeAction _actionid;

hint "Bag attached";