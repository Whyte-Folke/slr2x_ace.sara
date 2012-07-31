// Bank Rob script
// bankRob.sqf

GovmentLooses = 0;
_array = _this select 3;
_art   = _array select 0;
_cops = 0;

if (_art == "ausrauben") then
{	
	if (robb_possible == 0) exitWith {player groupChat localize "STRS_bank_rob_no";};
	for [{_i=0}, {_i < (count coparray)}, {_i=_i+1}] do {
	if (format ["%1", (coparray select _i)] call ISSE_UnitExists) then {_cops = _cops + 1};};
	if (_cops < 2) exitWith {player groupChat "There has to be at least 2 cops on duty to rob the bank"};
	if (!(call INV_isArmed)) exitWith {player groupChat localize "STRS_bank_rob_noweapon";};
	robb_possible = 0;
	player groupChat format[localize "STRS_bank_rob_info", (robb_money call ISSE_str_IntToStr)];
	"[] spawn Bank_Rob_Start_Script" call Isse_Pub_execPstr;
	_scriptabbruch = 0;
	for [{_i=0}, {_i < 30}, {_i=_i+1}] do
	{
		if ((player Distance MainBank >=10) or ((isstunned) or (playerpunched))) exitWith
		{
			player groupChat format[localize "STRS_bank_rob_nosuccess"]; 
			_scriptabbruch = 1;
		};
		sleep 1;											
	};									
	if (_scriptabbruch == 1) exitWith {};
	if (alive player) then
	{
		_erbeutet = round(robb_money*playercount*((random 1)+0.5));
		['illegal_money', (_erbeutet)] call INV_AddInventoryItem;
		//kontostand = 0;
		player groupChat format[localize "STRS_bank_rob_success"];
		[_erbeutet] spawn Bank_Rob_End_Script;
		//[] spawn Bank_Rob_End_Script;
	};
	local_useBankPossible = false;
	sleep robb_timeSperre;
	local_useBankPossible = true;
};	
if (_art == "opfer") then
{
	if (isServer) exitWith
	{	
		GovmentLooses = 0;
		[] spawn Bank_Rob_Server_looses_money;
		robb_possible = 0;
		publicVariable "robb_possible";
		sleep (robb_timeSperre/2);
		robb_possible = 1;
		publicVariable "robb_possible";
		
	};
	_verlust = round(Kontostand/BankRaubProzentVerlust);
	if ((Kontostand <= _verlust) and (Kontostand >= 1) and (('bankversicherung' call INV_GetItemAmount) == 0)) then
	{
		Kontostand = 0;
		player groupChat localize "STRS_bank_rob_allmoneylost";
	};
	if ((Kontostand >  _verlust) and (('bankversicherung' call INV_GetItemAmount) == 0)) then
	{
		Kontostand = Kontostand - _verlust;
		player groupChat format[localize "STRS_bank_rob_somemoneylost", (_verlust call ISSE_str_IntToStr), (Kontostand call ISSE_str_IntToStr)];			
	};															
	if (('bankversicherung' call INV_GetItemAmount) > 0) then
	{
		player groupChat localize "STRS_bank_rob_lostnomoney";
		['bankversicherung', -(1)] call INV_AddInventoryItem;				
	};
};
