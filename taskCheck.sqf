// taskCheck.sqf //
waitUntil {!isNil {player getVariable "Briefing"}};

[] spawn {
	waitUntil {alive player};
	tskInsertLZpv = missionNamespace getVariable "tskInsertLZpv";
	tskClearVillagepv = missionNamespace getVariable "tskClearVillagepv";
	tskElimHVTpv = missionNamespace getVariable "tskElimHVTpv";
	tskExvillLZpv = missionNamespace getVariable "tskExvillLZpv";
	tskRTBpv = missionNamespace getVariable "tskRTBpv";

	switch (tskInsertLZpv) do {
		case 1:	{tskInsertLZ setTaskState "NONE"};
		case 2:	{tskInsertLZ setTaskState "CREATED"};
		case 3:	{tskInsertLZ setTaskState "ASSIGNED"};
		case 4:	{tskInsertLZ setTaskState "SUCCEEDED"};
		case 5:	{tskInsertLZ setTaskState "FAILED"};
		case 6:	{tskInsertLZ setTaskState "CANCELED"};
		default {tskInsertLZ setTaskState "CREATED"};
	};
	switch (tskClearVillagepv) do {
		case 1:	{tskClearVillage setTaskState "NONE"};
		case 2:	{tskClearVillage setTaskState "CREATED"};
		case 3:	{tskClearVillage setTaskState "ASSIGNED"};
		case 4:	{tskClearVillage setTaskState "SUCCEEDED"};
		case 5:	{tskClearVillage setTaskState "FAILED"};
		case 6:	{tskClearVillage setTaskState "CANCELED"};
		default {tskClearVillage setTaskState "CREATED"};
	};
	switch (tskElimHVTpv) do {
		case 1:	{tskElimHVT setTaskState "NONE"};
		case 2:	{tskElimHVT setTaskState "CREATED"};
		case 3:	{tskElimHVT setTaskState "ASSIGNED"};
		case 4:	{tskElimHVT setTaskState "SUCCEEDED"};
		case 5:	{tskElimHVT setTaskState "FAILED"};
		case 6:	{tskElimHVT setTaskState "CANCELED"};
		default {tskElimHVT setTaskState "CREATED"};
	};
	switch (tskExvillLZpv) do {
		case 1:	{tskExvillLZ setTaskState "NONE"};
		case 2:	{tskExvillLZ setTaskState "CREATED"};
		case 3:	{tskExvillLZ setTaskState "ASSIGNED"};
		case 4:	{tskExvillLZ setTaskState "SUCCEEDED"};
		case 5:	{tskExvillLZ setTaskState "FAILED"};
		case 6:	{tskExvillLZ setTaskState "CANCELED"};
		default {tskExvillLZ setTaskState "CREATED"};
	};
	switch (tskRTBpv) do {
		case 1:	{tskRTB setTaskState "NONE"};
		case 2:	{tskRTB setTaskState "CREATED"};
		case 3:	{tskRTB setTaskState "ASSIGNED"};
		case 4:	{tskRTB setTaskState "SUCCEEDED"};
		case 5:	{tskRTB setTaskState "FAILED"};
		case 6:	{tskRTB setTaskState "CANCELED"};
		default {tskRTB setTaskState "CREATED"};
	};
};
