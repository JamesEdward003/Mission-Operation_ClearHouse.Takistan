/*
moveToVehiclePos.sqf

Execute with  _null = [vehicleName,group] execVM "assignToVehiclePos.sqf";
*/
private ["_vehicle","_group"];
_vehicle = _this select 0;
_group = _this select 1;

//_group addVehicle _vehicle;

{_x enableAI "MOVE"} forEach units _group;

(leader _group) action ["getInDriver", _vehicle];

(leader _group) setBehaviour "CARELESS";

((units _group) select 1) action ["getInGunner", _vehicle];

((units _group) select 1) action ["moveToGunner", _vehicle];

((units _group) select 2) action ["getInTurret",_vehicle, [1]];

{_x setBehaviour "COMBAT";} forEach [((units _group) select 1), ((units _group) select 2)];

{_x action ["getInCargo",_vehicle, _forEachIndex];_x setBehaviour "AWARE";} forEach units _group - [(leader _group), ((units _group) select 1), ((units _group) select 2)];
