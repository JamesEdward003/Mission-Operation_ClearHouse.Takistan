// launchOperation.sqf //
deleteVehicle radioTrigger1;
[] spawn {
	radioTrigger1=createTrigger["EmptyDetector",[0,0]];
	radioTrigger1 setTriggerActivation["Alpha","PRESENT",true];
	radioTrigger1 setTriggerStatements["this","0 spawn Heal_Player;",""];
	1 setRadioMsg "HEAL PLAYER";
};

Heal_Player = {

if ((lifeState player == "UNCONSCIOUS") || (lifeState player == "ALIVE")) then
//if (((lifeState player == "UNCONSCIOUS") || (lifeState player == "ALIVE")) and (damage player > .3)) then 
    {

        [] execVM "HealPlayer.sqf";

	} else {

		hintSilent parseText format ["<t color='#00FF00' size='2.0'>USE CONSCIOUS HEAL ACTION!</t>"];

	};
};

_null=[] spawn { 

	waitUntil { (Alpha_loaded and Bravo_loaded and Charlie_loaded and Delta_loaded and LaunchOperation) || ((vehicle player != player) and LaunchOperation) };
	taskHint ["Insert at LZ", [0, 1, 0, 1], "taskCurrent"];
	tskInsertLZ setTaskState "ASSIGNED";
	missionNamespace setVariable ["tskInsertLZpv",3];
	player setCurrentTask tskInsertLZ;
	hintSilent parseText format ["<t color='#00FF00' size='2.0'>Start The Operation!</t>"];
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
