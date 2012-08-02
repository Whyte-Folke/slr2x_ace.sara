// Play Animations from the Animationsarray and when neccessary call the approriate script
// playAnim.sqf

if ((_this select 0) == -1) exitWith {player groupChat localize "STRS_anim_noselect"};
_animnumber       = _this select 0;
_animScriptName   = _this select 1; 
_animname         = ((ANIM_AllAnimationArray select _animnumber) select 0);
_animart          = ((ANIM_AllAnimationArray select _animnumber) select 2);
_withWeapon       = ((ANIM_AllAnimationArray select _animnumber) select 4);
_callScript       = ((ANIM_AllAnimationArray select _animnumber) select 5);

// Check the conditions, such as being armed or not, are met
_hasweapon  = false;
_weapons = [] call INV_getWeapons;
if ( count((_weapons)) > 0) then {_hasweapon = true;};
if ((not(_hasweapon)) and (_withWeapon == 1)) exitWith {player groupChat localize "STRS_anim_nur_mit_waffe";};
if ((_hasweapon) and (_withWeapon == 0)) exitWith {player groupChat localize "STRS_anim_nur_ohne_waffe";};

//Exit for animations that use scripts, such as holstering
if (_callScript != "") exitWith {[_animnumber, _animScriptName] execVM _callScript;};

//Check if player is on foot
if (vehicle player == player) then {
	//Animations in animList.sqf with type "anim" work with switchMove, others with playMove
	if (_animart == "anim") then 
	{					
		(format ["%1 switchmove ""%2"";", player, _animname]) call ISSE_pub_execPstr;
	}
	else 
	{
		(format ["%1 playMove ""%2"";", player, _animname]) call ISSE_pub_execPstr;
	};	
};