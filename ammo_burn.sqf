// ammo_burn.sqf By: Johnnyboy

private ["_ammo", "_dur"];
_ammo     = _this select 0;
_dur      = _this select 1;
_disappear = _this select 2;
// Following line insures the script only runs once in Multi-player
if (!local _ammo) exitWith {};

while {alive _ammo} do
{
  sleep 2;
};
_start_time = time;
_end_time   = _start_time + _dur;
_sleep      = 0;

_orig_pos = getpos _ammo;
_marker = "HeliHEmpty" createvehicle _orig_pos;

if (_disappear) then
{
   dummy = [_ammo, (_dur + 60)] execvm "ammo_burn_replace.sqf";
};

_boxDim = boundingBox _ammo;
_boxArray2 = _boxDim select 1;
_maxZ = _boxArray2 select 2;
_launchZ = _maxZ + .5;

_interval_max = 1;
while {time <= _end_time} do
{
   _rand = floor (random 10);

  switch (_rand) do {
  case 0:  {
           _pos = _marker modelToWorld [-3 + floor (random 6), -3 + floor(random 6),.2];
           _obj="GrenadeHand" createvehicle _pos;        
           };
  case 1:  {
           _pos = _marker modelToWorld [-5 + floor (random 10), -5 + floor(random 10),.2];
           _obj="R_Hydra_HE" createvehicle _pos;     
           _pos = _marker modelToWorld [-5 + floor(random 10), -5 + floor(random 10),1 + floor(random 9)];  
          _b2 = "Bomb" createVehicle _pos;
          _b2 setPos _pos;
          comment "_g = ASFlash1 createVehicle _pos;";
          _g = "GrenadeHand" createVehicle _pos;
          if (_ammo isKindOf "Car") then
          {
             _ammo setVelocity [0+ ((random 10)), 0+ ((random 10) ), 0+ ((random 10) )]; 
             sleep .3;     
             _marker setpos getpos _ammo;
          } else 
          {
             sleep .3;
          };
          deleteVehicle _b2;
          _pos = _marker modelToWorld [-5 + floor(random 10), -5 + floor(random 10),1 + floor(random 9)];  
          _b2 = "Bomb" createVehicle _pos;
          _b2 setPos _pos;
          _g = "GrenadeHand" createVehicle _pos;
          sleep .2;
          deleteVehicle _b2;
           };
  case 2:  {
           _pos = _marker modelToWorld [-5 + random 10, -5 + random 10,.2];
           _obj="R_Hydra_HE" createvehicle _pos;
           _pos = _marker modelToWorld [-5 + random 10, -5 + random 10,1 + random 4];  
           _b2 = "Bomb" createVehicle _pos;
           _b2 setPos _pos;
           _g = "GrenadeHand" createVehicle _pos;
           if (_ammo isKindOf "Car") then
           {
              _ammo setVelocity [0+ ((random 10)), 0+ ((random 10) ), 0+ ((random 10) )]; 
              sleep .3;     
              _marker setpos getpos _ammo;
           } else 
           {
              sleep .3;
           };
           _g = "GrenadeHand" createVehicle _pos;
           sleep .4;
           _g = "GrenadeHand" createVehicle _pos;
           sleep .2;
           deleteVehicle _b2;
           _pos = _marker modelToWorld [-5 + floor(random 10), -5 + floor(random 10),1 + floor(random 9)];  
           _b2 = "Bomb" createVehicle _pos;
           _b2 setPos _pos;_g = "GrenadeHand" createVehicle _pos;
           _g = "GrenadeHand" createVehicle _pos;    
           sleep .05;
           deleteVehicle _b2;
       };
  case 3:  {
           _pos = _marker modelToWorld [-5 + random 10, -5 + random 10,.2];
           _obj="R_Hydra_HE" createvehicle _pos;   
           _pos = _marker modelToWorld [-5 + random 10, -5 + random 10,1 + random 4];  
          _b2 = "Bomb" createVehicle _pos;
          _b2 setPos _pos;
          _g = "GrenadeHand" createVehicle _pos;
          if (_ammo isKindOf "Car") then
          {
             _ammo setVelocity [0+ ((random 10)), 0+ ((random 10) ), 0+ ((random 10) )]; 
             sleep .5;     
             _marker setpos getpos _ammo;
          } else 
          {
             sleep .5;
          };
          deleteVehicle _b2;
          _pos = _marker modelToWorld [-5 + floor(random 10), -5 + floor(random 10),1 + floor(random 9)];  
          _b2 = "Bomb" createVehicle _pos;
          _b2 setPos _pos;_g = "GrenadeHand" createVehicle _pos;
          _g = "GrenadeHand" createVehicle _pos;
          sleep .2;
          _g = "GrenadeHand" createVehicle _pos;
          sleep .6;
          deleteVehicle _b2;
           };
  case 4:  {
           _pos = _marker modelToWorld [-5 + random 10, -5 + random 10,.2];
           _obj="R_Hydra_HE" createvehicle _pos;        
           };
  case 5:  {
           _pos = _marker modelToWorld [0,0,_launchZ];
           _obj="M_Strela_AA" createvehicle _pos;
           _obj setdir random 359;
           _obj setvectorup  [-1 + random 2,-1 + random 2, 0.3 + random 1];
           _obj setvectordir [-1 + random 2,-1 + random 2, 0.3 + random 1];
           };
  case 6:  {
           _pos = _marker modelToWorld [0,0,_launchZ];
           _obj="M_Strela_AA" createvehicle _pos;
           _obj setdir random 359;
           _obj setvectorup  [-1 + random 2,-1 + random 2, 0.3 + random 1];
           _obj setvectordir [-1 + random 2,-1 + random 2, 0.3 + random 1];
           };
  case 7:  {
           _pos = _marker modelToWorld [0,0,_launchZ];
           _obj="M_Strela_AA" createvehicle _pos;
           _obj setdir random 359;
           _obj setvectorup  [-1 + random 2,-1 + random 2, 0.3 + random 1];
           _obj setvectordir [-1 + random 2,-1 + random 2, 0.3 + random 1];
           };
  default  {
           _pos = _marker modelToWorld [-6 + random 12, -6 + random 12,1];
           _obj="B_762x54_Ball" createvehicle _pos;
           };
  }; 
  sleep (_sleep + floor (random _interval_max));
  _interval_max = _interval_max + .2;
// End while loop
};


// Slight up angle follows
//   _obj setvectorup [0.001,.3,-1];
// setting 3rd value from -1 to 1 made it somewhat steeper, I think
//   _obj setvectorup [0.001,.3,1];
// setting 2nd value from .3 to 1 made it much more steeper up.!!!!!!!!!!!
//   _obj setvectorup [0.001,1,1];
//   _obj setvectorup [0 + random 1,0 + random 1, 0 + random 1];
//hint "end of ammo_burn script";