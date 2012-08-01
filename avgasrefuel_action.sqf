// Refuel Action at AVGas-Fuelstations
// avgasrefuel_action.sqf

_a1 = 0;
_v1 = 0;
_f1 = 0;
while {true} DO 
{
	for [{_i=0}, {_i < (count AVGAS_TankstellenArray)}, {_i=_i+1}] do 
	{
	_flag = (AVGAS_TankstellenArray select _i);
	if ((vehicle player != player) and (vehicle player distance _flag <= 13) and (_a1 == 0)) then 
	{
		action_avtankstelle = vehicle player addAction [format [localize "STRS_addaction_buy_AVgas", AVGAS_TankenCost, AVGAS_TaxTankenCost],"avgasrefuel.sqf"];
		_a1 = 1;  
		_v1 = vehicle player;
		_f1 = _i;
	};						
	if (((vehicle player == player) or (vehicle player distance _flag > 13)) and (_f1 == _i) and (_a1 == 1)) then 
	{
		_v1 removeAction action_avtankstelle;
		_a1 = 0;
	};						
    };											
sleep 3;
};