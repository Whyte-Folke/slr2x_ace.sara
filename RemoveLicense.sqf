_array = _this select 3;
_art  = _array select 0;

 
 if (_art == "SelectCiv") then 
 {		
     _array = _this select 3;
	 
   RemoveLicenseArray = [];
     
     
     _SelectedCiv = lbCurSel 5002;
     _GetCivData = lbData [5002, _SelectedCiv];
     _value = lbValue [5002, _SelectedCiv];
     
     CivArrPlayer = playerstringarray select _value;
    
     
    lbclear 5003;
      
    DFS_RemLicReady = false;
	
    (format ['if (player == %1) then { [0,0,0,["GetLicenses"]] execVM "RemoveLicense.sqf"; };', CivArrPlayer]) call ISSE_pub_execPstr;

	waitUntil {DFS_RemLicReady};

  	for [{_i=0}, {_i < (count RemoveLicenseArray)}, {_i=_i+1}] do 
     	{
		LicenseName = (RemoveLicenseArray select _i);
		
		lbAdd [5003, format ["%1", (LicenseName call INV_GetLicenseName)]];
		lbSetData [5003, _i, format["%1", LicenseName]];
		lbsetValue[5003, _i, _i];	
	};
};

if (_art == "GetLicenses") then
{
	RemoveLicenseArray = INV_LizenzOwner;
	publicVariable "RemoveLicenseArray";
	
	
	DFS_RemLicReady = true;
	publicVariable "DFS_RemLicReady";
};

if (_art == "SelectLicense") then
{
	SelectedLicense = lbCurSel 5003;
	CivLicense = lbData[5003, SelectedLicense];
	LicensePos = lbvalue[5003, SelectedLicense];
	_NamePlayer = name player;
	_GetLicense = (CivLicense call INV_GetLicenseName);
	 publicvariable "CivLicense";
	
	
	(format ['hint "The Chief of police (%2) has removed the license - \n%3\nfrom %1"; if (player == %1) then {  [0,0,0,["RemoveLicense", CivLicense]] ExecVM "RemoveLicense.sqf"; };', CivArrPlayer, _NamePlayer, _GetLicense]) Call ISSE_Pub_execPstr;
	
	
};

if (_art =="RemoveLicense") then
{	
		CivLicense = _array select 1;
	    	_GetLicense = (CivLicense call INV_GetLicenseName);
	   
  		 INV_LizenzOwner = INV_LizenzOwner - [ CivLicense ];
   		player groupchat format [localize "STRS_remove_License",  _GetLicense];
   		["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar;
	
};