// Appearance
static const char *fonts[]         = { "JetBrains Mono NL:size=10" };
static const int showbar           = 1;
static const int topbar            = 1;
static const unsigned int borderpx = 2;
static const unsigned int gappx    = 5 + borderpx * 2;
static const unsigned int snap     = 32;
static const char bg[]             = "#282a36";
static const char fg[]             = "#f8f8f2";
static const char focused[]        = "#6272a4";
static const char unfocused[]      = "#44475a";
static const char *colors[][3]     = {
	//                fg  bg       border
	[SchemeNorm]  = { fg, bg,      unfocused },
	[SchemeSel]   = { fg, bg,      focused },
	[SchemeTitle] = { bg, focused, focused },
};

// Tags
static const char *tags[] = { "main", "term", "web", "chat", "hide" };

// Rules
static const Rule rules[] = { { NULL, NULL, NULL, 0, 0, -1 } };

// Layout(s)
static const float mfact        = 0.55;
static const int lockfullscreen = 0;
static const int nmaster        = 1;
static const int resizehints    = 0;
static const Layout layouts[] = { { "[]=", tile } };

// Keybinds
// If on chromebook: #define MODKEY Mod1Mask
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
#include "movestack.c"
static const Key keys[] = {
	//modifier          key            function          argument
	{ MODKEY|ShiftMask, XK_Return,     spawn,            SHCMD("st") },
	{ MODKEY,           XK_grave,      spawn,            SHCMD("croutoncycle cros") },
	{ MODKEY,           XK_apostrophe, spawn,            SHCMD("i3lock-conf") },
	{ MODKEY|ShiftMask, XK_apostrophe, spawn,            SHCMD("i3lock-conf & systemctl suspend") },
	{ MODKEY,           XK_equal,      spawn,            SHCMD("pulsemixer --change-volume +5") },
	{ MODKEY,           XK_minus,      spawn,            SHCMD("pulsemixer --change-volume -5") },
	{ MODKEY,           XK_BackSpace,  spawn,            SHCMD("pulsemixer --toggle-mute") },
	{ MODKEY|ShiftMask, XK_equal,      spawn,            SHCMD("volume up") },
	{ MODKEY|ShiftMask, XK_minus,      spawn,            SHCMD("volume down") },
	{ MODKEY|ShiftMask, XK_BackSpace,  spawn,            SHCMD("volume mute") },
	{ MODKEY,           XK_i,          spawn,            SHCMD("iwctl station wlan0 connect Atheer") },
	{ MODKEY|ShiftMask, XK_i,          spawn,            SHCMD("iwctl station wlan0 disconnect") },
	{ MODKEY,           XK_s,          spawn,            SHCMD("flameshot gui") },
	{ MODKEY|ShiftMask, XK_s,          spawn,            SHCMD("flameshot full") },
	{ MODKEY,           XK_p,          spawn,            SHCMD("rofi -1 -show drun") },
	{ MODKEY,           XK_v,          spawn,            SHCMD("setxkbmap -layout us -variant colemak") },
	{ MODKEY|ShiftMask, XK_v,          spawn,            SHCMD("setxkbmap -layout us") },
	{ MODKEY,           XK_b,          togglebar,        { 0 } },
	{ MODKEY,           XK_j,          focusstack,       { .i = +1 } },
	{ MODKEY,           XK_k,          focusstack,       { .i = -1 } },
	{ MODKEY|ShiftMask, XK_j,          movestack,        { .i = +1 } },
	{ MODKEY|ShiftMask, XK_k,          movestack,        { .i = -1 } },
	{ MODKEY,           XK_h,          setmfact,         { .f = -0.05 } },
	{ MODKEY,           XK_l,          setmfact,         { .f = +0.05 } },
	{ MODKEY,           XK_Return,     zoom,             { 0 } },
	{ MODKEY|ShiftMask, XK_c,          killclient,       { 0 } },
	{ MODKEY,           XK_f,          togglefloating,   { 0 } },
	{ MODKEY,           XK_space,      togglefullscreen, { 0 } },
	{ MODKEY,           XK_0,          view,             { .ui = ~0 } },
	{ MODKEY|ShiftMask, XK_0,          tag,              { .ui = ~0 } },
	{ MODKEY,           XK_comma,      focusnthmon,      { .i = 0 } },
	{ MODKEY,           XK_period,     focusnthmon,      { .i = 1 } },
	{ MODKEY|ShiftMask, XK_comma,      tagnthmon,        { .i = 0 } },
	{ MODKEY|ShiftMask, XK_period,     tagnthmon,        { .i = 1 } },
	TAGKEYS(            XK_1,                            0)
	TAGKEYS(            XK_2,                            1)
	TAGKEYS(            XK_3,                            2)
	TAGKEYS(            XK_4,                            3)
	TAGKEYS(            XK_5,                            4)
	{ MODKEY|ShiftMask, XK_q,          quit,             { 0 } },
};

// Mouse bindings
static const Button buttons[] = {
	//click          event mask button   function        argument
	{ ClkClientWin,  MODKEY,    Button1, movemouse,      { 0 } },
	{ ClkClientWin,  MODKEY,    Button2, togglefloating, { 0 } },
	{ ClkClientWin,  MODKEY,    Button3, resizemouse,    { 0 } },
	{ ClkLtSymbol,   0,         Button1, setlayout,      { 0 } },
	{ ClkStatusText, 0,         Button2, spawn,          SHCMD("st") },
	{ ClkTagBar,     0,         Button1, view,           { 0 } },
	{ ClkTagBar,     0,         Button3, toggleview,     { 0 } },
	{ ClkTagBar,     MODKEY,    Button1, tag,            { 0 } },
	{ ClkTagBar,     MODKEY,    Button3, toggletag,      { 0 } },
	{ ClkWinTitle,   0,         Button2, zoom,           { 0 } },
};
