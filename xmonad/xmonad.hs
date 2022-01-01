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

---------------
-- VARIABLES --
---------------

-- Basic config
myTerminal = "wezterm"
myModMask = mod4Mask
myBorderWidth = 3
myNormalBorderColor = "#44475A"
myFocusedBorderColor = "#6272A4"

-- Keybinds
myAdditionalKeysP =
	[ ("M-p", spawn "rofi -show drun")
	, ("M-<Print>", spawn "flameshot gui")
	]

-- Looks
myLayoutHook =
	avoidStruts tiled ||| noBorders Full
		where
			tiled = spacingWithEdge 10 $ Tall nmaster delta ratio
			nmaster = 1
			ratio = 1/2
			delta = 3/100

-- Startup garbaj
myStartupHook :: X ()
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
		spawnOnce "xmobar -x 0"
		spawnOnce "xmobar -x 1"

-- Xmobar stuff
myXmobar = statusBarProp "xmobar" (pure xmobarPP)

-- Just look at the name
myMainConfig :: IO ()
myMainConfig =
	xmonad . withSB myXmobar . docks $ def
		{ terminal = myTerminal
		, modMask = myModMask
		, borderWidth = myBorderWidth
		, normalBorderColor = myNormalBorderColor
		, focusedBorderColor = myFocusedBorderColor
		, startupHook = myStartupHook
		, layoutHook = myLayoutHook
		} `additionalKeysP` myAdditionalKeysP

---------------------
-- APPLYING CONFIG --
---------------------

-- Da config
main :: IO ()
main = myMainConfig

-- And I hope that's pretty much it or something
