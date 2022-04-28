-------------
-- IMPORTS --
-------------
import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Layout.NoBorders
import XMonad.Layout.ShowWName
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import qualified XMonad.StackSet as W

---------------
-- VARIABLES --
---------------
-- Basic stuff
myTerminal = "st"

myModMask = mod4Mask

myBorderWidth = 4

myBackgroundColor = "#282a36"

myForegroundColor = "#f8f8f2"

myNormalBorderColor = "#44475A"

myFocusedBorderColor = "#6272A4"

myWorkspaces = ["main", "term", "web", "chat", "edit", "temp"]

pulseAudioSink = 0

myAdditionalKeysP =
  [ ("M-p", spawn "rofi -show drun")
  , ("M-o", spawn "systemctl suspend && slock")
  , ("M-'", spawn "slock")
  , ("M-<Print>", spawn "flameshot gui")
  , ("M-x", spawnAllStatusBars)
  , ("M-z", sendMessage ToggleStruts)
  , ( "M-<XF86AudioRaiseVolume>"
    , spawn $ "pactl set-sink-volume " ++ show pulseAudioSink ++ " +5%")
  , ( "M-<XF86AudioLowerVolume>"
    , spawn $ "pactl set-sink-volume " ++ show pulseAudioSink ++ " -5%")
  , ( "M-<XF86AudioMute>"
    , spawn $ "pactl set-sink-volume " ++ show pulseAudioSink ++ " 0%")
  -- Colemak stuff
  , ("M-c", spawn "setxkbmap -layout us -variant colemak")
  , ("M-v", spawn "setxkbmap -layout us")
  , ("M-`", spawn "feh $HOME/my_other_stuff/colemak.png")
  , ("M-S-k", windows W.swapDown)
  , ("M-S-h", windows W.swapUp)
  , ("M-k", windows W.focusDown)
  , ("M-h", windows W.focusUp)
  , ("M-j", sendMessage Shrink)
  , ("M-l", sendMessage Expand)
  ]

-- Looks
myLayoutHook = avoidStruts $ tiled ||| noBorders Full
  where
    tiled = spacingWithEdge 25 $ Tall nmaster delta ratio
    nmaster = 1
    ratio = 1 / 2
    delta = 3 / 100

-- Startup garbaj
myStartupHook = spawnAllStatusBars

-- Xmobar stuff
spawnAllStatusBars = do
  killAllStatusBars
  spawnStatusBar "xmobar -x 0"
  spawnStatusBar "xmobar -x 1"

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
  xmonad . ewmh . withSB myXmobar . docks $
  def
    { terminal = myTerminal
    , modMask = myModMask
    , borderWidth = myBorderWidth
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , startupHook = myStartupHook
    , layoutHook = myLayoutHook
    , workspaces = myWorkspaces
    } `additionalKeysP`
  myAdditionalKeysP

---------------------
-- APPLYING CONFIG --
---------------------
-- Da config
main = myMainConfig
-- And I hope that's pretty much it or something