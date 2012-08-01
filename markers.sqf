_civnumber = _this select 0;
if (_civnumber == 0) exitWith {};
if (_civnumber == 1) then 
{
	_markerobj = createMarker["konvoy_marker",[0,0]];
	_markername= "konvoy_marker";
	_markerobj setMarkerShape "ICON";
	"konvoy_marker" setMarkerType "Marker";
	"konvoy_marker" setMarkerColor "ColorYellow";
	"konvoy_marker" setMarkerText localize "STRS_Konvoymarker";
	while {true} do 
	{
		_markername SetMarkerPos [(getMarkerPos "marker_dead" select 0)-1000,(getMarkerPos "marker_dead" select 1)-1000];
		waitUntil {(konvoy_marker_active == 1)};
		while {konvoy_marker_active == 1} do 
		{
			_markername SetMarkerPos getpos konvoytruck;
			sleep 5;
		};
	};
};

if (_civnumber == 3) then 
{
	_UpdateArray = [];
	_MarkerArray = [];
	{
		_markername = format ["%1_marker", _x];
		_civmarker  = createmarkerLocal [_markername, [-1000, -1000] ];
		_civmarker  setMarkerShapeLocal "ICON";
		_markername setMarkerTypeLocal  "Destroy";
		_markername setMarkerColorLocal "ColorYellow";
		_markername setMarkerTextLocal  "";
		_markername setMarkerSizeLocal  [0.6, 0.6];
		_UpdateArray = _UpdateArray + [0];
		_MarkerArray = _MarkerArray + [_markername];
	} forEach civstringarray;
	while {true} do 
	{
		for [{_i=0}, {_i < (count civstringarray)}, {_i=_i+1}] do 
		{
			_civmarkerjammed = call compile format ["civ%1_markerjammed;",  (_i+1)];
			_civ = civarray select _i;
			_civstring = civstringarray select _i;
			_LastUpdate = _UpdateArray select _i;
			_markername = _MarkerArray select _i;
			if ((not(_civstring call ISSE_UnitExists)) or (_civmarkerjammed == 1)) then 
			{
				_markername setMarkerPos (getmarkerpos "marker_dead");
			} 
			else 
			{
				if ((call compile format ["%1_wanted;", _civstring]) == 1) then 
				{
					_markername setMarkerColorLocal "ColorRed";
				} 
				else 
				{
					_markername setMarkerColorLocal "ColorYellow";
				};
				_IsInVisibleArea = false;
                
                _hasMask = _civ getVariable "ACE_Identity";
                if (_hasMask == "ACE_GlassesBalaklava") then {
                	_markername setMarkerColorLocal "ColorYellow";     
                };

                _patrolledAreas = [];
				{
                    _cop = _x;
					if ((_civ distance _x) < (marker_CopDistance)) then 
					{
						_isInVisibleArea = true;
					};
                    
                    {
                        if ((_cop distance (_x select 0)) < ((_x select 1)*1.75)) then {
                        	_patrolledAreas set[(count _patrolledAreas), _x];   
                        };
                    } forEach CityLocationArray;
				} forEach coparray;
                
                {
                    if ((_civ distance (_x select 0)) < (_x select 1)) then 
					{
						_isInVisibleArea = true;
					};
                } forEach _patrolledAreas;
				
				if (not(_IsInVisibleArea)) then 
				{
					if (marker_ausserhalb > 0) then 
					{
						if (time > (_LastUpdate+marker_ausserhalb)) then 
						{
							_posX = ((getpos _civ) select 0) + (random CivMarkerUngenau) - (random CivMarkerUngenau);
							_posY = ((getpos _civ) select 1) + (random CivMarkerUngenau) - (random CivMarkerUngenau);
							if (alive _civ) then 
							{
								_markername setMarkerPosLocal [_posX, _posY];
							};
							_UpdateArray SET [_i, time];
						};
					} 
					else 
					{
						_markername setMarkerPosLocal (getmarkerpos "marker_dead");
					};
				} 
				else 
				{
					if (alive _civ) then 
					{
						_markername setMarkerPosLocal [(getpos _civ select 0), (getpos _civ select 1)];
					};	
					_UpdateArray SET [_i, time];
				};
			};
		};
		sleep marker_innerhalb;
	};
};

if (_civnumber == 2) then 
{
	if (not(iscop)) exitWith {};	
	_copnumber = 1; 
	_copmarkerarray = []; 
	_copmarkernamearray = [];
	while {_copnumber <= copscount} do 
	{
		_copmarker = createMarkerLocal[format["cop%1_marker", _copnumber], [-100, -100]];
		_copmarkerarray = _copmarkerarray + [_copmarker];
		_markername = format["cop%1_marker", _copnumber];
		_copmarkernamearray = _copmarkernamearray + [_markername];
		_copmarker setMarkerShapeLocal "ICON";
		_markername setMarkerTypeLocal "Destroy";
		_markername setMarkerColorLocal "ColorGreen";
		format["cop%1_marker", _copnumber] setMarkerTextLocal format["Cop%1" , _copnumber];
		_copnumber = _copnumber + 1;
	};
	
	{
		_x SetMarkerPosLocal [(getMarkerPos "marker_dead" select 0)-1000,(getMarkerPos "marker_dead" select 1)-1000]
	} forEach _copmarkernamearray;
	
	while {true} do 
	{
		_counter = 0;
		while {_counter < count coparray} do 
		{
			_cop = coparray select _counter;
			if ((not((format["%1", (_cop)]) call ISSE_UnitExists)) or (copmarker_on == 0)) then 
			{
				(_copmarkernamearray select _counter) SetMarkerPosLocal (getmarkerpos "marker_dead");
			} 
			else 
			{
				if (alive _cop) then 
				{
					(_copmarkernamearray select _counter) SetMarkerPosLocal [position _cop select 0, position _cop select 1];
				};
			};
			_counter = _counter + 1;
		};
		sleep 5;
	};
};