// Basic Variables for Players and Wanted Status. Also checks which License a player owns and sets then a variable for further use on paychecks, etc.
// loopChecks.sqf

_a1 = 0;
_a3 = 0;
_a3 = 0;
_a4 = 0;
_a5 = 0;
_a6 = 0;
_a7 = 0;
_a8 = 0;
_a9 = 0;
_TerrorcivSetWanted   = 0;
_art = _this select 0;

/* This loop has a shorter sleep time than the other loops */
if (_art == "clientStateLoop") then {
    if (isNil "SLR_var_isRestrained") then {
     	SLR_var_isRestrained = false;   
        
    };
    
	while {true} do {
        _animation = animationState player;
        
        if (_animation == "ace_keycuffed_loop") then {
        	if (!(SLR_var_isRestrained)) then {
            	/* Restrain the player */  
               	[] spawn SLR_fnc_restrain;
            };
        } else {
        	if (SLR_var_isRestrained) then {
            	/* Unrestrain the player */   
                SLR_var_isRestrained = false;
            };
        };
        
        
    	sleep 1;    
    };
};

_money = 'money' call INV_GetItemAmount;
if (_art == "clientloop2") then {	
	while {true} do {
		coparray		= [cop1, cop2, cop3, cop4, cop5, cop6, cop7, cop8, cop9, cop10, cop11, cop12];
		civarray		= [civ1, civ2, civ3, civ4, civ5, civ6, civ7, civ8, civ9, civ10, civ11, civ12, civ13, civ14, civ15, civ16, civ17, civ18, civ19, civ20];
		playerarray		= [civ1, civ2, civ3, civ4, civ5, civ6, civ7, civ8, civ9, civ10, civ11, civ12, civ13, civ14, civ15, civ16, civ17, civ18, civ19, civ20, cop1, cop2, cop3, cop4, cop5, cop6, cop7, cop8, cop9, cop10, cop11, cop12];
		
Civilian setFriend [West, 1];
WEST setFriend [Civilian, 1];

RESISTANCE setFriend [West, 1];
WEST setFriend [RESISTANCE, 1];

RESISTANCE setFriend [Civilian, 1];
Civilian setFriend [RESISTANCE, 1];

RESISTANCE setFriend [EAST, 1];
EAST setFriend [RESISTANCE, 1];
		
		{if ((player distance (_x select 0)) < (_x select 1)) then {timeinworkplace = timeinworkplace + 5.019;};} forEach workplacearray;
		
		if (hideout_abgeschlossen) then {
			{
				if ((_x distance hideout_hideoutobj < 25) and (not(_x == player)) and (alive _x) and (not(_x in hideout_einbrucharray))) then {
					player groupChat format[localize "STRS_hideout_locked_entered", _x];
					hideout_einbrucharray = hideout_einbrucharray + [_x];
				};
			}
		
			forEach playerarray;
		
			{if (_x distance hideout_hideoutobj >= 25) then {hideout_einbrucharray = hideout_einbrucharray - [_x];};}forEach hideout_einbrucharray;
		};
		
		if ((not(iscop)) and (player DISTANCE terrorhideoutlogic <= 200) and (alive player) and (_TerrorcivSetWanted == 0)) then {
			player groupChat localize "STRS_check_civ_in_terrorbase";
			(format ["civ%1_wanted = 1; [""terrorIn"", %2] spawn Isse_AddCrimeLogEntry;", rolenumber, player]) call ISSE_pub_execPstr;
			_TerrorcivSetWanted = 1;
		};
		
		if ((_TerrorcivSetWanted == 1) and (player distance terrorhideoutlogic > 200)) then {
			_TerrorcivSetWanted = 0;
		};
		
		if (((rolecop == 1) and (player distance terrorhideoutlogic <= 215)) or ((player distance deadcamlogic < 400) and (deadcam == 0) and (rolecop == 0)) or ((rolecop == 0) and (player distance copbase1 <= 125) and (deadcam == 0))) then {
			if (alive player) then {titleText [localize "STRS_prohibited_area", "plain"];};
		};
		
		if (((player distance deadcamlogic < 200) and (deadcam == 0)) or ((not(iscop)) and (player distance copbase1 <= 110) and (deadcam == 0)) or ((iscop) and (player distance terrorhideoutlogic <= 250)) or ((not(iscop)) and (player distance borderpatrol <= 36))) then {
			if (alive player) then {call TeleBackFunction;};
		};
		
		// Check if player owns terrorlicense and if yes, set to terrorist = true for further use of that variable.
		if ("terrorist_license" call INV_HasLicense) then {
			isTerrorist = true;
			roleterrorist = 1;
		} else {
			isTerrorist = false;
			roleterrorist = 0;
		};
		// Check if player has the Ambulance Training:
		if ("medic" call INV_HasLicense) then {
			isAmbulance = true;
            //player setVariable ["ace_w_ismedic", true];
		} else {
			isAmbulance = false;
            //player setVariable ["ace_w_ismedic", false];
		};
		// Check if player owns Patrol-Cop Training
		if ("patrol_training" call INV_HasLicense) then {
			isPatrolOfficer = true;
			rolePatrolOfficer = 1;
		} else {
			isPatrolOfficer = false;
			rolePatrolOfficer = 0;
		};
		// Check if player owns Criminal-Response Training
		if ("response_training" call INV_HasLicense) then {
			isCroOfficer = true;
			roleCroOfficer = 1;
		} else {
			isCroOfficer = false;
			roleCroOfficer = 0;
		};
		// Check if player owns SWAT License
		if ("swat_training" call INV_HasLicense) then {
			istrainedSwat = true;
			roletrainedSwat = 1;
		} else {
			istrainedSwat = false;
			roletrainedSwat = 0;
		};
		// Check if player owns Bodyguard License
		if ("bodyguard_license" call INV_HasLicense) then {
			isBodyguard = true;
			roleBodyguard = 1;
		} else {
			isBodyguard = false;
			roleBodyguard = 0;
		};
		// Checks if player has at least one cellphone:
		if (("handy" call INV_GetItemAmount) >  0) then {
			iHaveaCellPhone = true;
		} else {
			iHaveaCellPhone = false;
			
		};
		// Checks if you have a Taxidriver Licence
		if ("taxidriver_license" call INV_HasLicense) then {
			isTaxidriver = true;
		} else {
			isTaxidriver = false;
		};
		if (player call ACE_fnc_HasRuck) then {
			INV_Tragfaehigkeit = 70;
		} else {
			INV_Tragfaehigkeit = 25;
		};
		// Auto-Repair Critical Buildings
		{ if ((!(alive _x)) or (damage _x > 0.4)) then { _x setDamage 0; };} forEach [RepairBuilding1, RepairBuilding2, rathaus, RepairBuilding4, RepairBuilding5, RepairBuilding6, RepairBuilding7, RepairBuilding8, RepairBuilding9, RepairBuilding10, RepairBuilding11, RepairBuilding12, RepairBuilding13, RepairBuilding14, RepairBuilding15, RepairBuilding16, RepairBuilding17, RepairBuilding18, RepairBuilding19, cophospitaltent, hospitaltent, jail_zelt5, hospitaltent2, bagango_shop, gunlogic5, obregan_shop, RepairBuilding20, RepairBuilding21, RepairBuilding22, RepairBuilding23, eponia_shop, mercalillo_shop, gunlogic1, gunlogic2, pita_shop, gunlogic7, masbete_shop, corazol_shop, RepairBuilding24, masbete_shop_house, RepairBuilding25, RepairBuilding26, civstorage];
		
		if ((alive player) and (DeadWaitSec > (respawnzeit+deadtimebonus))) then {
			DeadWaitSec = DeadWaitSec - deadtimebonus;
		};
				
		if (_money < 0) then {['money', 0] call INV_SetItemAmount;
		_money = 0;};

		// Inform Player they have Exceeded Max Money
		if (Kontostand > money_limit) then {
			Kontostand = money_limit;
			player groupChat localize "STRS_maxmoney";
		};
		
		if (_money > money_limit) then {
			['money', money_limit] call INV_SetItemAmount;
			player groupChat localize "STRS_maxmoney";
		};
        
        if (!(player hasWeapon "ItemRadio")) then {
       		player addWeapon "ItemRadio";
        };
        
        _hasMask = player getVariable "ACE_Identity";
        if (_hasMask == "ACE_GlassesBalaklava") then {
            if (!(SLR_hasMask)) then {
              player setVariable["ACE_Identity", _hasMask, true];
                SLR_hasMask = true;  
            };
        } else {
            if (SLR_hasMask) then {
                player setVariable["ACE_Identity","", true];
            	SLR_hasMask = false;  
            }; 
        };
		
		{if ((rating _x) < 0) then {
			_x addRating (abs (rating _x));
		}; if ((score _x) < 0)  then {
			_x addScore  (abs (score _x)); 
		};} forEach playerarray;
		
		if ((daytime >  20) or (daytime <  6)) then {night = 1;} else {night = 0;};
		// VAT-Taxes for fuel and Airtaxi
		airtaxitaxes			= round((airtaxicost / 100) * ((INV_ItemTypenArray select 1) select 2));
		TankenTaxCost    		= (TankenCost*GblFuelTaxes) / 100;
		AVGAS_TaxTankenCost  		= (AVGAS_TankenCost*GblFuelTaxes) / 100;
		
		sleep 5;
	};
};
	
if ((_art == "serverloop1") and (isServer)) then {
	_account_check_array = "";
	while {true} do {
		for [{_i=0}, {_i < (count publicarbeiterarctionarray)}, {_i=_i+1}] do {
			if ( (not((format["%1", ((publicarbeiterarctionarray select _i) select 1)]) call ISSE_UnitExists)) or (isNull((publicarbeiterarctionarray select _i) select 0)) ) then {
				if (debug) then {
					debugarray = debugarray + [ format["Deleting worker (%1).", publicarbeiterarctionarray] ];
				};
				if (not(isNull((publicarbeiterarctionarray select _i) select 0))) then {
					_worker = ((publicarbeiterarctionarray select _i) select 0);
					_worker Action ["eject", (vehicle _worker)];
					_worker setVehicleinit "";
					deletevehicle _worker;
				};
				publicarbeiterarctionarray SET [_i, ""];
				publicarbeiterarctionarray = publicarbeiterarctionarray - [""];
				};
		};

		for [{_i=0}, {_i < (count publichideoutarray)}, {_i=_i+1}] do {
			if (  (not( ((publichideoutarray select _i) select 0) call ISSE_UnitExists)) or (isNull(((publichideoutarray select _i) select 1) select 0))  ) then {
				{if (NOT(isNull _x)) then {_x setVehicleinit "";deletevehicle _x;};} forEach ((publichideoutarray select _i) select 1);
				publichideoutarray SET [_i, ""];
				publichideoutarray = publichideoutarray - [""];
			};
		};
	//Unit despawn
	if (count DynBr_Men > DynBr_max_men) then
	{
		while {(count DynBr_Men > DynBr_max_men)} do
		{
			_todelete = DynBr_Men select 0;
			clearVehicleInit _todelete;
			hidebody _todelete;
			deleteVehicle _todelete;
            DynBr_Men set[0, "DELETE"];
			DynBr_Men = DynBr_Men - ["DELETE"];
		};
		publicVariable "DynBr_Men";
	};
		coparray		= [cop1, cop2, cop3, cop4, cop5, cop6, cop7, cop8, cop9, cop10, cop11, cop12];
		civarray		= [civ1, civ2, civ3, civ4, civ5, civ6, civ7, civ8, civ9, civ10, civ11, civ12, civ13, civ14, civ15, civ16, civ17, civ18, civ19, civ20];
		playerarray		= [civ1, civ2, civ3, civ4, civ5, civ6, civ7, civ8, civ9, civ10, civ11, civ12, civ13, civ14, civ15, civ16, civ17, civ18, civ19, civ20, cop1, cop2, cop3, cop4, cop5, cop6, cop7, cop8, cop9, cop10, cop11, cop12];
		//sleep 0.5;
		sleep 5;
	};
};