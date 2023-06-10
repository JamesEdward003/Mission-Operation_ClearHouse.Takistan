/*
assignToVehiclePos.sqf

Execute with  _null = [vehicleName,group] execVM "008\assignToVehiclePos.sqf";
*/
private ["_vehicle","_group"];
_vehicle = _this select 0;
_group = _this select 1;

{_x enableAI "MOVE"} forEach units _group;

(leader _group) action ["getInDriver", _vehicle];

(leader _group) moveInDriver _vehicle;

((units _group) select 1) action ["getInTurret",_vehicle, [0]];

((units _group) select 2) action ["getInTurret",_vehicle, [1]];

{_x setBehaviour "COMBAT";} forEach [((units _group) select 1), ((units _group) select 2)];

{_x action ["getInCargo",_vehicle, _forEachIndex];_x setBehaviour "AWARE";} forEach units _group - [(leader _group), ((units _group) select 1), ((units _group) select 2)];
