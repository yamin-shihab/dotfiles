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
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce

---------------
-- VARIABLES --
---------------
-- Basic stuff
mySpacing = 15

myTerminal = "st"

myModMask = mod4Mask

myBorderWidth = 4

myBackgroundColor = "#282a36"

myForegroundColor = "#f8f8f2"

myNormalBorderColor = "#44475A"

myFocusedBorderColor = "#6272A4"

myWorkspaces = ["main", "term", "web", "chat", "edit", "temp"]

myAdditionalKeysP =
    [ ("M-o", spawn "slock systemctl suspend")
    , ("M-'", spawn "slock")
    , ("M-<Print>", spawn "flameshot gui")
    , ("M-a", spawn "himawaripy --auto-offset")
    , ("M-x", spawnAllStatusBars)
    , ("M-z", sendMessage ToggleStruts)
    , ("M-<XF86AudioRaiseVolume>", spawn "pulsemixer --change-volume 5")
    , ("M-<XF86AudioLowerVolume>", spawn "pulsemixer --change-volume -5")
    , ("M-<XF86AudioMute>", spawn "pulsemixer --toggle-mute")
  -- Colemak stuff
    , ("M-;", spawn "rofi -show drun")
    , ("M-c", spawn "setxkbmap -layout us -variant colemak")
    , ("M-v", spawn "setxkbmap -layout us")
    , ("M-`", spawn "feh $HOME/my_other_stuff/colemak.png")
    , ("M-j", sendMessage Shrink)
    , ("M-l", sendMessage Expand)
    , ("M-S-k", windows W.swapDown)
    , ("M-S-h", windows W.swapUp)
    , ("M-k", windows W.focusDown)
    , ("M-h", windows W.focusUp)
    ] ++
        -- Magic copy+paste weird Haskell code warning!
    [ ( mask ++ "M-" ++ [key]
      , screenWorkspace scr >>= flip whenJust (windows . action))
    | (key, scr) <- zip "wfp" [0, 1, 2]
    , (action, mask) <- [(W.view, ""), (W.shift, "S-")]
    ]
        -- Maybe choosing XMonad was a mistake...

-- Looks
myLayoutHook = avoidStruts $ tiled ||| noBorders Full
  where
    tiled = spacingWithEdge mySpacing $ Tall nmaster delta ratio
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
