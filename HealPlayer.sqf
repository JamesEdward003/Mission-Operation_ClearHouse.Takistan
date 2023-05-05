// =======================================================================================
//							INSTRUCTIONS
// =======================================================================================
// SCRIPT: [] execVM "HealPlayer.sqf" for Arma 2
// =======================================================================================
// SCRIPT INTENT: Selected units will form a 360 around the player and heal player
// =======================================================================================

// =======================================================================================
// =======================================  SETUP  ======================================= 
// =======================================================================================

// =======================================================================================
// DECLARE VARIABLES
// =======================================================================================

private ["_Player", "_Location", "_Group", "_Units", "_ValidArray", "_ValidArrayCount", "_ValidArrayPlayerSide", "_ValidArrayPlayerSideCount", "_Interval"];
private ["_CenterX", "_CenterY", "_Perimeter"];
private ["_Angle", "_PosX", "_PosY", "_Position", "_Member"];

// =======================================================================================
// DEFINE VARIABLES 
// =======================================================================================

_Player 		= Player;
_Side 			= west;
_Location		= getPos _Player;
_Group 			= group _Player;
_Units			= units _Group;
_Distance 		= 100;
_ValidArray		= [];
_MedicArray = [];
_ValidArrayCount	= 0;	
_ValidMedicArray		= [];
_ValidMedicArrayCount	= 0;	
_ValidArrayPlayerSideCount	= 0;
_ValidArrayPlayerSide = [];
{
    if ((side _x == _Side) and ((_x distance _Player) < _Distance)) then
    {
        _ValidArrayPlayerSide = _ValidArrayPlayerSide + [_x];
    };
} forEach allUnits;	
//hint format ["%1",_ValidArrayPlayerSide];
// =======================================================================================
// ======================================  SCRIPT  ======================================= 
// =======================================================================================

// =======================================================================================
// ESTABLISH THE PLAYER'S X AND Y POSITIONS AND A PERIMETER DISTANCE
// =======================================================================================

if ((lifeState _Player == "UNCONSCIOUS") || (lifeState _Player == "ALIVE")) then
{
	_CenterX	= _Location select 0;
	_CenterY	= _Location select 1;
	_Perimeter	= 3;

// =======================================================================================
// GRAB ONLY VALID UNITS BY CHECKING IF THEY ARE ON FOOT AND ARE NOT PLAYERS
// ======================================================================================= 

	switch (_Side) do 
	{
//	case west: {_MedicArray = ["US_Delta_Force_Medic_EP1","US_Soldier_Medic_EP1"]};
	case west: {_MedicArray = ["US_Delta_Force_Medic_EP1","US_Soldier_Medic_EP1","GER_Soldier_Medic_EP1","BAF_Soldier_Medic_DDPM","BAF_Soldier_Medic_W","BAF_Soldier_Medic_MTP","FR_OHara","FR_Corpsman","USMC_Soldier_Medic","CDF_Soldier_Medic","Doctor","RU_Doctor"];};
	case east: {_MedicArray = ["TK_Soldier_Medic_EP1","RU_Soldier_Medic","INS_Soldier_Medic","Doctor","RU_Doctor"];};
	case resistance: {_MedicArray = ["Soldier_Medic_PMC","GUE_Soldier_Medic","Doctor","RU_Doctor"];};
	case civilian: {_MedicArray = ["Doctor","RU_Doctor"];};
	}:
	uisleep .1;
    {if ((vehicle _x == _x) && (_x != _Player) && (typeOf _x in _MedicArray)) then {_ValidArray = _ValidArray + [_x];};} forEach _ValidArrayPlayerSide;
//hint format ["%1",_ValidArray];
// =======================================================================================
// EVERY VALID TEAM UNIT AND SUBSEQUENT ONE WILL MOVE TO THE PLAYER AND PERFORM A HEAL ACTION
// =======================================================================================

	if (count _ValidArray > 0) then {
		
		//hintSilent parseText format["<t size='1.25' color='#ff6161'>Medics in range!</t>"];
		_ValidArrayCount = count _ValidArray;
		_Interval = 360/(_ValidArrayCount);
	
	for [{_i = _ValidArrayCount},{_i > 0},{_i =_i-1}] do
	{
		_Angle		= 0 + (_Interval*_i);
		_PosX 		= _CenterX + _Perimeter * cos(_Angle);
		_PosY 		= _CenterY + _Perimeter * sin(_Angle);
		_Position	= [_PosX,_PosY];
			
		_Member 	= (_ValidArray select _i-1);
		_Member		doMove _Position;
		_Member		moveTo _Position;
		_Member		setBehaviour "AWARE";
		_Member		setCombatMode "YELLOW";
		_Member		setSpeedMode "FULL";
		_Member 	setUnitPos "MIDDLE";
		_Player 	action ["Heal", _Member];
		_Player  	setUnconscious false;
		_Player   	setCaptive false;	
	};	
	
// =======================================================================================
// A CREATED UNIT WILL MOVE TO THE PLAYER AND PERFORM A HEAL ACTION
// =======================================================================================

} else {
	
	//hintSilent parseText format["<t size='1.25' color='#ff6161'>No medics in range!</t>"];			
	_PosX 		= _CenterX + _Perimeter * cos(360);
	_PosY 		= _CenterY + _Perimeter * sin(360);
	_Position	= [_PosX,_PosY];

	"FR_OHara" createUnit [_Position,_Group,"Ohara2=this;",1,"CORPORAL"];

	Ohara2 	doMove _Position;
	Ohara2 	moveTo _Position;
	Ohara2 	setBehaviour "AWARE";
	Ohara2 	setCombatMode "YELLOW";
	Ohara2 	setSpeedMode "FULL";
	Ohara2 	setUnitPos "MIDDLE";
	_Player 	action ["Heal",Ohara2];
	_Player 	setUnconscious false;
	_Player 	setCaptive false;	
	};		
};
secop synchronizeObjectsAdd [_Player];
fa2 synchronizeObjectsAdd [_Player];
fa3 synchronizeObjectsAdd [_Player];
acm synchronizeObjectsAdd [_Player];
/*
	_validMedicArray 	= player nearEntities [_MedicArray, _Distance];
	_ValidMedicArrayCount = count _validMedicArray;
	if (_ValidMedicArrayCount == 0) then {hintSilent parseText format["<t size='1.25' color='#ff6161'>No medics in range!</t>"];};

	this setCaptive true;this setVehicleVarName 'Ohara';this setIdentity 'Ohara';

	_Player 	setVariable ["BIS_IS_inAgony",true]; (arma 3 function) does not work here
	_Player 	action ["Heal",_Member];
	_Player 	setDamage .1;
	_Player 	setUnconscious false;
	_Player 	setCaptive false;	

*/
