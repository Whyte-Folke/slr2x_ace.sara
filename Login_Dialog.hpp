class Login_Dialog
{
	idd = 99887755;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {text1, text2, eingabefeld, submit, cancel, dummybutton};

	class DLG_BACK1: RscBackground
	{
		x = 0.38; y = 0.42;
		w = 0.28; h = 0.48;
	};
	class background : RscBgRahmen
	{
		x = 0.38; y = 0.42;
		w = 0.28; h = 0.48;
		text = "Login Dialog";
	};
	class text1 : RscText
	{
		idc = 2;
		x = 0.39; y = 0.45;
		w = 0.08; h = 0.04;
		text = "Phrase: ";
	};
	class text2 : RscStructuredText
	{
		idc = 6;
		x = 0.39; y = 0.55;
		w = 0.27; h = 0.46;
		text = "How does this work? If this is your first time using the Login System, enter a phrase you will remember in the box and click Login/Create. You will need this every time you join the server, so you can load your stats. If you are returning, enter the phrase you previously used into the box and click Login/Create.";
	};
	class eingabefeld : RscEdit
	{
		idc = 1;
		x = 0.45; y = 0.45;
		w = 0.20; h = 0.04;
		onChar = "[_this, 1] call TastenDruck;";
	};
	class submit : RscButton
	{
		idc = 4;
		x = 0.39; y = 0.50;
		w = 0.15; h = 0.04;
		text = "login/Create";
		action = "[(ctrlText 1)] call ClientRequestVar;";
	};
	class cancel : RscButton
	{
		idc = 5;
		x = 0.55; y = 0.50;
		w = 0.10; h = 0.04;
		text = $STRD_description_cancel;
		action = "closedialog 0";
	};
	class dummybutton : RscDummy
	{
		idc = 1090;
	};
};