// Important Public Functions
// functions_public.sqf
ISSE_pub_varCount = _this select 0;
ISSE_pub_varNum   = _this select 1;

ISSE_pub_varName  = format["ISSE_pub_Pstr_%1", ISSE_pub_varNum];
for [{_i=0}, {_i <= (ISSE_pub_varCount)}, {_i=_i+1}] do {
	_varName = format["ISSE_pub_Pstr_%1", _i];
	call compile format['%1 = " ";', _varName];
	//_varName addPublicVariableEventHandler { call compile (_this select 1);};
};

ISSE_pub_execPstr = {
	[_this] call SLR_fnet_execPublic;
};


ISSE_pub_execStr = {
	if ((TypeName _this) == "STRING") then {
		call compile _this;	
	} else {
		hint "Public Error: expecting String.";	
	};
};

"SLR_net_publicExecVar" addPublicVariableEventHandler
{
    (_this select 1) call SLR_fnet_execCommand;	
};

SLR_fnet_execPublic =
{
    SLR_net_publicExecVar = _this;
    publicVariable "SLR_net_publicExecVar";
    _this call SLR_fnet_execCommand;

};

SLR_fnet_execCommand =
{
    private ["_function", "_params"];
    _function = _this select 0;

    if ((count _this) == 2) then
    {
        _params = _this select 1;
    }
    else
    {
        _params = [];
    };

    if ((typeName _function) == "STRING") then
    {
        _function = compile (_this select 0);
    };

    _params call _function;
};

DYN_Weather_calc = {
	fRainLess = (random 0.583)^2; 
	fRainMore = 0.35 + random 0.75;
	fFogLess = (random 0.415)^2; 
	fFogMore = 0.35 + random 0.65;
	Publicvariable "fRainLess";
	Publicvariable "fRainMore";
	Publicvariable "fFogLess";
	Publicvariable "fFogMore";
};