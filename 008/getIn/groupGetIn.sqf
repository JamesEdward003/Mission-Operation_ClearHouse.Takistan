//////////////////////////////////////////////////////////////////
private ["_vehicle","_caller"];
_vehicle = _this select 0;
_caller = _this select 1;

(leader group _caller) moveInTurret [_vehicle, [2]];
{[_x] orderGetIn true} forEach units group _caller;
{_x action ["getInCargo", _vehicle, _forEachIndex]} forEach units group _caller - [leader group _caller]; 
//hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Assigned Vehicle Role: %1</t>", assignedVehicleRole player];

