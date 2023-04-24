// launchOperation.sqf //
_null=[] execVM "jointOperation.sqf";
_null=[] spawn { 
	waitUntil { Alpha_loaded and Bravo_loaded and Charlie_loaded and Delta_loaded and LaunchOperation };
	hintSilent parseText format ["<br/><t color='#00FF00' size='2.0'>Start The Operation!</t>"];
	if (!isEngineOn Echo1_AH6J_1) then {  
		Echo1_AH6J_1 engineOn true;
		(driver Echo1_AH6J_1) action ["engineOn", Echo1_AH6J_1];  
	};
	if (!isEngineOn Echo1_AH6J_2) then { 
		Echo1_AH6J_2 engineOn true; 
		(driver Echo1_AH6J_2) action ["engineOn", Echo1_AH6J_2];
	}; 
	StartedMission = true; publicVariable "StartedMission"; 
};
