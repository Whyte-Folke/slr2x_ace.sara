TastenDruck = 
{
	private ["_ctrl", "_zeichennummer", "_ctrlid"];
	_ctrl          = ((_this select 0) select 0);
	_zeichennummer = ((_this select 0) select 1);
	_ctrlid        = (_this select 1);
	if (ISSE_str_const_validInput find _zeichennummer < 0) then
	{
		closedialog 0;
		player groupChat format[localize "STRS_wrong_input", _zeichennummer];
	};
};
ISSE_UnitExists = 
{
	private ["_obj"];
	if ((typeName _this) == "STRING") then
	{
		if ((isnil(_this)) or (_this == "scalar bool array string 0xe0ffffef") or (_this == "<NULL-Object>") or (_this == "Error: No vehicle")) then
		{
			false
		}
		else
		{
			_obj = call compile format ["%1", _this];
			if (format ["%1", isplayer _obj] == "true") then
			{
				true
			}
			else
			{
				false
			};
		};
	}
	else
	{
		if (isNull _this) then
		{
			false
		}
		else
		{
			true
		};
	};
};
ISSE_ArrayIsNear = 
{
	private ["_c", "_obj", "_arr", "_dis", "_res"];
	_obj = _this select 0;
	_arr = _this select 1;
	_dis = _this select 2;
	_res = false;
	if (isNull _obj) then 
	{	
		_res = false;
	}
	else
	{
		{
            _u = _x;
			if (not(isNull _u)) then
			{
				if ((_obj distance _u) < _dis) then
				{
					_res = true;
				};
			};
		} forEach _arr;
	};
	_res
};

ISSE_CreateMarkerArray =
{	
	private ["_name", "_text", "_color", "_shape", "_pos", "_typ", "_marker", "_size"];
	_pos = [0,0];
	if ((typeName (_this select 0)) == "OBJECT") then
	{
		_pos = [((getPos (_this select 0)) select 0), ((getPos (_this select 0)) select 1)];
	};
	if ((typeName (_this select 0)) == "ARRAY") then
	{
		_pos = [((_this select 0) select 0), ((_this select 0) select 1)];
	};		
	_text  = "";  
	if (count _this > 1) then {_text  = _this select 1};			
	_typ   = "Destroy";      
	if (count _this > 2) then {_typ   = _this select 2};
	_color = "ColorRed";
	if (count _this > 3) then {_color = _this select 3};
	_shape = "ICON";
	if (count _this > 4) then {_shape = _this select 4};
	_size  = [1, 1];
	if (count _this > 5) then {_size  = _this select 5};
	
	if (isNil("GespawnteMarkerCounter")) then {GespawnteMarkerCounter = 0;};
	_name = format["SpawnedMarker_%1", GespawnteMarkerCounter];
	if (count _this > 6) then {_name  = _this select 6};
	_marker = createMarkerLocal [_name, _pos];
	_marker setMarkerShapeLocal _shape;
	_marker setMarkerTypeLocal  _typ;
	_marker setMarkerColorLocal _color;
	_marker setMarkerTextLocal  _text;
	_marker setMarkerSizeLocal  _size;
	GespawnteMarkerCounter = GespawnteMarkerCounter + 1;
	[_name, _marker]
};

ISSE_IsVictim =
{
	private ["_state", "_victimStats"];
	_state  = animationState _this;
	_victimStats = ["AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon", "amovpercmstpssurwnondnon", "AdthPercMstpSnonWnonDnon_3", "adthpercmstpsnonwnondnon_3"];
	if (_state in _victimStats) then
	{
		true
	}
	else
	{
		false
	};
};

ISSE_DeleteVehicle = {
	private ["_vcl", "_deltime"];
	_vcl     = _this select 0;
	_deltime = _this select 1;
	sleep _deltime;
	if (not(isNull(_vcl))) then
	{
		_vcl setVehicleInit "";
		call compile format["%1 = nil;", _vcl];
		deleteVehicle _vcl;			
	};
};

if ((!isServer) or (server_client)) then {
// create a local marker function borrowed from Domination by Xeno 2009.
// parameters: marker name, marker pos, marker shape, marker color, marker size;(optional) marker text, marker dir, marker type, marker brush
// example: ["my marker",  position player, "Dot", "ColorBlue", [0.5,0.5]] call XfCreateMarkerLocal;
XfCreateMarkerLocal = {
	private ["_m_name","_m_pos","_m_shape","_m_col","_m_size","_m_text","_m_dir","_m_type","_m_brush"];
	_m_name = _this select 0;
	_m_pos = _this select 1;
	_m_shape = _this select 2;
	_m_col = _this select 3;
	_m_size = _this select 4;
	_m_text = (if (count _this > 5) then {_this select 5} else {""});
	_m_dir = (if (count _this > 6) then {_this select 6} else {-888888888888});
	_m_type = (if (count _this > 7) then {_this select 7} else {""});
	_m_brush = (if (count _this > 8) then {_this select 8} else {""});
	
	_xmarker = createMarkerLocal [_m_name, _m_pos];
	if (_m_shape != "") then {_xmarker setMarkerShapeLocal _m_shape};
	if (_m_col != "") then {_xmarker setMarkerColorLocal _m_col};
	if (count _m_size > 0) then {_xmarker setMarkerSizeLocal _m_size};
	if (_m_text != "") then {_xmarker setMarkerTextLocal _m_text};
	if (_m_dir != -888888888888) then {_xmarker setMarkerDirLocal _m_dir};
	if (_m_type != "") then {_xmarker setMarkerTypeLocal _m_type};
	if (_m_brush != "") then {_xmarker setMarkerBrushLocal _m_brush};
};

// Dynamic Weather Loop Funtion. Client side only.

XWeatherLoop = {
	rainy setPos (x_weather_array select 0);
	rainy2 setPos (x_weather_array select 1);
	rainy3 setPos (x_weather_array select 2);
	if (d_weather_fog) then {
		foggy setPos (x_weather_array select 3);
	};
	"rainmark" setMarkerPosLocal (x_weather_array select 0);
	"rainmarkt" setMarkerPosLocal (x_weather_array select 0);
	"rainmark2" setMarkerPosLocal (x_weather_array select 1);
	"rainmarkt2" setMarkerPosLocal (x_weather_array select 1);
	"rainmark3" setMarkerPosLocal (x_weather_array select 2);
	"rainmarkt3" setMarkerPosLocal (x_weather_array select 2);
	if (d_weather_fog) then {
		"fogmark" setMarkerPosLocal (x_weather_array select 3);
		"fogmarkt" setMarkerPosLocal (x_weather_array select 3);
	};
};
};

SetSatcamActive = {
	_activator = _this select 0;
	if (_activator == "enable") then {
		SatCamAvailableGlobal = true;
		if (iscop) then {
			hint format [localize "STRD_cam_orbit_reached"];
		};
	};
	if (_activator == "disable") then {
		SatCamAvailableGlobal = false;
		if (iscop) then {
			hint format [localize "STRD_cam_orbit_passed"];
			closeDialog 2001;
		};
	};
}; 

CHCK_Fuelstations ={
	{ if ((!(alive _x)) or (damage _x > 0.5)) then { _x setDamage 0; };} forEach TankstellenArray;
};
