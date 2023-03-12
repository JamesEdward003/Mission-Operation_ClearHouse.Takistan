//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
//////////////////////////////////////////////////////////////////
_vehicle 	= vehicle player;
_caller 		= player; 
_vehicle removeaction ALZ;

_vehicleVarName = vehicleVarName _vehicle;
_vehiclegroup = group _vehicle;
_vehiclepilot = driver _vehicle;
_lzMkrColor = "ColorOrange";
_hEnd3 = "hEnd3";
_hStart = "hStart";
_hStartLoc = getMarkerPos "hStart";
_hDest = "airStart";
_hDestLoc = getMarkerPos "airStart";

if (isServer) then {
	
sleep 0.1;
openMap true;

	deleteVehicle lzPickup;
	deleteVehicle lzDropOff
	deleteVehicle lzDropOff3;
	deleteMarker "hEnd";
	deleteMarker "hEnd3";

	
sleep 0.1;
	PAPABEAR=[West,"HQ"]; PAPABEAR SideChat format ["%1 to your new position, %2, mark your new destination on the map.", _vehicleVarName, name _caller];
dt=true;
onMapSingleClick "infTarget3 = _pos;dt=false";
waitUntil {!dt};
onMapSingleClick "";

	createMarkerLocal [_hEnd3, infTarget3];
	_hEnd3 setMarkerTypeLocal "b_air";
	_hEnd3 setMarkerShapeLocal "Icon";
	_hEnd3 setMarkerTextLocal _hEnd3;
	_hEnd3 setMarkerSizeLocal [1,1];
	_hEnd3 setMarkerColorLocal _lzMkrColor;
				
sleep 0.5;
openMap false;
	_end3 = getMarkerPos _hEnd3;
	lzDropOff3 = "HeliHEmpty" createvehicle _end3;
		
	while {(count (waypoints _vehiclegroup)) > 0} do {
		deleteWaypoint ((waypoints _vehiclegroup) select 0);
		sleep 0.01;
		};
				 
	// If "TR UNLOAD" It'll auto boot the leader once there, but he'll have to tell the others to get out.	
	wp0 = _vehiclegroup addWaypoint [_end3, 20];
	wp0 setWaypointType "TR UNLOAD";
	wp0 setWaypointBehaviour "AWARE";
	wp0 setWaypointCombatMode "RED";
	wp0 setWaypointSpeed "NORMAL";
	wp0 setWaypointStatements ["true","(vehicle this) land 'GET OUT'"];
		
	// Wait till the player's group is out of the helo.
	waitUntil{{_x in _vehicle} count units group _caller == 0};
	
	[_randomZ,"Succeeded"] call SHK_Taskmaster_upd;
		
	// Once they are out, set a waypoint back to the start and clean up by deleting the helo and landing pads.
	wp1 = _vehiclegroup addwaypoint [_hStartLoc, 20];
	wp1 setwaypointtype "MOVE";
	wp1 setWaypointBehaviour "CARELESS";
	wp1 setWaypointCombatMode "BLUE";
	wp1 setWaypointSpeed "NORMAL";
	wp1 setWaypointStatements ["true","{deletevehicle _x} foreach (crew vehicle this + [vehicle this]); PAPABEAR=[West,'HQ']; PAPABEAR SideChat format ['TransportHelo ready for reassignment!'];"];
	
	deleteVehicle lzPickup;
	deleteVehicle lzDropOff3;
	deleteMarker "hEnd3";
	_hStart setMarkerPos _hDestLoc;	
};
