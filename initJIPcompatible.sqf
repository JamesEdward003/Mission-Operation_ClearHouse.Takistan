// initJIPcompatible.sqf //
if (isMultiplayer) then {

	onPlayerConnected "
		publicVariable 'tskInsertLZpv';
		publicVariable 'tskElimHVTpv';
		publicVariable 'tskClearVillagepv';
		publicVariable 'tskExvillLZpv';
		publicVariable 'tskRTBpv';
	";

	execVM "briefing.sqf";
	execVM "taskCheck.sqf";
};
	
player action ["WEAPONONBACK", player];
uisleep 20;

[nil,nil,rSPAWN,hintSilent format ["Enjoy the game\n %1",name player]] call RE;

PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat format ["Enjoy the game %1",name player];
