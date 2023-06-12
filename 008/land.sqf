// land.sqf //
_unit = _this select 0;
_unit land "LAND"; PAPABEAR=[(side _unit),"HQ"]; PAPABEAR SideChat "Vehicle landing, engines off";
uisleep 10;
_unit land "LAND";
	if (isEngineOn _unit) then { 
		_unit engineOn false; 
		(driver _unit) action ["engineOff", _unit];};

