class Commanddialog
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {background};
	objects[] = { };
	controls[] = {Command_Zeile, befehle, publicCombo, submit, befehlselect, debugliste, befehl_0, befehl_1, befehl_2, befehl_3, befehl_4, befehl_5, befehl_6, befehl_7, befehl_8, befehl_9, befehl_10, befehl_11, befehl_12, befehl_13, befehl_14, befehl_15, befehl_16, befehl_17, befehl_18, befehl_19, befehl_20, befehl_21, befehl_22, befehl_23, befehl_24, befehl_25, befehl_26, befehl_27};

	class background : RscBackgroundPicture
	{
	x = 0.01; y = 0.01;
	w = 0.98; h = 0.98;
	};
	class Command_Zeile : RscEdit
	{
	idc = 1;
	x = 0.04; y = 0.04;
	w = 0.40; h = 0.04;
	autocomplete = "scripting";
	};
	class Submit : RscButton
	{
	x = 0.04; y = 0.09;
	w = 0.14; h = 0.04;
	text = "Execute";
	action = "[""exec"", ctrlText 1, lbText [3, lbCurSel 3]] execvm ""debugConsole.sqf"";";
	default = 1;
	};
	class publicCombo : RscCombo
	{
	idc = 3;
	x = 0.20; y = 0.09;
	w = 0.10; h = 0.04;
	};
	class befehle : RscCombo
	{
	idc = 2;
	x = 0.55; y = 0.04;
	w = 0.40; h = 0.04;
	};
	class befehlselect : RscButton
	{
	x = 0.55; y = 0.09;
	w = 0.14; h = 0.04;
	text = "Select";
	action = "ctrlsettext [1, lbText [2, lbCurSel 2]];";
	};
	class debugliste : RscListBox
	{
	idc = 100;
	x = 0.04; y = 0.15;
	w = 0.60; h = 0.75;
	SizeEX = 0.02;
	RowHeight = 0.03;
	};
	class befehl_0 : RscButton
	{
	idc = 10;
	x = 0.65; y = 0.25;
	w = 0.14; h = 0.04;
	};
	class befehl_1 : RscButton
	{
	idc = 11;
	x = 0.65; y = 0.30;
	w = 0.14; h = 0.04;
	};
	class befehl_2 : RscButton
	{
	idc = 12;
	x = 0.65; y = 0.35;
	w = 0.14; h = 0.04;
	};
	class befehl_3 : RscButton
	{
	idc = 13;
	x = 0.65; y = 0.40;
	w = 0.14; h = 0.04;
	};
	class befehl_4 : RscButton
	{
	idc = 14;
	x = 0.65; y = 0.45;
	w = 0.14; h = 0.04;
	};
	class befehl_5 : RscButton
	{
	idc = 15;
	x = 0.65; y = 0.50;
	w = 0.14; h = 0.04;
	};
	class befehl_6 : RscButton
	{
	idc = 16;
	x = 0.65; y = 0.55;
	w = 0.14; h = 0.04;
	};
	class befehl_7 : RscButton
	{
	idc = 17;
	x = 0.65; y = 0.60;
	w = 0.14; h = 0.04;
	};
	class befehl_8 : RscButton
	{
	idc = 18;
	x = 0.65; y = 0.65;
	w = 0.14; h = 0.04;
	};
	class befehl_9 : RscButton
	{
	idc = 19;
	x = 0.65; y = 0.70;
	w = 0.14; h = 0.04;
	};
	class befehl_10 : RscButton
	{
	idc = 20;
	x = 0.65; y = 0.75;
	w = 0.14; h = 0.04;
	};
	class befehl_11 : RscButton
	{
	idc = 21;
	x = 0.65; y = 0.80;
	w = 0.14; h = 0.04;
	};
	class befehl_12 : RscButton
	{
	idc = 22;
	x = 0.65; y = 0.85;
	w = 0.14; h = 0.04;
	};
	class befehl_13 : RscButton
	{
	idc = 23;
	x = 0.65; y = 0.90;
	w = 0.14; h = 0.04;
	};
	class befehl_14 : RscButton
	{
	idc = 24;
	x = 0.80; y = 0.25;
	w = 0.14; h = 0.04;	
	};
	class befehl_15 : RscButton
	{
	idc = 25;
	x = 0.80; y = 0.30;
	w = 0.14; h = 0.04;
	};
	class befehl_16 : RscButton
	{
	idc = 26;
	x = 0.80; y = 0.35;
	w = 0.14; h = 0.04;
	};
	class befehl_17 : RscButton
	{
	idc = 27;
	x = 0.80; y = 0.40;
	w = 0.14; h = 0.04;
	};
	class befehl_18 : RscButton
	{
	idc = 28;
	x = 0.80; y = 0.45;
	w = 0.14; h = 0.04;
	};
	class befehl_19 : RscButton
	{
	idc = 29;
	x = 0.80; y = 0.50;
	w = 0.14; h = 0.04;
	};
	class befehl_20 : RscButton
	{
	idc = 30;
	x = 0.80; y = 0.55;
	w = 0.14; h = 0.04;
	};
	class befehl_21 : RscButton
	{
	idc = 31;
	x = 0.80; y = 0.60;
	w = 0.14; h = 0.04;
	};
	class befehl_22 : RscButton
	{
	idc = 32;
	x = 0.80; y = 0.65;
	w = 0.14; h = 0.04;
	};
	class befehl_23 : RscButton
	{
	idc = 33;
	x = 0.80; y = 0.70;
	w = 0.14; h = 0.04;
	};
	class befehl_24 : RscButton
	{
	idc = 34;
	x = 0.80; y = 0.75;
	w = 0.14; h = 0.04;
	};
	class befehl_25 : RscButton
	{
	idc = 35;
	x = 0.80; y = 0.80;
	w = 0.14; h = 0.04;
	};
	class befehl_26 : RscButton
	{
	idc = 36;
	x = 0.80; y = 0.85;
	w = 0.14; h = 0.04;
	};
	class befehl_27 : RscButton
	{
	idc = 37;
	x = 0.80; y = 0.90;
	w = 0.14; h = 0.04;
	};
	class dummybutton : RscDummy {idc = 1026;};
};