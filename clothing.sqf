SLR_fnc_changeUnit = 
{
    private ["_class", "_oldType", "_oldUnit", "_stored", "_dummyGroup", "_dummyUnit", "_newUnit"];
    _class = _this select 0;
    _oldtype = typeof player;
    _oldUnit = player;
    
     titleCut ["","black faded", 0];
     
     _position = getpos player;

    
    _stored = 
    [
        weapons _oldUnit, 
        magazines _oldUnit, 
        rank _oldUnit, 
        score _oldUnit, 
        group _oldUnit, 
        getPos _oldUnit, 
        (leader _oldUnit) == _oldUnit, 
        vehicleVarName _oldUnit
    ];


    _dummyGroup = createGroup (side _oldUnit);
    _dummyUnit = (_stored select 4) createUnit [_class, [0,0,0], [], 0, "NONE"]; 
    [_oldUnit] join _dummyGroup;

    
    _newUnit = _dummyGroup createUnit [_class, _stored select 5, [], 0, "NONE"];
    
    [_newUnit] join GrpNull;
   
    addSwitchableUnit _newUnit;
 
    _newUnit setpos getpos player;
    player setpos getpos empty;
    
    sleep 1;

    _oldUnit setVehicleInit format["this setVehicleVarName 'old%1'; old%1 = this", _stored select 7];
    _newUnit setVehicleInit format["this setVehicleVarName '%1'; %1 = this;", _stored select 7];
    processInitCommands;
    
    selectPlayer _newUnit;
    removeAllWeapons _newUnit;
    
    _newUnit setpos _position;
    
    { _newUnit addMagazine _x } forEach (_stored select 1);
    { _newUnit addWeapon _x } forEach (_stored select 0);
    
    removeSwitchableUnit _newUnit;
    removeSwitchableUnit _oldUnit;
    
    _oldUnit setpos [0,0,0];
    //hideObject _oldUnit;
    //deleteVehicle _oldUnit;
    
    //player addEventHandler ["killed", "[_this select 0, _this select 1] call RPP_fnc_killed;"];
    
    _newUnit setpos _position;
    
   	_newUnit addMPEventHandler ["MPKilled", {_this execVM "killedScript.sqf";}];
	_newUnit addEventHandler ["handleDamage",  { ["hit", _this] execVM "stun.sqf"; }];
    SLR_gClothingUpdate = true;
    SLR_gPlayer = _newUnit;

    titleCut["", "BLACK in",2];
};