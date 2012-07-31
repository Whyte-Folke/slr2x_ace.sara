//Fade to black script by MAD T, 9th November 2010.

while {true} do
{
	waitUntil {(!(alive player))};
	while {(!(alive player))} do
	{
		0 fadeSound 0;
		//0 fadeRadio 0;
		0 fadeMusic 0;
		cutText ["","BLACK FADED",0];
		sleep 0.01;
	};
	1.5 fadeSound 1;
	//1.5 fadeRadio 1;
	1.5 fadeMusic 1;
	cutText ["","BLACK IN",0];
};