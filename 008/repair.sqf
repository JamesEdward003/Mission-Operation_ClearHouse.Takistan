//////////////////////////////////////////////////////////////////
_target = _this select 0;  
_caller = _this select 1;

_damage = getDammage _target;

if (_damage > 0) then {

_caller playMove "AinvPknlMstpSlayWrflDnon_medic";

sleep 8;
	
_target setDamage 0;

sleep 1;

player commandChat format["%1 repaired by %2", typeOf _target, name _caller];

} else {
	
player commandChat format["%1 is not damaged", typeOf _target];

};
