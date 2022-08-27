import XMonad
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import qualified XMonad.Layout.Dwindle as Dwindle
import qualified XMonad.StackSet as W
import System.Exit
import qualified Data.Map as M

-- Settings
myBorderWidth = 2
myClickJustFocuses = False
myDefaultModMask = mod4Mask
myFocusFollowsMouse = True
myFocusedBorderColor = "#6272a4"
myModMask = mod4Mask
myNormalBorderColor  = "#44475a"
myTerminal = "st"
myWorkspaces = [ "main", "term", "web", "chat", "hide" ]

-- Startup hook
myStartupHook = do
	spawnOnce "$HOME/.config/polybar/launch.sh"
	spawnOnce "/usr/lib/geoclue-2.0/demos/agent"
	spawnOnce "dunst"
	spawnOnce "echo 15 | canvas -S 1920x1080 -B -n -a"
	spawnOnce "picom --experimental-backends"
	spawnOnce "redshift"
	spawnOnce "setxkbmap -layout us -variant colemak"
	spawnOnce "xautolock -time 5 -locker slock"
	spawnOnce "xbanish"
	spawnOnce "xset r 66"
	spawnOnce "xset r rate 300 40"
	spawnOnce "xsetroot -cursor_name left_ptr"

-- Log hook
myLogHook = updatePointer (0.5, 0.5) (0, 0)

-- Manage hook
myManageHook = composeAll
	[ className =? "MPlayer" --> doFloat
	, className =? "mplayer2" --> doFloat
	, className =? "Gimp" --> doFloat
	, className =? "zoom" --> doFloat
	, isDialog --> doFloat ]

-- Layouts
myLayoutHook = tiled ||| noBorders Full where
	tiled = spacing $ avoidStruts $ Dwindle.Spiral Dwindle.R Dwindle.CW 1.2 1.1
	direction = Dwindle.R
	rotation = Dwindle.CW
	ratio = 1.2
	delta = 1.1
	spacing = spacingRaw False (Border 31 5 5 5) True (Border 5 5 5 5) True -- 31 because of polybar

-- Keybinds
myKeys =
	[ ((myModMask, xK_semicolon),                spawn "rofi -show drun")
	, ((myModMask, xK_s),                        spawn "flameshot gui")
	, ((myModMask .|. shiftMask, xK_s),          spawn "flameshot full")
	, ((myModMask, xK_apostrophe),               spawn "slock")
	, ((myModMask .|. shiftMask, xK_apostrophe), spawn "slock systemctl suspend")
	, ((myModMask, xK_equal),                    spawn "pulsemixer --change-volume +5")
	, ((myModMask, xK_minus),                    spawn "pulsemixer --change-volume -5")
	, ((myModMask, xK_c),                        spawn "setxkbmap -layout us -variant colemak")
	, ((myModMask, xK_x),                        spawn "setxkbmap -layout us")
	]
	++
	-- Monitor movement
	[((m .|. myModMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
		| (key, sc) <- zip [xK_w, xK_f, xK_p] [0..]
		, (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

-- Config
myConfig = def
	{ borderWidth = myBorderWidth
	, clickJustFocuses = myClickJustFocuses
	, focusFollowsMouse = myFocusFollowsMouse
	, focusedBorderColor = myFocusedBorderColor
	, layoutHook = myLayoutHook
	, logHook = myLogHook
	, manageHook = myManageHook
	, modMask = myModMask
	, normalBorderColor = myNormalBorderColor
	, startupHook = myStartupHook
	, terminal = myTerminal
	, workspaces = myWorkspaces
	} `additionalKeys` myKeys

main = xmonad $ docks $ ewmhFullscreen $ ewmh $ myConfig
