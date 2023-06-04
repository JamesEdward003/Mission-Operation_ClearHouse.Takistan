//////////////////////////////////////////////////////////////////
// this addEventHandler["killed", {[_this select 0, _this select 1, hStart, lzPickup, lzDropOff] execVM "008\onKilled.sqf"}];
private ["_victim","_killer","_hStart","_lzPickup","_lzDropOff"];
_victim 	= _this select 0;
_killer 	= _this select 1;
_hStart = if (count _this >2) then {_this select 2};
_lzPickup = if (count _this >3) then {_this select 3};
_lzDropOff = if (count _this >4) then {_this select 4};

hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Asset Destroyed, TypeOfVictim: %1, TypeOfKiller: %2</t>", typeOf _victim, typeOf _killer];

if (isMultiplayer) then {_killer addScore 200} else {_killer addRating 200};

[] spawn {
	//if (!isNil _hStart) then {deleteMarker _hStart};
	//if (!isNull _lzPickup) then {deleteVehicle _lzPickup};
	//if (!isNull _lzDropOff) then {deleteVehicle _lzDropOff};
	if (((getMarkerPos _hStart) select 1) != 0) then {deleteMarker _hStart};
	if (((getPosATL _lzPickup) select 2) != 0) then {deleteVehicle _lzPickup};
	if (((getPosATL _lzDropOff) select 2) != 0) then {deleteVehicle _lzDropOff};
};

//hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Asset Destroyed, TypeOfVictim: %1, TypeOfKiller: %2</t>", typeOf _victim, typeOf _killer];
//hintSilent format["Asset Destroyed, Killer: %1, Victim: %2, NameOfKiller: %3, NameOfVictim: %4", _killer, _victim, name _killer, name _victim];
