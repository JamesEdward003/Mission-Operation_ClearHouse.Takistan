///////////////////////////////////////////////////
// Function file execVM "altLZalt.sqf";
// Function file for ArmA 2: Operation Arrowhead
///////////////////////////////////////////////////
private ["_vehicle","_vehicleVarName","_vehicleGroup","_caller","_sideCaller","_pos","_mrkrcolor","_marker","_mrkr","_flightPath"];
_vehicle 	= _this select 0;
_caller 	= _this select 1;      
if (_caller == vehicle _caller) then {_vehicle = cursorTarget} else {_vehicle = vehicle player};
_hPad 		= BasehPad; 
_vehicleGroup = group _vehicle;
_sideCaller = side _caller;    
_grpCaller  = group _caller;                           
_hPadPos	= getPosATL _hPad;

_vehicleVarName = vehicleVarName _vehicle;

_vehicle setVariable ["ReleaseHeli", 0];

[] spawn {
	if ((getMarkerColor "LZ4") != "") then {deleteMarker "LZ4"};
	if (((getPosATL lzDropOff4) select 2) != 0) then {deleteVehicle lzDropOff4};
};
	
_mrkrcolor 	= [];

switch (_sideCaller) do {

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:	{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorYellow"};
};

_vehicle addEventHandler ["Killed", {[_this select 0, _this select 1, "LZ4", lzDropOff4] execVM "008\onKilled.sqf"}];

MOVE_TASK = {
	if (!isNil "A_MOVE_TASK") then {player removeSimpleTask A_MOVE_TASK};
	_task = _this select 0;
	_task_dest = _this select 1;
	_task_pos = getPosATL _task_dest;
	A_MOVE_TASK = player createSimpleTask [_task];
	A_MOVE_TASK setSimpleTaskDestination _task_pos;
	A_MOVE_TASK setSimpleTaskDescription [
	_task,
	_task,
	_task
	];
	A_MOVE_TASK setTaskState "CREATED";
	taskHint ["LZ4", [1, 1, .5, 1], "taskNew"];
	//[objNull, objNull, A_MOVE_TASK, "CREATED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
	uisleep 4;

	A_MOVE_TASK setTaskState "ASSIGNED";
	taskHint ["LZ4", [0, 1, 0, 1], "taskCurrent"];
	//[objNull, objNull, A_MOVE_TASK, "ASSIGNED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
	player setCurrentTask A_MOVE_TASK;
	uisleep 10; 

	PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat "The task marker shown will be removed in 60 seconds";
	uisleep 60; 
	player removeSimpleTask A_MOVE_TASK;
};

if (isServer) then {

uisleep 0.25;
location = false;
openmap [true,false];
titleText["Map location", "PLAIN DOWN"];

uisleep 0.25;

PAPABEAR=[_sideCaller,"HQ"]; PAPABEAR SideChat format ["%1 to your new position, %2, mark your new destination on the map.", _vehicleVarName, name _caller];

onMapSingleClick "onMapSingleClick ''; mappos = _pos; location = true";		
waitUntil {uisleep 1; (!visiblemap OR location OR !alive _caller)};
	if (!location OR !alive _caller) exitWith {
		mappos = nil;
		PAPABEAR=[_sideCaller,"HQ"]; PAPABEAR SideChat "Map location canceled";
		hintSilent parseText format ["<t size='1.25' color='#ff0000'>Map location canceled</t>"];
		titletext ["","plain"];
	};

	_mrkr = createMarkerLocal ["LZ4", mappos];
	_mrkr setMarkerTypeLocal "mil_end";
	_mrkr setMarkerShapeLocal "Icon";
	_mrkr setMarkerTextLocal "LZ4";
	_mrkr setMarkerSizeLocal [1,1];
	_mrkr setMarkerDirLocal 0;
	_mrkr setMarkerColorLocal _mrkrcolor;

titletext ["","plain",0.2];
hintSilent parseText format ["<t size='1.25' color='#00FFFF'>Mapclick location successful</t>"];
uisleep 2;
hintSilent "";
openmap [false,false];
uisleep 0.25;   

	_airDist = _vehicle distance (getMarkerPos "LZ4");

	PAPABEAR=[_sideCaller,"HQ"]; PAPABEAR SideChat format ["%1 is %2 meters from your new position.", _vehicleVarName, round(_airDist)/1.0];

	_vehicle setVehicleLock "UNLOCKED";

	while {(count (waypoints _vehicleGroup)) > 0} do {
		deleteWaypoint ((waypoints _vehicleGroup) select 0);
		uisleep 0.01;
		};

	uisleep 0.25;
	PAPABEAR=[_sideCaller,"HQ"]; PAPABEAR SideChat format ["%1 relocating to your new position.",_vehicleVarName];

	_drop = getMarkerPos "LZ4";
	_dropPos = [_drop select 0, _drop select 1, 0];
	lzDropOff4 = "HeliHEmpty" createvehicle _dropPos;
	_flightPath = [(vehicle _caller), _dropPos] call BIS_fnc_relativeDirTo;		
	"LZ4" setMarkerDirLocal (_flightPath + 180);

	["LZ4",lzDropOff4] spawn MOVE_TASK;

	_wp0 = _vehicleGroup addWaypoint [_dropPos, 0];
	_wp0 setWaypointType "MOVE";
	_wp0 setWaypointBehaviour "AWARE";
	_wp0 setWaypointCombatMode "WHITE";
	_wp0 setWaypointSpeed "NORMAL";
	_wp0 setWaypointStatements ["true","(vehicle this) VehicleChat 'Prepare to unload!';"];

	[_vehicle] spawn { 
		if ((_this select 0) getVariable "ActionAdded" == 1) exitWith {};
		(_this select 0) setVariable ["ReleaseHeli", 0];
		(_this select 0) addaction ["<t color='#FF0000'>Release Helicopter</t>","008\ReleaseHeli.sqf",[],1,false,true,"",""];
		(_this select 0) setVariable ["ActionAdded", 1];
	};

	_wp1 = _vehicleGroup addWaypoint [_dropPos, 0];
	_wp1 setWaypointType "GETOUT";
	_wp1 setWaypointBehaviour "AWARE";
	_wp1 setWaypointCombatMode "YELLOW";
	_wp1 setWaypointSpeed "NORMAL";
	_wp1 setWaypointStatements ["true","	
	(vehicle this) land 'LAND';
	(vehicle this) VehicleChat 'Unload!';
	{commandGetOut [_x]} forEach units group this; 
	{_x action ['getOut', (vehicle this)]} forEach (crew (vehicle this));"];

	waitUntil { (_vehicle getVariable "ReleaseHeli") == 1 };
	[_vehicle,_vehicleGroup] execVM "008\assignToVehiclePos.sqf";

	_wp2 = _vehicleGroup addWaypoint [_dropPos, 0];
	_wp2 setWaypointType "GETIN";
	_wp2 setWaypointBehaviour "AWARE";
	_wp2 setWaypointCombatMode "GREEN";
	_wp2 setWaypointSpeed "NORMAL";
	_wp2 setWaypointStatements ["true","
	(vehicle this) VehicleChat 'Get in the Choppa!';"];

	[] spawn {
		if ((getMarkerColor "LZ4") != "") then {deleteMarker "LZ4"};
		if (((getPosATL lzDropOff4) select 2) != 0) then {deleteVehicle lzDropOff4};
	};

	_wp3 = _vehicleGroup addwaypoint [_hPadPos, 0];
	_wp3 setwaypointtype "MOVE";
	_wp3 setWaypointBehaviour "AWARE";
	_wp3 setWaypointCombatMode "GREEN";
	_wp3 setWaypointSpeed "NORMAL";
	_wp3 setWaypointStatements ["","
	(vehicle this) land 'LAND';
	if (!isEngineOn (vehicle this)) then { 
		(vehicle this) engineOn true; 
		(driver (vehicle this)) action ['engineOn', (vehicle this)];
	};
	PAPABEAR=[(side (vehicle this)),'HQ']; PAPABEAR SideChat 'Transport ready for reassignment!';"];
};

