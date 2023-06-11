//////////////////////////////
// execVM "taskCreate.sqf"; //
//////////////////////////////
private ["_varname","_closestobjects","_closestobject","_closesttowns","_closesttown","_town_name","_town_pos","_task","_task_pos","_object_type","_object_pos","_locationPos"];
if !(isNil "A_SIMPLE_TASK") then {player removeSimpleTask A_SIMPLE_TASK};
if (getMarkerColor "Marker" == "ColorBlue") then {deleteMarker "Marker"};

uisleep 0.25;
location = false;
openmap [true,false];
titleText["Map location", "PLAIN DOWN"];
PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat format ["On mapclick, %1, set a location", name player];

onMapSingleClick "onMapSingleClick ''; mappos = _pos; location = true";    
waitUntil {uisleep 1; (!visiblemap OR location OR !alive player)};
   if (!location OR !alive player) exitWith {
   mappos = nil;
   PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat "Map location canceled";
   hintSilent parseText format ["<t size='1.25' color='#ff0000'>Map location canceled</t>"];
   titletext ["","plain"];
   };
 
   _varname = createMarkerLocal ["Marker", mappos];
   _varname setMarkerShapeLocal "ICON";
   _varname setMarkerColorLocal "ColorBlue";
   _varname setMarkerSizeLocal [1,1];
   _varname setMarkerTypeLocal "select";

   Locator setPos [getMarkerPos "Marker" select 0,getMarkerPos "Marker" select 1,2];
   
titletext ["","plain",0.2];
hintSilent parseText format ["<t size='1.25' color='#00FFFF'>Mapclick location successful</t>"];
uisleep 2;
hintSilent "";
openmap [false,false];

_closestobjects = (nearestObjects [Locator, ["Man","Car","Air","Tank","Truck","Ship","Static","House","Office","Barracks","Hanger"], 75]);
_closestobject = _closestobjects select 0;
_closesttowns = (nearestLocations [Locator,["NameCityCapital","NameCity","NameVillage"],1000]);
_closesttown = _closesttowns select 0;
if ((count _closestobjects) < 1 and (count _closesttowns) < 1) exitWith {  
   deleteMarker "Marker";
   hintSilent parseText format ["<t size='1.25' color='#00FFFF'>Nothing at that location</t>"]; 
};
if ((count _closestobjects) > 0 and (count _closesttowns) > 0) then {
   _object_type = typeOf _closestobject;
   _object_pos = getPosATL _closestobject; //[position _closestobject select 0,position _closestobject select 1,2];
    Locator setPos _object_pos;
   _task = _object_type;
   _task_pos = _object_pos;
};
if ((count _closestobjects) > 0 and (count _closesttowns) < 1) then {
   _object_type = typeOf _closestobject;
   _object_pos = getPosATL _closestobject; //[position _closestobject select 0,position _closestobject select 1,2];
    Locator setPos _object_pos;
   _task = _object_type;
   _task_pos = _object_pos;
};
if ((count _closestobjects) < 1 and (count _closesttowns) > 0) then {
   _town_name = text _closesttown;
   _locationPos = locationPosition _closesttown;
   _town_pos = [_locationPos select 0,_locationPos select 1,2];
    Locator setPos _town_pos;
   _task = _town_name;
   _task_pos = _locationPos;
};
A_SIMPLE_TASK = player createSimpleTask [_task];
A_SIMPLE_TASK setSimpleTaskDestination _task_pos;
A_SIMPLE_TASK setSimpleTaskDescription [
_task,
_task,
_task
];
A_SIMPLE_TASK setTaskState "CREATED";
[objNull, objNull, A_SIMPLE_TASK, "CREATED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
uisleep 10;

player setCurrentTask A_SIMPLE_TASK;
A_SIMPLE_TASK setTaskState "ASSIGNED";
[objNull, objNull, A_SIMPLE_TASK, "ASSIGNED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
uisleep 10; 

PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat "The task marker shown will be removed in 60 seconds";
uisleep 60; 
player removeSimpleTask A_SIMPLE_TASK;

/*
A_SIMPLE_TASK = player createSimpleTask ["simple task title"];
A_SIMPLE_TASK setSimpleTaskDestination (position player);
A_SIMPLE_TASK setSimpleTaskDescription[
  "simple task long description",
  "simple task title",
  "simple task waypoint label"
];
A_SIMPLE_TASK setTaskState "CREATED";
*/