///////////////////////////////
//  execVM "onMapClick.sqf"; //
///////////////////////////////
private ["_varname"];
uisleep 0.25;
location = false;
openmap [true,false];
titleText["Map location", "PLAIN DOWN"];
PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat format ["On mapclick, %1, set a location", name player];

if (getMarkerColor "Marker" == "ColorBlue") then {deleteMarker "Marker"};

ShowCinemaborder false;

enableRadio false;

onMapSingleClick "onMapSingleClick ''; mappos = _pos; location = true";		
waitUntil {sleep 1; (!visiblemap OR location OR !alive player)};
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

titletext ["","plain",0.2];
hintSilent parseText format ["<t size='1.25' color='#00FFFF'>Mapclick location successful</t>"];
uisleep 2;
hintSilent "";
openmap [false,false];
