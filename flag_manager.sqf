// flag_manager.sqf //
_unit = _this select 0;
//hintsilent format ["Faction: %1",(faction _unit)];
if ((faction _unit) == "bis_us") then {
//flag1 setFlagTexture "\ca\ca_e\data\flag_knight_co.paa";};
flag1 setFlagTexture "\ca\ca_e\data\flag_usarmy_co.paa";};
if ((faction _unit) == "usmc") then {
flag1 setFlagTexture "\ca\data\flag_usmc_co.paa";};
if ((faction _unit) == "bis_cdf") then {
flag1 setFlagTexture "\ca\ca_e\data\flag_cdf_co.paa";};
if ((faction _unit) == "bis_baf") then {
flag1 setFlagTexture "\ca\data_baf\flag_unionjack_co.paa";};
if ((faction _unit) == "ru") then {
flag1 setFlagTexture "\ca\data\flag_rus_co.paa";};
if ((faction _unit) == "pmc_baf") then {
flag1 setFlagTexture "\ca\ca_e\data\flag_cr_co.paa";};
if ((faction _unit) == "bis_tk_civ") then {
flag1 setFlagTexture "\ca\ca_e\data\flag_cz_co.paa";};

/*
Arma 2 Flag Textures
"\ca\data\Flag_usmc_co.paa"
"\ca\data\Flag_rus_co.paa"
"\ca\data\Flag_usa_co.paa"
"\ca\data\Flag_napa_co.paa"
"\ca\data\Flag_chdkz_co.paa"
"\ca\data\Flag_chernarus_co.paa"
"\ca\data\FlagHolder_co.paa"

Arma 2 OA Flag Textures
"\ca\ca_e\data\flag_opfor_co.paa"
"\ca\ca_e\data\flag_blufor_co.paa"
"\ca\ca_e\data\flag_indfor_co.paa"
"\ca\ca_e\data\flag_white_co.paa"

"\ca\ca_e\data\flag_cdf_co.paa"
"\ca\ca_e\data\flag_cr_co.paa"
"\ca\ca_e\data\flag_cz_co.paa"
"\ca\ca_e\data\flag_ger_co.paa"
"\ca\ca_e\data\flag_tka_co.paa"
"\ca\ca_e\data\flag_tkg_co.paa"
"\ca\ca_e\data\flag_tkm_co.paa"
"\ca\ca_e\data\flag_us_co.paa"
"\ca\data_baf\flag_unionjack_co.paa"

"\ca\ca_e\data\flag_bis_co.paa"
"\ca\ca_e\data\flag_knight_co.paa"
"\ca\ca_e\data\flag_nato_co.paa"
"\ca\ca_e\data\flag_pow_co.paa"
"\ca\ca_e\data\flag_uno_co.paa"
"\ca\ca_e\data\flag_usarmy_co.paa"
"\ca\ca_pmc\data\flag_ion_white_co.paa"
"\ca\ca_pmc\data\flag_ion_black_co.paa"

"\ca\ca_e\data\flag_rcrescent_co.paa"
"\ca\ca_e\data\flag_rcross_co.paa"
"\ca\ca_e\data\flag_rcrystal_co.paa"

"\ca\missions_e\data\images\fos_planck_co.paa"
*/

