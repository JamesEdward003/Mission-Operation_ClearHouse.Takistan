// OnTeamSwitch.sqf //genie check//
_from = _this select 0;
_to = _this select 1;

_from enableAI "TeamSwitch";

execVM "briefing.sqf";

[_to] execVM "initJIPcompatible.sqf";

hintSilent "Switched!";
