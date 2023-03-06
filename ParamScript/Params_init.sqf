/*==============================================
                Params Script
================================================*/
_P = [];
if (isNil "paramsArray") then { // SP or Editor Preview
	if (isClass (missionConfigFile/"Params")) then {
		for "_i" from 0 to (count (missionConfigFile/"Params") - 1) do {
			_paramName = configName ((missionConfigFile >> "Params") select _i);
			missionNamespace setVariable [_paramName, getNumber (missionConfigFile >> "Params" >> _paramName >> "default")];
			_P = _P + [_paramName];
		};
	};
} else { // MP
	for "_i" from 0 to (count paramsArray - 1) do {
		_paramName = configName ((missionConfigFile >> "Params") select _i);
		missionNamespace setVariable [configName ((missionConfigFile >> "Params") select _i), paramsArray select _i];
		_P = _P + [_paramName];
	};
};
_debug = false;
Day_Time = missionNamespace getVariable "Day_Time";
Weather = missionNamespace getVariable "Weather";
FogParam = missionNamespace getVariable "FogParam";
WindDirection = missionNamespace getVariable "WindDirection";
WindStrength = missionNamespace getVariable "WindStrength";
AICurrentSkill = missionNamespace getVariable "AICurrentSkill";
WeaponParam = missionNamespace getVariable "WeaponParam";
WeaponRespawn = missionNamespace getVariable "WeaponRespawn";
UnlimitedAmmo = missionNamespace getVariable "UnlimitedAmmo";
UnitArmor = missionNamespace getVariable "UnitArmor";
ClyHeal = missionNamespace getVariable "ClyHeal";
UnitMarkers = missionNamespace getVariable "UnitMarkers";
OnLeaderRespawn = missionNamespace getVariable "OnLeaderRespawn";
////////////////////////////////////////
//          AICURRENTSKILL            //
////////////////////////////////////////
if (isNil "AICurrentSkill") then {AICurrentSkill=3};
switch (AICurrentSkill) do {
//Novice 
    case 1: 
    	{ 
        AICurrentSkill = 0.25; 
    	}; 
//Rookie 
    	case 2: 
    	{ 
        AICurrentSkill = 0.45; 
    	}; 
//Veteran 
    	case 3: 
    	{ 
        AICurrentSkill = 0.65; 
    	}; 
//Expert 
    	case 4: 
    	{ 
        AICurrentSkill = 0.85; 
    	}; 
//Elite 
    	case 5: 
    	{ 
        AICurrentSkill = 0.95; 
    	};    
};
if (!isNil "AICurrentSkill") then {AICurrentSkill=AICurrentSkill;[] spawn {uisleep 4;[west, "HQ"] sideChat "AI Skill!";}};
////////////////////////////////////////
//             WEAPON TYPE            //
////////////////////////////////////////
if (isNil "WeaponParam") then {WeaponParam=1};
switch (WeaponParam) do {
		case 1:	{[player] execVM "Cly_addweapon\cly_unitweapons.sqf"};
		case 2:	{{[_x] execVM "Cly_addweapon\cly_unitweapons.sqf"} forEach units group player;};
		case 3:	{{[_x] execVM "Cly_addweapon\cly_unitweapons.sqf"} forEach (if ismultiplayer then {playableunits} else {switchableunits});};
		case 4:	{{[_x] execVM "Cly_addweapon\w_rockets\cly_unitweapons.sqf"} forEach units group player;};
		case 5:	{{[_x] execVM "Cly_addweapon\w_rockets\cly_unitweapons.sqf"} forEach (if ismultiplayer then {playableunits} else {switchableunits});};
		case 6:	{{[_x] execVM "weaponrespawn.sqf"} forEach (if ismultiplayer then {playableunits} else {switchableunits});};
		case 7:	{};
	};
if (!isNil "WeaponParam") then {WeaponParam=WeaponParam;[] spawn {uisleep 5;[west, "HQ"] sideChat "Cly Weapons!";}};
////////////////////////////////////////
//           WEAPON RESPAWN           //
////////////////////////////////////////
if (isNil "WeaponRespawn") then {WeaponRespawn=1};
switch (WeaponRespawn) do {
		case 1:	{[player] execVM "weaponrespawn.sqf"};
		case 2:	{{[_x] execVM "weaponrespawn.sqf"} forEach units group player;};
		case 3:	{{[_x] execVM "weaponrespawn.sqf"} forEach (if ismultiplayer then {playableunits} else {switchableunits});};
		case 4:	{};
	};
if (!isNil "WeaponRespawn") then {WeaponRespawn=WeaponRespawn;[] spawn {uisleep 6;[west, "HQ"] sideChat "Weapon Respawn!";}};
///////////////////////////////////////////////
//              UNLIMITEDAMMO		     //
///////////////////////////////////////////////	
if (isNil "UnlimitedAmmo") then {UnlimitedAmmo=1};
switch (UnlimitedAmmo) do {
		case 1:	{[player] execVM "cly_addweapon\cly_unlimited.sqf"};
		case 2:	{{[_x] execVM "cly_addweapon\cly_unlimited.sqf"} forEach units group player;};
		case 3:	{{[_x] execVM "cly_addweapon\cly_unlimited.sqf"} forEach (if ismultiplayer then {playableunits} else {switchableunits});};
		case 4:	{};
	};
if (!isNil "UnlimitedAmmo") then {UnlimitedAmmo=UnlimitedAmmo;[] spawn {uisleep 7;[west, "HQ"] sideChat "Unlimited Ammo!";}};
///////////////////////////////////////////////
//                UNITARMOR		     //
///////////////////////////////////////////////	
if (isNil "UnitArmor") then {UnitArmor=1};
switch (UnitArmor) do {
		case 1:	{[player] execVM "aiHealthRegen2.sqf"};
		case 2:	{{[_x] execVM "aiHealthRegen2.sqf"} forEach units group player;};
		case 3:	{{[_x] execVM "aiHealthRegen2.sqf"} forEach (if ismultiplayer then {playableunits} else {switchableunits});};
		case 4:	{};
	};
if (!isNil "UnitArmor") then {UnitArmor=UnitArmor;[] spawn {uisleep 8;[west, "HQ"] sideChat "Unit Armor!";}};
///////////////////////////////////////////////
//                CLYHEAL		     //
///////////////////////////////////////////////	
if (isNil "ClyHeal") then {ClyHeal=1};
switch (ClyHeal) do {
		case 1:	{[player,0.1,0,5,true] execVM "cly_heal.sqf"};
		case 2:	{{[_x,0.1,0,5,true] execVM "cly_heal.sqf"} forEach units group player;};
		case 3:	{{[_x,0.1,0,5,true] execVM "cly_heal.sqf"} forEach (if ismultiplayer then {playableunits} else {switchableunits});};
		case 4:	{};
	};
if (!isNil "ClyHeal") then {ClyHeal=ClyHeal;[] spawn {uisleep 9;[west, "HQ"] sideChat "Cly Heal!";}};
///////////////////////////////////////////////
//               UNITMARKERS		     //
///////////////////////////////////////////////	
if (isNil "UnitMarkers") then {UnitMarkers=1};
switch (UnitMarkers) do {
		case 1:	{[player] execVM "markerID.sqf"};
		case 2:	{{[_x] execVM "markerID.sqf"} forEach units group player;};
		case 3:	{{[_x] execVM "markerID.sqf"} forEach (if ismultiplayer then {playableunits} else {switchableunits});};
		case 4:	{};
	};
if (!isNil "UnitMarkers") then {UnitMarkers=UnitMarkers;[] spawn {uisleep 10;[west, "HQ"] sideChat "Unit Markers!";}};
///////////////////////////////////////////////
//              ONLEADERRESPAWN		     //
///////////////////////////////////////////////	
if (isNil "OnLeaderRespawn") then {OnLeaderRespawn=1};
switch (OnLeaderRespawn) do {
		case 1:	{execVM "OnLeaderRespawn.sqf"};
		case 2:	{};
	};
if ((!isNil "OnLeaderRespawn") and (OnLeaderRespawn==1)) then {OnLeaderRespawn=OnLeaderRespawn;[] spawn {uisleep 10;[west, "HQ"] sideChat "On Leader Respawn!";}} else {[] spawn {uisleep 10;[west, "HQ"] sideChat "Base Respawn!";}};
///////////////////////////////////////////////
//              DEBUG SETTINGS		     //
///////////////////////////////////////////////		
if (_debug) then {
	[] spawn {
		while {alive player} do {
		uisleep 10; hintSilent format ["AICurrentSkill: %1\nWeaponParam: %2\nWeaponRespawn: %3\nUnlimitedAmmo: %4\nUnitArmor: %5\nClyHeal: %6\nUnitMarkers: %7\nOnLeaderRespawn: %8",AICurrentSkill,WeaponParam,WeaponRespawn,UnlimitedAmmo,UnitArmor,ClyHeal,UnitMarkers,OnLeaderRespawn]; copytoclipboard format ["AICurrentSkill: %1\nWeaponParam: %2\nWeaponRespawn: %3\nUnlimitedAmmo: %4\nUnitArmor: %5\nClyHeal: %6\nUnitMarkers: %7\nOnLeaderRespawn: %8",AICurrentSkill,WeaponParam,WeaponRespawn,UnlimitedAmmo,UnitArmor,ClyHeal,UnitMarkers,OnLeaderRespawn]; uisleep 10; hintSilent "";
		uisleep 60; 
		}; 
	}; 
};
//AICurrentSkill: 0.65\nWeaponParam: 3\WeaponRespawn: 2\nUnlimitedAmmo: 2\nUnitArmor: 2\nClyHeal: 1\nUnitMarkers: 3\nOnLeaderRespawn: 2
