// haloOperation.sqf //
[] spawn {
	radioTrigger1=createTrigger["EmptyDetector",[0,0]];
	radioTrigger1 setTriggerActivation["Alpha","PRESENT",true];
	radioTrigger1 setTriggerStatements["this","0 spawn Halo_Operation;",""];
	1 setRadioMsg "HALO TOGGLE";
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

