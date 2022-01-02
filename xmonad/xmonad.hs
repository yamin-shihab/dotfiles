-------------
-- IMPORTS --
-------------

import XMonad
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.ShowWName

---------------
-- VARIABLES --
---------------

-- Basic stuff
myFont = "JetBrainsMono Nerd Font"
myTerminal = "wezterm"
myModMask =	mod4Mask
myBorderWidth =	3
myBackgroundColor = "#282a36"
myForegroundColor = "#f8f8f2"
myNormalBorderColor = "#44475A"
myFocusedBorderColor = "#6272A4"
myWorkspaces = ["main", "web", "chat", "edit"]

-- Keybinds
myAdditionalKeysP =
	[ ("M-p", spawn "rofi -show drun")
	, ("M-<Print>", spawn "flameshot gui")
	, ("M-x", spawnAllStatusBars)
	, ("M-z", sendMessage ToggleStruts)
	]

-- Looks
myShowWNameTheme =
	def
		{ swn_font = myFont
		, swn_bgcolor = myBackgroundColor
		, swn_color = myForegroundColor
		, swn_fade = 1
		}

myLayoutHook =
	showWName' myShowWNameTheme . avoidStruts $ tiled ||| noBorders Full
		where
			tiled = spacingWithEdge 10 $ Tall nmaster delta ratio
			nmaster = 1
			ratio = 1/2
			delta = 3/100

-- Startup garbaj
myStartupHook =
	do
		spawnOnce "feh"
		spawnOnce "variety"
		spawnOnce "picom"
		spawnOnce "flameshot"
		spawnOnce "dunst"
		spawnOnce "redshift -P -O 5500"
		spawnOnce "xsetroot -cursor_name left_ptr"
		spawnOnce "xrandr --output DVI-D-0 --left-of HDMI-0"
		spawnAllStatusBars

-- Xmobar stuff
spawnAllStatusBars =
	do
		killAllStatusBars
		spawnStatusBar("xmobar -x 0")
		spawnStatusBar("xmobar -x 1")

myXmobarColor fgColor = xmobarColor fgColor "#282a36"

myXmobarPP =
	def
		{ ppCurrent = myXmobarColor "#f1fa8c"
		, ppVisible = myXmobarColor "#44475a"
		, ppHidden = myXmobarColor "#44475a"
		, ppUrgent = myXmobarColor "#ff5555"
		, ppLayout = myXmobarColor "#bd93f9"
		, ppTitle = myXmobarColor "#50fa7b"
		, ppSep = " | "
		}
myXmobar = statusBarProp "xmobar" (pure myXmobarPP)

-- Just look at the name
myMainConfig =
	xmonad . withSB myXmobar . docks $ def
		{ terminal = myTerminal
		, modMask = myModMask
		, borderWidth = myBorderWidth
		, normalBorderColor = myNormalBorderColor
		, focusedBorderColor = myFocusedBorderColor
		, startupHook = myStartupHook
		, layoutHook = myLayoutHook
		, workspaces = myWorkspaces
		} `additionalKeysP` myAdditionalKeysP

---------------------
-- APPLYING CONFIG --
---------------------

-- Da config
main = myMainConfig

-- And I hope that's pretty much it or something
