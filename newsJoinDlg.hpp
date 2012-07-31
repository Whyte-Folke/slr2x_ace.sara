class NewsJoinDlg
{
	idd = 1631618;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background, DLG_BACK2};
	objects[] = { };
	controls[] = {header_text, newsList, newsTextbox, button_close, dummybutton};
	
	class DLG_BACK1: Rscbackground
	{
		x = 0.20; y = 0.19;
		w = 0.60; h = 0.61;
	};
	class background : RscBgRahmen
	{
		x = 0.20; y = 0.19;
		w = 0.60; h = 0.61;
	};
	class header_text : RscText
	{
		x = 0.21; y = 0.21;
		w = 0.25; h = 0.04;
		style = ST_CENTER;
		SizeEX = 0.04;
		text = "SLR News Updates";
	};

	class newsList : RscCombo
	{
		idc = 1562;
		x = 0.22; y = 0.265;
		w = 0.56; h = 0.04;
		onLBSelChanged = "_this call JAS_NewsItemChange;";

	};

	class DLG_BACK2: RscBgRahmen
	{
		x = 0.22; y = 0.33;
		w = 0.56; h = 0.41;
	};

	class newsTextbox : RscStructuredText
	{
		idc = 1564;
		x = 0.22; y = 0.34;
		w = 0.56; h = 0.39;
		text = "";

		class Attributes
		{
			font = "TahomaB";
			color = "#000000";
			align = "left";
			valign = "middle";
			shadow = false;
			shadowColor = "#ff0000";
			size = "1";
		}; 
	};
	class button_close : RscButton
	{
		x = 0.58; y = 0.75;
		w = 0.20; h = 0.04;
		idc = 10;
		text = $STRD_grafikeinstellungen_close;
		action = "closedialog 0;";
	};
	class dummybutton : RscDummy
	{
		idc = 1004;
	};
};