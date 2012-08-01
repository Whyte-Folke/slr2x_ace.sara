// Refuel Action at Fuelstations
// refuelActions.sqf

_a1 = 0;
_v1 = 0;
_f1 = 0;
while {true} DO {
	for [{_i=0}, {_i < (count TankstellenArray)}, {_i=_i+1}] do {
	_flag = (TankstellenArray select _i);
	if ((vehicle player != player) and (vehicle player distance _flag <= 10) and (_a1 == 0)) then {
		action_tankstelle = vehicle player addAction [format [localize "STRS_addAction_buy_gas", TankenCost, TankenTaxCost],"refuel.sqf"];
		_a1 = 1; 
		_v1 = vehicle player; 
		_f1 = _i;
	};						
	if (((vehicle player == player) or (vehicle player distance _flag > 10)) and (_f1 == _i) and (_a1 == 1)) then {
		_v1 removeAction action_tankstelle;
		_a1 = 0;
	};						
     };											
sleep 3;
};