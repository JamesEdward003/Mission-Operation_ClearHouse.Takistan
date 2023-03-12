//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: RALPH BELLAMY
// _handle = [] execVM "weaponrespawn.sqf"
//////////////////////////////////////////////////////////////////
_unit = _this select 0;

waitUntil {!isNil "WeaponParam"};
WeaponParam = missionNamespace getVariable "WeaponParam";

if ((WeaponParam != 6) or (WeaponParam != 7)) then {
    waitUntil {(!isNil {_unit getVariable "CLY_addweapon"})};
    uisleep 10;
};
if (isNil {_unit getVariable "Loadout"}) then {   
    _wep = weapons _unit;
    _mag = magazines _unit;
    _backpack = typeOf unitBackpack _unit;
    _backpackmags = getMagazineCargo unitBackpack _unit;
    _backpackweap = getWeaponCargo unitBackpack _unit;
    missionNamespace setVariable ["Loadout",[_wep,_mag,_backpack,_backpackmags,_backpackweap]];   

    //hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Loadout Saved!</t>"];
    //titleText [format ["Loadout Saved! - %1,%2,%3,%4,%5",name player,_wep,_mag,_backpack,_backpackmags,_backpackweap],"plain down"];
    uisleep 5;
    hintSilent "";
};
while {alive player} do {
    waitUntil {!alive player};
    waitUntil {alive player};
    _loadout = missionNamespace getVariable "Loadout";
    _p = player;
    removeAllWeapons _p;
    removeAllItems _p;
    removeBackpack _p;
    _wep = _loadout select 0;
	_mag = _loadout select 1;
	_backpack = _loadout select 2;
	_backpackmags = _loadout select 3;
	_backpackweap = _loadout select 4;
    {_p addMagazine _x} foreach _mag;
    {_p addWeapon _x} foreach _wep;
    if (primaryWeapon _p != "") then {
        _p selectWeapon (primaryWeapon _p);
        _muzzles = getArray(configFile>>"cfgWeapons" >> primaryWeapon _p >> "muzzles"); // Fix for weapons with grenade launcher
        _p selectWeapon (_muzzles select 0);
    };
    if(_backpack != "") then {
        _p addBackpack _backpack; clearWeaponCargo (unitBackpack _p); clearMagazineCargo (unitBackpack _p);

        for "_i" from 0 to (count (_backpackmags select 0) - 1) do {
            (unitBackpack _p) addMagazineCargo [(_backpackmags select 0) select _i,(_backpackmags select 1) select _i];
        };
        for "_i" from 0 to (count (_backpackweap select 0) - 1) do {
            (unitBackpack _p) addWeaponCargo [(_backpackweap select 0) select _i,(_backpackweap select 1) select _i];
        };
    };
};

/*
{if (_p hasWeapon _x) then {_up removeWeapon _x}} foreach (weapons _p);

_primw = primaryWeapon _p;
if (_primw != "") then {
    _p selectWeapon _primw;
    // Fix for weapons with grenade launcher
    _muzzles = getArray(configFile>>"cfgWeapons" >> _primw >> "muzzles");
    _p selectWeapon (_muzzles select 0);
    };
*/
