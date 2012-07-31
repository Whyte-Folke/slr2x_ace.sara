// Lottery is owned by state so state gets the money you play with but also pays you if you win!
_lotto     = (_this  select 0) call GetLottoArray;

_lottocost = (_lotto select 2);
_lottowin  = (_lotto select 3);
_chance    = (_lotto select 4);
_winner    = random 50;
_money      = 'money' call INV_GetItemAmount;

if (_money < _lottocost) exitWith {role groupChat localize "STRS_lotto_nomoney";};

['money', -(_lottocost)] call INV_AddInventoryItem;
INV_SteuernGezahlt = INV_SteuernGezahlt + _lottocost;

player groupChat format[localize "STRS_lotto_wait"];
playing_lotto = true; 
sleep 5;
 playing_lotto = false;
 
 if (_winner >= _chance) then 
 {							
 
 player groupChat localize "STRS_lotto_lost";
 
 } else {										
 
 ['money', _lottowin] call INV_AddInventoryItem;	
 [_lottowin] call Bank_Gov_remove_money; 
 player groupChat format[localize "STRS_lotto_winner", (_lottowin call ISSE_str_IntToStr)];
 
 };