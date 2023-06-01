/////////////// _null = [_unit] execVM "cly_unitweapons.sqf" ///////////////
private ["_unit"];
_unit = _this select 0;
/*
if (isMultiplayer) then {
	_unit addEventHandler ["Respawn", {
		private ["_unit","_dead"];
		_unit = (_this select 0);
		_dead = (_this select 1);
		[_unit] execVM "cly_addweapon\cly_unitweapons.sqf";
	}
]};
*/
if (daytime > 18.50 || daytime < 4.50) then {
	
switch (side _unit) do {
	
    case west							: {
	    
	    switch (typeOf _unit) do {

	    case "USMC_Soldier_Officer"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };		    
	    case "USMC_Soldier_SL"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_TWS_SD.sqf";
        };
	    case "USMC_Soldier_TL"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
	    case "USMC_Soldier_Medic"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4.sqf";
        };
	    case "USMC_Soldier_LAT"								: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
	    case "USMC_Soldier_AT"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        };
	    case "USMC_Soldier_HAT"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
	    case "USMC_Soldier_AA"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        };
	    case "USMC_SoldierS_Sniper"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M107_TWS.sqf";
        }; 
	    case "USMC_SoldierM_Marksman"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M107_TWS.sqf";
        }; 
	    case "USMC_Soldier_GL"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M4A3_RCO_GL_EP1.sqf";
        };
	    case "USMC_Soldier_MG"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";   
	    };
	    case "USMC_SoldierS_Engineer"							: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_SVD_NSPU_EP1.sqf";
        };   
	    case "FR_Commander"									: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4.sqf";
        };
	    case "FR_TL"										: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4.sqf";
        };
	    case "FR_Assault_R"									: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_TWS_SD.sqf";
        };
	    case "FR_Assault_GL"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        };
	    case "FR_GL"										: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "FR_Corpsman"									: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_TWS_SD.sqf";
        };
	    case "FR_AR"										: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        };
	    case "FR_AC"										: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_TWS_SD.sqf";
        };
	    case "FR_Light"										: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_TWS_SD.sqf";
        };
	    case "FR_Sapper"									: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_TWS_SD.sqf";
        };
	    case "FR_R"										: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_TWS_SD.sqf";
        };
	    case "FR_Miles"										: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
	    case "FR_Cooper"									: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4.sqf";
        };
	    case "FR_OHara"										: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
	    case "FR_Rodriguez"									: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
	    case "FR_Sykes"										: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M107_TWS.sqf";
        };
	    case "US_Soldier_Officer_EP1"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };		    
	    case "US_Soldier_SL_EP1"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4.sqf";
        };
	    case "US_Soldier_TL_EP1"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
	    case "US_Soldier_Spotter_EP1"							: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_M110_TWS.sqf";
        };
	    case "US_Soldier_Sniper_NV_EP1"						: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M110_NVG.sqf";
        };
	    case "US_Soldier_Sniper_EP1"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M107_TWS.sqf";
        };
	    case "US_Soldier_SniperH_EP1"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M110_TWS.sqf";
        };
	    case "US_Soldier_Pilot_EP1"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        }; 
	    case "US_Soldier_Medic_EP1"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        }; 
	    case "US_Soldier_Marksman_EP1"						: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M107_TWS.sqf";
        };
	    case "US_Soldier_MG_EP1"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";   
	    };
	    case "US_Soldier_HAT_EP1"							: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4.sqf";
        };
	    case "US_Soldier_LAT_EP1"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4.sqf";
        };
	    case "US_Soldier_GL_EP1"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
	    case "US_Soldier_Engineer_EP1"						: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
	    case "US_Soldier_Crew_EP1"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
	    case "US_Soldier_Light_EP1"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
	    case "US_Soldier_EP1"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
	    case "US_Delta_Force_AR_EP1"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
	    case "US_Delta_Force_Air_Controller_EP1"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        }; 
	    case "US_Delta_Force_MG_EP1"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        }; 
	    case "US_Delta_Force_Assault_EP1"						: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
	    case "US_Delta_Force_EP1"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";   
	    };
	    case "US_Delta_Force_M14_EP1"							: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4.sqf";
        };
	    case "US_Delta_Force_Marksman_EP1"						: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4.sqf";
        };
	    case "US_Delta_Force_Medic_EP1"						: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
	    case "US_Delta_Force_Night_EP1"						: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4.sqf";
        };
	    case "US_Delta_Force_SD_EP1"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
	    case "US_Delta_Force_TL_EP1"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4.sqf";
        };
	    case "US_Delta_Force_Undercover_Takistani06_EP1"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
	    case "WDL_Mercenary_Default9"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };		    
	    case "Mercenary_Default11"							: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS.sqf";
        };
      };
    };

    /* 	night vision rifles-best choice order:
    	scoped-w-magnification:
    cly_addweapon_FN_FAL_ANPVS4
    cly_addweapon_FN_FAL_ANPVS4_RPG7V
    cly_addweapon_SCAR_L_STD_Mk4CQT
    cly_addweapon_AKS_74_GOSHAWK
    cly_addweapon_AKS_74_NSPU_RPG7V
    	scoped-sniper:
    cly_addweapon_M110_NVG
    cly_addweapon_M110_TWS
    cly_addweapon_M107_TWS
	scoped-marksman:
    cly_addweapon_M14_EP1
    	scoped-no-magnification:
    cly_addweapon_SCAR_H_CQC_CCO
    	iron-sights:
    cly_addweapon_FN_FAL
    cly_addweapon_M16A2
    cly_addweapon_bizon
    */

    case east							: {
	    
	    switch (typeOf _unit) do {
		    
	    case "USMC_Soldier_SL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        };
	    case "USMC_Soldier_TL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        };
	    case "USMC_Soldier_Medic"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        };
	    case "USMC_Soldier_LAT"			: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        };
	    case "USMC_Soldier_AT"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        };
	    case "USMC_Soldier_HAT"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        };
	    case "USMC_Soldier_AA"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        };
	    case "USMC_SoldierS_Sniper"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        }; 
	    case "USMC_Soldier_GL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws.sqf";
        };
	    case "RU_Soldier"				: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4.sqf";
        };  
	    case "RUS_Commander"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_bizon_silenced.sqf";   
	    }; 
	    case "RUS_Soldier_TL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_bizon.sqf";   
	    };
	    case "RUS_Soldier1"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_bizon_RPG7V.sqf";   
	    };
	    case "RUS_Soldier2"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_bizon_silenced_RPG7V.sqf";   
	    };
	    case "RUS_Soldier3"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_bizon_METIS.sqf";   
	    };
	    case "RUS_Soldier_GL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_AKS_74_GOSHAWK_METIS.sqf";   
	    };
	    case "RUS_Soldier_Marksman"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_bizon_silenced_RPG7V.sqf";   
	    };
	    case "RUS_Soldier_Sab"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_bizon_silenced_RPG7V.sqf";   
	    };
	    case "ETaliban11"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };		    
	    case "Ins_Soldier_Sniper"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
      };
    };
    case resistance						: {
	    
	    switch (typeOf _unit) do {
		    
	    case "USMC_Soldier_SL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_TL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_Medic"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_LAT"			: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_AT"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_HAT"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_AA"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_SoldierS_Sniper"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        }; 
	    case "USMC_Soldier_GL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "USMC_Soldier_MG"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";   
	    };
	    case "USMC_SoldierS_Engineer"		: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        }; 
	    case "Soldier_Sniper_PMC"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };		    
	    case "Soldier_Sniper_PMC"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };  
      };
    };
    case civilian						: {
	    
	    switch (typeOf _unit) do {
		    
	    case "TK_CIV_Takistani01_EP1"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };		    
	    case "TK_CIV_Takistani02_EP1"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_TWS_SD.sqf";
        };
	    case "TK_CIV_Takistani03_EP1"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "TK_CIV_Takistani04_EP1"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4_RPG7V.sqf";
        };
	    case "TK_CIV_Takistani05_EP1"								: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "TK_CIV_Takistani06_EP1"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        }; 
	    case "TK_CIV_Worker01_EP1"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        }; 
	    case "TK_CIV_Worker02_EP1"								: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M4A3_RCO_GL_EP1_RPG7V.sqf";
        };
	    case "CIV_EuroMan01_EP1"									: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";   
	    };
	    case "CIV_EuroMan02_EP1"									: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_SVD_NSPU_EP1.sqf";
        };   
	    case "Citizen2_EP1"										: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4_RPG7V.sqf";
        };
	    case "Citizen3_EP1"										: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "Dr_Hladik_EP1"									: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS_Javelin.sqf";
        };
	    case "Functionary1_EP1"									: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws_stinger.sqf";
        };
	    case "Functionary2_EP1"									: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M107_TWS_smaw.sqf";
        }; 
	    case "Haris_Press_EP1"									: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        }; 
	    case "Pilot_EP1"										: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M4A3_RCO_GL_EP1_RPG7V.sqf";
        };
	    case "Profiteer1_EP1"									: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";   
	    };  
	    case "RU_Priest"										: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m249_tws_smaw.sqf";
        };
	    case "RU_Pilot"											: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SVD_NSPU_EP1.sqf";
        };
	    case "RU_Policeman"										: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M249_TWS_M136.sqf";
        };
	    case "RU_Doctor"										: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4_RPG7V.sqf";
        };
	    case "RU_Functionary1"									: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_FN_FAL_ANPVS4_RPG7V.sqf";
        };
      };
    };
  };  
} else {
	   
switch (side _unit) do {
	
    case west							: {
	    
	    switch (typeOf _unit) do {

	    case "USMC_Soldier_Officer"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr.sqf";
        };		    
	    case "USMC_Soldier_SL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr.sqf";
        };
	    case "USMC_Soldier_TL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "USMC_Soldier_Medic"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "USMC_Soldier_LAT"			: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "USMC_Soldier_AT"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "USMC_Soldier_HAT"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "USMC_Soldier_AA"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "USMC_SoldierS_Sniper"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M107.sqf";
        }; 
	    case "USMC_SoldierM_Marksman"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr.sqf";
        }; 
	    case "USMC_Soldier_GL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "USMC_Soldier_MG"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";   
	    };
	    case "USMC_SoldierS_Engineer"		: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "FR_Commander"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "FR_TL"					: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr.sqf";
        };
	    case "FR_Assault_R"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "FR_Assault_GL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "FR_GL"					: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "FR_Corpsman"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "FR_AR"					: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "FR_AC"					: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "FR_Light"					: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "FR_Sapper"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "FR_R"					: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "FR_Cooper"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "FR_Miles"					: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "FR_OHara"					: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "FR_Rodriguez"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "FR_Sykes"					: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr.sqf";
        };
	    case "US_Soldier_Officer_EP1"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };		    
	    case "US_Soldier_SL_EP1"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr.sqf";
        };
	    case "US_Soldier_TL_EP1"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "US_Soldier_Spotter_EP1"		: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "US_Soldier_Sniper_NV_EP1"	: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M110_TWS.sqf";
        };
	    case "US_Soldier_Sniper_EP1"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M107.sqf";
        };
	    case "US_Soldier_SniperH_EP1"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M107.sqf";
        };
	    case "US_Soldier_Pilot_EP1"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        }; 
	    case "US_Soldier_Medic_EP1"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        }; 
	    case "US_Soldier_Marksman_EP1"	: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr.sqf";
        };
	    case "US_Soldier_MG_EP1"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";   
	    };
	    case "US_Soldier_HAT_EP1"		: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "US_Soldier_LAT_EP1"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "US_Soldier_GL_EP1"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "US_Soldier_Engineer_EP1"	: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "US_Soldier_Crew_EP1"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "US_Soldier_Light_EP1"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "US_Soldier_EP1"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "US_Delta_Force_AR_EP1"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "US_Delta_Force_Air_Controller_EP1"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        }; 
	    case "US_Delta_Force_MG_EP1"						: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        }; 
	    case "US_Delta_Force_Assault_EP1"					: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "US_Delta_Force_EP1"						: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";   
	    };
	    case "US_Delta_Force_M14_EP1"						: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "US_Delta_Force_Marksman_EP1"					: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr.sqf";
        };
	    case "US_Delta_Force_Medic_EP1"					: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "US_Delta_Force_Night_EP1"					: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "US_Delta_Force_SD_EP1"						: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        };
	    case "US_Delta_Force_TL_EP1"						: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr.sqf";
        };
	    case "US_Delta_Force_Undercover_Takistani06_EP1"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect.sqf";
        }; 
	    case "WDL_Mercenary_Default9"						: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr.sqf";
        };		    
	    case "Mercenary_Default11"						: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr.sqf";
        };
      };
    };
    
    case east							: {
	    
	    switch (typeOf _unit) do {
		    
	    case "USMC_Soldier_SL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_TL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_Medic"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_LAT"			: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_AT"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_HAT"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_AA"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_SoldierS_Sniper"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        }; 
	    case "USMC_Soldier_GL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "RU_Soldier"				: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_AKS_74_GOSHAWK_METIS.sqf";
        };  
	    case "RUS_Commander"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_bizon_silenced_RPG7V.sqf";   
	    }; 
	    case "RUS_Soldier_TL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_bizon_JAVELIN.sqf";   
	    };
	    case "RUS_Soldier1"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_bizon_RPG7V.sqf";   
	    };
	    case "RUS_Soldier2"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_bizon_silenced_RPG7V.sqf";   
	    };
	    case "RUS_Soldier3"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_bizon_METIS.sqf";   
	    };
	    case "RUS_Soldier_GL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_AKS_74_GOSHAWK_METIS.sqf";   
	    };
	    case "RUS_Soldier_Marksman"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_bizon_silenced_RPG7V.sqf";   
	    };
	    case "RUS_Soldier_Sab"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_bizon_silenced_RPG7V.sqf";   
	    };   
	    case "ETaliban11"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };		    
	    case "Ins_Soldier_Sniper"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
      };
    };
    
    case resistance						: {

	    switch (typeOf _unit) do {
		    
	    case "USMC_Soldier_SL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_TL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_Medic"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_LAT"			: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_AT"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_HAT"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_AA"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_SoldierS_Sniper"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        }; 
	    case "USMC_Soldier_GL"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "USMC_Soldier_MG"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";  
	    };
	    case "USMC_SoldierS_Engineer"		: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        }; 
	    case "Soldier_Sniper_PMC"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };		    
	    case "Soldier_Sniper_PMC"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };  
      };
    };
   
    case civilian						: {
	    
	    switch (typeOf _unit) do {
		    
	    case "TK_CIV_Takistani01_EP1"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };		    
	    case "TK_CIV_Takistani02_EP1"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        };
	    case "TK_CIV_Takistani03_EP1"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "TK_CIV_Takistani04_EP1"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "TK_CIV_Takistani05_EP1"		: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "TK_CIV_Takistani06_EP1"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "TK_CIV_Worker01_EP1"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        }; 
	    case "TK_CIV_Worker02_EP1"		: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "CIV_EuroMan01_EP1"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";   
	    };
	    case "CIV_EuroMan02_EP1"			: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "Citizen2_EP1"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "Citizen3_EP1"				: {
	    		[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_M136.sqf";
        };
	    case "Dr_Hladik_EP1"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_Javelin.sqf";
        };
	    case "Functionary1_EP1"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_Stinger.sqf";
        };
	    case "Functionary2_EP1"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_M107_smaw.sqf";
        }; 
	    case "Haris_Press_EP1"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_dmr_smaw.sqf";
        }; 
	    case "Pilot_EP1"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "Profiteer1_EP1"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";   
	    };
	    case "RU_Priest"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "RU_Pilot"					: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };
	    case "RU_Policeman"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_m240_scoped.sqf";
        };
	    case "RU_Doctor"				: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        };   
	    case "RU_Functionary1"			: {
		    	[_unit] execvm "Cly_AddWeapon\cly_addweapon_SCAR_H_STD_EGLM_Spect_smaw.sqf";
        } 
      };
    };
  };
};

