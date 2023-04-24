//////////////////////////////////////////////////////////////////
// this addEventHandler["killed", {[_this select 0, _this select 1, ['hEnd',lzPickup, lzDropOff]] execVM "008\onKilled.sqf"}];
private ["_victim","_killer","_hStart","_lzPickup","_lzDropOff"];
_victim 	= _this select 0;
_killer 	= _this select 1;
_hStart 	= if ((count _this >2) and (count ((_this select 2) >0))) then {_this select 2 select 0} else {nil};
_lzPickup   = if ((count _this >2) and (count ((_this select 2) >1))) then {_this select 2 select 1} else {objNull};
_lzDropOff  = if ((count _this >2) and (count ((_this select 2) >2))) then {_this select 2 select 2} else {objNull};

deleteMarker _hStart;
deleteVehicle _lzPickup;
deleteVehicle _lzDropOff;

/*
_hStart 	= if ((count _this >2) and (count (_this select 2 select 0) >0)) then {_this select 2 select 0} else {nil};
_lzPickup   = if ((count _this >2) and (count (_this select 2 select 1) >1)) then {_this select 2 select 1} else {objNull};
_lzDropOff  = if ((count _this >2) and (count (_this select 2 select 2) >2)) then {_this select 2 select 2} else {objNull};

_hStart 	= if (count (_this select 2 select 0) >0) then {_this select 2 select 0} else {nil};
_lzPickup   = if (count (_this select 2 select 1) >0) then {_this select 2 select 1} else {objNull};
_lzDropOff  = if (count (_this select 2 select 2) >0) then {_this select 2 select 2} else {objNull};

_hStart 	= if (count _this >2) then {_this select 2 select 0};
_lzPickup   = if (count _this >2) then {_this select 2 select 1};
_lzDropOff  = if (count _this >2) then {_this select 2 select 2};

deleteMarker _hStart;
deleteVehicle _lzPickup;
deleteVehicle _lzDropOff;

_hStart 	= if ((count _this >2) and (!isNil (_this select 2 select 0))) then {deleteMarker _hStart} else {_hStart=nil};
_lzPickup   = if ((count _this >2) and (!isNull (_this select 2 select 1))) then {deleteVehicle _lzPickup} else {_lzPickup=objNull};
_lzDropOff  = if ((count _this >2) and (!isNull (_this select 2 select 2))) then {deleteVehicle _lzDropOff} else {_lzDropOff=objNull};

_heliHs = nearestObjects [_victim, ["HeliHEmpty"], 20];

if (!isNil getMarkerColor _hStart) then {deleteMarker _hStart};

if (!isNull _lzPickup) then {deleteVehicle _lzPickup};

if (!isNull _lzDropOff) then {deleteVehicle _lzDropOff};

if (!isNil getMarkerColor "LZ") then {deleteMarker "LZ"};
*/
hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Asset Destroyed, Victim: %2, NameOfVictim: %4, Killer: %1, NameOfKiller: %3</t>", typeOf _killer, typeOf _victim, name _killer, name _victim];
//hintSilent format["Asset Destroyed, Killer: %1, Victim: %2, NameOfKiller: %3, NameOfVictim: %4", _killer, _victim, name _killer, name _victim];
 
 	