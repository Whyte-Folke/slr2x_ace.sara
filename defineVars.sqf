// Base Variables and Arrays File
// defineVars.sqf

waitUntil {((alive player) or (isServer))};

SLR_hasMask = false;

//Hunger/Food Variables
xZe_foodTypes =
[
	["fisch", [1,0.5]],
	["getreide", [1,0.5]],
	["donut", [3,0.5]],
	["Shark", [1,6]],
	["Whale", [2,12]],
	["bread", [15,13]],
	["soup", [5, 3.5]],
	["Olives", [5,6]],
	["Apple", [7,7]],
	["cerealbar", [1,50]],
	["fish_filet", [19,19]],
	["shark_filet", [39,50]],
	["whale_filet", [54,70]]
];
xZe_nutritionDecrease = 0.15;

//drug dealer job vars
drugDealerJobLocations = [];
for [{_i=1},{((str getMarkerPos format["DealerJobLocation%1",_i]) != "[0,0,0]")},{_i=_i+1}] do
{
	_obj = format["DealerJobLocation%1", _i];

	drugDealerJobLocations set[(count drugDealerJobLocations), _obj];
};

drugDealerJobSettings =
[
	["marihuana", [10,1]],
	["kokain", [5,1]]
];
drugDealerJobWaitTime = 300;
drugDealerClientChance = 7;
drugAddicts = [ "sah_civilian4_shorts", "sah_civilian3_shorts", "sah_civilian2_shorts", "sah_civilian1_shorts" ];
numDrugAddicts = 15;
isDealer = false;



// Debug Vars
internDebug    = false;
debug          = false;
debugarray     = [];
//if (interndebug) then {ACE_sys_wound_debug = true;};
MoneyDebug 	   = false;
phonedebug 	   = false;
noIntro		   = false;

Civilian setFriend [West, 1];
WEST setFriend [Civilian, 1];

RESISTANCE setFriend [West, 1];
WEST setFriend [RESISTANCE, 1];

RESISTANCE setFriend [Civilian, 1];
Civilian setFriend [RESISTANCE, 1];

RESISTANCE setFriend [EAST, 1];
EAST setFriend [RESISTANCE, 1];

EAST setFriend [Civilian, 0];
Civilian setFriend [EAST, 0];

WEST setFriend [EAST, 0];
EAST setFriend [WEST, 0];

// Player Arrays
role = player;
startgroup = group player;
copscount      = 12;
civscount      = 20;
playercount    = 32;
playerstringarray = ["Civ1", "Civ2", "Civ3", "Civ4", "Civ5", "Civ6", "Civ7", "Civ8", "Civ9", "Civ10", "Civ11", "Civ12",	"Civ13", "Civ14", "Civ15", "Civ16", "Civ17", "Civ18", "Civ19", "Civ20", "Cop1", "Cop2", "Cop3", "Cop4", "Cop5", "Cop6",	"Cop7",	"Cop8",	"Cop9",	"Cop10", "Cop11", "Cop12"];
for [{_i=0}, {_i < (count playerstringarray)}, {_i=_i+1}] do 
{
	if (isNil (playerstringarray select _i)) then 
	{
		call compile format["%1 = objNull;", (playerstringarray select _i)]; 
	}; 
};
if (isNil "playerarray") then {
	playerarray       = [civ1, civ2, civ3, civ4, civ5, civ6, civ7, civ8, civ9, civ10, civ11, civ12, civ13, civ14, civ15, civ16, civ17, civ18, civ19, civ20, cop1, cop2, cop3, cop4, cop5, cop6, cop7, cop8, cop9, cop10, cop11, cop12];
};

if (isnil "coparray") then { 
	coparray          = [cop1,   cop2,   cop3,   cop4,   cop5,   cop6,  cop7,  cop8,  cop9,	 cop10,	 cop11,	cop12];
};

if (isNil "civarray") then {
	civarray          = [civ1, civ2, civ3, civ4, civ5, civ6, civ7, civ8, civ9, civ10, civ11, civ12, civ13, civ14, civ15, civ16, civ17, civ18, civ19, civ20];     
};
civstringarray    = ["Civ1", "Civ2", "Civ3", "Civ4", "Civ5", "Civ6", "Civ7", "Civ8", "Civ9", "Civ10", "Civ11", "Civ12",	"Civ13", "Civ14", "Civ15", "Civ16", "Civ17", "Civ18", "Civ19", "Civ20"];

copstringarray    = ["Cop1", "Cop2", "Cop3", "Cop4", "Cop5", "Cop6", "Cop7", "Cop8", "Cop9", "Cop10", "Cop11",	"Cop12"];

swatarray         = [];
swatstringarray   = [];
undercoverarray = [];
undercoverstringarray = [];
borderpatrolarray = [];
borderpatrolstringarray = [];
rolenumber = 0; 
for [{_i=0}, {_i < (count playerarray)}, {_i=_i+1}] do {
  call compile format["if ((playerarray select %1) == player) then {rolenumber = (%1 + 1);}", _i];
};

// Define you exact role....
if (player in coparray) then {
	iscop = true;
	rolecop = 1;
	sidenumber = rolenumber - civscount;
	longrolenumber = 1100 + sidenumber;
	rolestring = format["Cop%1", sidenumber];
} else {
	iscop = false;
	rolecop = 0;
};
if (player in civarray) then {
	sidenumber = rolenumber;
	longrolenumber = 1000 + sidenumber;
	rolestring = format["Civ%1", sidenumber];
};
/*if (player in swatarray) then {
	isswat = true; 
	roleswat = 1;
} else {
	isswat = false; 
	roleswat = 0;
};*/
/*if (player in undercoverarray) then {
	isundercover = true;
	roleundercover = 1;
	iscop = true;
	rolecop = 1;
} else {
    isundercover = false;
	roleundercover = 0;
};*/

isundercover = false;
roleundercover = 0;

if (player in borderpatrolarray) then {
	isborderpatrol = true; 
	roleborderpatrol = 1;
} else {
	isborderpatrol = false; 
	roleborderpatrol = 0;
};

// Dynamic weather parameters
d_weather_fog = true;
d_weather_sandstorm = false;
//  fRainLess = random 0.34; //linear random
fRainLess = (random 0.583)^2; //tendency towards nicer weather in nice weather areas
fRainMore = 0.35 + random 0.75; //1.1 for better chance of actual thunderstorms
//  fFogLess = random 0.33; //linear random
fFogLess = (random 0.415)^2; //tendency towards less fog in fogless areas
fFogMore = 0.35 + random 0.65;

// Inventory Variables
INV_LizenzOwner = [];
INV_ROLESTRING  		= format["%1", player];
INV_CALL_CREATVEHICLE 	= "vehDespawn.sqf";
INV_CALL_CREATEDWEAPON	= "junkScript.sqf";
INV_CALL_CREATEDITEM 	= "junkScript2.sqf";
INV_MAX_ITEMS 		= 999999;
INV_smscost = 10;
INV_SaveVclArray  		= true;
INV_VehicleArray 		= [];
INV_ServerVclArray 		= [];
INV_SaveObjArray 		= false;
INV_ObjectsArray 		= [];
INV_ServerObjArray 		= [];
INV_CanUseInventory		= true;
INV_CanUseItem			= true;
INV_CanDropItem			= true;
INV_CanGiveItem			= true;
INV_Tragfaehigkeit		= 25;
INV_InventarArray			= [];
INV_SteuernGezahlt		= 0;
INV_hunger         = 1.5;
INV_HungerProSek   = 0.8;
INV_HungerSchaden  = 0.001;
INV_HungerStartVal = 50;
INV_Thirst         = 5;
INV_ThirstProSek   = 0.015;
INV_ThirstSchaden  = 0.001;
INV_ThirstStartVal = 50;
INV_objSpawned         = [];
INV_objServerSpawned   = [];
INV_objMaxObject       = 150;
INV_objIdleTime        = (3600 * 60);
	
INV_VehicleGaragen		= 
[	
[vehicle_garage_cop, 90], 
[vehicle_garage_sap, 60], 
[vehicle_garage_sap2, 50],
[rathaus_logic, 20],
[rathaus_logic2, 10],
[vehicle_parklot_bag, 17],
[vehicle_parklot_pita, 60]
];

clone_random_class =
[
"ACE_SquadLeaderG_INS_A", 
"ACE_SoldierG_MG_INS_A", 
"ACE_SoldierG_AA_INS_A", 
"ACE_SoldierG_Demo_INS_A", 
"ACE_SoldierG_AT_INS_A", 
"ACE_SoldierG_RPG_INS_A", 
"ACE_SoldierG_SR_INS_A", 
"ACE_SoldierG_Sniper_INS_A", 
"ACE_SoldierG_Spotter_INS_A" 
];

repair_anims = [
 "ActsPercSnonWnonDnon_carFixing",
 "ActsPercSnonWnonDnon_carFixing2"
 ];
 
vclStorage_array = ["civstorage1_local", "coplager_local"];

INV_PlacingVerbotArray =
[
[jailsperre, 115]
];
INV_inactive_vcl_maxtime	= 120;
/*INV_JIP 				= true;
publicVariable "INV_JIP";*/

// Money+banking Values
Startmoney				= 12500;
robb_timeSperre			= 1800;	
local_useBankPossible		= true;
robb_money				= 4500;
BankRaubKontoverlust		= 2500;
BankRaubProzentVerlust		= 10;
bank_steuer				= 7;
zinsen_prozent			= 0;          
zinsen_dauer			= 1800;       
SLR_gIntroFinished = false;
if (internDebug) then { zinsen_dauer = 200;};
robb_possible			= 1; 		 
Kontostand				= Startmoney; 
bankflagarray			= [bankflag_1, bankflag_2, bankflag_3, bankflag_4, bankflag_5, bankflag_6, bankflag_7, bankflag_8, bankflag_9, bankflag_paraiso, bankflag_ortego, copbuy_border, bankflag_eponia];
MainBank				= bankflag_1;


// Values for Taxes and its changes
// default-Taxes are the Numbers on 3rd place. See in openDialogs2.sqf under "if (_art == "steuern") then {"
INV_ItemTypenArray = [ ["Item", "Item", 20], ["Fahrzeug", "Vehicle",30], ["Magazin","Magazine",50], ["Waffe","Weapon",50]];
GovernmentTaxAccount 	= 50000;
TaxiMissionReward 		= 0;
GblFuelTaxes            = 50;
GblWealthTaxLimit		= 1000000;
GblWealthTax			= 5;
GblIncomeTaxClass1      = 25;
GblIncomeTaxClass2      = 25;
GblIncomeTaxClass3      = 25;
GblIncomeTaxClass4      = 25;
GblIncomeTaxClass5      = 25;
GblWelfareIncomeLimit   = 1000;
GblWelfareBankLimit     = 15000;
PoliceChiefExtraPay		= 1500;
MayorExtraPay			= 2000;
add_civmoney 			= 500;
add_copmoney			= 1250;
add_workplace			= 900;
uni_training_add		= 750;


// Obvious Variables
terrorshopmultiplier = 5;
atBusting = false;
MoneyArray = [];
PlayersAccount = 0;
harvestready = 0;
isMayor	= false;
voteArray = [];
MayorNumber	= -1;
ChiefNumber = -1;
chiefarray = [];
isChief = false;
playerpunched = false;
blackmarketrandommultiplier = 2.7;
playing_lotto = false;
TankenCost = 4;
AVGAS_TankenCost = 90;
SatCamAvailableGlobal = false;
cellphoneinuse = false;
lockpick_active = false;
fuelkitinuse = 0;
repkitinuse = 0;
clear_chat = false;
unflip_active = false;
NSPD_shop_unlocked = false;
speedcam_take = false;
DynBr_Men = [];
DynBr_max_men = 6;
JIP_Stats_Ready = false;
JIP_Stats_Wait = false;
pickingup = false;

airtaxicost = 5000;
isTerrorist = false;
CopWaffenAvailable	= 0;
CopIsInPrison = false;
CopInPrisonTime = 300;
night					= 0;
deadcam				= 0;
isstunned				= false;
Antwort				= 0;           	
CivTimeInPrison			= 0;           	
CopLog				= [];                 	
konvoyrespawnzeit			= 30;
if (interndebug) then {konvoyrespawnzeit = 2};         
eigene_zeit				= time;
money_limit				= ISSE_MAX_NUMBER; 
wantedbonus				= 500;         
StunActiveTime			= 15;
moneyStehlenMax			= 250000;

// Racing Vars
race_starting            = 0;
race_started             = 0;
race_ended               = 0;
race_gewonnen_anzahl     = 0;
race_bestzeit_eigen      = -1;
race_multi_win           = 3;
race_join_cost           = 2500;
MaxRaceTime              = 1000;  

CityLocationArray			= 
[ 
[CityLogic1, 500], 
[CityLogic2, 250], 
[CityLogic3, 250], 
[CityLogic4, 250], 
[CityLogic5, 250], 
[CityLogic6, 250], 
[CityLogic7, 300], 
[CityLogic8, 350]	
];

// Group IDs
basic_police_officers1 setGroupId ["Regular Officer1"];
basic_police_officers2 setGroupId ["Regular Officer2"];
basic_police_officers3 setGroupId ["Regular Officer3"];
basic_police_officers4 setGroupId ["Regular Officer4"];
basic_police_officers5 setGroupId ["Regular Officer5"];
basic_police_officers6 setGroupId ["Regular Officer6"];
basic_police_officers7 setGroupId ["Regular Officer7"];
basic_police_officers8 setGroupId ["Regular Officer8"];
basic_police_officers9 setGroupId ["Regular Officer9"];
// basic_swat_officers setGroupId ["Swat Unit"];
basic_bpatrol_officers1 setGroupId ["Border Patrol1"];
basic_bpatrol_officers2 setGroupId ["Border Patrol2"];
basic_bpatrol_officers3 setGroupId ["Border Patrol3"];
//basic_undercover_officers1 setGroupId ["Undercover Agent1"];
//basic_undercover_officers2 setGroupId ["Undercover Agent2"];

// Radio Messages

if (iscop) then 
{
	RadioTextMsg_1 = "Please put your hands up";
	RadioTextMsg_2 = "Turn the engine off and remain in your vehicle";
	RadioTextMsg_3 = "Drop your weapon and put your hands in the air!";
	RadioTextMsg_4 = "Thank you for your cooperation";
} 
else 
{
	RadioTextMsg_1 = "Dont shoot! I surrender!";
	RadioTextMsg_2 = "Dont shoot! I surrender!";
	RadioTextMsg_3 = "Dont shoot! I surrender!";
	RadioTextMsg_4 = "Dont shoot! I surrender!";
};

RadioTextArt_1 = "direct";
RadioTextArt_2 = "direct";
RadioTextArt_3 = "direct";
RadioTextArt_4 = "direct";

JIP_PublicArray_ready    	= false;
publicarbeiterarctionarray	= [];
JIP_Arbeiter_Action_Array	= "";
ENV_SkipTimeDay    		= (floor(Param2/100));
SkipTimeNight  			= (Param2 mod 100);

for [{_i=1}, {_i <= civscount}, {_i=_i+1}] do 
{
	call compile format ["bounty_civ%1 = 0;civ%1_wanted = 0; civ%1_arrest = 0;civ%1_markerjammed  = 0; civ%1_account = 0;", _i];
};
{
	call compile format ["%1_needSupport = false;", _x];
} forEach (copstringarray + undercoverstringarray);

Account_in_use_array = [];
for [{_i=0}, {_i < (count playerarray)}, {_i=_i+1}] do 
{
	Account_in_use_array = Account_in_use_array + [["",""]];
};

local_arrest			= 0;
deadtimewait			= 25;
deadcoptimewait			= 10;
respawnzeit				= 30;
DeadWaitSec				= respawnzeit;
DeadTimeMax				= 300;
deadtimebonus			= 0.001;
deadtimes				= 0;
CopsKilled				= 0;
CivsKilled				= 0;
SelfKilled				= 0;
killstrafe				= 1000;
copteamkillstrafe			= 5000;
GildenErstellenCost		= 25000;
GildenEintrittCost		= 5000;
MaxPlayersProGilde		= 5;
EroberungenAktiv		= false;
WarteVorEroberung		= 60 * 60;
GangEroberungsZeit		= 120;
MinRegierungsPunkte		= 100;
RegierungsID			= -1;
isRegierung				= false;
isTerrorleader			= false;
GildenInfoArrays			= [];
GildenAnzahl			= 0;
isGildenMember			= false;
isGildenLeader			= false;
EigeneGildenId			= -1;
GildenLeaderTotPt		= -10;
EigenesGildenArray		= [];
GesetzAnzahl			= 20;
GesetzArray				= 
[
"You must follow all road signs and traffic laws",
"You must own a relevent licence for a gun or car",
"You could lose your licence if it is abused",
"Respect and obey the cops orders",
"Drugs are illegal",
"Do not break others out from jail",
"Respect others as you would expect to be yourself",
"Terrorists will get a large jailtime when caught",
"",
"",
"",
"",
"",
"",
"",
"",
"",
"",
"",
""
];
GildenPunktCost			= 1000;

for [{_i=0}, {_i < civscount}, {_i=_i+1}] do {voteArray = voteArray + [ [] ];  };
for [{_i=0}, {_i < playercount}, {_i=_i+1}] do { chiefarray = chiefarray + [ [] ]; };
deadcam_target_array	= [[17205.75,99198.17,-49454.65],[114238.47,12719.49,3040.26],[114238.47,12719.49,3040.28],[9396.48,-87407.76,-3495.99],[9396.48,-87407.76,-3495.72],[-85499.48,17145.94,-3497.86],[-81437.91,41177.12,-3500.26],[-68592.92,68496.92,-3504.91],[63894.18,99059.27,-3504.91],[57781.25,102312.13,-3505.24],[18155.12,112290.52,-3505.59],[114056.91,13559.94,-3506.64],[114056.91,13559.94,-3506.63],[12082.11,112377.59,-3507.94],[12082.11,112377.59,-3508.13],[12082.11,112377.59,-3507.88],[71475.13,94441.38,-3511.65],[79131.48,88521.11,-3512.17],[90116.62,77668.10,-3514.78],[93979.69,72896.55,-3515.45],[23989.44,112118.31,-3515.51],[111421.41,-10631.93,-3515.78],[111421.41,-10631.93,-3515.45],[111421.41,-10631.93,-3515.62],[-85207.23,22475.24,-3515.77],[-85269.09,22481.34,761.18],[-52542.68,-60176.11,-15820.92],[66335.50,-71098.57,-15831.98],[112733.68,9274.25,-15848.19],[112733.68,9274.25,-15848.03],[112733.68,9274.25,-15848.01],[112733.68,9274.25,-15848.28],[15793.38,-87445.16,-1975.57],[15793.38,-87445.16,-1975.58],[-85045.43,23679.19,-1976.55],[-2976.49,110953.34,-1977.04],[-2976.49,110953.34,-1976.94],[25975.48,-86795.57,-1977.29],[25975.48,-86795.57,-1977.28],[30152.87,-86219.98,-1977.49],[114191.58,8919.13,-1977.75],[114186.95,8335.76,-1978.02],[13212.45,-87514.59,-1978.28],[13212.45,-87514.59,-1978.39],[13328.19,-76559.05,-45508.50]];	deadcam_position_array   = [	[14273.78,12365.67,19.16],[14263.33,12408.16,2.60],[14298.98,12408.27,2.60],[14315.21,12404.75,2.60],[14316.97,12369.89,2.60],[14319.17,12355.47,2.36],[14250.88,12357.08,2.60],[14119.63,12400.90,2.92],[14112.46,12403.60,2.08],[14121.08,12419.00,2.08],[14127.18,12457.75,2.08],[14124.96,12462.48,2.08],[14164.31,12462.91,2.08],[14171.92,12463.14,2.08],[14171.38,12538.25,2.08],[14171.13,12550.88,2.08],[14169.29,12568.52,2.08],[14193.91,12598.42,2.08],[14225.21,12646.20,2.08],[14239.44,12658.20,2.08],[14239.00,12658.38,2.08],[14239.94,12668.50,2.35],[14242.29,12667.94,2.33],[14246.04,12667.05,5.37],[14247.04,12668.54,5.41],[14242.96,12668.32,6.69],[14069.18,12697.18,7.22],	[13992.32,12615.79,6.43],[14079.88,12514.44,6.43],[14160.67,12516.16,6.43],[14188.56,12525.49,6.43],[14251.50,12521.79,6.43],[14306.49,12523.45,1.69],[14306.37,12476.85,1.69],[14302.42,12474.65,1.69],[14278.19,12474.97,1.69],[14274.55,12488.17,1.69],[14274.79,12497.03,1.69],[14273.99,12491.74,5.46],[14274.33,12490.64,4.93],[14274.66,12458.02,4.93],[14297.66,12457.95,4.93],[14299.95,12459.04,5.23],[14299.66,12459.05,18.31],[14275.55,12451.36,19.46]];
deadcam_wechsel_dauer	= 5;
deadcam_kameraposition	= 0;
huren_cost			= 5000;
hoemoneyprosekunde	= 500;
maxhuren			= 5;
copworkerallowed		= 1;
pimpactive			= 0;
localhuren			= 0;
localhurencounter		= 0;
speedbomb_minspeed	= 1;
speedbomb_maxspeed	= 100;
speedbomb_mindur		= 10;
speedbomb_maxdur		= 300;
zeitbombe_mintime		= 10;
zeitbombe_maxtime		= 120;

BuyAbleBuildingsArray   = 
[
["shop1",	"Shop 1",		shop_buyflag1,		7500,		750,	"shop",	"ShopAblage_1"],
["shop2",	"Shop 2",		shop_buyflag2,		15000,	1500,	"shop",	"ShopAblage_2"],
["shop3",	"Shop 3",		shop_buyflag3,		25000,	2500,	"shop",	"ShopAblage_3"],
["wp1",	"Workplace 1",	workplace_buyflag1,	7500,		750,	"wp",		"WpAblage_1"],
["wp2",	"Workplace 2",	workplace_buyflag2,	15000,	1500,	"wp",		"WpAblage_2"],
["wp3",	"Workplace 3",	workplace_buyflag3,	25000,	2500,	"wp",		"WpAblage_3"]	
];

BuildingsOwnerArray = [];

HideoutArray = 	
[
["CampEmpty",	localize "STRS_variablen_hideout_small",	"\arpg_common\klein.JPG",	20000,	[] ],
["CampEastC",	localize "STRS_variablen_hideout_middle",	"\arpg_common\mittel.JPG",	30000,	[] ],
["CampEastC",	localize "STRS_variablen_hideout_large",	"\arpg_common\gross.JPG",	45000,	[] ]	
];

hideoutHouseArray			= 	["CampEmpty",	"CampEastC", 	"CampEastC"];
hideoutNameArray 			= 	[localize "STRS_variablen_hideout_small",	localize "STRS_variablen_hideout_middle",	localize "STRS_variablen_hideout_large"	];
hideoutHousePictureArray	= 	["\arpg_common\klein.jpg", "\arpg_common\mittel.jpg", "\arpg_common\gross.jpg"];
hideoutPriceArray			=	[20000, 30000, 	45000];
hideout_bonus			= 	1500;
hideout_arraynumber		= 	-1;
localhideoutmarker		= 	"";
HideoutMarkerName			= "hideoutmarker";
hideout_objarray			= [];
hideout_addons_cost		= [2500, 75000, 5000, 3000];
hideout_addons_active		= [0, 0, 0, 0];
hideout_addons_names		= [localize "STRS_variablen_hideout_addon_firstaid", localize "STRS_variablen_hideout_addon_teleporter", localize "STRS_variablen_hideout_addon_banking"];
HideoutLocationArray = 
[ 
[CityLogic1, 500], 
[CityLogic2, 250], 
[CityLogic3, 250], 
[CityLogic4, 250], 
[CityLogic5, 250], 
[CityLogic6, 250] 	
];

INV_local_hashideout	= 0;
hideoutteleporton		= 0;
hideout_abgeschlossen	= false;
hideout_einbrucharray	= [];
publichideoutarray	= [];
JIP_Hideout_Flag_Array	= [];
SpawnAtHideout		= false;
marker_ausserhalb		= 0;
marker_innerhalb		= 5;
marker_CopDistance	= 150;
CivMarkerUngenau		= 30;
copmarker_on		= 1;



/*
if (iscop) then 
{
	"teleport1" setMarkerPosLocal [getpos cophospitaltent select 0, getpos cophospitaltent select 1];
	 teleport_cost = 35000;
};

if (not(iscop)) then 
{
	"teleport1" setMarkerPosLocal [getpos hospitaltent    select 0, 	getpos hospitaltent    select 1];
	 teleport_cost = 55000;
};
*/

workplacearray			= 
[
[workplace1, 100], 
[workplace2, 100], 
[workplace3, 100]
];
timeinworkplace			= 0;
//respawnarray			= [spawnflag_1,	spawnflag_2,	spawnflag_3,	spawnflag_4,	spawnflag_5,	spawnflag_6,	spawnflag_7,	spawnflag_8,	spawnflag_9,	spawnflag_10];
respawnarray_mark			= [getmarkerpos "spawn_mark1", getmarkerpos "spawn_mark2", getmarkerpos "spawn_mark3"];

// Lotto Arrays:
LottoArray = 
[									
["lotto1", "Cheap ticket",	500, 10000, 3],							
["lotto2", "Normal ticket", 1000,	35000,	3],			
["lotto3", "Super ticket",	2500,	100000,	 3],								
["lotto4", "Mega ticket",	10000,	500000,	 3]];

LottoFlags = 
[								
[lottoflag, ["lotto1", "lotto2", "lotto3", "lotto4"] ]
];

// Fuelstation Stuff


TankstellenArray =
[
 tankstelle_fahne1, 
 tankstelle2, 
 tankstelle3, 
 tankstelle4, 
 tankstelle5, 
 tankstelle_base, 
 tankstelle6,
 disable_tanke2, 
 disable_tanke3, 
 disable_tanke4,
 disable_tanke5, 
 disable_tanke6, 
 disable_tanke7, 
 disable_tanke8
];
 

AVGAS_TankstellenArray = 
[
avgas_tanke1
];

// Workplace Vars/Arrays
// workplaceVars.sqf

workplacejob_plane_zielarray	 = [getmarkerpos "planemarker1", getmarkerpos "planemarker2", getmarkerpos "planemarker3", getmarkerpos "planemarker4"];
workplacejob_plane_sperrzeit	= 10;
workplacejob_plane_multiplikator  = 15;
workplacejob_plane_maxmoney       = 40000;
alreadygotaworkplacejob 		= 0;
workplacemissioninfos 			= ["", ""];
workplacejob_actionflag_search	= workplace_getjobflag_1;
workplacejob_search_cancel		= 0;
searchjobsuccess				= 10000;
searchjobmin					= 2500;
workplacejob_search_cancelsperre	= 10;
workplacejob_searchmessages		= [localize "STRS_workplacemission_searchmsg_1", localize "STRS_workplacemission_searchmsg_2", localize "STRS_workplacemission_searchmsg_3"];
workplacejob_searchobjects		= ["Body", "BlackhawkWreck", "Barrel1"];
workplacejob_searchpos			= [ [suchlogik, 250] ];
workplacejob_actionflag_delivery = workplace_getjobflag_1;
workplacejob_deliverymsg		= ["STRS_workplacemission_deliverymsg_1", "STRS_workplacemission_deliverymsg_2", "STRS_workplacemission_deliverymsg_3", "STRS_workplacemission_deliverymsg_4",
"STRS_workplacemission_deliverymsg_5", "STRS_workplacemission_deliverymsg_6", "STRS_workplacemission_deliverymsg_7"
];
deliveryjobmulti				= 5;
workplacejob_deliveryflagarray	= [workplacejob_deliveryflag1, 	workplacejob_deliveryflag2, workplacejob_deliveryflag3, workplacejob_deliveryflag4, workplacejob_deliveryflag5, workplacejob_deliveryflag6, workplacejob_deliveryflag7, workplacejob_deliveryflag8, workplacejob_deliveryflag9, workplacejob_deliveryflag10];
workplacejob_deliverynamearray	= ["Delivery Point 1", "Delivery Point2", "Delivery Point 3", "Delivery Point 4", "Delivery Point 5", "Delivery Point 6", "Delivery Point 7", "Delivery Point 8", "Delivery Point 9", "Delivery Point 10"];
workplacejob_actionflag_weapons1	= workplace_getjobflag_2;	workplacejob_actionflag_weapons2 = workplace_getjobflag_2;	workplacejob_waffe_active        = 0;
workplacejob_waffe				= "";
workplacejob_waffe_bonus		= 750;
workplacejob_waffe_sperrzeit	= 10;
workplacejob_waffe_sperre		= 0;
workplacejob_taxi_zielarray		= [getmarkerpos "taximarker1",getmarkerpos "taximarker2",getmarkerpos "taximarker3",getmarkerpos "taximarker4",getmarkerpos "taximarker5",getmarkerpos "taximarker6",getmarkerpos "taximarker7",getmarkerpos "taximarker8",getmarkerpos "taximarker9",getmarkerpos "taximarker10",getmarkerpos "taximarker11",getmarkerpos "taximarker12",getmarkerpos "taximarker13",getmarkerpos "taximarker14",getmarkerpos "taximarker15",getmarkerpos "taximarker16",getmarkerpos "taximarker17",getmarkerpos "taximarker18",getmarkerpos "taximarker19",getmarkerpos "taximarker20" ,getmarkerpos "taximarker21" ,getmarkerpos "taximarker22" ,getmarkerpos "taximarker23" ,getmarkerpos "taximarker24" ,getmarkerpos "taximarker25" ,getmarkerpos "taximarker26",getmarkerpos "taximarker27",getmarkerpos "taximarker28",getmarkerpos "taximarker29",getmarkerpos "taximarker30" ,getmarkerpos "taximarker31" ,getmarkerpos "taximarker32" ,getmarkerpos "taximarker33" ,getmarkerpos "taximarker34" ,getmarkerpos "taximarker35",getmarkerpos "taximarker36"];
workplacejob_taxi_sperrzeit		= 10;
workplacejob_taxi_multiplikator	= 3;
workplacejob_taxi_maxmoney		= 25000;