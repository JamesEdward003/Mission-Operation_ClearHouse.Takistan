///////////////////////////////////////////////////
// Function file for Armed Assault
// Function file for ArmA 2: Operation Arrowhead
///////////////////////////////////////////////////
private ["_vehicle","_vehicleVarName","_vehicleGroup","_caller","_sideCaller","_pos","_mrkrcolor","_marker","_mrkr","_flightPath"];
waituntil {!isnil "bis_fnc_init"};

_vehicle 	= _this select 0;
_caller 	= _this select 1;        
_sideCaller = side _caller;                               

_vehicleVarName = vehicleVarName _vehicle;
_vehicleGroup = group _vehicle;

_vars = [lzDropOff2,A_MOVE_TASK];
{
	if (isNil "_x") then {
		_vars set [_forEachIndex, -1]
} else {
	if (!isNull _x) then {
		_vars set [_forEachIndex, -1]
	}
}
} forEach _vars;
_vars = _vars - [-1];
//hint format ["%1",_vars];

if ((getMarkerColor "Drop") != "") then {deleteMarker "Drop"};
if (!isNull lzDropOff2) then {deleteVehicle lzDropOff2};
	
_mrkrcolor 	= [];

switch (_sideCaller) do {

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:	{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorYellow"};
};

_vehicle addEventHandler ["Killed", {[_this select 0, _this select 1, ["Drop",lzDropOff2]]execVM "008\onKilled.sqf"}];

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
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat "Map location canceled";
	hintSilent parseText format ["<t size='1.25' color='#ff0000'>Map location canceled</t>"];
	titletext ["","plain"];
	};

	_mrkr = createMarkerLocal ["Drop", mappos];
	_mrkr setMarkerTypeLocal "mil_end";
	_mrkr setMarkerShapeLocal "Icon";
	_mrkr setMarkerTextLocal "Drop";
	_mrkr setMarkerSizeLocal [1,1];
	_mrkr setMarkerDirLocal 0;
	_mrkr setMarkerColorLocal _mrkrcolor;

titletext ["","plain",0.2];
hintSilent parseText format ["<t size='1.25' color='#00FFFF'>Mapclick location successful</t>"];
uisleep 2;
hintSilent "";
openmap [false,false];
uisleep 0.25;   

_airDist = _vehicle distance (getMarkerPos "Drop");

PAPABEAR=[_sideCaller,"HQ"]; PAPABEAR SideChat format ["%1 is %2 meters from your new position.", _vehicleVarName, round(_airDist)/1.0];
		
	while {(count (waypoints _vehicleGroup)) > 0} do {
		deleteWaypoint ((waypoints _vehicleGroup) select 0);
		uisleep 0.01;
		};
	uisleep 0.25;
	PAPABEAR=[_sideCaller,"HQ"]; PAPABEAR SideChat format ["%1 relocating to your new position.",_vehicleVarName];

	_drop = getMarkerPos "Drop";
	_dropPos = [_drop select 0, _drop select 1, 0];
	lzDropOff2 = "HeliHEmpty" createvehicle _dropPos;
	_flightPath = [(vehicle _caller), _dropPos] call BIS_fnc_relativeDirTo;		
	"Drop" setMarkerDirLocal (_flightPath + 180);

	["DropOff",lzDropOff2] spawn MOVE_TASK;

	// If "TR UNLOAD" It'll auto boot the leader once there, but he'll have to tell the others to get out.	
	wp0 = _vehicleGroup addWaypoint [_dropPos, 20];
	wp0 setWaypointType "TR UNLOAD";
	wp0 setWaypointBehaviour "CARELESS";
	wp0 setWaypointCombatMode "BLUE";
	wp0 setWaypointSpeed "NORMAL";
	wp0 setWaypointStatements ["true","(vehicle this) land 'GET OUT'"];
		
	// Wait till the player's group is out of the helo.
	waitUntil{{_x in _vehicle} count units group _caller == 0};

	if ((getMarkerColor "Drop") != "") then {deleteMarker "Drop"};
	if (!isNull lzDropOff2) then {deleteVehicle lzDropOff2};	
			
	// Once they are out, set a waypoint back to the start and clean up by deleting the helo and landing pads and markers.
	wp1 = _vehicleGroup addwaypoint [getMarkerPos "Start", 20];
	wp1 setwaypointtype "MOVE";
	wp1 setWaypointBehaviour "CARELESS";
	wp1 setWaypointCombatMode "BLUE";
	wp1 setWaypointSpeed "NORMAL";
	wp1 setWaypointStatements ["true","{deletevehicle _x} foreach (crew vehicle this + [vehicle this]);
	PAPABEAR=[(side (vehicle this)),'HQ']; PAPABEAR SideChat 'Transporthelo ready for reassignment!';
	deleteMarker 'Start';"];
};

