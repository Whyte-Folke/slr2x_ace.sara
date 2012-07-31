class NSPD_Shop_Password_Dialog
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {text1, eingabefeld, submit, cancel, dummybutton};

	class DLG_BACK1: RscBackground
	{
		x = 0.38; y = 0.42;
		w = 0.24; h = 0.13;
	};
	class background : RscBgRahmen
	{
		x = 0.38; y = 0.42;
		w = 0.24; h = 0.13;
		text = "Stringtable";
	};
	class text1 : RscText
	{
		idc = 2;
		x = 0.39; y = 0.45;
		w = 0.08; h = 0.04;
		text = "Password: ";
	};
	class eingabefeld : RscEdit
	{
		idc = 1;
		x = 0.47; y = 0.45;
		w = 0.13; h = 0.04;
		onChar = "[_this, 1] call TastenDruck;";
	};
	class submit : RscButton
	{
		idc = 4;
		x = 0.39; y = 0.50;
		w = 0.10; h = 0.04;
		text = "Ok";
		action = "[""Unlock"" ,(ctrlText 1)] call NSPD_Shop_System";
	};
	class cancel : RscButton
	{
		idc = 5;
		x = 0.51; y = 0.50;
		w = 0.10; h = 0.04;
		text = $STRD_description_cancel;
		action = "closedialog 0";
	};
	class dummybutton : RscDummy
	{
		idc = 1090;
	};
};