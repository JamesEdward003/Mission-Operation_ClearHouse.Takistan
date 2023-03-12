//////////////////////////////////////////////////////////////////
_target = _this select 0;

_target playMove "AinvPknlMstpSlayWrflDnon_medic";

uisleep 6;
		
_target setDamage 0;

uisleep 1;

//hintSilent parseText format["<t>You healed %1</t>", _target];

player commandChat format["Unit %1 healed himself", name _target];



//player addAction ["<t color='#00FFFF'>Heal Self</t>","008\healSelf\healSelf.sqf",[],-99,false,false,"","(getDammage _target) > 0.1"];
