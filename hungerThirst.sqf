// Hunger, Thirst Stuff
// hungerThirst.sqf

_art = _this select 0;
if (_art == "init") then 
{
	_hungernachricht   = 0;
	_sleepTime         = 10;
	INV_nutrition = 100;
	if (interndebug) then 
	{
		debugarray = debugarray + [ "Hunger script init successfully called once" ];
	};
	while {true} do 
	{
		INV_nutrition = INV_nutrition - (xZe_nutritionDecrease);
		
		if (INV_nutrition < 2) then
		{
			INV_nutrition = 2;
		};
	
		if (INV_hunger < 100) then 
		{
			INV_hunger = INV_hunger + ((INV_HungerProSek*_sleepTime)/INV_nutrition);
			if ((_hungernachricht == 0) and (INV_hunger > 90)) then 
			{
				titleText [localize "STRS_inv_item_nahrung_verhungern", "plain"];
				_hungernachricht = 1;
			};
			if ((_hungernachricht == 1) and (INV_hunger <= 90)) then 
			{
				_hungernachricht = 0;
			};
			if (!alive player) then 
			{
				INV_hunger = 5;
			};
		} 
		else 
		{
			titleText [localize "STRS_inv_item_nahrung_verhungern", "plain"];
			player setDamage ((damage player) + (INV_HungerSchaden*1));
			INV_hunger = 100;
		};																		
		sleep _sleepTime;													
	};
};

if (_art == "use") then 
{
	_item   = _this select 1;
	_anzahl = _this select 2; //amount
	_hungerStillen = 0;
	_nutrition = 0;
	{
		if (_x select 0 == _item) exitWith
		{
			_hungerStillen = ((_x select 1) select 0);
			_nutrition = ((_x select 1) select 1);
		};
	} forEach xZe_foodTypes;
	
	INV_hunger = INV_hunger - (_hungerStillen*_anzahl);
	INV_nutrition = INV_nutrition + (_nutrition*_anzahl);
	
	if (INV_nutrition > 100) then
	{
		INV_nutrition = 100;
	};
	
	if (INV_hunger < 0) then 
	{
		INV_hunger = 0;
	};
	player groupChat format[localize "STRS_inv_item_nahrung_gegessen", ((round (100-INV_hunger)) call ISSE_str_IntToStr)];
	[_item, -(_anzahl)] call INV_AddInventoryItem;
};
