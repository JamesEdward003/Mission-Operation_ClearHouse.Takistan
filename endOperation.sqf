// endOperation.sqf //
deleteVehicle radioTrigger1;
[] spawn {
	radioTrigger1=createTrigger["EmptyDetector",[0,0]];
	radioTrigger1 setTriggerActivation["Alpha","PRESENT",true];
	radioTrigger1 setTriggerStatements["this","0 spawn End_Operation;",""];
	1 setRadioMsg "END OPERATION";
};

End_Operation = {

	{ for "_i" from count waypoints _x - 1 to 0 step -1 do { deleteWaypoint [_x, _i]; }; } forEach (allGroups-[Kilo6_5,group player]); 
	hintSilent parseText format ["<t color='#00FF00' size='2.0'>END THE OPERATION!</t>"];
	uisleep 6;
	{ _wp1 = _x addWaypoint [position leader _x, 0]; 
	  _wp1 setWaypointType "MOVE"; 
	  _wp1 setWaypointBehaviour "AWARE";
	  _wp1 setWaypointCombatMode "BLUE";
	  _wp1 setWaypointSpeed "FULL"; 
      _wp2 = _x addWaypoint [MarkerPos "fin_marker", 0]; 
	  _wp2 setWaypointType "MOVE";
	  _wp2 setWaypointBehaviour "AWARE";
	  _wp2 setWaypointCombatMode "BLUE";
	  _wp2 setWaypointSpeed "FULL";
      _wp3 = _x addWaypoint [MarkerPos "fin_marker", 0]; 
	  _wp3 setWaypointType "DISMISS";
	  _wp3 setWaypointBehaviour "AWARE";
	  _wp3 setWaypointCombatMode "BLUE";
	  _wp3 setWaypointSpeed "NORMAL"; } forEach (allGroups-[Kilo6_5,group player]);
    hintSilent parseText format ["<t color='#00FF00' size='2.0'>RETURN TO BASE!</t>"];
	tskExvillLZ setTaskState "SUCCEEDED";
	missionNamespace setVariable ["tskExvillLZpv",4];
	taskHint ["Exvill at LZ Xray", [0, 1, 0, 1], "taskDone"];
	//_null=[objNull, objNull, tskExvillLZ, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
	tskRTB setTaskState "ASSIGNED";
	missionNamespace setVariable ["tskRTBpv",3];
	taskHint ["Return To Base!", [0, 1, 0, 1], "taskCurrent"];
	//_null=[objNull, objNull, tskRTB, "ASSIGNED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
	player setCurrentTask tskRTB;
	EndOperation=true;publicVariable "EndOperation";
	hintSilent parseText format ["<t color='#00FF00' size='2.0'>End Operation Started!</t>"];
	while {(count (waypoints Kilo6_5)) > 0} do {
		deleteWaypoint ((waypoints Kilo6_5) select 0);
		uisleep 0.01;
		};
	if (!isEngineOn MH47E_Kilo6_5) then { 
		MH47E_Kilo6_5 engineOn true; 
		(driver MH47E_Kilo6_5) action ["engineOn", MH47E_Kilo6_5];
	};  
	lzPickup = "HeliHEmpty" createvehicle (player modelToWorld [0,20,0]);
	_wp01 = Kilo6_5 addWaypoint [position leader player, 0]; 
	_wp01 setWaypointType "MOVE"; 
	_wp01 setWaypointBehaviour "AWARE";
	_wp01 setWaypointCombatMode "BLUE";
	_wp01 setWaypointSpeed "FULL"; 
    _wp02 = Kilo6_5 addWaypoint [position leader player, 0]; 
	_wp02 setWaypointType "LOAD";
	_wp02 setWaypointBehaviour "AWARE";
	_wp02 setWaypointCombatMode "BLUE";
	_wp02 setWaypointSpeed "NORMAL";
	_wp02 setWaypointStatements ["true","PAPABEAR=[(side (vehicle this)),'HQ']; PAPABEAR SideChat 'Transport ready!';"];
	waitUntil {(count (assignedCargo MH47E_Kilo6_5)) > 0};
	deleteVehicle lzPickup;
    _wp03 = Kilo6_5 addWaypoint [position BIS_transportHeliH, 0]; 
	_wp03 setWaypointType "MOVE";
	_wp03 setWaypointBehaviour "AWARE";
	_wp03 setWaypointCombatMode "BLUE";
	_wp03 setWaypointSpeed "NORMAL";
    _wp04 = Kilo6_5 addWaypoint [position BIS_transportHeliH, 0]; 
	_wp04 setWaypointType "TR UNLOAD";
	_wp04 setWaypointBehaviour "AWARE";
	_wp04 setWaypointCombatMode "BLUE";
	_wp04 setWaypointSpeed "NORMAL";
	_wp04 setWaypointStatements ["true","
	if (isEngineOn MH47E_Kilo6_5) then { 
		MH47E_Kilo6_5 engineOn false; 
		(driver MH47E_Kilo6_5) action ['engineOff', MH47E_Kilo6_5];};
	MH47E_Kilo6_5 land 'LAND'; PAPABEAR=[(side MH47E_Kilo6_5),'HQ']; PAPABEAR SideChat 'Transport ready for reassignment!';"];
	_wp05 = Kilo6_5 addWaypoint [position BIS_transportHeliH, 0];
	_wp05 setWaypointType "MOVE";
	_wp05 setWaypointBehaviour "AWARE";
	_wp05 setWaypointCombatMode "GREEN";
	_wp05 setWaypointSpeed "NORMAL";
	_wp05 setWaypointStatements ["true","(vehicle this) land 'LAND'; PAPABEAR=[(side (vehicle this)),'HQ']; PAPABEAR SideChat 'Transport ready for reassignment!';"];
    [] execVM "haloOperation.sqf";
    hintSilent parseText format ["<t color='#00FF00' size='2.0'>Halo Support Added!</t>"];
};

hintSilent parseText format ["<t color='#00FF00' size='2.0'>End Operation Support Added!</t>"];

