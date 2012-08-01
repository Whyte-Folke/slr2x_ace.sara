//Arma-RPG SLR
//-------------
//Proper object placement script (objPlace.sqf)

//Global vars:
//HAMM_obj_dir
//HAMM_obj_dist
//HAMM_obj_height
//HAMM_obj_placing

_what = _this select 3;
_item = _this select 4;

switch (_what) do
{
	case "rotateleft":
	{
		HAMM_obj_dir = HAMM_obj_dir - 10;
		
	};
	case "rotateright":
	{
		HAMM_obj_dir = HAMM_obj_dir + 10;
	};
	case "distmore":
	{
		if (HAMM_obj_dist < HAMM_obj_maxDist) then
		{
			HAMM_obj_dist = HAMM_obj_dist + 0.25;
			hint format ["Distance: %1m (maximal: %2m)", HAMM_obj_dist, HAMM_obj_maxDist];
		}
		else
		{
			hint "cant further";
		};
	};
	case "distless":
	{
		if (HAMM_obj_dist > HAMM_obj_minDist) then
		{
			HAMM_obj_dist = HAMM_obj_dist - 0.25;
			hint format ["Distance: %1m (minimal: %2m)", HAMM_obj_dist, HAMM_obj_minDist];
		}
		else
		{
			hint "cant closer";
		};
	};
	
	case "heightmore":
	{
		if (HAMM_obj_height < HAMM_obj_maxHeight) then
		{
			HAMM_obj_height = HAMM_obj_height + 0.10;
			hint format ["Height: %1m (maximal: %2m)", HAMM_obj_height, HAMM_obj_maxHeight];
		}
		else
		{
			hint "cant higher";
		};
	};
	case "heightless":
	{
		if (HAMM_obj_height > HAMM_obj_minHeight) then
		{
			HAMM_obj_height = HAMM_obj_height - 0.10;
			hint format ["Height: %1m (minmal: %2m)", HAMM_obj_height, HAMM_obj_minHeight];
		}
		else
		{
			hint "cant higher";
		};
	};
	case "bendonoff":
	{
		if (HAMM_obj_bend) then
		{
			HAMM_obj_bend = false;
			hint "Terrain bending: OFF";
		}
		else
		{
			HAMM_obj_bend = true;
			hint "Terrain bending: ON";
		};
	};
	case "cancel":
	{
		HAMM_obj_placing = 0;
	};
	case "done":
	{
		HAMM_obj_placing = 2;
	};

	default
	{
		if (HAMM_obj_placing == 1) then
		{
			hint "already placing";
		}
		else
		{
			HAMM_obj_placing = 1;	

			hint "placing started";

			HAMM_obj_bend = true;
			HAMM_obj_dir = (_this select 2) select 0;
			HAMM_obj_dist = (_this select 0) select 0;
			HAMM_obj_height = (_this select 1) select 0;
			
			HAMM_obj_minDist = (_this select 0) select 1;
			HAMM_obj_maxDist = (_this select 0) select 2;
			
			HAMM_obj_minHeight = (_this select 1) select 1;
			HAMM_obj_maxHeight = (_this select 1) select 2;

			private "_object";
			_obj = [_what, position player, (direction player)] call INV_CreateObject;
			call compile format ["_object = %1", _obj];

			_rotateleft = player addAction ["[Rotate Left]", "placing\objPlace.sqf", "rotateleft"];
			_rotateright = player addAction ["[Rotate Right]", "placing\objPlace.sqf", "rotateright"];
			_distmore = player addAction ["[Further]", "placing\objPlace.sqf", "distmore"];
			_distless = player addAction ["[Closer]", "placing\objPlace.sqf", "distless"];
			_heightmore = player addAction ["[Raise]", "placing\objPlace.sqf", "heightmore"];
			_heightless = player addAction ["[Lower]", "placing\objPlace.sqf", "heightless"];
			_bendonoff = player addAction ["[Terrain bending on/off]", "placing\objPlace.sqf", "bendonoff"];
			_cancel = player addAction ["[Cancel]", "placing\objPlace.sqf", "cancel"];
			_done = player addAction ["[Done!]", "placing\objPlace.sqf", "done"];

			_dummy = "HeliHEmpty" createVehicleLocal position player;

			[_item, (-1)] call INV_addInventoryItem;

			while {true} do
			{
				if (isNull _object) exitwith
				{
					deleteVehicle _dummy;
					HAMM_obj_placing = 0;
					
					player removeAction _rotateleft;
					player removeAction _rotateright;
					player removeAction _distmore;
					player removeAction _distless;
					player removeAction _heightmore;
					player removeAction _heightless;
					player removeAction _bendonoff;
					player removeAction _cancel;
					player removeAction _done;
				};
				
				_dir = (getDir player) + HAMM_obj_dir;
				_object setDir _dir;
				_pos = player ModelToWorld [0, HAMM_obj_dist, HAMM_obj_height];
				_object setPos [_pos select 0, _pos select 1, HAMM_obj_height];

				if (!HAMM_obj_bend) then
				{
					_object setVectorUp [0,0,1];
				};
				
				if (not (alive player)) exitWith
				{
					HAMM_obj_placing = 0;			

					deleteVehicle _object;
					deleteVehicle _dummy;

					player removeAction _rotateleft;
					player removeAction _rotateright;
					player removeAction _distmore;
					player removeAction _distless;
					player removeAction _heightmore;
					player removeAction _heightless;
					player removeAction _bendonoff;
					player removeAction _cancel;
					player removeAction _done;
				};

				if ((HAMM_obj_placing == 0) || (player distance _dummy > 15)) exitWith
				{
					HAMM_obj_placing = 0;			

					deleteVehicle _object;
					deleteVehicle _dummy;
					[_item, 1] call INV_addInventoryItem;
					hint "placing canceled";

					player removeAction _rotateleft;
					player removeAction _rotateright;
					player removeAction _distmore;
					player removeAction _distless;
					player removeAction _heightmore;
					player removeAction _heightless;
					player removeAction _bendonoff;
					player removeAction _cancel;
					player removeAction _done;
				};

				if (HAMM_obj_placing == 2) exitWith
				{
					hint "building, stay nearby...";

					deleteVehicle _dummy;

					player removeAction _rotateleft;
					player removeAction _rotateright;
					player removeAction _distmore;
					player removeAction _distless;
					player removeAction _heightmore;
					player removeAction _heightless;
					player removeAction _bendonoff;
					player removeAction _cancel;
					player removeAction _done;

					player playMove "AinvPknlMstpSlayWrflDnon_medic";
					
					_pos = getPos player;
					_anim = 0;
					_time = ((_this select 2) select 1) * 10;
					_i = 0;
					_ok = true;
					while {_i < _time} do
					{
						if (!alive player) exitWith
						{
							_ok = false;
						};
						if (player distance _pos > 5) exitWith
						{
							[_item, 1] call INV_addInventoryItem;
							hint "moved away";
						};
						if (_anim >= 50) then
						{
							player playMove "AinvPknlMstpSlayWrflDnon_medic";
						};
						
						_i = _i + 1;
						sleep 0.1;
					};
					
					if (_ok) then
					{
						INV_objSpawned = INV_objSpawned + [ _object ];
						format ["INV_objServerSpawned = INV_objServerSpawned + [ [%1, 0] ];", _object] call ISSE_pub_execPstr;
						hint "built!";
					}
					else
					{
						deleteVehicle _object;
					};
					
					HAMM_obj_placing = 0;
				};
				sleep 0.01;
			};
		};
	};
};