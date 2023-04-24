// aiHealthRegen2.sqf /////////////////[unit, causedBy, damage]
private ["_unit"];
_unit = _this select 0;

if (isMultiplayer) then {
	_unit addEventHandler ["Respawn", {
		private ["_unit","_dead"];
		_unit = (_this select 0);
		_dead = (_this select 1);
		[_unit] execVM "aiHealthRegen2.sqf";
	}	
]};

_unit addEventHandler ["Hit",{
	private ["_unit","_causedBy","_damage"];
    _unit = _this select 0; 
    [_unit] spawn {
    	_unit = _this select 0;
		while {(getDammage _unit) > .3} do {
			if ((getDammage _unit) > .3) then {
				_unit setDamage ((getDammage _unit) - 0.1);
				//hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Health: %1-%2</t>",name _unit, damage _unit];
				sleep 0.1;
			};
		};
	};
}];
