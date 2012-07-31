SLR_fnc_lightbar = {
    _veh = _this;

	_ledoff = "";
	_strobeon = "#(argb,8,8,3)color(0.270588,0.866667,0.894118,1.0,CO)";
	_rearstrobeon = "#(argb,8,8,3)color(1,0.109804,0.109804,1.0,CO)";
    
    _veh setVariable ["rpp_strobeson",true,false];
	
	_delay = 0.0425;
	
	_lightBrightness = 0.11;
	_light = "#lightpoint" createVehicle getpos _veh; 
	_light setLightBrightness _lightBrightness; 
	_light setLightAmbient[0, 0, 0.07]; 
	_light setLightColor[0, 0.05, 1.0]; 
	_light lightAttachObject [_veh, [0,0,0]];

	while {_veh getVariable ["rpp_strobeson",false]} do
	{
		_light setLightBrightness _lightBrightness;
		for [{_p = 0},{_p < 3},{_p = _p + 1}] do
		{
			_veh setObjectTexture [1,_strobeon];
			_veh setObjectTexture [3,_strobeon];
			_veh setObjectTexture [6,_rearstrobeon];
			_veh setObjectTexture [7,_rearstrobeon];
			
			_veh setObjectTexture [2,_ledoff];
			_veh setObjectTexture [4,_ledoff];
			
			sleep _delay;
			
			_veh setObjectTexture [1,_ledoff];
			_veh setObjectTexture [3,_ledoff];
			_veh setObjectTexture [6,_ledoff];
			
			sleep _delay;
		};
		
		_light setLightBrightness 0; 
		_veh setObjectTexture [7,_ledoff];
		
		for [{_p = 0},{_p < 3},{_p = _p + 1}] do
		{
			_veh setObjectTexture [4,_strobeon];
			_veh setObjectTexture [2,_strobeon];
			_veh setObjectTexture [5,_rearstrobeon];
			_veh setObjectTexture [8,_rearstrobeon];
			
			_veh setObjectTexture [1,_ledoff];
			_veh setObjectTexture [3,_ledoff];
			
			sleep _delay;
			
			_veh setObjectTexture [4,_ledoff];
			_veh setObjectTexture [2,_ledoff];
			_veh setObjectTexture [5,_ledoff];
			
			sleep _delay;
		};
		
		_veh setObjectTexture [8,_ledoff];
	};

	_veh setObjectTexture [1,_ledoff];
	_veh setObjectTexture [2,_ledoff];
	_veh setObjectTexture [3,_ledoff];
	_veh setObjectTexture [4,_ledoff];
	_veh setObjectTexture [5,_ledoff];
	_veh setObjectTexture [6,_ledoff];
	_veh setObjectTexture [7,_ledoff];
	_veh setObjectTexture [8,_ledoff];
	deleteVehicle _light; 
};