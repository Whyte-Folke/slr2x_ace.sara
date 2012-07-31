_civnumber = _this select 0;
_civnumber = _civnumber+1;
_civ       = format["civ%1", _civnumber];

if (_civ == rolestring) exitWith {player groupChat localize "STRS_bounty_notself";};

if (not(_civ call ISSE_UnitExists)) exitWith {role groupChat localize "STRS_player_not_ingame";};

_deletebounty = _this select 2;

if (_deletebounty == 1) exitWith 
{												

if (call compile format ["%1_wanted == 0", _civ]) exitWith {player groupChat localize "STRS_bounty_kein_bounty_entfernen";};		

call compile format ["bounty_%1 = 0; publicVariable ""bounty_%1""; %1_wanted = 0; publicVariable ""%1_wanted"";", _civ];													
player groupChat format [localize "STRS_bounty_entfernt", _civ];};

_bounty    = _this select 1;                

 if (!(_bounty call ISSE_str_isInteger)) exitWith {player groupChat localize "STRS_inv_no_valid_number";};
 
 _bounty    = _bounty call ISSE_str_StrToInt;  
 
 if (_bounty < 0) exitWith {};
 
 call compile format ["_bountycivvar = bounty_civ%1; _civvar = civ%1;",_civnumber];
 call compile format ["_civarrestedvar = civ%1_arrest;",_civnumber];
 
 if ((!(alive _civvar)) or (_civarrestedvar == 1)) exitWith {role groupChat format [localize "STRS_bounty_nobounty", _civ];};
 
 _money = 'money' call INV_GetItemAmount;
 
 if (_money < _bounty) exitWith {player groupChat localize "STRS_bounty_nomoney";};
 
 ['money', -(_bounty)] call INV_AddInventoryItem;
 
 player groupChat format[localize "STRS_kofpmoney_set", _civ, (_bounty call ISSE_str_IntToStr)];
 format ["civ%3_wanted = 1; bounty_civ%3 = bounty_civ%3 + %2; player groupChat format [localize ""STRS_bounty_publicmsg"", %1, %2, %3, bounty_civ%3];", player, (_bounty call ISSE_str_IntToStr), _civnumber] call ISSE_pub_execPstr;