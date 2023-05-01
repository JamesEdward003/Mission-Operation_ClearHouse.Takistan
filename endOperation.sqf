// endOperation.sqf //
[] spawn {
	_radio=createTrigger["EmptyDetector",[0,0]];
	_radio setTriggerActivation["Alpha","PRESENT",true];
	_radio setTriggerStatements["this","0 spawn End_Operation",""];
	1 setRadioMsg "END OPERATION";
};

End_Operation = {

	{ for "_i" from count waypoints _x - 1 to 0 step -1 do { deleteWaypoint [_x, _i]; }; } forEach (allGroups-[MH47E_Kilo6_5]); 
	hintSilent parseText format ["<br/><t color='#00FF00' size='2.0'>END THE OPERATION!</t>"];
	uisleep 6;
	{ _wp1 = _x addWaypoint [position leader _x, 10]; 
	  _wp1 setWaypointType "MOVE"; 
	  _wp1 setWaypointBehaviour "AWARE";
	  _wp1 setWaypointCombatMode "BLUE";
	  _wp1 setWaypointSpeed "FULL"; 
      _wp2 = _x addWaypoint [MarkerPos "fin_marker", 20]; 
	  _wp2 setWaypointType "MOVE";
	  _wp2 setWaypointBehaviour "AWARE";
	  _wp2 setWaypointCombatMode "BLUE";
	  _wp2 setWaypointSpeed "FULL";
      _wp3 = _x addWaypoint [MarkerPos "fin_marker", 20]; 
	  _wp3 setWaypointType "DISMISS";
	  _wp3 setWaypointBehaviour "AWARE";
	  _wp3 setWaypointCombatMode "BLUE";
	  _wp3 setWaypointSpeed "NORMAL"; } forEach (allGroups-[MH47E_Kilo6_5]);
    hintSilent parseText format ["<br/><t color='#00FF00' size='2.0'>RETURN TO BASE!</t>"];
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
	hintSilent parseText format ["<br/><t color='#00FF00' size='2.0'>End Operation Started!</t>"];
	if (!isEngineOn MH47E_Kilo6_5) then { 
		MH47E_Kilo6_5 engineOn true; 
		(driver MH47E_Kilo6_5) action ["engineOn", MH47E_Kilo6_5];
	};  
};


