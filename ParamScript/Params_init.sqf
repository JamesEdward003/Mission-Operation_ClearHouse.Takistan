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
_debugtasks = false;
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
HealSelf = missionNamespace getVariable "HealSelf";
UnitMarkers = missionNamespace getVariable "UnitMarkers";
OnLeaderRespawn = missionNamespace getVariable "OnLeaderRespawn";
FirstAidModules = missionNamespace getVariable "FirstAidModules";

tskInsertLZpv = missionNamespace getVariable "tskInsertLZpv";
tskClearVillagepv = missionNamespace getVariable "tskClearVillagepv";
tskElimHVTpv = missionNamespace getVariable "tskElimHVTpv";
tskExvillLZpv = missionNamespace getVariable "tskExvillLZpv";
tskRTBpv = missionNamespace getVariable "tskRTBpv";
tskDGCpv = missionNamespace getVariable "tskDGCpv";
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
		case 4:	{};
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
		case 1:	{player addAction ["<t color='#00FFFF'>Heal Self</t>","008\healSelf\healSelf.sqf",[],-99,false,false,"","((_target == _this) and (getDammage _target) > 0.1)"];};
		case 2:	{{[_x] addAction ["<t color='#00FFFF'>Heal Self</t>","008\healSelf\healSelf.sqf",[],-99,false,false,"","((_target == _this) and (getDammage _target) > 0.1)"];} forEach units group player;};
		case 3:	{{[_x] addAction ["<t color='#00FFFF'>Heal Self</t>","008\healSelf\healSelf.sqf",[],-99,false,false,"","((_target == _this) and (getDammage _target) > 0.1)"];} forEach (if ismultiplayer then {playableunits} else {switchableunits});};
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
//              ENABLESAVING		     //
///////////////////////////////////////////////	
switch (EnableSaves) do {
		case 1:	{enableSaving [true, true]};
		case 2:	{enableSaving [false, false]};
	};
///////////////////////////////////////////////
//             	   TASKS		     //
///////////////////////////////////////////////
switch (tskInsertLZpv) do {
		case 1:	{tskInsertLZ setTaskState "NONE"};
		case 2:	{tskInsertLZ setTaskState "CREATED"};
		case 3:	{tskInsertLZ setTaskState "ASSIGNED"};
		case 4:	{tskInsertLZ setTaskState "SUCCEEDED"};
		case 5:	{tskInsertLZ setTaskState "FAILED"};
		case 6:	{tskInsertLZ setTaskState "CANCELED"};
		default {tskInsertLZ setTaskState "CREATED"};
	};
switch (tskClearVillagepv) do {
		case 1:	{tskClearVillage setTaskState "NONE"};
		case 2:	{tskClearVillage setTaskState "CREATED"};
		case 3:	{tskClearVillage setTaskState "ASSIGNED"};
		case 4:	{tskClearVillage setTaskState "SUCCEEDED"};
		case 5:	{tskClearVillage setTaskState "FAILED"};
		case 6:	{tskClearVillage setTaskState "CANCELED"};
		default {tskClearVillage setTaskState "CREATED"};
	};
switch (tskElimHVTpv) do {
		case 1:	{tskElimHVT setTaskState "NONE"};
		case 2:	{tskElimHVT setTaskState "CREATED"};
		case 3:	{tskElimHVT setTaskState "ASSIGNED"};
		case 4:	{tskElimHVT setTaskState "SUCCEEDED"};
		case 5:	{tskElimHVT setTaskState "FAILED"};
		case 6:	{tskElimHVT setTaskState "CANCELED"};
		default {tskElimHVT setTaskState "CREATED"};
	};
switch (tskExvillLZpv) do {
		case 1:	{tskExvillLZ setTaskState "NONE"};
		case 2:	{tskExvillLZ setTaskState "CREATED"};
		case 3:	{tskExvillLZ setTaskState "ASSIGNED"};
		case 4:	{tskExvillLZ setTaskState "SUCCEEDED"};
		case 5:	{tskExvillLZ setTaskState "FAILED"};
		case 6:	{tskExvillLZ setTaskState "CANCELED"};
		default {tskExvillLZ setTaskState "CREATED"};
	};
switch (tskRTBpv) do {
		case 1:	{tskRTB setTaskState "NONE"};
		case 2:	{tskRTB setTaskState "CREATED"};
		case 3:	{tskRTB setTaskState "ASSIGNED"};
		case 4:	{tskRTB setTaskState "SUCCEEDED"};
		case 5:	{tskRTB setTaskState "FAILED"};
		case 6:	{tskRTB setTaskState "CANCELED"};
		default {tskRTB setTaskState "CREATED"};
	};
switch (tskDGCpv) do {
		case 1:	{tskDGC setTaskState "NONE"};
		case 2:	{tskDGC setTaskState "CREATED"};
		case 3:	{tskDGC setTaskState "ASSIGNED"};
		case 4:	{tskDGC setTaskState "SUCCEEDED"};
		case 5:	{tskDGC setTaskState "FAILED"};
		case 6:	{tskDGC setTaskState "CANCELED"};
		default {tskDGC setTaskState "NONE"};
	};
///////////////////////////////////////////////
//              DEBUG SETTINGS		     //
///////////////////////////////////////////////		
if (_debug) then {
	[] spawn {
		while {alive player} do {
		uisleep 10; hintSilent format ["AICurrentSkill: %1\nWeaponParam: %2\nWeaponRespawn: %3\nUnlimitedAmmo: %4\nUnitArmor: %5\nClyHeal: %6\nUnitMarkers: %7\nOnLeaderRespawn: %8\nFirstAidModules: %9\nEnableSaves: %10",AICurrentSkill,WeaponParam,WeaponRespawn,UnlimitedAmmo,UnitArmor,ClyHeal,UnitMarkers,OnLeaderRespawn,FirstAidModules,EnableSaves]; copytoclipboard format ["AICurrentSkill: %1\nWeaponParam: %2\nWeaponRespawn: %3\nUnlimitedAmmo: %4\nUnitArmor: %5\nClyHeal: %6\nUnitMarkers: %7\nOnLeaderRespawn: %8\nFirstAidModules: %9\nEnableSaves: %10",AICurrentSkill,WeaponParam,WeaponRespawn,UnlimitedAmmo,UnitArmor,ClyHeal,UnitMarkers,OnLeaderRespawn,FirstAidModules,EnableSaves]; uisleep 10; hintSilent "";
		uisleep 60; 
		}; 
	}; 
};
if (_debugtasks) then {
	[] spawn {
		while {alive player} do {
		uisleep 10; hintSilent format ["tskInsertLZpv: %1\ntskClearVillagepv: %2\ntskElimHVTpv: %3\ntskExvillLZpv: %4\ntskRTBpv: %5\ntskDGCpv: %6",tskInsertLZpv,tskClearVillagepv,tskElimHVTpv,tskExvillLZpv,tskRTBpv,tskDGCpv]; copytoclipboard format ["tskInsertLZpv: %1\ntskClearVillagepv: %2\ntskElimHVTpv: %3\ntskExvillLZpv: %4\ntskRTBpv: %5\ntskDGCpv: %6",tskInsertLZpv,tskClearVillagepv,tskElimHVTpv,tskExvillLZpv,tskRTBpv,tskDGCpv]; uisleep 10; hintSilent "";
		uisleep 60; 
		}; 
	}; 
};
