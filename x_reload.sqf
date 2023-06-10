// x_reload.sqf //
private ["_object","_type","_varname"];

_object = _this select 0;

_type = typeof _object;

_varname = vehicleVarname _object;

if (_object isKindOf "ParachuteBase") exitWith {};

if (!alive _object) exitWith {};

_object vehicleChat format ["Repairing %1... Please stand by...", _type];

sleep 1;

_object setDamage 0;

_object vehicleChat format ["Refueling %1... Please stand by...", _type];

sleep 1;

_object setFuel 1;

_object vehicleChat format ["Reloading %1... Please stand by...", _type];

sleep 1;

_object setVehicleAmmo 1;

_object vehicleChat format ["%1 is ready!", _varname];
