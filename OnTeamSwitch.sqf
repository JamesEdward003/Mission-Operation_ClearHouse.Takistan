// OnTeamSwitch.sqf //genie check//
_from = _this select 0;
_to = _this select 1;

_from enableAI "TeamSwitch";

[_to] execVM "markerID.sqf";

[] execVM "briefing.sqf";
/*
[player] execVM "weaponrespawn.sqf";
[player] execVM "markerID.sqf";
[player] execVM "OnLeaderRespawn.sqf";
[player] execVM "safeWeapon.sqf";
*/
hintSilent "Switched!";
