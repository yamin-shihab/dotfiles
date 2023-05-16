// Pyro: The Thermal Thruster

#base "HudItemEffectMeter.res"

"Resource/UI/HudRocketPack.res"
{
	HudItemEffectMeter
	{
		"fieldName"		"HudItemEffectMeter"
		"ypos"			"r21"
		"ypos_minmode"	"r121"
	}
	
	"ItemEffectIcon"
	{
		"ControlName"	"CTFImagePanel"
		"fieldName"		"ItemEffectIcon"
		"xpos"			"0"
		"ypos"			"0"
		"ypos_minmode"	"15"
		"zpos"			"2"
		"wide"			"32"
		"tall"			"32"
		"visible"		"0"
		"enabled"		"0"
		"image"			"../hud/pyro_jetpack_off2"
		"scaleImage"	"1"
	}

	"ItemEffectMeterLabel"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"ItemEffectMeterLabel"
		"xpos"			"32"
		"xpos_minmode"	"32"
		"ypos"			"12"
		"ypos_minmode"	"27"
		"zpos"			"2"
		"wide"			"90"
		"tall"			"15"
		"autoResize"	"1"
		"pinCorner"		"2"
		"visible"		"0"
		"enabled"		"0"
		"tabPosition"	"0"
		"labelText"		"#TF_RocketPack_Disabled"
		"textAlignment"	"west"
		"dulltext"		"0"
		"brighttext"	"0"
		"font"			"G_FontSmall_2"
		"fgcolor"		"178 0 0 255"
	}
	
	"ItemEffectMeter"
	{	
		"fieldName"				"ItemEffectMeter"
		"wide"					"90"
	}
	
	"ItemEffectMeter2"
	{	
		"ControlName"			"ContinuousProgressBar"
		"fieldName"				"ItemEffectMeter2"
		"font"					"Default"
		"xpos"					"90"
		"ypos"					"0"
		"zpos"					"2"
		"wide"					"90"
		"tall"					"6"		
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"textAlignment"			"Left"
		"dulltext"				"0"
		"brighttext"			"0"
		"bgcolor_override"		"G_ItemMeterBg"
	}
	
	"Mask25"
	{	
		"ControlName"			"EditablePanel"
		"visible"				"0"
	}
	
	"Mask50"
	{	
		"ControlName"			"EditablePanel"
		"bgcolor_override"		"80 80 80 230"
	}
	
	"Mask50"
	{
		"ControlName"			"CTFImagePanel"
		"fieldName"				"Mask50"
		"image"					"../hud/color_panel_brown"
		"scaleImage"			"1"
		"teambg_1"				"../hud/color_panel_brown"
		"teambg_2"				"../hud/color_panel_red"
		"teambg_3"				"../hud/color_panel_blu"
		"src_corner_height"		"23"
		"src_corner_width"		"23"
		"draw_corner_width"		"0"
		"draw_corner_height" 	"0"
		"Alpha"					"200"
	}
	
	"Mask75"
	{	
		"ControlName"			"EditablePanel"
		"visible"				"0"
	}
	
	"Mask100"
	{
		"ControlName"			"CTFImagePanel"
		"fieldName"				"Mask100"
		"image"					"../hud/color_panel_brown"
		"scaleImage"			"1"
		"teambg_1"				"../hud/color_panel_brown"
		"teambg_2"				"../hud/color_panel_red"
		"teambg_3"				"../hud/color_panel_blu"
		"src_corner_height"		"23"
		"src_corner_width"		"23"
		"draw_corner_width"		"0"
		"draw_corner_height" 	"0"
	}
	
	"Border25"
	{	
		"ControlName"			"EditablePanel"
		"fieldName"				"Border25"
		"visible"				"0"
	}
	
	"Border75"
	{	
		"ControlName"			"EditablePanel"
		"fieldName"				"Mask75"
		"visible"				"0"
	}
}
