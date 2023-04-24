// jointOperation.sqf //
[] spawn {
	_radio=createTrigger["EmptyDetector",[0,0]];
	_radio setTriggerActivation["Alpha","PRESENT",true];
	_radio setTriggerStatements["this","0 spawn Joint_Operation",""];
	1 setRadioMsg "JOINT OPERATION";
};

Joint_Operation = {
	{ for "_i" from count waypoints _x - 1 to 0 step -1 do { deleteWaypoint [_x, _i] } } forEach [Alpha1,Bravo1,Charlie1,Delta1,Venom,Command];
	hintSilent parseText format ["<br/><t color='#00FF00' size='2.0'>Joint Operation!</t>"];
	_newGrp = (units Alpha1) + (units Bravo1) + (units Charlie1) + (units Delta1) + (units Venom) + (units Command);
	{ [_x] join grpNull } forEach _newGrp;
    hintSilent parseText format ["<br/><t color='#00FF00' size='2.0'>Regroup!</t>"];
	{ [_x] joinSilent (group player) } forEach _newGrp;
	(group player) selectLeader player;
    [] execVM "endOperation.sqf";
    [] execVM "menu.sqf";
    hintSilent parseText format ["<br/><t color='#00FF00' size='2.0'>End Operation Support Menu Added!</t>"];
};
