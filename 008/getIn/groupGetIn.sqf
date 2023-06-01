//////////////////////////////////////////////////////////////////
private ["_vehicle","_caller"];
_vehicle = _this select 0;
_caller = _this select 1;

{[_x] orderGetIn true} forEach units group _caller;
{_x action ["getInCargo", _vehicle, _forEachIndex]} forEach units group _caller; 
