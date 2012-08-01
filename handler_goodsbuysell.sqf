// handler_goodsbuysell.sqf
// calls alot of good,shops,factory related defining scripts

if ((isServer) or (Server_Client)) then {
	// Disabled and moved into JIP script
	//["serverloop"] execVM "saveObjVeh.sqf";
};
if ((!isServer) or (Server_Client)) then
{	
	[] execVM "goodsArray.sqf";
	[] execVM "shopDefine.sqf";
	[] execVM "factoryDetails.sqf";
	[] execVM "licenceDetails.sqf";
	[] execVM "someItemsScript.sqf";
};