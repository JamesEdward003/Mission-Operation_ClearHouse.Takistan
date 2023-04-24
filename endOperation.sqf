// endOperation.sqf //
[] spawn {
	_radio=createTrigger["EmptyDetector",[0,0]];
	_radio setTriggerActivation["Alpha","PRESENT",true];
	_radio setTriggerStatements["this","0 spawn End_Operation",""];
	1 setRadioMsg "END OPERATION";
};
End_Operation = {

	{ for "_i" from count waypoints _x - 1 to 0 step -1 do { deleteWaypoint [_x, _i]; }; } forEach [Alpha1,Bravo1,Charlie1,Delta1,Venom,Command]; 
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
	  _wp3 setWaypointSpeed "NORMAL"; } forEach [Alpha1,Bravo1,Charlie1,Delta1,Venom,Command];
    hintSilent parseText format ["<br/><t color='#00FF00' size='2.0'>RETURN TO BASE!</t>"];
	tskExvillLZ setTaskState "SUCCEEDED";
	missionNamespace setVariable ["tskExvillLZ","SUCCEEDED"];
	_null=[objNull, objNull, tskExvillLZ, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
	player setCurrentTask tskRTB;
	missionNamespace setVariable ["tskRTB","ASSIGNED"];
	_null=[objNull, objNull, tskRTB, "ASSIGNED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
};

