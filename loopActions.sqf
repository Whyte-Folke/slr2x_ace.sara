 // Loop Scripts and Checks
 // loopActions.sqf
 
  // Setup Zero Vars
 _a1	= 0;
 _a2	= 0;
 _a3	= 0;
 _a4	= 0;
 _a5	= 0;
 _a6	= 0;
 // _a7	= 0;
 _a8	= 0;
 _a9	= 0;
 _a10	= 0;
 _a11	= 0;
 _a12	= 0;
 _a13	= 0;
 _a14	= 0;
 _a15	= 0;
 _a16	= 0;
 _a17	= 0;
 _a18 = 0;
 _a19 = 0;
 _a20 = 0;
 _a21 = 0;
 _a22 = 0;
 _a23 = 0;
 _a24 = 0;
 _a25 = 0;
 _a26 = 0;
 _a27 = 0;
 _a28 = 0;
 _a29 = 0;
 _a30 = 0;
 _a31 = 0;
 _a32 = 0;
 _a33 = 0;
 _a34 = 0;
 _a35 = 0;
 _a36 = 0;
 _a37 = 0;
 _a38 = 0;
 _a39 = 0;
 _a40 = 0;
 _a41 = 0;
 _a42 = 0;
 _a43 = 0;
 _a44 = 0;
 _a45 = 0;
 _a46 = 0;
 _a47 = 0;
 _a48 = 0;
 _a49 = 0;
 _a50 = 0; // License Remove Flag // Check civ accounts
 _a51 = 0; // Resign Bodyguard
 _a52 = 0; // Cellphone call
 _a53 = 0; // Bunny Hop
 _a54 = false; // Car Reg Check
 _hasSiren = false;
 
 // Own added ones
 airtaxi_cost = 5000;
 _addeal = 0;
 _drugdeal = 0;
 _weapondeal = 0;
 _cmenul = 0;
 _holmenu = 0;
 _unholmenu = 0;
 holstervar = false;
 unholstervar = false;
 _hasweapon  = false;
 _HandWeapon = false;
 _trans1 = 0;
 _trans2 = 0;
 _trans3 = 0;
 _trans4 = 0;
 _trans5 = 0;
 _trans6 = 0;
 _v1 = 0;
 _v2 = 0;
 _v3 = 0;
 _f1 = 0;
 _f2 = 0;
 _f3 = 0;
 _f4 = 0;
 _f5 = 0;
 _f6 = 0;
 _f7 = 0;
 
 _Arr1 = [];
 
 for [{_i=0}, {_i < (count civarray)}, {_i=_i+1}] do {_Arr1 = _Arr1 + [0];};
 
 _Arr4 = [];
 _Arr5 = [];
 _Arr6 = [];
 _Arr7 = []; 
 _Arr8 = [];


// Check Loops 
 while {true} DO {
 
	// Cop actionmenus for busting of the drugdealer
	if ((iscop) and (player distance drugvehicle <= 5) and (_addeal == 0) and (alive drugvehicle)) then {
	actionbustdrugdealer = player addaction [format[localize "STRS_addAction_drugdealerbust"], "bustdrugd.sqf"];
	_addeal = 1;
	};
 
	if (((player distance drugvehicle > 5) and (_addeal == 1)) or (!alive drugvehicle)) then {
	player removeAction actionbustdrugdealer;
	_addeal = 0;
	};
	
	// Actionmenu for the Drugdealer (odd workaround and new array "INV_Dealershops" was needed, since for that you cannnot use the automatic way like all other itmeshops does it.)
	_action = ((INV_DealerShops select 0) select 1);
		if ((player distance drugvehicle <= 5) and (_drugdeal == 0) and ((alive drugvehicle) and (alive drug_einheit))) then {
			if (!(iscop)) then {
			actiondrugdealer = player addaction [_action, "shopDlgOpen.sqf", [0]];
			actiondealmari = player addAction[format["Drug deal %1","marihuana" call INV_getitemName], "DrugDealerJob.sqf", ["startDealing", "marihuana"]];
			actiondealcoke = player addAction[format["Drug deal %1","kokain" call INV_getitemName], "DrugDealerJob.sqf", ["startDealing", "kokain"]];
			if (isDealer) then { actioncanceldeal = player addAction["Stop drug dealing", "DrugDealerJob.sqf", ["cancel"]];};
			_drugdeal = 1;
			};
		};
		if ((player distance drugvehicle > 5) and (_drugdeal == 1) or (!alive drugvehicle) or (!alive drug_einheit) and (!(iscop))) then {
			player removeaction actiondrugdealer;
			player removeaction actiondealmari;
			player removeaction actiondealcoke;
			player removeaction actioncanceldeal;
			_drugdeal = 0;
		};
		
	// Actionmenu for Cell-Phone calls
	if ((iHaveaCellphone) and (_a52 == 0)) then {
		actionCellPhoneMenu = player addAction [format[localize "STRS_addAction_cellphonemenu"], "openDialogs2.sqf",["cellphonemenu"]];
		_a52 = 1;
	};
	if ((!iHaveaCellphone) and (_a52 == 1)) then {
		player removeaction actionCellPhoneMenu;
		_a52 = 0;
	};

	// ----Airtaxi Stuff----
	
		// To Bagango airport
	if (((player distance airflag_paraiso <= 5) or (player distance airflag2 <= 5) or (player distance carflag6 <= 5) or (player distance airflag_rahmadi <= 5)) and (_trans1 == 0)) then {
		 airtaxi_bagango = player addAction [format[localize "STRS_addAction_trans_to_bagango", airtaxicost, airtaxitaxes],"airtaxi.sqf",["bagango"]];
		_trans1 = 1;
	};										
	if (((player distance airflag_paraiso > 5) and (player distance airflag2 > 5) and (player distance carflag6 > 5) and (player distance airflag_rahmadi > 5)) and (_trans1 == 1)) then {
		 player removeAction airtaxi_bagango;
		 _trans1 = 0;
	};
	
		// To Mercalillo Airport
	if (((player distance airflag_paraiso <= 5) or (player distance airflag1 <= 5) or (player distance carflag6 <= 5) or (player distance airflag_rahmadi <= 5)) and (_trans2 == 0)) then {
		 airtaxi_mercalillo = player addAction [format[localize "STRS_addAction_trans_to_mercalillo", airtaxicost, airtaxitaxes],"airtaxi.sqf",["mercalillo"]];
		_trans2 = 1;
	};										
	if (((player distance airflag_paraiso > 5) and (player distance airflag1 > 5) and (player distance carflag6 > 5) and (player distance airflag_rahmadi > 5)) and (_trans2 == 1)) then {
		 player removeAction airtaxi_mercalillo;
		 _trans2 = 0;
	};
	
		// To Pita Airport
	if (((player distance airflag_paraiso <= 5) or (player distance airflag1 <= 5) or (player distance airflag2 <= 5) or (player distance airflag_rahmadi <= 5)) and (_trans3 == 0)) then {
		 airtaxi_pita = player addAction [format[localize "STRS_addAction_trans_to_pita", airtaxicost, airtaxitaxes],"airtaxi.sqf",["pita"]];
		_trans3 = 1;
	};										
	if (((player distance airflag_paraiso > 5) and (player distance airflag1 > 5) and (player distance airflag2 > 5) and (player distance airflag_rahmadi > 5)) and (_trans3 == 1)) then {
		 player removeAction airtaxi_pita;
		 _trans3 = 0;
	};	 
		// To Paraiso Airport
	if (((player distance carflag6 <= 5) or (player distance airflag1 <= 5) or (player distance airflag2 <= 5) or (player distance airflag_rahmadi <= 5)) and (_trans4 == 0)) then {
		 airtaxi_paraiso = player addAction [format[localize "STRS_addAction_trans_to_paraiso", airtaxicost, airtaxitaxes],"airtaxi.sqf",["paraiso"]];
		_trans4 = 1;
	};										
	if (((player distance carflag6 > 5) and (player distance airflag1 > 5) and (player distance airflag2 > 5) and (player distance airflag_rahmadi > 5)) and (_trans4 == 1)) then {
		 player removeAction airtaxi_paraiso;
		 _trans4 = 0;	
	};
	
		// To Rahmadi Airport
	if (((player distance carflag6 <= 5) or (player distance airflag1 <= 5) or (player distance airflag2 <= 5) or (player distance airflag_paraiso <= 5)) and (_trans5 == 0)) then {
		 airtaxi_rahmadi = player addAction [format[localize "STRS_addAction_trans_to_rahmadi", airtaxicost, airtaxitaxes],"airtaxi.sqf",["rahmadi"]];
		_trans5 = 1;
	};										
	if (((player distance carflag6 > 5) and (player distance airflag1 > 5) and (player distance airflag2 > 5) and (player distance airflag_paraiso > 5)) and (_trans5 == 1)) then {
		 player removeAction airtaxi_rahmadi;
		 _trans5 = 0;	
	};	
	
		// To Corazol City
	if (((player distance carflag6 <= 5) or (player distance airflag1 <= 5) or (player distance airflag2 <= 5) or (player distance airflag_paraiso <= 5) or (player distance airflag_rahmadi <= 5)) and (_trans6 == 0)) then {
		 airtaxi_corazol = player addAction [format[localize "STRS_addAction_trans_to_corazol", airtaxicost, airtaxitaxes],"airtaxi.sqf",["corazol"]];
		_trans6 = 1;
	};										
	if (((player distance carflag6 > 5) and (player distance airflag1 > 5) and (player distance airflag2 > 5) and (player distance airflag_paraiso > 5) and (player distance airflag_rahmadi > 5)) and (_trans6 == 1)) then {
		 player removeAction airtaxi_corazol;
		 _trans6 = 0;	
	};	
	
	// Default Entries
 	if ((iscop) and (player distance copbaseflag <= 5) and (_a5 == 0)) then {
 		action_copmenu = player addAction [format[localize "STRS_addAction_copmenu"], "openDialogs2.sqf",["copmenu"]];
 		_a5 = 1;
 	};
 
 	if ((player distance copbaseflag > 5) and (_a5 == 1)) then {
 		player removeAction action_copmenu;
 		_a5 = 0;
 	};

	
	//player removeAction action_copmenulite;
	 if ((iscop) && (player == vehicle player) && (_cmenul == 0)) then
	 {
		player removeAction action_copmenulite;
		 action_copmenulite = player addAction [format[localize "STRS_addAction_copmenulite"], "openDialogs2.sqf",["copmenulite"]];
		 _cmenul = 1;
	 };

	 if ((player != vehicle player) && (_cmenul == 1)) then
	 {
		 player removeAction action_copmenulite;
		 _cmenul = 0;
	 };
  	
 	if ((rolecop == 0) and (player distance bailflag<= 5) and (_a10 == 0)) then {
 		action_bail = player addAction [format [localize "STRS_addAction_bail"],"openDialogs2.sqf",["bail"]];
 		_a10 = 1;
 	};
 	
 	if ((player distance bailflag > 5) and (_a10 == 1)) then {
 		player removeAction action_bail;
 		_a10 = 0;
 	};
 	
 	if ((player distance hurenflag <= 5) and ((rolecop == 0) or (copworkerallowed == 1)) and (_a11 == 0)) then {
 		action_hoes = player addAction[format [localize "STRS_addAction_buy_worker", huren_cost],"workers.sqf", ["holen"]];
 		_a11 = 1;
 	};
 	
 	if ((player distance hurenflag > 5) and (_a11 == 1)) then {
 		player removeAction action_hoes;
 		_a11 = 0;
 	};
 	
 	if ((player distance rathaus <= 5) and (rolecop == 0) and (_a12 == 0) and (INV_local_hashideout == 0)) then {
 		action_hideout = player addAction[localize "STRS_addAction_buy_hideout","openDialogs2.sqf",["hideout"]];
 		_a12 = 1;
 	};
 	
 	if ((player distance rathaus > 5) and (_a12 == 1)) then {
 		player removeAction action_hideout;
 		_a12 = 0;
 	};
 	
 	if ((player distance rathaus <= 5) and (_a13 == 0)) then {
 		action_gildenmenu = player addAction[localize "STRS_addAction_gildenmenu","openDialogs2.sqf",["gildenmenu"]];
 		_a13 = 1;
 	};
 	
 	if ((player distance rathaus > 5) and (_a13 == 1)) then {
 		player removeAction action_gildenmenu;
 		_a13 = 0;
 	};
 	
 	if ((player distance rathaus <= 5) and (_a14 == 0) and (isGildenLeader)) then {
 		action_gildenpunkte = player addAction[localize "STRS_addAction_gildenpunkte","openDialogs2.sqf",["punktekauf"]];
 		_a14 = 1;
 	};
 	
 	if (((player distance rathaus > 5) or (NOT(isGildenLeader))) and (_a14 == 1)) then {
 		player removeAction action_gildenpunkte; _a14 = 0;
 	};
 	
 	if ((player distance rathaus <= 5)  and (_a47 == 0)) then {
 		action_wahl = player addAction [format [localize "STRS_addAction_wahlen"], "openDialogs2.sqf",["wahlen"]];
 		_a47 = 1;
 	};
 	
 	if ((player distance rathaus > 5) and (_a47 == 1)) then {
 		player removeAction action_wahl;
 		_a47 = 0;
 	};
	
	// Resign Bodyguard
	 if ((player distance regierungsflag <= 2)  and (_a51 == 0) and (isBodyguard)) then {
 		resignChief_action   = player addAction [localize "STRS_addaction_resignBodyguard",  "positionResign.sqf", ["bodyguard"]];
 		_a51 = 1;
 	};
 	
 	if ((player distance regierungsflag > 2) and (_a51 == 1) or (!isBodyguard)) then {
 		player removeAction resignChief_action;
 		_a51 = 0;
 	};
 	
 	if (((player distance workplaceradio <= 5) or (player distance prisonradio <= 5)) and (_a21 == 0)) then {
 		action_radio = player addAction [localize "STRS_addAction_radio_on","radio.sqf"];
 		_a21 = 1;
 	};
 	
 	if (((player distance workplaceradio > 5) and (player distance prisonradio > 5) and (_a21 == 1))) then {
 		player removeAction action_radio;
 		_a21 = 0;
 	};
 	
 	if ((player distance rathaus <= 5) and (_a45 == 0)) then {
 		action_crimelog = player addAction [localize "STRS_addaction_crimelog", "openDialogs2.sqf",["coplog"]];
 		_a45 = 1;
 	};
 	
 	if ((player distance rathaus > 5) and (_a45 == 1)) then {
 		player removeAction action_crimelog;
 		_a45 = 0;
 	};


 	//  Racing Variables
 	_cost = race_join_cost;
 	_racevcl = vehicle player;


 	if ((player != _racevcl) and (_racevcl Distance raceflag <= 5) and (rolecop == 0) and (race_started == 0) and (_a15 == 0)) then {
 		_v3 = vehicle player; action_racemember = _v3 addAction[format [localize "STRS_addAction_race_join", _cost], "raceStart.sqf"];
 		_a15 = 1;
 	};
 	
 	if (((_racevcl Distance raceflag > 5) or (race_started == 1) or (player == vehicle player)) and (_a15 == 1)) then {
 		_v3 removeAction action_racemember;
 		_a15 = 0;
 	};
 	
	// Storages now at crate in PoliceBase
   	 if ((player distance copbase_crate <= 5) and (_a49 == 0)) then {
     	  action_copstorage1 = player addAction[localize "STRS_addAction_copstorage1","storage.sqf", ["coplager_local",  "save"]];
     	  action_copstorage2 = player addAction[localize "STRS_addAction_copstorage2","storage.sqf", ["coplager_global", "public"]];
      	 _a49 = 1;
    	};
    
   	 if ((player distance copbase_crate > 5) and (_a49 == 1)) then {
      	 player removeAction action_copstorage1;
      	 player removeAction action_copstorage2;
     	  _a49 = 0;
   	 };
 	
// Copmenu and Sirens
 	if ((!(player == vehicle player)) and (_a1 == 0)) then {
 		_v1 = vehicle player;
 		_a1 = 1;
 		vclinfoaction = _v1 addAction [localize "STRS_addAction_vehicleinfo", "vehHidoutInfo.sqf", ["vehicle_info"]];
 
 		if (!iscop) then
 		{
 		vclinventaraction = _v1 addAction [localize "STRS_dead_menuentry_inventar", "invOpen.sqf", []];
 		}
 		else
		{
	 	vclCopinventaraction = _v1 addAction [localize "STRS_dead_menuentry_inventar", "cop_inventory_dialog.sqf", []];
	  	};
	  
 		vclstatsraction   = _v1 addAction [localize "STRS_dead_menuentry_hints", "openDialogs2.sqf", ["spielerliste"]];

 		if ((_v1 isKindOf "rpp_hilux") or (_v1 isKindOf "rpp_hatch") or (_v1 isKindOf "rpp_sedan") or (_v1 isKindOf "rpp_skoda") or (_v1 isKindOf "LadaLM") or (_v1 isKindOf "rpp_hilux")) then {
 			vclsireneaction  = _v1 addAction [localize "STRS_addAction_sirene", "carSiren.sqf", ["activate"], 0, true, false, "binocular"];
			_hasSiren = true;
 		};
		
 		if (_v1 isKindOf "S1203_ambulance_EP1") then {
 			vclsireneaction  = _v1 addAction [localize "STRS_addAction_sirene", "RescueSiren.sqf", ["activate"], 0, true, false, "binocular"];
			_hasSiren = true;
 		};
 		if ((iscop) and ((_v1 isKindOf "rpp_hilux") or (_v1 isKindOf "rpp_hatch") or (_v1 isKindOf "rpp_sedan") or (_v1 isKindOf "rpp_skoda") or (_v1 isKindOf "LadaLM") or (_v1 isKindOf "rpp_hilux"))) then {
 			vclcopmenu = _v1 addAction [localize "STRS_addAction_copmenu", "openDialogs2.sqf",["copmenu"]];
			_hasSiren = true;
 		};
		
		if (('ucasiren' call INV_GetItemAmount) > 0 && !_hasSiren) then {
			vclucasireneaction  = _v1 addAction [localize "STRS_addAction_sirene", "ucaSiren2.sqf", ["activate"], 0, true, false, "binocular"];
			
				if(iscop) then {
					vclcopmenu = _v1 addAction [localize "STRS_addAction_copmenu", "openDialogs2.sqf",["copmenu"]];
				};
		};
		
 	};
 	
 	
 	if (((player == vehicle player) and (_a1 == 1)) || (SLR_gClothingUpdate)) then {
 		_a1 = 0;
 		player removeAction playanimationaction;
 		player removeAction statdialogaction;
 		player removeAction action_inventar;
 		player removeAction action_inventar_cop;
 		statdialogaction = player addAction [localize "STRS_dead_menuentry_hints", "openDialogs2.sqf", ["spielerliste"]];
 
  	if (!iscop) then
 	 {
 		action_inventar = player addAction [localize "STRS_dead_menuentry_inventar", "invOpen.sqf", []];
	 }
	 else 
	 {
	    action_inventar_cop = player addAction [localize "STRS_dead_menuentry_inventar", "cop_inventory_dialog.sqf", []];   
     };
 		playanimationaction = player addAction [localize "STRS_dead_menuentry_animation", "animDlgOpen.sqf", []];
        
        if (typeName _v1 == "OBJECT") then {
	 		_v1 removeAction vclstatsraction;
	 		_v1 removeAction vclinfoaction;
	 		_v1 removeAction vclinventaraction;
	 		_v1 removeAction vclsireneaction;
			_v1 removeAction vclucasireneaction;
	 		_v1 removeAction vclCopinventaraction;
	 		_v1 removeAction vclcopmenu;
        };
		_hasSiren = false;
        
        if (SLR_gClothingUpdate) then {
        	SLR_gClothingUpdate = false;  
        };
        
 	};
	 	
 	for [{_i=0}, {_i < (count BuyAbleBuildingsArray)}, {_i=_i+1}] do {
 		_name = (BuyAbleBuildingsArray select _i) select 1;
 		_flag = (BuyAbleBuildingsArray select _i) select 2;
 		_cost = (BuyAbleBuildingsArray select _i) select 3;
 		if ((player distance _flag <= 5) and (_a16 == 0)) then {
 			action_shopbuy = player addAction [format [localize "STRS_addAction_buy_shop", _name, _cost], "buyShop.sqf", ["immobilie", _i]];
 			_a16 = 1; _f1 = _i;
 		};
 		if ((player distance _flag > 5) and (_i == _f1) and (_a16 == 1)) then {
 			player removeAction action_shopbuy;
 			_a16 = 0;
 		};
 	};
 	
 	for [{_i=0}, {_i < (count BuyAbleBuildingsArray)}, {_i=_i+1}] do {
 		_Scriptname = (BuyAbleBuildingsArray select _i) select 0;
 		_flag   = (BuyAbleBuildingsArray select _i) select 2;
 		_art    = (BuyAbleBuildingsArray select _i) select 5;
 		_ablage = (BuyAbleBuildingsArray select _i) select 6;
 		if ( (_Scriptname in BuildingsOwnerArray) and (_art == "shop") ) then {
 			if ((player distance _flag <= 5) and (rolecop == 0) and (_a48 == 0)) then {
 				action_shopablage = player addAction [localize "STRS_fac_storage", "storage.sqf", [_ablage, "save"]];
 				_a48 = 1; _f1 = _i;
 			};
 			if ((player distance _flag > 5) and (_i == _f1) and (_a48 == 1)) then {
 				player removeAction action_shopablage; _a48 = 0;
 			};
 		};
 	};
 	//Mayor
 	if ((player distance regierungsflag <= 2) and (isMayor) and (_a25 == 0)) then {
 		action_prisonrelease = player addAction [localize "STRS_addAction_prisonrelease","openDialogs2.sqf", ["wantedrelease"]];
 		gesetz_action    = player addAction [localize "STRS_addAction_gesetz",   "openDialogs2.sqf", ["gesetz"]];
 		steuern_action   = player addAction [localize "STRS_addAction_steuern",  "openDialogs2.sqf", ["steuern"]];
		resignMayor_action   = player addAction [localize "STRS_addaction_resignMayor",  "positionResign.sqf", ["mayor"]];
 		_a25 = 1;
 	};
 	
 	if (((player distance regierungsflag > 2) or (not(isMayor))) and (_a25 == 1)) then {
 		player removeAction action_prisonrelease;
 		player removeAction gesetz_action;
 		player removeAction steuern_action;
		player removeAction resignMayor_action;
 		_a25 = 0;
 	};
 
       if ((IsChief) or (interndebug)) then
       {
     	  if ((player distance ChiefofPoliceFlag <=  2) and (_a50 == 0)) then
		{
	       Action_RemoveLicense = player addaction [localize "STRS_addAction_removeLicense", "openDialogs2.sqf", ["RemoveLicense"]];
	       Action_CheckBank = player addaction [localize "STRS_addAction_CheckCivBanks", "openDialogs2.sqf", ["CheckAccounts"]];
		   resignChief_action   = player addAction [localize "STRS_addaction_resignChief",  "positionResign.sqf", ["chief"]];
	       _a50 = 1;
		};
       };
	   
	 if ((player distance ChiefofPoliceFlag > 2) and (_a50 == 1)) then
	 {
		 player removeaction Action_RemoveLicense;
		 player removeaction Action_CheckBank;
		 player removeAction resignChief_action;
		 _a50 = 0;
	};	
	
	 
 		
    // Civ Menu!
	
 	for [{_i = 0}, {_i < civscount}, {_i = _i+1}] do {
 		_player = civarray select _i;
 		_playerstring = civstringarray select _i;
 		_added    = _Arr1  select _i;
 
 		if ((player distance _player <= 3) and (alive _player) and (_player == vehicle _player) and (_added == 0) and (NOT(_player == player))) then {
 
 			if (iscop) then {
 				call compile format ["action_civmenu%1 = player addAction [format [localize ""STRS_addAction_civmenu"", name %3, %2], ""civMenuOpen.sqf"", [""civmenu"", %2, %3]];", (_i+1), _playerstring, _player];
 			} else {
 				call compile format ["action_civmenu%1 = player addAction [format [localize ""STRS_addAction_civmenu"", name %3, %2], ""civMenuOpen.sqf"", [""civinteraktion"", %2, %3]];", (_i+1), _playerstring, _player];
 			};
 			
 			_Arr1 set [_i, 1];
 		};
 		
 		if (((player distance _player > 3) or (NOT(alive _player)) or (NOT(_player == vehicle _player))) and (_added == 1)) then {
 			call compile format ["player removeAction action_civmenu%1; ", (_i+1)];
 			_Arr1 set [_i, 0];
 		};
 	};
 	
 	//Interaction with vehicles
 	for [{_i=0}, {_i < (count INV_ServerVclArray)}, {_i=_i+1}] do {
 		if (not(isNull(INV_ServerVclArray select _i))) then {
 			_vcl = (INV_ServerVclArray select _i);
			
 			if ((not(_vcl in _Arr4)) and (_vcl in INV_VehicleArray)) then {
 				_Arr4 = _Arr4 + [_vcl];
 				call compile format['%1_lockaction = %1 addAction [ localize "STRS_addaction_lock", "someCompile.sqf", [ "[""schluessel"", %1, 0] execVM ""carKeys.sqf"";" ] ];
 				%1_kofferraum = %1 addAction [ localize "STRS_addaction_trunk", "storage.sqf", [ "%3", "public", ["vcl", "%2"], "%4", "%5", %1 ] ]; ', _vcl, (typeOf _vcl), format["%1_storage", _vcl], format["%1_maxWeight", _vcl], format["%1_Weight", _vcl]];
 			};
			
			if (not(_vcl in _Arr6)) then {
				_Arr6 = _Arr6 + [_vcl];
				if (iscop) then {
				call compile format ['%1_pullout = %1 addaction [ localize "STRS_pullout", "pullout.sqf"];', _vcl, (typeOf _vcl)];
				call compile format ['%1_regcheck  = %1 addAction ["Check Registration",   "someCompile.sqf", "sleep 0.5; player sidechat ""Vehicle Registration is being checked. Please wait.""; sleep (random 5); sleep 4; player sidechat format[""Vehicle Registration - %1 | Vehicle Type: %2""];" ];' , _vcl, typeOf _vcl];
				};
			};
	
	if  (("engineer" call INV_HasLicense) and (not(_vcl in _Arr8))) then {
				_Arr8 = _Arr8 + [_vcl];
				call compile format ['%1_unlip = %1 addaction [ "Unflip Vehicle", "someCompile.sqf", "[%1] execVM ""unflip.sqf"";"];', _vcl];
				};
				
 			if ((not(_vcl in _Arr5)) and (not(_vcl in INV_VehicleArray))) then {
 				_Arr5 = _Arr5 + [_vcl];
 				if (iscop) then {
 					call compile format['%1_vehiclecheck  = %1 addAction [ localize "STRS_addaction_trunk_see",   "someCompile.sqf", "[""%3""] execVM ""openStorageDlg.sqf"";" ];%1_removeillegal = %1 addAction [ localize "STRS_addaction_trunk_check", "someCompile.sqf", "if (""%3"" call INV_RemoveIllegalStorage) then {publicVariable ""%3""; player groupChat ""Illegal things found and removed."";} else {player groupChat ""No illegal things found"";};" ];' , _vcl, (typeOf _vcl), format["%1_storage", _vcl]];
 				};
 			};
 		};
 	};
 	
 	
 	for [{_i=0}, {_i < (count _Arr4)}, {_i=_i+1}] do {
 		if (not(isNull(_Arr4 select _i))) then {
 			_vcl = (_Arr4 select _i);
 			if (not(_vcl in INV_VehicleArray)) then {
 				_Arr4 = _Arr4 - [_vcl];call compile format['%1 removeAction %1_lockaction;%1 removeAction %1_kofferraum;', _vcl];
 			};
 		} else {
 			_Arr4 SET [_i, ""];
 			_Arr4 = _Arr4 - [""];
 		};
 	};
 	
 	for [{_i=0}, {_i < (count _Arr5)}, {_i=_i+1}] do {
 		if (not(isNull(_Arr5 select _i))) then {
 			_vcl = (_Arr5 select _i);
 			if ((not(_vcl in INV_ServerVclArray)) or (_vcl in INV_VehicleArray)) then {
 				_Arr5 = _Arr5 - [_vcl];
 				if (iscop) then {
 					call compile format['%1 removeAction %1_vehiclecheck; %1 removeAction %1_removeillegal', _vcl];
 				};
 			};
 		} else {
 			_Arr5 SET [_i, ""];
 			_Arr5 = _Arr5 - [""];
 		};
 	};
 	
 	if (iscop) then {
 		for [{_i=0}, {_i < count _Arr7 }, {_i=_i+1}] do {
 			if (isNull(_Arr7 select _i)) then {
 				_Arr7 set [_i, ""];
 				_Arr7 = _Arr7 - [""];
 			};
 		};
 		for [{_i=0}, {_i < count INV_ServerObjArray}, {_i=_i+1}] do {
 			if (not(isNull(INV_ServerObjArray select _i))) then {
 				_obj = INV_ServerObjArray select _i;
 				if ( (not(_obj in _Arr7)) and (not(_obj in INV_objSpawned)) ) then {
 					call compile format ['%1 addAction [localize"STRS_inv_item_obj_take", "someCompile.sqf", ''["pack", %1] execVM "placeObj.sqf";'']; ', _obj];
 					_Arr7 = _Arr7 + [_obj];
 				};
 			};
 		};
 	};
	
	// Holster + Unholster Pistol Actionmenu.
	
	if ( count((weapons player) - ["Binocular"] - ["NVGoggles"]) > 0) then {
		_hasweapon = true;
	} else {
		_hasweapon = false;
	};
	// Use one of isseteas functions to detect pistol
	{ if ((_x call INV_GetWeaponTyp) == 1) then {_HandWeapon = true;} else {_HandWeapon = false;}; } forEach (weapons player);

	// Holster
	if ((player == vehicle player) AND (_holmenu == 0) AND ((_hasweapon) and (_HandWeapon) and (!holstervar))) then 
	{
		action_holsterpistol = player addaction [format[localize "STRS_addAction_holsterpistol"], "holster_mid_script.sqf",["holster"]];
		_holmenu = 1;
	};
	if (((player != vehicle player) OR ((!_hasweapon) OR (!_HandWeapon)) OR (holstervar)) AND (_holmenu == 1)) then 
	{
		player removeAction action_holsterpistol;
		_holmenu = 0;
	};
	
	
	//Unholster
	if ((player == vehicle player) && (_unholmenu == 0) && (unholstervar)) then 
	{
		action_unholsterpistol = player addaction [format[localize "STRS_addAction_unholsterpistol"], "holster_mid_script.sqf",["unholster"]];
		_unholmenu = 1;
	};
	if (((player != vehicle player) OR (!unholstervar)) AND (_unholmenu == 1)) then 
	{
		player removeAction action_unholsterpistol;
		_unholmenu = 0;
	};	
	
	//Bunny Hop
 	if ((player != vehicle player) and (_a53 == 0)) then 
	{
 		bh_vcl = vehicle player;
 		_a53 = 1;
		if ((bh_vcl isKindOf "modem_mtb") or (bh_vcl isKindOf "modem_mtb_dhl") or (bh_vcl isKindOf "TT650C") or (bh_vcl isKindOf "TT650G") or (bh_vcl isKindOf "M1030")) then 
		{
 		bunnyhop = bh_vcl addAction ["Bunny Hop", "bunnyHop.sqf"];
		};
	};
	
	if ((player == vehicle player) and (_a53 == 1)) then 
	{
		_a53 = 0;
 		bh_vcl removeAction bunnyhop;
	};
	
 	sleep 1;
 };