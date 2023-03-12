//////////////////////////////////////////////////////////////////[unit, causedBy, damage]
private ["_unit"];
_unit = _this select 0;

_unit addEventHandler ["Hit",{
	private ["_unit","_causedBy","_damage"];
    _unit = _this select 0; 
    [_unit] spawn {
    	_unit = _this select 0;
		while {alive _unit} do {
			if ((getDammage _unit) > .3) then
			{
				_unit setDamage ((getDammage _unit) - 0.1);
				//hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Health: %1-%2</t>",name _unit, damage _unit];
				sleep 0.1;
			};

		};
	};
}];

///////////////////DOES NOT WORK WELL...SLOW TO REGISTER///////////////////
//_unit addMPEventHandler ["MPHit",{

//		if (alive _unit) then 
//		{
//			if (damage _unit > 0) then
//			{
//				_unit setDamage ((damage _unit) - 0.1);
//				//hintSilent format ["Health: %1-%2",name _unit, damage _unit];
//				hintSilent parseText format["<t size='1' font='Zeppelin33' color='#FFFF00'>Health: %1-%2</t>",name _unit, damage _unit];
//				sleep 0.1;
//			};

//		};

//}];
