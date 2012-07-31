_car = vehicle player;
_victim = player;

player action ["eject", _car];
if (alive player) then
{
	sleep 0.5;
	(format ["%1 switchmove ""%2"";", player, "AmovPercMrunSlowWrflDf_AmovPpneMstpSrasWrflDnon"]) call ISSE_pub_execPstr;
};