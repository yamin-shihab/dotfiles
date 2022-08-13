#include <X11/XF86keysym.h>

/* Appearance */
static const unsigned int borderpx = 2;
static const unsigned int gappx = 9;
static const unsigned int snap = 32;
static const int showbar = 1;
static const int topbar = 1;
static const char *fonts[] = { "JetBrains Mono NL:size=10" };
static const char fg[] = "#f8f8f2";
static const char bg[] = "#282a36";
static const char unfocused[] = "#44475a";
static const char focused[] = "#bd93f9";
static const char urg[] = "#ff5555";
static const char *colors[][3] = {
	/*                fg       bg       border */
	[SchemeNorm]  = { fg,      bg,      unfocused },
	[SchemeSel]   = { fg,      bg,      focused },
	[SchemeUrg]   = { fg,      bg,      urg },
	[SchemeTitle] = { bg,      focused, focused },
	[SchemeUline] = { focused, bg,      focused },
};

/* Settings */
static const char *tags[] = { "main", "term", "web", "chat", "hide" };
static const unsigned int ulinepad = 5;
static const unsigned int ulinestroke = 2;
static const unsigned int ulinevoffset = 0;
static const int ulineall = 0;
static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "zoom",     NULL,       NULL,       0,            1,           -1 },
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};
static const float mfact     = 0.55;
static const int nmaster     = 1;
static const int resizehints = 0;
static const int lockfullscreen = 0;
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },
	{ "><>",      NULL },
	{ "[M]",      monocle },
};

/* Keybinds */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XF86XK_AudioRaiseVolume, spawn, SHCMD("pulsemixer --change-volume 5")},
	{ MODKEY,                       XF86XK_AudioLowerVolume, spawn, SHCMD("pulsemixer --change-volume -5")},
	{ MODKEY,                       XF86XK_AudioMute, spawn,   SHCMD("pulsemixer --toggle-mute")},
	{ MODKEY,                       XK_apostrophe,spawn,       SHCMD("slock") },
	{ MODKEY|ShiftMask,             XK_apostrophe,spawn,       SHCMD("slock systemctl suspend") },
	{ MODKEY,                       XK_semicolon,spawn,        SHCMD("rofi -show drun") },
	{ MODKEY,                       XK_p,      spawn,          SHCMD("flameshot gui")},
	{ MODKEY,                       XK_c,      spawn,          SHCMD("setxkbmap -layout us -variant colemak")},
	{ MODKEY,                       XK_x,      spawn,          SHCMD("setxkbmap -layout us")},
	{ MODKEY,                       XK_comma,  focusnthmon,    {.i = 0 } },
	{ MODKEY,                       XK_period, focusnthmon,    {.i = 1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagnthmon,      {.i = 0 } },
	{ MODKEY|ShiftMask,             XK_period, tagnthmon,      {.i = 1 } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          SHCMD("st") },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY|ShiftMask,             XK_f,      togglefullscreen, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	/* { MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } }, */
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          SHCMD("st") },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
