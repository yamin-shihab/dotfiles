import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
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
myFocusedBorderColor = "#bd93f9"
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

-- Help text
help = unlines
	[ "My modifier is mod4. My keybindings:"
	, ""
	, "-- launching and killing programs"
	, "mod-Shift-Enter      Launch st"
	, "mod-semicolon        Launch rofi"
	, "mod-{-,=}            Decrease or increase volume using pulsemixer"
	, "mod-s                Launch flameshot gui"
	, "mod-Shift-s          Launch flameshot full"
	, "mod-apostrophe       Launch slock"
	, "mod-Shift-apostrophe Launch slock and suspend computer with systemctl"
	, "mod-{x,c}            Switch keyboard layout between qwerty and colemak using setxkbmap"
	, "mod-Shift-c          Close/kill the focused window"
	, "mod-Space            Rotate through the available layout algorithms"
	, "mod-Shift-Space      Reset the layouts on the current workSpace to default"
	, "mod-n                Resize/refresh viewed windows to the correct size"
	, "mod-Shift-/          Show this help message with the default keybindings"
	, ""
	, "-- move focus up or down the window stack"
	, "mod-Tab              Move focus to the next window"
	, "mod-Shift-Tab        Move focus to the previous window"
	, "mod-j                Move focus to the next window"
	, "mod-k                Move focus to the previous window"
	, "mod-m                Move focus to the master window"
	, ""
	, "-- modifying the window order"
	, "mod-Return           Swap the focused window and the master window"
	, "mod-Shift-j          Swap the focused window with the next window"
	, "mod-Shift-k          Swap the focused window with the previous window"
	, ""
	, "-- resizing the master/slave ratio"
	, "mod-h                Shrink the master area"
	, "mod-l                Expand the master area"
	, ""
	, "-- floating layer support"
	, "mod-t                Push window back into tiling; unfloat and re-tile it"
	, ""
	, "-- increase or decrease number of windows in the master area"
	, "mod-comma            Increment the number of windows in the master area"
	, "mod-period           Deincrement the number of windows in the master area"
	, ""
	, "-- quit, or restart"
	, "mod-Shift-q          Quit xmonad"
	, "mod-q                Restart xmonad"
	, ""
	, "-- Workspaces & screens"
	, "mod-[1..9]           Switch to workSpace N"
	, "mod-Shift-[1..9]     Move client to workspace N"
	, "mod-{w,f,p}          Switch to physical/Xinerama screens 1, 2, or 3"
	, "mod-Shift-{w,f,p}    Move client to screen 1, 2, or 3"
	, ""
	, "-- Mouse bindings: default actions bound to mouse events"
	, "mod-button1          Set the window to floating mode and move by dragging"
	, "mod-button2          Raise the window to the top of the stack"
	, "mod-button3          Set the window to floating mode and resize by dragging"
	]

-- Keybinds
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
	-- Custom program binds
	[ ((modMask .|. shiftMask, xK_Return),     spawn myTerminal)
	, ((modMask, xK_semicolon),                spawn "rofi -show drun")
	, ((modMask, xK_s),                        spawn "flameshot gui")
	, ((modMask .|. shiftMask, xK_s),          spawn "flameshot full")
	, ((modMask, xK_minus),                    spawn "pulsemixer --change-volume -5")
	, ((modMask, xK_equal),                    spawn "pulsemixer --change-volume +5")
	, ((modMask, xK_apostrophe),               spawn "slock")
	, ((modMask .|. shiftMask, xK_apostrophe), spawn "slock systemctl suspend")
	, ((modMask, xK_c),                        spawn "setxkbmap -layout us -variant colemak")
	, ((modMask, xK_x),                        spawn "setxkbmap -layout us")
	-- Window management and layouts binds
	, ((modMask .|. shiftMask, xK_c),          kill)
	, ((modMask, xK_space),                    sendMessage NextLayout)
	, ((modMask .|. shiftMask, xK_space),      setLayout $ XMonad.layoutHook conf)
	, ((modMask, xK_n), refresh)
	-- Window movement and size binds
	, ((modMask, xK_Tab),                      windows W.focusDown)
	, ((modMask .|. shiftMask, xK_Tab),        windows W.focusUp)
	, ((modMask, xK_j),                        windows W.focusDown)
	, ((modMask, xK_k),                        windows W.focusUp)
	, ((modMask, xK_m),                        windows W.focusMaster)
	, ((modMask, xK_Return),                   windows W.swapMaster)
	, ((modMask .|. shiftMask, xK_j	),         windows W.swapDown)
	, ((modMask .|. shiftMask, xK_k	),         windows W.swapUp)
	, ((modMask, xK_h),                        sendMessage Shrink)
	, ((modMask, xK_l),                        sendMessage Expand)
	, ((modMask, xK_t),                        withFocused $ windows . W.sink)
	, ((modMask, xK_comma),                    sendMessage (IncMasterN 1))
	, ((modMask, xK_period),                   sendMessage (IncMasterN (-1)))
	-- Recompile and help
	, ((modMask .|. shiftMask, xK_q	),         io (exitWith ExitSuccess))
	, ((modMask, xK_q),                        spawn "if type xmonad; then xmonad --recompile && xmonad --restart; else xmessage xmonad not in \\$PATH: \"$PATH\"; fi")
	, ((modMask .|. shiftMask, xK_slash),      helpCommand)
	, ((modMask, xK_question),                 helpCommand)
	]
	++
	-- Workspace movement
	[((m .|. modMask, k), windows $ f i)
		| (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
		, (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
	++
	-- Monitor movement
	[((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
		| (key, sc) <- zip [xK_w, xK_f, xK_p] [0..]
		, (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
	-- Help command
	where helpCommand = xmessage help

-- Config
myConfig = def
	{ borderWidth = myBorderWidth
	, clickJustFocuses = myClickJustFocuses
	, focusFollowsMouse = myFocusFollowsMouse
	, focusedBorderColor = myFocusedBorderColor
	, keys = myKeys
	, layoutHook = myLayoutHook
	, manageHook = myManageHook
	, modMask = myModMask
	, normalBorderColor = myNormalBorderColor
	, startupHook = myStartupHook
	, terminal = myTerminal
	, workspaces = myWorkspaces
	}

main = xmonad $ docks $ ewmhFullscreen $ ewmh $ myConfig
