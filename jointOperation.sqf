// jointOperation.sqf //
[] spawn {
	radioTrigger1=createTrigger["EmptyDetector",[0,0]];
	radioTrigger1 setTriggerActivation["Alpha","PRESENT",true];
	radioTrigger1 setTriggerStatements["this","0 spawn Joint_Operation;deleteTrigger radioTrigger1;",""];
	1 setRadioMsg "JOINT OPERATION";
};

Joint_Operation = {
	{ for "_i" from count waypoints _x - 1 to 0 step -1 do { deleteWaypoint [_x, _i] } } forEach [Alpha1,Bravo1,Charlie1,Delta1,Venom,Command];
	hintSilent parseText format ["<t color='#00FF00' size='2.0'>Joint Operation!</t>"];
	_newGrp = (units Alpha1) + (units Bravo1) + (units Charlie1) + (units Delta1) + (units Venom) + (units Command);
	{ [_x] join grpNull } forEach _newGrp;
    hintSilent parseText format ["<t color='#00FF00' size='2.0'>Regroup!</t>"];
	{ [_x] joinSilent (group player) } forEach _newGrp;
	(group player) selectLeader player;
    [] execVM "endOperation.sqf";
    [] execVM "menu.sqf";
    hintSilent parseText format ["<t color='#00FF00' size='2.0'>End Operation Support Menu Added!</t>"];
};

hintSilent parseText format ["<t color='#00FF00' size='2.0'>Joint Operation Support Added!</t>"];
