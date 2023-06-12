//////////////////////////////////////////////////////////////////
_target = _this select 0;  
_caller = _this select 1;

_target setvehiclelock "unlocked"; vehicle _caller setvehiclelock "unlocked";

_caller commandChat format["%1 unlocked by %2", typeOf _target, name _caller];