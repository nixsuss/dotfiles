/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>
/* appearance */
static const char *upvol[] = { "volume", "up", NULL };
static const char *downvol[] = { "volume", "down", NULL };
static const char *mute[] = { "volume", "mute", NULL };
// change the scrot's path to save screenshots to your specific path /home/$USER/what/ever/%Y-%m-%d-%T-screenshot.png
static const char *screenshot[] = { "scrot","/home/ahmed/Pictures/screenshots/%Y-%m-%d-%T-screenshot.png", NULL };
static const char *slock[] = { "slock", NULL };
static const char *mpctoggle[] = { "mpc","toggle", NULL };
static const char *mpcnext[] = { "mpc","next", NULL };
static const char *mpcprev[] = { "mpc","prev", NULL };
static const char *mpcstop[] = { "mpc","stop", NULL };
static const char *nextplay[] = { "playerctl","next", NULL };
static const char *prevplay[] = { "playerctl","previous", NULL };
static const char *toggleplay[] = { "playerctl","play-pause", NULL };
static const char *stopplay[] = { "playerctl","stop", NULL };
static const char *ncmpcpp[] = { "kitty","ncmpcpp", NULL };
static const char *fm[] = { "kitty","lf", NULL };
static const char *wallpaper[] = { "wallpapermenu", NULL };
static const char *rofi[] = { "rofi","-show", NULL };
static const char *powermenu[] = { "powermenu", NULL };
static const char *filemanager[] = { "pcmanfm", NULL };
static const char *clipmenu[] = { "clipmenu","-i","-fn","DejaVu Sans:size=14:style=Condensed Bold:antialias=true:hinting=true","-nb","#000000","-nf","#ffffff","-sb","#808080","-sf","#000000", NULL };
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int focusonwheel       = 0;
static const char *fonts[]          = { "JetBrainsMonoNL Nerd Font:size=12:style=Bold:antialias=true:hinting=true", "Overpass Nerd Font:size=12:antialias=true","Noto Color Emoji:size=12:antialias=true" };
static const char dmenufont[]       = "DejaVu Sans:size=14:style=Condensed Bold:antialias=true:hinting=true";
static char normbgcolor[]           = "#222222";
static char normbordercolor[]       = "#444444";
static char normfgcolor[]           = "#bbbbbb";
static char selfgcolor[]            = "#eeeeee";
static char selbordercolor[]        = "#005577";
static char selbgcolor[]            = "#005577";
static char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Firefox", NULL,     NULL,           1 << 8,    0,          -1 },
	{ "firefox", NULL,     NULL,           1 << 8,    0,          -1 },
	{ "librewolf", NULL,     NULL,           1 << 8,    0,        -1 },
	{ "URxvt",   NULL,     NULL,           0,         0,          -1 },
	{ "mpv",     NULL,     NULL,           0,         1,          -1 },
	{ "stalonetray",     NULL,     NULL,           0,         1,  -1 },
	{ "vlc",     NULL,     NULL,           0,         1,          -1 },
//	{ "VirtualBox",    NULL,     NULL,           0,         1,    -1 },
	{ "Gedit",     NULL,     NULL,           0,         1,        -1 },
	{ "Xed",     NULL,     NULL,           0,         1,         -1 },
	{ "Pluma",     NULL,     NULL,           0,         1,        -1 },
	{ "kwrite",     NULL,     NULL,           0,         1,       -1 },
	{ "org.gnome.FileRoller",     NULL,     NULL,           0,         1,       -1 },
//	{ "Xreader",     NULL,     NULL,           0,         1,      -1 },
	{ "Evince",     NULL,     NULL,           0,         1,       -1 },
	{ "Image Lounge",     NULL,     NULL,           0,         1, -1 },
	{ "Gthumb",     NULL,     NULL,           0,         1,       -1 },
	{ "pavucontrol",     NULL,     NULL,           0,         1,  -1 },
	{ "Galculator",     NULL,     NULL,           0,         1,    -1 },
	{ "Leafpad",     NULL,     NULL,           0,         1,    -1 },
//	{ "Nemo",     NULL,     NULL,           0,         1,          -1 },
//	{ "Pcmanfm",     NULL,     NULL,           0,         1,       -1 },
	{ "qBittorrent",     NULL,     NULL,           0,         1,   -1 },
	{ "obs",     NULL,     NULL,           0,         1,          -1 },
	{ "Audacious",     NULL,     NULL,           0,         1,     -1 },
	{ "Nsxiv",     NULL,     NULL,           0,         1,     -1 },
	{ "Zathura",     NULL,     NULL,           0,         1,     -1 },
	{ NULL,      NULL,     "Event Tester", 0,         0,           -1 }, /* xev */
	{ "Firefox", "Toolkit", "Picture-in-Picture", 0,          1,   -1 },
	{ "firefox", "Toolkit", "Picture-in-Picture", 0,          1,   -1 },
	{ "librewolf", "Toolkit", "Picture-in-Picture", 0,        1,   -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	{ "[@]",      spiral },
	{ "[\\]",     dwindle },
	{ "H[]",      deck },
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
	{ "HHH",      grid },
	{ "###",      nrowgrid },
	{ "---",      horizgrid },
	{ ":::",      gaplessgrid },
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbordercolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "kitty", NULL };

#include "movestack.c"
static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_F11,    spawn,          {.v = downvol } },
	{ MODKEY,                       XK_F9,     spawn, 	   {.v = mute } },
	{ MODKEY,                       XK_F12,    spawn, 	   {.v = upvol   } },
        { 0,              XF86XK_AudioRaiseVolume, spawn,          {.v = upvol } },
        { 0,              XF86XK_AudioLowerVolume, spawn,          {.v = downvol } },
        { 0,              XF86XK_AudioMute,          spawn,          {.v = mute } },	
        { 0,              XF86XK_AudioPlay,        spawn,          {.v = toggleplay } },	
        { 0,              XF86XK_AudioNext,        spawn,          {.v = nextplay } },	
        { 0,              XF86XK_AudioPrev,        spawn,          {.v = prevplay } },	
        { 0,              XF86XK_AudioStop,        spawn,          {.v = stopplay } },	
	{ MODKEY,                       XK_Print,  spawn, 	   {.v = screenshot } },
	{ MODKEY,                       XK_m,      spawn, 	   {.v = ncmpcpp } },
	{ MODKEY,                       XK_r,      spawn, 	   {.v = fm } },
	{ MODKEY,                       XK_w,      spawn, 	  {.v = wallpaper } },
	{ MODKEY,                       XK_f,      spawn, 	   {.v = rofi } },
	{ MODKEY,                       XK_q,      spawn, 	   {.v = powermenu } },
	{ MODKEY,                       XK_e,      spawn, 	   {.v = filemanager } },
	{ MODKEY,	                XK_l, 	   spawn, 	   {.v = slock } },
	{ MODKEY,                       XK_x,      spawn,          {.v = mpctoggle } },
	{ MODKEY|ShiftMask,             XK_n,      spawn,          {.v = mpcprev } },
	{ MODKEY,                       XK_n,      spawn,          {.v = mpcnext } },
//	{ MODKEY,                       XK_s,      spawn,          {.v = mpcstop } },
	{ MODKEY,                       XK_v,      spawn,          {.v = clipmenu } },
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_Down,   focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_Up,     focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_Left,   setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask,             XK_Right,  setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_k,      movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_j,      movestack,      {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_Up,     setcfact,       {.f = +0.25} },
	{ MODKEY|ShiftMask,             XK_Down,   setcfact,       {.f = -0.25} },
	{ MODKEY|ShiftMask,          	XK_o,      setcfact,       {.f =  0.00} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY|Mod1Mask,              XK_u,      incrgaps,       {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_u,      incrgaps,       {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_i,      incrigaps,      {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_i,      incrigaps,      {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_o,      incrogaps,      {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_o,      incrogaps,      {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_6,      incrihgaps,     {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_6,      incrihgaps,     {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_7,      incrivgaps,     {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_7,      incrivgaps,     {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_8,      incrohgaps,     {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_8,      incrohgaps,     {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_9,      incrovgaps,     {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_9,      incrovgaps,     {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_0,      togglegaps,     {0} },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_0,      defaultgaps,    {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
//	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
//	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
//	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ControlMask,		XK_comma,  cyclelayout,    {.i = -1 } },
	{ MODKEY|ControlMask,           XK_period, cyclelayout,    {.i = +1 } },
//	{ MODKEY,                       XK_space,  setlayout,      {0} },
//	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_Down,   moveresize,     {.v = "0x 25y 0w 0h" } },
	{ MODKEY,                       XK_Up,     moveresize,     {.v = "0x -25y 0w 0h" } },
	{ MODKEY,                       XK_Right,  moveresize,     {.v = "25x 0y 0w 0h" } },
	{ MODKEY,                       XK_Left,   moveresize,     {.v = "-25x 0y 0w 0h" } },
	{ MODKEY|ShiftMask,             XK_Down,   moveresize,     {.v = "0x 0y 0w 25h" } },
	{ MODKEY|ShiftMask,             XK_Up,     moveresize,     {.v = "0x 0y 0w -25h" } },
	{ MODKEY|ShiftMask,             XK_Right,  moveresize,     {.v = "0x 0y 25w 0h" } },
	{ MODKEY|ShiftMask,             XK_Left,   moveresize,     {.v = "0x 0y -25w 0h" } },
	{ MODKEY|ControlMask,           XK_Up,     moveresizeedge, {.v = "t"} },
	{ MODKEY|ControlMask,           XK_Down,   moveresizeedge, {.v = "b"} },
	{ MODKEY|ControlMask,           XK_Left,   moveresizeedge, {.v = "l"} },
	{ MODKEY|ControlMask,           XK_Right,  moveresizeedge, {.v = "r"} },
	{ MODKEY|ControlMask|ShiftMask, XK_Up,     moveresizeedge, {.v = "T"} },
	{ MODKEY|ControlMask|ShiftMask, XK_Down,   moveresizeedge, {.v = "B"} },
	{ MODKEY|ControlMask|ShiftMask, XK_Left,   moveresizeedge, {.v = "L"} },
	{ MODKEY|ControlMask|ShiftMask, XK_Right,  moveresizeedge, {.v = "R"} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_F5,     xrdb,           {.v = NULL } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

