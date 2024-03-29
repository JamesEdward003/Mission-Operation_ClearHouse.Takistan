//////////////////////////////////////////////////////////////////
private ["_unit","_varName","_mrkrName","_mrkrcolor"];
_unit 	 = _this select 0;
_varName = vehicleVarname _unit;
_type = typeOf _unit;
_mrkrName = _type;

_mrkrcolor 	= [];

switch (side _unit) do {

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:	{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorOrange"};
};

_marker = createMarkerLocal [_mrkrName, position _unit];
_marker setMarkerTypeLocal "select";
_marker setMarkerShapeLocal "Icon";  
_marker setMarkerTextLocal _varName;
_marker setMarkerSizeLocal [0.75,0.75];
_marker setMarkerColorLocal _mrkrcolor;	
	
if (isMultiplayer) then {	
	_unit addEventHandler ["Respawn",{_this execVM "008\twirlyMrkr2.sqf"}];
};

While {alive _unit} do {
	_mrkrName setMarkerPos position _unit;
	_mrkrName setMarkerDir getDir _unit;
	sleep 2;
};

sleep 2;
_mrkrName setMarkerColorLocal "ColorBlack";


