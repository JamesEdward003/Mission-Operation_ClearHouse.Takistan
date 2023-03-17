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
FirstAidModules = missionNamespace getVariable "FirstAidModules";
////////////////////////////////////////
//          AICURRENTSKILL            //
////////////////////////////////////////
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
////////////////////////////////////////
//             WEAPON TYPE            //
////////////////////////////////////////
switch (WeaponParam) do {
		case 1:	{[player] execVM "Cly_addweapon\cly_unitweapons.sqf"};
		case 2:	{{[_x] execVM "Cly_addweapon\cly_unitweapons.sqf"} forEach units group player;};
		case 3:	{{[_x] execVM "Cly_addweapon\cly_unitweapons.sqf"} forEach (if ismultiplayer then {playableunits} else {switchableunits});};
		case 4:	{{[_x] execVM "Cly_addweapon\w_rockets\cly_unitweapons.sqf"} forEach units group player;};
		case 5:	{{[_x] execVM "Cly_addweapon\w_rockets\cly_unitweapons.sqf"} forEach (if ismultiplayer then {playableunits} else {switchableunits});};
		case 6:	{exec "loadouts\sf_weapons.sqs"};
		case 7:	{{[_x] execVM "weaponrespawn.sqf"} forEach (if ismultiplayer then {playableunits} else {switchableunits});};
		case 8:	{};
	};
////////////////////////////////////////
//           WEAPON RESPAWN           //
////////////////////////////////////////
switch (WeaponRespawn) do {
		case 1:	{[player] execVM "weaponrespawn.sqf"};
		case 2:	{{[_x] execVM "weaponrespawn.sqf"} forEach units group player;};
		case 3:	{{[_x] execVM "weaponrespawn.sqf"} forEach (if ismultiplayer then {playableunits} else {switchableunits});};
		case 4:	{};
	};
///////////////////////////////////////////////
//              UNLIMITEDAMMO		     //
///////////////////////////////////////////////	
switch (UnlimitedAmmo) do {
		case 1:	{[player] execVM "cly_addweapon\cly_unlimited.sqf"};
		case 2:	{{[_x] execVM "cly_addweapon\cly_unlimited.sqf"} forEach units group player;};
		case 3:	{{[_x] execVM "cly_addweapon\cly_unlimited.sqf"} forEach (if ismultiplayer then {playableunits} else {switchableunits});};
		case 4:	{};
	};
///////////////////////////////////////////////
//                UNITARMOR		     //
///////////////////////////////////////////////	
switch (UnitArmor) do {
		case 1:	{[player] execVM "aiHealthRegen2.sqf"};
		case 2:	{{[_x] execVM "aiHealthRegen2.sqf"} forEach units group player;};
		case 3:	{{[_x] execVM "aiHealthRegen2.sqf"} forEach (if ismultiplayer then {playableunits} else {switchableunits});};
		case 4:	{};
	};
///////////////////////////////////////////////
//                HEALSELF		     //
///////////////////////////////////////////////	
switch (HealSelf) do {
		case 1:	{player addAction ["<t color='#00FFFF'>Heal Self</t>","008\healSelf\healSelf.sqf",[],-99,false,false,"","(getDammage _target) > 0.1"];};
		case 2:	{{[_x] addAction ["<t color='#00FFFF'>Heal Self</t>","008\healSelf\healSelf.sqf",[],-99,false,false,"","(getDammage _target) > 0.1"];} forEach units group player;};
		case 3:	{{[_x] addAction ["<t color='#00FFFF'>Heal Self</t>","008\healSelf\healSelf.sqf",[],-99,false,false,"","(getDammage _target) > 0.1"];} forEach (if ismultiplayer then {playableunits} else {switchableunits});};
		case 4:	{};
	};
///////////////////////////////////////////////
//               UNITMARKERS		     //
///////////////////////////////////////////////	
switch (UnitMarkers) do {
		case 1:	{[player] execVM "markerID.sqf"};
		case 2:	{{[_x] execVM "markerID.sqf"} forEach units group player;};
		case 3:	{{[_x] execVM "markerID.sqf"} forEach (if ismultiplayer then {playableunits} else {switchableunits});};
		case 4:	{};
	};
///////////////////////////////////////////////
//              ONLEADERRESPAWN		     //
///////////////////////////////////////////////	
switch (OnLeaderRespawn) do {
		case 1:	{execVM "OnLeaderRespawn.sqf"};
		case 2:	{};
	};
///////////////////////////////////////////////
//             FIRSTAIDMODULES		     //
///////////////////////////////////////////////	
switch (FirstAidModules) do {
		case 1:	{};
		case 2:	{execVM "FirstAidModules.sqf"};
	};
///////////////////////////////////////////////
//              DEBUG SETTINGS		     //
///////////////////////////////////////////////		
if (_debug) then {
	[] spawn {
		while {alive player} do {
		uisleep 10; hintSilent format ["AICurrentSkill: %1\nWeaponParam: %2\nWeaponRespawn: %3\nUnlimitedAmmo: %4\nUnitArmor: %5\nClyHeal: %6\nUnitMarkers: %7\nOnLeaderRespawn: %8\nFirstAidModules: %9",AICurrentSkill,WeaponParam,WeaponRespawn,UnlimitedAmmo,UnitArmor,ClyHeal,UnitMarkers,OnLeaderRespawn,FirstAidModules]; copytoclipboard format ["AICurrentSkill: %1\nWeaponParam: %2\nWeaponRespawn: %3\nUnlimitedAmmo: %4\nUnitArmor: %5\nClyHeal: %6\nUnitMarkers: %7\nOnLeaderRespawn: %8\nFirstAidModules: %9",AICurrentSkill,WeaponParam,WeaponRespawn,UnlimitedAmmo,UnitArmor,ClyHeal,UnitMarkers,OnLeaderRespawn,FirstAidModules]; uisleep 10; hintSilent "";
		uisleep 60; 
		}; 
	}; 
};
//AICurrentSkill: 0.65\nWeaponParam: 3\WeaponRespawn: 2\nUnlimitedAmmo: 2\nUnitArmor: 2\nClyHeal: 1\nUnitMarkers: 3\nOnLeaderRespawn: 2
