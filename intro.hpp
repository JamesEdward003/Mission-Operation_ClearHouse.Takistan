// Control types
#define CT_STATIC	0

// Static styles
#define ST_LEFT	0
#define ST_RIGHT	1
#define ST_CENTER	2
#define ST_UP		3
#define ST_DOWN	4
#define ST_VCENTER	5

#define ST_SINGLE	0
#define ST_MULTI	16
#define ST_PICTURE	48
#define ST_FRAME	64

#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE 144
#define ST_WITH_RECT 160
#define ST_LINE	176

#define ST_SHADOW	256
#define ST_NO_RECT	512

#define FontM "TahomaB"
#define ST_LEFT      0
#define ST_RIGHT     1
#define ST_CENTER    2
#define CT_STATIC    0

class RscText{        
	type = CT_STATIC;        
	idc = 889;
	style = ST_LEFT;        
	colorBackground[] = {0, 0, 0, 0};        
	colorText[] = {1, 1, 1, 1};        
	font = FontM;        
	sizeEx = 0.04;
};

class RscPicture {
	type = CT_STATIC;
	idc = -1;
	style = ST_PICTURE;
	x = 0.1;
	y = 0.1;
	w = 0.4;
	h = 0.2;
	sizeEx = 0.04;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = FontM;
	text = "";
};

class RscTitleScreen
{  
	idd = 1;
	movingEnable = true;
	controlsBackground[] = { };
	objects[] = { };
	controls[] = { TitleImg };  
	class TitleImg : RscText  
	{    
		idc = 181;    
		style = ST_CENTER;    
		x = 0.4;    
		y = 0.45;    
		w = 0.5;    
		h = 0.5;    
		text = "Hello World!";  
	};
};
class TitleLogo {
	idd=-2;
	movingEnable=0;
	duration=9;
	name="TitleLogo";
	fadein = 1;
	fadeout = 1;
	sizeEx = 256;
	class controls {
		class Picture : RscPicture {
			idc=50;
			x=0;y=0.15;w=1;h=0.3;
			text="images\logo_desertgambit_1k.paa";
			sizeEx = 48;
		};
	};
};