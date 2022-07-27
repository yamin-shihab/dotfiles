import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar
import XMonad.Layout.NoBorders
import XMonad.Layout.ShowWName
import XMonad.Layout.Spacing
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce

-- Basic stuff
mySpacing = 5
myTerminal = "st"
myModMask = mod4Mask
myBorderWidth = 3
myBackgroundColor = "#282a36"
myForegroundColor = "#f8f8f2"
myNormalBorderColor = "#44475A"
myFocusedBorderColor = "#6272A4"
myWorkspaces = ["main", "term", "web", "chat"]

-- Keybinds
myAdditionalKeysP =
	[ ("M-S-'", spawn "slock systemctl suspend")
	, ("M-'", spawn "slock")
	, ("M-x", spawn "flameshot gui")
	, ("M-z", sendMessage ToggleStruts)
	, ("M-<XF86AudioRaiseVolume>", spawn "pulsemixer --change-volume 5")
	, ("M-<XF86AudioLowerVolume>", spawn "pulsemixer --change-volume -5")
	, ("M-<XF86AudioMute>", spawn "pulsemixer --toggle-mute")
	, ("M-;", spawn "rofi -monitor -4 -show drun")
	, ("M-c", spawn "setxkbmap -layout us -variant colemak")
	, ("M-v", spawn "setxkbmap -layout us")
	] ++
	-- Magic copy+paste weird Haskell code warning!
	[ ( mask ++ "M-" ++ [key]
	, screenWorkspace scr >>= flip whenJust (windows . action))
	| (key, scr) <- zip "wfp" [0, 1, 2]
	, (action, mask) <- [(W.view, ""), (W.shift, "S-")]
	]
	-- Maybe choosing XMonad was a mistake...

-- Looks
myLayoutHook = avoidStruts $ tiled ||| noBorders Full where
	tiled = spacingWithEdge mySpacing $ Tall nmaster delta ratio
	nmaster = 1
	ratio = 1 / 2
	delta = 3 / 100

-- Startup garbaj
myStartupHook = do
	spawnAllStatusBars
	spawnOnce "livewallpaper"
	spawnOnce "picom --experimental-backends"
	spawnOnce "dunst"
	spawnOnce "xsetroot -cursor_name left_ptr"
	spawnOnce "redshift -l 53.55014:-113.46871 -t 7000:5000"
	spawnOnce "setxkbmap -layout us -variant colemak"
	spawnOnce "xset r rate 300 40"
	spawnOnce "xset r 66"
	spawnOnce "xautolock -time 5 -locker slock"
	spawnOnce "xbanish"

-- Status bar stuff
spawnAllStatusBars = do
	killAllStatusBars
	spawnStatusBar "$HOME/.config/polybar/launch.sh"

-- Just look at the name
myMainConfig = xmonad . ewmh . docks $ def
	{ terminal = myTerminal
	, modMask = myModMask
	, borderWidth = myBorderWidth
	, normalBorderColor = myNormalBorderColor
	, focusedBorderColor = myFocusedBorderColor
	, startupHook = myStartupHook
	, layoutHook = myLayoutHook
	, workspaces = myWorkspaces
	} `additionalKeysP` myAdditionalKeysP

-- Da config
main = myMainConfig
