// Operations.sqf //
Alpha_1 = {
	[] spawn {
		_radio=createTrigger["EmptyDetector",[0,0]];
		_radio setTriggerActivation["Alpha","PRESENT",true];
		_radio setTriggerStatements["this","LaunchOperation=true;publicVariable "LaunchOperation";_null=[] execVM "endOperation.sqf";",""];
		1 setRadioMsg "LAUNCH OPERATION";
	};
	Launch_Operation = {


	};
};
Alpha_2 = {
	[] spawn {
		_radio=createTrigger["EmptyDetector",[0,0]];
		_radio setTriggerActivation["Alpha","PRESENT",true];
		_radio setTriggerStatements["this","0 spawn Joint_Operation",""];
		1 setRadioMsg "JOINT OPERATION";
	};
	Joint_Operation = {

		{ for "_i" from count waypoints _x - 1 to 0 step -1 do { deleteWaypoint [_x, _i]; }; } forEach [Alpha_1,Bravo_1,Charlie_1,Delta_1,Venom,Command]; 
		hintSilent parseText format ["<br/><t color='#00FF00' size='1.0'>Joint Operation!</t>"];
		uisleep 6;
		for "_i" from count _x - 1 to 0 step -1 do { {if (alive _x) then {[_x] joinSilent (group player)}} forEach (units Alpha_1) + (units Bravo_1) + (units Charlie_1) + (units Delta_1) + (units Venom) + (units Command)};
	    hintSilent parseText format ["<br/><t color='#00FF00' size='1.0'>Regroup!</t>"];
	    [] execVM "endOperation.sqf";
	};
};
Alpha_5 = {
	[] spawn {
		_radio=createTrigger["EmptyDetector",[0,0]];
		_radio setTriggerActivation["Alpha","PRESENT",true];
		_radio setTriggerStatements["this","0 spawn End_Operation",""];
		1 setRadioMsg "END OPERATION";
	};
	End_Operation = {

		{ for "_i" from count waypoints _x - 1 to 0 step -1 do { deleteWaypoint [_x, _i]; }; } forEach allGroups; 
		hintSilent parseText format ["<br/><t color='#00FF00' size='1.0'>End the Operation!</t>"];
		uisleep 6;
		{ _wp1 = _x addWaypoint [position leader _x, 10]; 
		  _wp1 setWaypointType "GETINNEAREST"; 
		  _wp1 setWaypointSpeed "FULL"; 
	      _wp2 = _x addWaypoint [MarkerPos "fin_marker", 100]; 
		  _wp2 setWaypointType "GETOUT"; } forEach allGroups; 
	    hintSilent parseText format ["<br/><t color='#00FF00' size='1.0'>Return To Base!</t>"];
		tskExvillLZ setTaskState "SUCCEEDED";
		tskExvillLZcompleted=true;publicVariable "tskExvillLZcompleted";
		player setCurrentTask tskRTB;
	};
};