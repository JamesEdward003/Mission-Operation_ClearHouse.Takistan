//  [player] execVM "Heal_Player.sqf";  //
_unit = _this select 0;
_side = side _unit;
_teamleader = leader _unit;
_grp =  group _unit;
_dist = 100;
_type = "US_Delta_Force_Medic_EP1";
hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Ambulance unit<br/>%1<br/>reporting!", vehicleVarname _teamleader];

_nearestUnits = nearestObjects [_unit,["Man"],_dist];

_injuredGrp = [];

{if (((lifeState _x == "UNCONSCIOUS") || (lifeState _x == "ALIVE")) and (damage _x > .3)) then {    
	_injuredGrp = _injuredGrp + [_x];
}} forEach _nearestUnits;

for "_i" from 0 to count _injuredGrp - 1 do {
	
	_injured = _injuredGrp select _i;
	
	if (lifeState _injured == "ALIVE") then {
		_injured setDamage 0;
		hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>%1<br/>patched up<br/>%2. You're good to go!", vehicleVarname _teamleader,vehicleVarname _injured];
	};
	if (lifeState _injured == "UNCONSCIOUS") then {
		_injured setDamage 0;
		_injured setUnconscious false;
		hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>%1<br/>healed<br/>%2. You're good to go!", vehicleVarname _teamleader,vehicleVarname _injured];
	};	
};

uisleep 10;
hint "";

