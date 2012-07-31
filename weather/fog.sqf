/*

while {true} do {
	waitUntil {sleep random 0.3;vehicle player in list foggy};
	if ((speed vehicle player) > 100) then {
		10 setFog fFogMore;
	} else {
		if ((speed vehicle player) > 25) then {
			35 setFog fFogMore;
		} else {
			if ((speed vehicle player) < 25) then {
				60 setFog fFogMore;
			};
		};
	};
	waitUntil {sleep random 0.3; not(vehicle player in list foggy) or not alive player};
	if (not alive player) then {
		10 setFog fFogLess;
	} else {
		if ((speed vehicle player) > 100 or not alive player) then {
			10 setFog fFogLess;
		} else {
			if ((speed vehicle player) > 25) then {
				35 setFog fFogLess;
			} else {
				if ((speed vehicle player) < 25) then {
					60 setFog fFogLess;
				};
			};
		};
	};
	sleep 1.0;
};

*/