// haloOperation.sqf //
[] spawn {
	_radio=createTrigger["EmptyDetector",[0,0]];
	_radio setTriggerActivation["India","PRESENT",true];
	_radio setTriggerStatements["this","0 spawn Halo_Operation",""];
	9 setRadioMsg "HALO TOGGLE";
};

Halo_Operation = {

	if (Halo_Check_Group) then {

		Halo_Check_Group = false; publicVariable "Halo_Check_Group"; 
		hintSilent "Group Halo is ON"; 
		uisleep 2; 
		hintSilent ""; 
		execVM "008\HaloGroup.sqf";
		1 setRadioMsg "PLAYER HALO";

	} else {

		Halo_Check_Group = true; publicVariable "Halo_Check_Group";  
		hintSilent "Player Halo is ON"; 
		uisleep 2; 
		hintSilent "";
		execVM "008\HaloPlayer.sqf";
		1 setRadioMsg "GROUP HALO";

	};
};

