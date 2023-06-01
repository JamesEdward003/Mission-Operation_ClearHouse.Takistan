//////////////////////////////////////////////////////////////////
// this addEventHandler["killed", {[_this select 0, _this select 1, hStart, lzPickup, lzDropOff] execVM "008\onKilled.sqf"}];
private ["_victim","_killer","_hStart","_lzPickup","_lzDropOff"];
_victim 	= _this select 0;
_killer 	= _this select 1;
_hStart = if (count _this >2) then {_this select 2};
_lzPickup = if (count _this >3) then {_this select 3};
_lzDropOff = if (count _this >4) then {_this select 4};
/*
_hStart 	= if ((!isNil _hStart) || ((getMarkerColor _hStart) != "")) then {_this select 2};
_lzPickup   = if ((!isNull _lzPickup) || (alive _lzPickup) || ((getPosATL _lzPickup) != [])) then {_this select 3};
_lzDropOff  = if ((!isNull _lzDropOff) || (alive _lzDropOff) || ((getPosATL _lzDropOff) != [])) then {_this select 4};
*/
hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Asset Destroyed, TypeOfVictim: %1, TypeOfKiller: %2</t>", typeOf _victim, typeOf _killer];

_killer addScore 200;
/*
deleteMarker _hStart;
deleteVehicle _lzPickup;
deleteVehicle _lzDropOff;
*/
if ((!isNil _hStart) || ((getMarkerColor _hStart) != "")) then {deleteMarker _hStart} else { 0 = 0 };
if ((!isNull _lzPickup) || (alive _lzPickup) || ((getPosATL _lzPickup) != [0,0,0])) then {deleteVehicle _lzPickup} else { 0 = 0 };
if ((!isNull _lzDropOff) || (alive _lzDropOff) || ((getPosATL _lzDropOff) != [0,0,0])) then {deleteVehicle _lzDropOff} else { 0 = 0 };

//hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Assets Deleted, Marker: %1, HeliPad1: %2, HeliPad2: %3</t>", _hStart, _lzPickup, _lzDropOff];
//copyToClipboard format["Assets Deleted, Marker: %1, HeliPad1: %2, HeliPad2: %3", _hStart, _lzPickup, _lzDropOff];
hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Asset Destroyed, TypeOfVictim: %1, TypeOfKiller: %2</t>", typeOf _victim, typeOf _killer];
//hintSilent format["Asset Destroyed, Killer: %1, Victim: %2, NameOfKiller: %3, NameOfVictim: %4", _killer, _victim, name _killer, name _victim];

/*
_hStart 	= if ((count _this >2) and (count ((_this select 2) >0))) then {_this select 2 select 0} else {nil};
_lzPickup   = if ((count _this >2) and (count ((_this select 2) >1))) then {_this select 2 select 1} else {objNull};
_lzDropOff  = if ((count _this >2) and (count ((_this select 2) >2))) then {_this select 2 select 2} else {objNull};

deleteMarker _hStart;
deleteVehicle _lzPickup;
deleteVehicle _lzDropOff;
*/
