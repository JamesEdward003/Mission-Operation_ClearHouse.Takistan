/////////////////////////////////////
//  execVM "onMapClickCamera.sqf"; //
/////////////////////////////////////
private ["_varname"];
uisleep 0.25;
location = false;
openmap [true,false];
titleText["Map location", "PLAIN DOWN"];
PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat format ["On mapclick, %1, set a location", name player];

if (getMarkerColor "Marker" == "ColorBlue") then {deleteMarker "Marker"};
if (!isNil "sphere") then {deleteVehicle sphere};

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

	sphere = "Baseball" createVehicle mappos;
	sphere exec "camera.sqs";
/*
	_varname = createMarkerLocal ["Marker", mappos];
	_varname setMarkerShapeLocal "ICON";
	_varname setMarkerColorLocal "ColorBlue";
	_varname setMarkerSizeLocal [1,1];
	_varname setMarkerTypeLocal "select";
*/
titletext ["","plain",0.2];
hintSilent parseText format ["<t size='1.25' color='#00FFFF'>Mapclick location successful</t>"];
uisleep 2;
hintSilent "";
openmap [false,false];

[] spawn {
	waitUntil {!isNull(findDisplay 46)};
	(findDisplay 46) displaySetEventHandler ["KeyDown","_this call keyspressed"];

	keyspressed = {
	    _keyDik = _this select 1;
	    _shift =_this select 2;
	    _ctrl = _this select 3;
	    _alt = _this select 4;
	    _handled = false;
	    switch (_this select 1) do {

	    case 82: {//NumPad 0 key
            	execVM "008\snapTerminate.sqf";
	        };
	    };
	    _handled;
	};
};

titleText [format ["Press NumPad 0 To Return"],"plain down"];
/*
player cameraEffect ["terminate","back"];

vehicle player switchCamera "INTERNAL";

enableRadio true;
/