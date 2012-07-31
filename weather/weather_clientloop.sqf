// Client Loop for markers
[] spawn {
	while {true} do {
		[] spawn XWeatherLoop;	
		sleep 2.12;
	};
};