//////////////////////////////////////////////////////
//  From trigger:
//  _null = [player] execVM "plannedRotaryWing.sqf";
//////////////////////////////////////////////////////
private ["_unit","_sideUnit","_unitPos","_sourcePoint","_pos","_blinky","_targets","_target","_type","_airDist","_smoke","_targetPos","_mrkr2color","_marker2","_vehicle","_mrkrcolor","_randDir","_randDist","_spawnLoc","_marker","_flightPath","_ch","_chGroup","_nul","_kv","_airDist2"];
waituntil {!isnil "bis_fnc_init"};

_unit = _this select 0;
_sideUnit = side _unit;
_unitPos = getPos _unit;
_sourcePoint = _unit;

_vehicle = [];

switch (playerSide) do 
{
	case west: 		{_vehicle = "AH64D_EP1"};
	case east: 		{_vehicle = "Ka52Black"};
	case resistance: 	{_vehicle = "Ka137_MG_PMC"};
	case civilian: 	{_vehicle = "Mi17_Civilian"};
};

_mrkrcolor 	= [];

switch (_sideUnit) do {

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:	{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorYellow"};
};

//_vehicle = "AH1Z";
//_vehicle = "AH64D";
//_vehicle = "AH64D_EP1";
//_vehicle = "AH6J_EP1";
//_vehicle = "AH6X_EP1";
//_vehicle = "AW159_Lynx_BAF";
//_vehicle = "BAF_Apache_AH1_D";
//_vehicle = "BAF_Merlin_HC3_D";
//_vehicle = "CH_47F_BAF";
//_vehicle = "CH_47F_EP1";
//_vehicle = "Ka52";
//_vehicle = "Ka52Black";
//_vehicle = "Ka137_PMC";
//_vehicle = "Ka137_MG_PMC";
//_vehicle = "Ka60_GL_PMC";
//_vehicle = "Ka60_PMC";
//_vehicle = "MH60S";
//_vehicle = "MH6J_EP1";
//_vehicle = "Mi17_CDF";
//_vehicle = "Mi17_Civilian";
//_vehicle = "Mi17_medevac_CDF";
//_vehicle = "Mi17_medevac_Ins";
//_vehicle = "Mi17_medevac_RU";
//_vehicle = "Mi17_rockets_RU";
//_vehicle = "Mi17_TK_EP1";
//_vehicle = "Mi17_UN_CDF_EP1";
//_vehicle = "Mi171Sh_CZ_EP1";
//_vehicle = "Mi171Sh_rockets_CZ_EP1";
//_vehicle = "Mi24_D";
//_vehicle = "Mi24_D_TK_EP1";
//_vehicle = "Mi24_P";
//_vehicle = "Mi24_V";
//_vehicle = "MV22";
//_vehicle = "UH1H_TK_EP1";
//_vehicle = "UH1H_TK_GUE_EP1";
//_vehicle = "UH1Y";
//_vehicle = "UH1Y_cutscene";
//_vehicle = "UH60M_EP1";
//_vehicle = "UH60M_MEV_EP1";

_randDir = getDir vehicle _sourcePoint - 10;
_randDir = _randDir + random(20);
_randDist = (random 100) + 2000;
_spawnLoc =	[(getPos vehicle _sourcePoint select 0) + (_randDist * sin(_randDir)), (getPos vehicle _sourcePoint select 1) + (_randDist * cos(_randDir)), 0];

_marker = createMarkerLocal ["HStart", _spawnLoc];
_marker setMarkerTypeLocal "select";
_marker setMarkerShapeLocal "Icon";  
_marker setMarkerTextLocal "HStart";
_marker setMarkerSizeLocal [0.75,0.75];
_marker setMarkerColorLocal _mrkrcolor;	

if (isServer) then {
 
uisleep 0.25;
openMap true;
uisleep 0.25;

	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["RotaryWingCAS ready, %1, mark your target on the map!", name _unit];
	
dt=true;
onMapSingleClick "RWTarget = _pos;dt=false";
waitUntil {!dt};
onMapSingleClick "";

	_blinky = "Sign_sphere10cm_EP1" createVehicle RWTarget;	
	_targets = nearestObjects[_blinky,["Man","Car","Air","Tank","Truck","Ship","Static","House","Office","Barracks","Hanger"], 75];
	_target = _targets select 0;
	deleteVehicle _blinky;

uisleep 2;
openMap false;	

uisleep 0.25;   

if (count _targets > 0) then

{		
	_airDist = _unit distance _target;

	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["%1 marked is %2 meters from %3.", typeOf _target, round(_airDist)/1.0, name _unit];

	uisleep 1;
	[_target] execVM "008\twirlyMrkr.sqf";
	_target addEventHandler ["Killed", {[_this select 0, _this select 1,[]] execVM "008\onKilled.sqf"}];
	_type = typeOf _target;

	_smoke = "SmokeShellRed" createVehicle (_target modelToWorld [0,0,50]);

	_blinky = "Sign_sphere10cm_EP1" createVehicle _spawnLoc;
	_flightPath = [_blinky, _target] call BIS_fnc_relativeDirTo;	
	deleteVehicle _blinky;	
	
	_ch = [[_spawnLoc select 0, _spawnLoc select 1, 120], _flightPath, _vehicle, side _unit] call BIS_fnc_spawnVehicle;
	
	RotaryWingCAS = _ch select 0;
	
	_chGroup = _ch select 2; 
	
	addSwitchableUnit leader _chGroup;
	
	_ch select 0 setVehicleInit "RotaryWingCAS = this; this setVehicleVarName 'RotaryWingCAS'; RotaryWingCASGroup=group this; this setGroupID ['RotaryWingCASGroup', 'GroupColor4'];  
	this flyInHeight 100;
	this setvehiclelock 'unlocked'; 
	clearWeaponCargo this;
	this addWeaponCargo ['DMR',1]; 
	this addMagazineCargo ['20Rnd_762x51_DMR',8]; 
	this addWeaponCargo ['m240_scoped_EP1',1];
	this addMagazineCargo ['100Rnd_762x51_M240',4];
	this addWeaponCargo ['JAVELIN',1]; 
	this addMagazineCargo ['JAVELIN',4];
	[this] execVM '008\setIdentity.sqf';
	[this] execVM '008\loadoutAir.sqf';
	this addEventHandler ['Fired',{[_this select 0,getNumber (configFile/'CfgAmmo'/(_this select 4)/'explosive')] spawn {if (_this select 1==1) then {uisleep 0.5};_this select 0 setVehicleAmmo 1}}];
	this addEventHandler ['Killed', {[_this select 0, _this select 1, ['HStart',objNull,objNull]] execVM '008\onKilled.sqf'}];
	{[_x] execVM '008\adfalse.sqf'} forEach crew this;
	this addeventhandler ['Getin', {_nul=[_this select 2] execVM '008\adfalse.sqf'}];
	this addeventhandler ['Getout', {_nul=[_this select 2] execVM '008\adtrue.sqf'}];";
	processInitCommands;
	
	[_target,RotaryWingCAS] execVM "008\snapShot2.sqf";
	//[_target] execVM "008\snapShot5.sqf";

	_target addEventHandler ["Killed", {[_this select 0, _this select 1, []] execVM "008\onKilled.sqf"}];
	
	_targetPos = getPos _target;

	_airDist2 = RotaryWingCAS distance _target;

	_height = (_target call BIS_fnc_boundingBoxDimensions) select 2;

	_laze = "LaserTargetW" createVehicle getPos _target;	

	_laze attachTo [_target,[0,0,_height/2]];

	_laze spawn {

	    t = time;

	    waituntil {isnull _this};

	    hintSilent format ["time started\n%1\n\ntime stopped\n%2\n\ntotal time\n%3",str t,str time,str (time - t)];

	    copyToClipboard format ["time started\n%1\n\ntime stopped\n%2\n\ntotal time\n%3",str t,str time,str (time - t)];
	};

	{_x doWatch getPos _laze} forEach units _chGroup;

	{_x lookAt _laze} forEach units _chGroup;

	RotaryWingCAS reveal [_laze, 2];

	RotaryWingCAS doTarget _laze;

	wp0 = _chGroup addwaypoint [_targetPos, 20];
	wp0 setwaypointtype "MOVE";	
	wp0 setWaypointBehaviour "AWARE";
	wp0 setWaypointCombatMode "YELLOW";
	wp0 setWaypointSpeed "NORMAL";
	wp0 setWaypointStatements ["true",""];

	waitUntil {([RotaryWingCAS,_target] call BIS_fnc_distance2D) <= 1200};

	{_x doFire _laze} forEach units _chGroup;

	RotaryWingCAS doFire _laze;

	{_x doFire _target} forEach units _chGroup;

	RotaryWingCAS doFire _target;

	waitUntil {([RotaryWingCAS,_target] call BIS_fnc_distance2D) <= 300};

	detach _laze;

	deleteVehicle _laze;

	_target setDamage 1;
	
	wp1 = _chGroup addwaypoint [_unitPos, 20];
	wp1 setwaypointtype "MOVE";	
	wp1 setWaypointBehaviour "AWARE";
	wp1 setWaypointCombatMode "GREEN";
	wp1 setWaypointSpeed "LIMITED";
	wp1 setWaypointStatements ["true","driver (vehicle this) sideChat format ['RotaryWingCAS returning to BASE!'];"];

	wp2 = _chGroup addwaypoint [_spawnLoc, 20];
	wp2 setwaypointtype "MOVE";
	wp2 setWaypointBehaviour "CARELESS";
	wp2 setWaypointCombatMode "BLUE";
	wp2 setWaypointSpeed "FULL";
	wp2 setWaypointStatements ["true","{deletevehicle _x} foreach (crew vehicle this + [vehicle this]);deleteMarkerLocal 'HStart';"];
			
	waitUntil {!alive RotaryWingCAS};
	
	titleText [format ["Press Home To Return"],"plain down"];
	
 	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["RotaryWingCAS ready for reassignment!", name _unit];

} else {
		
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["No targets in that area, %1!", name _unit];
	uisleep 1;
	
 	deleteMarkerLocal _marker;
  };
};	
