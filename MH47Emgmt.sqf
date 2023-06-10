// MH47Emgmt.sqf //
_vehicle = _this select 0;
//_vehicle setVariable ["kyo_wipersOn", false];
//[_vehicle, false] execVM "animateWipers.sqf";
_vehicle spawn {
	while {alive _this} do {
		switch true do {
			case (rain < .2): {if (_this getVariable ["kyo_wipersOn", true]) then {(_this setVariable ["kyo_wipersOn", false]);[_this, false] execVM "animateWipers.sqf"}};
			case (rain > .2): {if (!(_this getVariable ["kyo_wipersOn", true])) then {(_this setVariable ["kyo_wipersOn", true]);[_this, true] execVM "animateWipers.sqf"}};
			default {};
		};	
		sleep 12;
	};
};
_vehicle spawn {
	while {alive _this} do {
		switch true do {
			case (((getpos _this) select 2 < 6)): {if (_this animationPhase "Ani_Ramp" > 0.2) then {_this animate["Ani_Ramp",0]}};
			case (((getpos _this) select 2 > 6)): {if (_this animationPhase "Ani_Ramp" < 0.5) then {_this animate["Ani_Ramp",1]}};
			default {};
		};	
		sleep 2;
	};
};
_vehicle spawn {
	while {alive _this} do {
		switch true do {
			case (damage _this > .1): {[_this] execVM "x_reload.sqf"};
			case (damage _this < .1): {};
			default {};
		};
		sleep 6;
	};
};
//_null=[] spawn { if (WeatherCheck) then {WeatherCheck = false; publicVariable "WeatherCheck"; hintSilent "Weather Check is OFF"; uisleep 10; hintSilent "";} else {WeatherCheck = true; publicVariable "WeatherCheck"; hintSilent "Weather Check is ON"; uisleep 10; hintSilent "";};};
//_null=[] spawn { if ((vehicle player) getVariable ["kyo_wipersOn", false]) then {((vehicle player) setVariable ["kyo_wipersOn", false]);[(vehicle player), false] execVM "animateWipers.sqf"; hintSilent "Windshield Wipers turned OFF"; uisleep 10; hintSilent "";} else {((vehicle player) setVariable ["kyo_wipersOn", true]);[vehicle player, true] execVM "animateWipers.sqf"; hintSilent "Windshield Wipers turned ON"; uisleep 10; hintSilent "";};};
