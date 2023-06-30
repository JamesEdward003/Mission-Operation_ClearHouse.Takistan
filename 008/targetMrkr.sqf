//////////////////////////////////////////////////////////////////
private ["_unit","_varName","_mrkrName","_mrkrcolor"];
_unit 	 = _this select 0;
_varName = vehicleVarname _unit;
_type = typeOf _unit;
_mrkrName = _varName;

_mrkrcolor 	= [];

switch (side _unit) do {

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:	{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorOrange"};
};
	
if (isMultiplayer) then {	
	_unit addEventHandler ["Respawn",{_this execVM "008\targetMrkr.sqf"}];
};

While {alive _unit} do {
	_mrkrName setMarkerPos position _unit;
	_mrkrName setMarkerDir getDir _unit;
	sleep 2;
};

sleep 2;
_mrkrName setMarkerColorLocal "ColorBlack";


