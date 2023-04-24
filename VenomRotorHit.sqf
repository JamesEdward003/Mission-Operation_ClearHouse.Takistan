// VenomRotorHit.sqf //
axident={
	waitUntil {(venom1 distance LZ_Xray) < 400}; 
	venom1 setHit ["mala vrtule", 1];
	_flr = "flare" camCreate (position venom1);
	_null=["<t color='#2cb88e' size='1'>Razor's helicopter has been damaged!</t>",-1,-1,10,1,-1,789] spawn BIS_fnc_dynamicText;
};
_null=[]spawn axident;

hintSilent parseText format ["<br/><t color='#00FF00' size='1.0'>Intel...Razor in for rough landing somewhere in Chardarakht!</t>"];

