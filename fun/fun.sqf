_h = [] execVM "fun\nuke.sqf";
_h = [] execVM "fun\nuke2.sqf";


SLR_fnc_nuclearWarning = {
	private ["_pos", "_time"];
    _pos = _this select 0;
    _time = _this select 1;
    
  	 _marker = createMarkerLocal ["nuclear_marker", getpos _pos];
    _marker setMarkerShapeLocal "ICON";
    _marker setMarkerTypeLocal "DOT";
    _marker setMarkerColorLocal "ColorRed";
    _marker setMarkerSizeLocal [0.50, 0.50];   
    _marker setMarkerTextLocal "Nuclear Weapon";
    
    [_marker, _pos] spawn {
        _marker = _this select 0;
        _vcl = _this select 1;
        
        while {true} do {
            _marker setMarkerPosLocal getpos _vcl;
            sleep 5;  
        };
        
    };
    
    player groupchat format["A nuclear bomb has been planted! The location is on your map. It will detonate in: %1 seconds", _time];
    
};

SLR_fnc_nuclearCleanup = {
	  deleteMArkerLocal "nuclear_marker";
    
};