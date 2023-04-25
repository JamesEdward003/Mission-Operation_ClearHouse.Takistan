//////////////////////////////////////////////////////////////////
// this addEventHandler["killed", {[_this select 0, _this select 1, ['hEnd',lzPickup, lzDropOff]] execVM "008\onKilled.sqf"}];
private ["_victim","_killer","_hStart","_lzPickup","_lzDropOff"];
_victim 	= _this select 0;
_killer 	= _this select 1;
_hStart 	= if ((markerColor (_this select 2 select 0)) != "") then {_this select 2 select 0} else {nil};
_lzPickup   = if (!isNull (_this select 2 select 1) and (typeOf (_this select 2 select 1)) != "") then {_this select 2 select 1} else {objNull};
_lzDropOff  = if (!isNull (_this select 2 select 1) and (typeOf (_this select 2 select 2)) != "") then {_this select 2 select 2} else {objNull};

deleteMarker _hStart;
deleteVehicle _lzPickup;
deleteVehicle _lzDropOff;

hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Asset Destroyed, Victim: %2, NameOfVictim: %4, Killer: %1, NameOfKiller: %3</t>", typeOf _killer, typeOf _victim, name _killer, name _victim];
//hintSilent format["Asset Destroyed, Killer: %1, Victim: %2, NameOfKiller: %3, NameOfVictim: %4", _killer, _victim, name _killer, name _victim];

/*
_hStart 	= if ((count _this >2) and (count ((_this select 2) >0))) then {_this select 2 select 0} else {nil};
_lzPickup   = if ((count _this >2) and (count ((_this select 2) >1))) then {_this select 2 select 1} else {objNull};
_lzDropOff  = if ((count _this >2) and (count ((_this select 2) >2))) then {_this select 2 select 2} else {objNull};

deleteMarker _hStart;
deleteVehicle _lzPickup;
deleteVehicle _lzDropOff;
*/
