// taskCheck.sqf //
waitUntil {!isNil {player getVariable "Briefing"}};

if (isMultiplayer) then {	
	
	player addEventHandler ["Respawn", {
		private ["_unit","_dead","_varName"];
		_unit = _this select 0;
		_dead = _this select 1;
		_varName = vehicleVarname _dead;
		_unit setIdentity _varName;
		call taskStateCheck;
	}];
};
taskStateCheck = {

	tskInsertLZpv = missionNamespace getVariable "tskInsertLZpv";
	tskClearVillagepv = missionNamespace getVariable "tskClearVillagepv";
	tskElimHVTpv = missionNamespace getVariable "tskElimHVTpv";
	tskExvillLZpv = missionNamespace getVariable "tskExvillLZpv";
	tskRTBpv = missionNamespace getVariable "tskRTBpv";

	switch (tskInsertLZpv) do {
		case NONE:	{tskInsertLZ setTaskState "NONE"};
		case CREATED:	{tskInsertLZ setTaskState "CREATED"};
		case ASSIGNED:	{tskInsertLZ setTaskState "ASSIGNED"};
		case SUCCEEDED:	{tskInsertLZ setTaskState "SUCCEEDED"};
		case FAILED:	{tskInsertLZ setTaskState "FAILED"};
		case CANCELED:	{tskInsertLZ setTaskState "CANCELED"};
		default: {tskInsertLZ setTaskState "CREATED"};
	};

	switch (tskClearVillagepv) do {
		case NONE:	{tskClearVillage setTaskState "NONE"};
		case CREATED:	{tskClearVillage setTaskState "CREATED"};
		case ASSIGNED:	{tskClearVillage setTaskState "ASSIGNED"};
		case SUCCEEDED:	{tskClearVillage setTaskState "SUCCEEDED"};
		case FAILED:	{tskClearVillage setTaskState "FAILED"};
		case CANCELED:	{tskClearVillage setTaskState "CANCELED"};
		default: {tskClearVillage setTaskState "CREATED"};
	};

	switch (tskElimHVTpv) do {
		case NONE:	{tskElimHVTpv setTaskState "NONE"};
		case CREATED:	{tskElimHVTpv setTaskState "CREATED"};
		case ASSIGNED:	{tskElimHVTpv setTaskState "ASSIGNED"};
		case SUCCEEDED:	{tskElimHVTpv setTaskState "SUCCEEDED"};
		case FAILED:	{tskElimHVTpv setTaskState "FAILED"};
		case CANCELED:	{tskElimHVTpv setTaskState "CANCELED"};
		default: {tskElimHVTpv setTaskState "CREATED"};
	};

	switch (tskExvillLZpv) do {
		case NONE:	{tskExvillLZpv setTaskState "NONE"};
		case CREATED:	{tskExvillLZpv setTaskState "CREATED"};
		case ASSIGNED:	{tskExvillLZpv setTaskState "ASSIGNED"};
		case SUCCEEDED:	{tskExvillLZpv setTaskState "SUCCEEDED"};
		case FAILED:	{tskExvillLZpv setTaskState "FAILED"};
		case CANCELED:	{tskExvillLZpv setTaskState "CANCELED"};
		default: {tskExvillLZpv setTaskState "CREATED"};
	};

	switch (tskRTBpv) do {
		case NONE:	{tskRTBpv setTaskState "NONE"};
		case CREATED:	{tskRTBpv setTaskState "CREATED"};
		case ASSIGNED:	{tskRTBpv setTaskState "ASSIGNED"};
		case SUCCEEDED:	{tskRTBpv setTaskState "SUCCEEDED"};
		case FAILED:	{tskRTBpv setTaskState "FAILED"};
		case CANCELED:	{tskRTBpv setTaskState "CANCELED"};
		default: {tskRTBpv setTaskState "CREATED"};
	};
};
call taskStateCheck;

