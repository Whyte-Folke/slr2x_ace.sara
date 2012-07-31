//Beam yourself away from Trained Terrorshop if you are not a Trained terrorist....
// if (isServer) exitWith {};

while {true} do {	
	if ((not(isterrorist)) and (player distance gunbox_terrorbox_logic < 10)) then {
		player setpos [ getPos player select 0, (getPos player select 1) +10, getPos player select 2];
		player groupchat localize "STRS_not_trained_terrorist_for_shop";
	};
	sleep 1;
};