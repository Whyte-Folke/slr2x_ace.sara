//Dialogue for cops inventory

class inventarCop
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {background};
	objects[] = { };
	controls[] = {
		header,
		copheader,		
		button_use,
		button_drop,
		button_cancel,
		TransferButton,
		InfoItem,
		InfoItemVar,
		InfoAnzahl,
		InfoAnzahlVar,
		InfoAddinfo,
		InfoAddinfoVar,
		InfoGewicht,
		InfoGewichtVar,
		UseAmounteingabe,
		description,
		playerlist,
		Itemlist,
		dummybutton,
		coproadblock,
		copvimpound,
		copwimpound
	};
	class header : RscText
	{
		idc = 101;
		x = 0.23; y = 0.14;
		w = 0.55; h = 0.04;
		style = ST_CENTER;
		SizeEX = 0.03;
		text = $STRD_inv_description_inventar_header_police;
	};
	class background : RscBackground
	{
		x = 0.14; y = 0.10;
		w = 0.71; h = 0.75;
	};
	class button_use : RscButton
	{
		idc = 3;
		x = 0.15; y = 0.20;
		w = 0.20; h = 0.04;
		text = $STRD_inv_description_inventar_use;
	};			
	class button_cancel : RscButton
	{
		x = 0.15; y = 0.26;
		w = 0.20; h = 0.04;
		text = $STRD_inv_description_buyitem_close;
		action = "closedialog 0;";
	};										
	class button_drop : RscButton
	{	
		idc = 4;
		x = 0.15; y = 0.32;
		w = 0.20; h = 0.04;
		text = $STRD_inv_description_inventar_drop;
	};
	class TransferButton : RscButton
	{
		idc = 246;
		x = 0.15; y = 0.38;
		w = 0.20; h = 0.04;
		text = $STRD_inv_description_inventar_schluessel_uebergabe;
	};
	class UseAmounteingabe : RscEdit
	{
		idc = 501;
		x = 0.15; y = 0.44;
		w = 0.20; h = 0.04;
		text = "1";	
	};
	class playerlist : RscCombo
	{
		idc = 99;
		x = 0.15; y = 0.50;
		w = 0.20; h = 0.04;
	};
	class InfoItem : RscText
	{
		idc = 51;
		x = 0.15; y = 0.61;
		w = 0.20; h = 0.04;
		style = ST_LEFT;
		text = $STRD_inv_description_inventar_item;
	};										
	class InfoItemVar : RscText
	{
		idc = 52;
		x = 0.36; y = 0.61;
		w = 0.20; h = 0.04;
	};			
	class InfoAnzahl : RscText
	{
		idc = 61;
		x = 0.15; y = 0.66;
		w = 0.20; h = 0.04;
		style = ST_LEFT;
		text = $STRD_inv_description_inventar_amount;
	};
	class InfoAnzahlVar : RscText
	{
		idc = 62;
		x = 0.36; y = 0.66;	
		w = 0.20; h = 0.04;
	};
	class InfoAddinfo : RscText
	{
		idc = 71;
		x = 0.15; y = 0.71;
		w = 0.20; h = 0.04;
		style = ST_LEFT;
		text = $STRD_inv_description_inventar_addinfo;
	};						
	class InfoAddinfoVar : RscText
	{
		idc = 72;
		x = 0.36; y = 0.71;
		w = 0.50; h = 0.04;
	};
	class InfoGewicht : RscText
	{
		idc = 201;
		x = 0.15; y = 0.76;
		w = 0.20; h = 0.04;
		style = ST_LEFT;
		text = $STRD_inv_description_inventar_gewicht;
	};									 
	class InfoGewichtVar : RscText
	{
		idc = 202;
		x = 0.36; y = 0.76;
		w = 0.20; h = 0.04;
	};
	class description : RscText
	{
		idc = 7;
		x = 0.36; y = 0.20;
		w = 0.27; h = 0.25;
		style = ST_MULTI;
		lineSpacing = 1;
	};
	class Itemlist : RscListBox
	{
		idc = 1;
		x = 0.64; y = 0.20;
		w = 0.2; h = 0.34;
	};
	class copheader : RscText
	{
		idc = 187101;
		x = 0.64; y = 0.59;
		w = 0.2; h = 0.04;
		style = ST_CENTER;
		SizeEX = 0.025;
		text = $STRD_inv_description_inventar_polheader_police;
	};
	class coproadblock : RscButton
	{	
		idc = 18701;
		x = 0.64; y = 0.64;
		w = 0.2; h = 0.04;
		text = $STRD_inv_description_inventar_police_roadblock;
	};
	class copVimpound : RscButton
	{	
		idc = 18702;
		x = 0.64; y = 0.70;
		w = 0.2; h = 0.04;
		text = $STRD_inv_description_inventar_police_impoundw;
	};
	class copWimpound : RscButton
	{	
		idc = 18703;
		x = 0.64; y = 0.76;
		w = 0.2; h = 0.04;
		text = $STRD_inv_description_inventar_police_impoundv;
	};
	class dummybutton : RscDummy {idc = 1001;};
};