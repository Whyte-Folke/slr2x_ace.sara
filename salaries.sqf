// Paychecks for Cop, Civ, Mayor and active Terrorists salaries.sqf
// Completely recoded with Taxation Mr.G-C Feb. 2009

// Zero the variable shit or get scalar bool error
call compile format ["FinalTax_%1 = 0", rolestring];
Deliverymissionreward = 0;
SearchjobMissionReward = 0;
TaxiMissionReward = 0;
WorkerHoeEarnings = 0;
_completeincome = 0;
_finalIncome = 0;
_IncomeTax = 0;
_taxclass = 0;
_taxpercentage = 0;
_MissionsReward = 0;
_WorkersIncome = 0;
_OverviewMissionsMsg = "";
_OverviewWelfareMsg = "";
_OverviewWorkPlaceMsg = "";
_OverviewWorkersMsg = "";
_OverviewBusinessAssetsMsg = "";
_OverviewTrainedJobMsg = "";
_OverviewMayorMsg = "";
_undercovermsg  = "";
_patrolmsg = "";
_cromsg = "";
_swatmsg = "";
_borderpmsg = "";
_defaultCopIncomemsg = "";
_OverviewChiefPolMsg = "";
_zusatzgeld_under = 0;
_zusatzgeld_patrol = 0;
_zusatzgeld_cro = 0;
_zusatzgeld_swat = 0;
_zusatzgeld_border = 0;
_tempTaxAccMonAvail = 0;
_bodyguardsalary = 0;
_ambulancesalary = 0;
_taxidriversalary = 0;
_AFK = false;

while {true} do {
	if (!interndebug) then {
		_pos1_1 = getPos player select 0;
		_pos1_2 = getPos player select 1;
		_dir1 = getDir player;
		sleep 60;
		player groupChat format[localize "STRS_geld_countdown", "4"];
		sleep 60;
		player groupChat format[localize "STRS_geld_countdown", "3"];
		sleep 60;
		player groupChat format[localize "STRS_geld_countdown", "2"];
		sleep 60;
		player groupChat format[localize "STRS_geld_countdown", "1"];
		sleep 60;
		_pos2_1 = getPos player select 0;
		_pos2_2 = getPos player select 1;
		_dir2 = getDir player;
		if ((_pos1_1 == _pos2_1) and (_pos1_2 == _pos2_2)) then {_AFK = true} 
		else {_AFK = false};
	} else {
		player groupChat format[localize "STRS_geld_countdown", "1"];
		sleep 60;
	};
	if (_AFK) then {player groupChat "You dont receive paychecks while being AFK"} else {
	if ((alive player) and (deadcam == 0)) then {
		
		// Cop Pay
		if (iscop) then {
			_tempTaxAccMonAvail = GovernmentTaxAccount;

			// Add default cop money
			if (_tempTaxAccMonAvail >= add_copmoney) then {
				_completeincome = _completeincome + add_copmoney;
				_tempTaxAccMonAvail = _tempTaxAccMonAvail - add_copmoney;
				call compile format ["FinalTax_%1 = FinalTax_%1 - add_copmoney", rolestring];
				_defaultCopIncomemsg = format[localize "STRS_geld_CopBaseIncomemsg", add_copmoney];
			} else {
				_defaultCopIncomemsg = localize "STRS_geld_CopBaseIncomemsgNO";
			};

				
			// Undercover cop additional pay (85% of default salary)
			if (isundercover) then {
				_zusatzgeld_under = ((add_copmoney/100)*85);
				if (_tempTaxAccMonAvail >= _zusatzgeld_under) then {
					_completeincome = _completeincome + _zusatzgeld_under;
					_tempTaxAccMonAvail = _tempTaxAccMonAvail - _zusatzgeld_under;
					call compile format ["FinalTax_%1 = FinalTax_%1 - _zusatzgeld_under", rolestring];
					_undercovermsg = format[localize "STRS_geld_undercovermsg", _zusatzgeld_under];
				} else {
					_undercovermsg = localize "STRS_geld_undercovermsgNO";
				};
			};
			
			
			// Patrol Officer additional pay (55% of default salary)
			if (isPatrolOfficer) then {
				_zusatzgeld_patrol = ((add_copmoney/100)*55);
				if (_tempTaxAccMonAvail >= _zusatzgeld_patrol) then {
					_completeincome = _completeincome + _zusatzgeld_patrol;
					_tempTaxAccMonAvail = _tempTaxAccMonAvail - _zusatzgeld_patrol;
					call compile format ["FinalTax_%1 = FinalTax_%1 - _zusatzgeld_patrol", rolestring];
					_patrolmsg = format[localize "STRS_geld_patrolmsg", _zusatzgeld_patrol];
				} else {
					_patrolmsg = localize "STRS_geld_patrolmsgNO";
				};
			};
			
			
			// Criminal-Respone Officer additional pay (90% of default salary)
			if (isCroOfficer) then {
				_zusatzgeld_cro = ((add_copmoney/100)*90);
				if (_tempTaxAccMonAvail >= _zusatzgeld_cro) then {
					_completeincome = _completeincome + _zusatzgeld_cro;
					_tempTaxAccMonAvail = _tempTaxAccMonAvail - _zusatzgeld_cro;
					call compile format ["FinalTax_%1 = FinalTax_%1 - _zusatzgeld_cro", rolestring];
					_cromsg = format[localize "STRS_geld_cromsg", _zusatzgeld_cro];
				} else {
					_cromsg = localize "STRS_geld_cromsgNO";
				};
			};
			
			
			// Swat Officer additional pay (110% of default salary)
			if (istrainedSwat) then {
				_zusatzgeld_swat = ((add_copmoney/100)*110);
				if (_tempTaxAccMonAvail >= _zusatzgeld_swat) then {
					_completeincome = _completeincome + _zusatzgeld_swat;
					_tempTaxAccMonAvail = _tempTaxAccMonAvail - _zusatzgeld_swat;
					call compile format ["FinalTax_%1 = FinalTax_%1 - _zusatzgeld_swat", rolestring];
					_swatmsg = format[localize "STRS_geld_swatmsg", _zusatzgeld_swat];
				} else {
					_swatmsg = localize "STRS_geld_swatmsgNO";
				};
			};
			
			
			// Borderpatrol Additional Payment (75% of default salary)
			if (isborderpatrol) then {
				_zusatzgeld_border = ((add_copmoney/100)*75);
				if (_tempTaxAccMonAvail >= _zusatzgeld_border) then {
					_completeincome = _completeincome + _zusatzgeld_border;
					_tempTaxAccMonAvail = _tempTaxAccMonAvail - _zusatzgeld_border;
					call compile format ["FinalTax_%1 = FinalTax_%1 - _zusatzgeld_border", rolestring];
					_borderpmsg = format[localize "STRS_geld_bordermsg", _zusatzgeld_border];
				} else {
					_borderpmsg = localize "STRS_geld_bordermsgNO";
				};	
			};
			
			// Add chief of police Money
			if (ischief) then {
				if (PoliceChiefExtraPay > _tempTaxAccMonAvail) then {
					_OverviewChiefPolMsg = localize "STRS_geld_ChiefPoliceNOMoney";
				} else {
				 _completeincome = _completeincome + PoliceChiefExtraPay;
				call compile format ["FinalTax_%1 = FinalTax_%1 - PoliceChiefExtraPay", rolestring];
				_OverviewChiefPolMsg = format[localize "STRS_geld_ChiefPoliceYESMoney", PoliceChiefExtraPay];
				};
			};
			// COP SPECIFIC PART ENDS HERE
		} else 
		{
		
			if (isterrorist) then {
				player groupChat localize "STRS_geld_terroristadd";
			} else 
			{
			
			//******* CIVILLIAN PAY STARTS HERE ********
				// Zero Vars
				_workplacepaycheck = 0;
				_uniPaycheck       = 0;
				_TrainedJobReward = 0;
				_zusatzgeld_bodyguard = 0;
				_zusatzgeld_ambulance = 0;
				_zusatzgeld_taxidriver = 0;
				
				
				if (timeinworkplace > 0) then {
					_workplacepaycheck = (round(add_workplace/180*timeinworkplace));
					if ("uni" call INV_HasLicense) then {
						_uniPaycheck = (round(uni_training_add/180*timeinworkplace));
						_workplacepaycheck = _workplacepaycheck + _uniPaycheck;
					};
					_completeincome  = _completeincome + _workplacepaycheck;
				};
				timeinworkplace = 0;
				_immobilienGeld = 0;
				for [{_i=0}, {_i < (count BuyAbleBuildingsArray)}, {_i=_i+1}] do {
					if ( ((BuyAbleBuildingsArray select _i) select 0) in BuildingsOwnerArray ) then {
						_immobilienGeld = _immobilienGeld + ( round( (random 2)*((BuyAbleBuildingsArray select _i) select 4) ) );
					};
				};
				_completeincome = _completeincome + _immobilienGeld;
				for [{_i=0}, {_i < (count BuyAbleBuildingsArray)}, {_i=_i+1}] do {
					_Scriptname = (BuyAbleBuildingsArray select _i) select 0;
					_flag       = (BuyAbleBuildingsArray select _i) select 2;
					_art        = (BuyAbleBuildingsArray select _i) select 5;
					_ablage     = (BuyAbleBuildingsArray select _i) select 6;
					if ( (_Scriptname in BuildingsOwnerArray) and (_art == "shop") ) then {
						_verkaufitems = _ablage call INV_ReturnAblage;

						{
							if (not((_x select 0) == 'geld')) then {
								_addinfo  = ((_x select 0) call INV_getitemArray);
								_menge    = round(random(_x select 1));
								_sellCost = (_addinfo call INV_getitemSellCost);
								_buyCost  = (_addinfo call INV_getitemBuyCost);
								_addgeld  = ( (round( _cost + (random(_buyCost - _cost)))) * _menge);
								[(_x select 0), -(_menge), _ablage] call INV_AddItemStorage;
								['geld',        _addgeld,  _ablage] call INV_AddItemStorage;
							};
						}
				
					forEach _verkaufitems;
					};
				};			
				// Add Money for Bodyguard
				if ((isBodyguard) or (roleBodyguard == 1)) then {
					_zusatzgeld_bodyguard = (round (200));
					if (GovernmentTaxAccount >= _zusatzgeld_bodyguard) then {
						_completeincome = _completeincome +_zusatzgeld_bodyguard;
						_bodyguardsalary = _zusatzgeld_bodyguard;
						call compile format ["FinalTax_%1 = FinalTax_%1 - _zusatzgeld_bodyguard", rolestring];
					} else {
						_bodyguardsalary = 0;
					};
				};
				
				// Add Money for Ambulance
				if (isambulance) then {
					_zusatzgeld_ambulance = (round (100 + (random 100)));
					if (GovernmentTaxAccount >= _zusatzgeld_ambulance) then {
						_completeincome = _completeincome +_zusatzgeld_ambulance;
						_ambulancesalary = _zusatzgeld_ambulance;
						call compile format ["FinalTax_%1 = FinalTax_%1 - _zusatzgeld_ambulance", rolestring];
					} else {
						_ambulancesalary = 0;
					};
				};
				
				// Add Money for Taxidrivers
				if (isTaxidriver) then {
					_zusatzgeld_taxidriver = (round (50 + (random 150)));
					if (GovernmentTaxAccount >= _zusatzgeld_taxidriver) then {
						_completeincome = _completeincome +_zusatzgeld_taxidriver;
						_taxidriversalary = _zusatzgeld_taxidriver;
						call compile format ["FinalTax_%1 = FinalTax_%1 - _zusatzgeld_taxidriver", rolestring];
					} else {
						_taxidriversalary = 0;
					};
				};
				
				// Adds Trained Job Salaries such as Bodygurad, Medic, Mechanics, etc.
				_TrainedJobReward = _TrainedJobReward + _bodyguardsalary + _ambulancesalary + _taxidriversalary;
				// _completeincome = _completeincome + _TrainedJobReward;
							
				// Adds Missions-Reward:
				_MissionsReward = _MissionsReward + TaxiMissionReward + Deliverymissionreward + SearchjobMissionReward;
				_completeincome = _completeincome + _MissionsReward;
				
				// Adds Workers income:
				_WorkersIncome = _WorkersIncome + WorkerHoeEarnings;
				_completeincome = _completeincome + _WorkersIncome;
				
				// Adds MAYOR pay bonus *IF* there is enough money on the Governements Account. Has always one round paycheque delay - not other possible, but we know the governemnts are slow.... :p
				if (isMayor) then {
					if (GovernmentTaxAccount >= MayorExtraPay) then {
						_completeincome = _completeincome + MayorExtraPay;
						_mayorPayVar = MayorExtraPay;
						call compile format ["FinalTax_%1 = FinalTax_%1 - MayorExtraPay", rolestring];
						_OverviewMayorMsg = format[localize "STRS_geld_overviewmsgmayorYes", _mayorPayVar];
					} else {
						_OverviewMayorMsg = localize "STRS_geld_overviewmsgmayorNo";
					};
				};
				
				// Adds basic welfare salaray *IF* Enough money is on governements account
				if (GovernmentTaxAccount >= add_civmoney) then {
					if ((_completeincome >= GblWelfareIncomeLimit) || (kontostand > GblWelfareBankLimit)) then { 
						_OverviewWelfareMsg = localize "STRS_geld_overviewmsgwelfareLimitReached";
					} else {
						_completeincome = _completeincome + add_civmoney;
						call compile format ["FinalTax_%1 = FinalTax_%1 - add_civmoney", rolestring];
						_OverviewWelfareMsg = format[localize "STRS_geld_overviewmsgwelfareYes", add_civmoney];
					};
				} else {
					_OverviewWelfareMsg = localize "STRS_geld_overviewmsgwelfareNo";
				};
				
				//******************* MESSAGE-PARTS *******************
				// Message for Workplaces you worked in:
				if (_workplacepaycheck > 0) then {
					_OverviewWorkPlaceMsg = format[localize "STRS_geld_overviewmsgworkplaces", _workplacepaycheck];
				};
				
				// Message for done Jobs like Taxi, delivery,  etc...
				if (_MissionsReward > 0) then {
					_OverviewMissionsMsg = format[localize "STRS_geld_overviewmsgmissions", _MissionsReward];
				};
				if (_WorkersIncome > 0) then {
					_OverviewWorkersMsg = format[localize "STRS_geld_overviewmsgworkers", _WorkersIncome];
				};
				// Message for income from trained Jobs (Medic, Bodyguard, etc.)
				if (_TrainedJobReward > 0) then {
					_OverviewTrainedJobMsg = format[localize "STRS_geld_overviewmsgtrainedjobs", _TrainedJobReward];
				};
				// Message for income from business Objects (WPs, Shops)
				if (_immobilienGeld > 0) then {
					_OverviewBusinessAssetsMsg = format[localize "STRS_geld_overviewmsgbusinessassets", _immobilienGeld];			
				};
			};
         }; // CIV-Specific part ends
		 
		 
		//****************************TAXATION STARTS HERE*************************************//
		// Basic Income Taxation starts here. Incometax is fixed here, but can later be changed by Mayor hopefully.
		// Tax classes starting from 1 t0 5. Values: 1=10%, 2=19%, 3=26%, 4=33%, 5=41%
		// Issetea if you steal this unique feature also from us, i know where you Live........
				
					// For tax-class 1
					if (_completeincome < 1000) then {
						_taxclass = 1;
						_taxpercentage = GblIncomeTaxClass1;
						_IncomeTax = round((_completeincome / 100) * GblIncomeTaxClass1);
						_finalIncome = _completeincome - _IncomeTax;							
					};
					// For tax-class 2
					if ((_completeincome >= 1000) && (_completeincome <= 4000)) then {
						_taxclass = 2;
						_taxpercentage = GblIncomeTaxClass2;
						_IncomeTax = round((_completeincome / 100) * GblIncomeTaxClass2);
						_finalIncome = _completeincome - _IncomeTax;						
					};
					// For tax-class 3
					if ((_completeincome >= 4001) && (_completeincome <= 9999)) then {
						_taxclass = 3;
						_taxpercentage = GblIncomeTaxClass3;
						_IncomeTax = round((_completeincome / 100) * GblIncomeTaxClass3);
						_finalIncome = _completeincome - _IncomeTax;						
					};
					// For tax-class 4
					if ((_completeincome >= 10000) && (_completeincome <= 20000)) then {
						_taxclass = 4;
						_taxpercentage = GblIncomeTaxClass4;
						_IncomeTax = round((_completeincome / 100) * GblIncomeTaxClass4);
						_finalIncome = _completeincome - _IncomeTax;						
					};
					// For tax-class 5
					if (_completeincome >= 20001) then {
						_taxclass = 5;
						_taxpercentage = GblIncomeTaxClass5;
						_IncomeTax = round((_completeincome / 100) * GblIncomeTaxClass5);
						_finalIncome = _completeincome - _IncomeTax;						
					};
					
				call compile format ["FinalTax_%1 = FinalTax_%1 + _IncomeTax + INV_SteuernGezahlt; PublicVariable ""FinalTax_%1""; ", rolestring];
				TaxationServerStart = rolestring;
				publicvariable "TaxationServerStart";
				
				// What finally arrives at your account
				kontostand = kontostand + _finalIncome;
				// New Mesasge for Brief Overview of Income, both Civs and Cops
				player groupChat format[localize "STRS_geld_briefoverviewmsg", _completeincome, _finalIncome, _IncomeTax, _taxclass, _taxpercentage];
								
				// New Detailed-Income Message CIV
				if (!isCop) then {
				player groupChat format[localize "STRS_geld_civmoneyadd", _OverviewWelfareMsg, _OverviewWorkPlaceMsg, _OverviewWorkersMsg, _OverviewMissionsMsg, _OverviewTrainedJobMsg, _OverviewBusinessAssetsMsg, _OverviewMayorMsg];
				} else {
				// New Detailed-Income Message COP
				player groupChat format[localize "STRS_geld_copmoneyadd", _defaultCopIncomemsg, _undercovermsg, _patrolmsg, _cromsg, _swatmsg, _borderpmsg, _OverviewChiefPolMsg];
				};
			
				// Debug Hint Message. Sleep because PubVar takes some seconds to reach client after calculation on server...
				if (interndebug) then {
							sleep 10;
							hint format ["Personal income-tax is: %1\nthe percentage is: %2\nthe final-income is %3.\nThe gross-income was %4.\nGvmnt Tax-Account: %5\nOwn Bank-Account: %6 \nPersonal VAT payed: %7", _IncomeTax, _taxpercentage, _finalIncome, _completeincome, (GovernmentTaxAccount call ISSE_str_IntToStr), (kontostand call ISSE_str_IntToStr), (INV_SteuernGezahlt call ISSE_str_IntToStr)];
				};
				
		//****** RESET ALL VARIABLES AND/OR MESSAGE_VARS (which can have different stages) AT THE END OF EACH PAYCHEQUE ROUND ********	
		INV_SteuernGezahlt = 0;  //VAT
		_IncomeTax = 0; // Income Tax
		call compile format ["FinalTax_%1 = 0", rolestring];
		if (TaxiMissionReward > 0) then {TaxiMissionReward = 0;}; 
		if (Deliverymissionreward > 0) then {Deliverymissionreward = 0;};
		if (SearchjobMissionReward > 0) then {SearchjobMissionReward = 0;};
		if (WorkerHoeEarnings > 0) then {WorkerHoeEarnings = 0;};
		_MissionsReward = 0;
		_WorkersIncome = 0;
		_TrainedJobReward = 0;
		_finalIncome = 0;
		_completeincome = 0;
		_taxclass = 0;
		_taxpercentage = 0;
		_bodyguardsalary = 0;
		_OverviewMayorMsg = "";
		_OverviewChiefPolMsg = "";
		_OverviewWelfareMsg = "";
		_OverviewMissionsMsg = "";
		_OverviewWorkPlaceMsg = "";
		_OverviewWorkersMsg = "";
		_OverviewBusinessAssetsMsg = "";
		_OverviewTrainedJobMsg = "";
		_defaultCopIncomemsg = "";		
		_undercovermsg = "";
		_patrolmsg = "";
		_cromsg = "";
		_swatmsg = "";
		_borderpmsg = ""
		
	} else {
		// No paycheck when dead:
		player groupChat format[localize "STRS_geld_paycheckdead"];
	};
};
};