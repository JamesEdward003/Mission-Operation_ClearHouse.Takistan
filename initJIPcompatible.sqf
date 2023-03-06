// initJIPcompatible.sqf //
execVM "briefing.sqf";

if (isMultiplayer) then {	
	
	player addEventHandler ["Respawn",{
		_unit = _this select 0;
		_dead = _this select 1;
		_varName = vehicleVarname _dead;
		_unit setIdentity _varName;
	}];
	player addEventHandler ["Killed",{
		_unit = _this select 0;
		[_unit] execVM "Cly_addweapon\cly_unitweapons.sqf";
	}];
	player addEventHandler ["Killed",{
		_unit = _this select 0;
		[_unit] execVM "Cly_addweapon\cly_unlimited.sqf";
	}];
	player addEventHandler ["Killed",{
		_unit = _this select 0;
		[_unit] execVM "weaponrespawn.sqf";
	}];
	player addEventHandler ["Killed",{
		_unit = _this select 0;
		[_unit] execVM "aiHealthRegen2.sqf";
	}];
	player addEventHandler ["Killed",{
		_unit = _this select 0;
		[_unit,0.1,0,5,true] execVM "cly_heal.sqf";
	}];
	player addEventHandler ["Killed",{
		_unit = _this select 0;
		[_unit] execVM "markerID.sqf";
	}];
	player addEventHandler ["Killed",{
		_unit = _this select 0;
		[_unit] execVM "OnLeaderRespawn.sqf";
	}];
};
player action ["WEAPONONBACK", player];

[nil,nil,rSPAWN,hintSilent format ["Enjoy the game\n %1",name player]] call RE;


/*
[player] execVM "Cly_addweapon\cly_unitweapons.sqf";

[player] execVM "Cly_addweapon\cly_unlimited.sqf";

[player] execVM "weaponrespawn.sqf";

[player] execVM "aiHealthRegen2.sqf";

[player,0.1,0,5,true] execVM "cly_heal.sqf";

[player] execVM "markerID.sqf";

execVM "OnLeaderRespawn.sqf";

player action ["WEAPONONBACK", player];

[nil,nil,rSPAWN,hintSilent format ["Enjoy the game\n %1",name player]] call RE;
*/
