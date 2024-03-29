import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.SpawnOnce
import XMonad.Util.ClickableWorkspaces
import XMonad.Util.WorkspaceCompare
import XMonad.Util.Loggers

import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.SimpleFloat
import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Layout.NoBorders  (lessBorders, Ambiguity(Never))

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks

import XMonad.Actions.CycleWS
import XMonad.Actions.UpdatePointer

-- import XMonad.Actions.Workscreen


myLayout = lessBorders Never $ onWorkspace "8 <fn=1>\xf7b3</fn> " simpleFloat $ gaps [(U,3), (R,3), (L,3), (D,3)] $ spacing 3 $  tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

myManageHook = composeAll
    [ -- Shift Firefox to Workspace 2
      className =? "firefox" --> doShift "2 <fn=1>\xfa9e</fn> "
      -- Shift Steam to Workspace 8
    , className =? "Steam" --> doShift "8 <fn=1>\xf7b3</fn> "
    ]

myStartupHook = do
    spawnOnce "autostart.sh"


myKeys =
    [ ("M-S-z", spawn "xscreensaver-command -lock")
    , ("M-w"  , spawn "firefox"                   )
    , ("M-d"  , spawn "rofi -modi 'combi,window,run,drun,ssh' -combi-modi 'drun,run,ssh' -show combi")
    , ("M-C-s", unGrab *> spawn "scrot -s"        )
    , ("<XF86AudioRaiseVolume>", spawn "pamixer -i 5")
    , ("<XF86AudioLowerVolume>", spawn "pamixer -d 5")
    , ("<XF86AudioMute>", spawn "pamixer -t")    
    , ("<XF86MonBrightnessUp>", spawn "/usr/bin/pkexec /usr/bin/brillo -A 10")    
    , ("<XF86MonBrightnessDown>", spawn "/usr/bin/pkexec /usr/bin/brillo -U 10")
    , ("M-m", nextWS)
    , ("M-n", prevWS)
    ]

-- Interact with xmobar
myPP = def { ppCurrent = xmobarColor "black" "white" }
mySB = statusBarProp "xmobar" (clickablePP myXmobarPP)
myWorkspaces = ["1 <fn=1>\xe795</fn> ", "2 <fn=1>\xfa9e</fn> ", "3 <fn=1>\xf713</fn> ", "4 <fn=1>\xf126</fn> ", "5 <fn=1>\xe5ff</fn> "
               , "6 <fn=1>\xf001</fn> ", "7 <fn=1>\xf086</fn> ", "8 <fn=1>\xf7b3</fn> ", "9 <fn=1>\xf1f8</fn> "]

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#a6e3a1" 6
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (red "!") (red "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppLayout          = (\layout -> case layout of
                            "Spacing Tall" -> ""
                            "Spacing Mirror Tall" -> ""
                            "Spacing Full" -> ""
                            "Simple Float" -> ""
                            "Spacing Magnifier NoMaster ThreeCol" -> "")
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white "[") (white "]") . red . ppWindow
    formatUnfocused = wrap (white "[") (white "]") . white . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 20

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#cba6f7" ""
    blue     = xmobarColor "#89b4fa" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f9e2af" ""
    red      = xmobarColor "#f38ba8" ""
    lowWhite = xmobarColor "#b4befe" ""

myConfig = def
    { modMask = mod4Mask  -- Rebind Mod to the Super key
    , terminal = "alacritty"
    , layoutHook =  myLayout
    , manageHook = myManageHook
    , startupHook = myStartupHook
    , workspaces = myWorkspaces
    , logHook = updatePointer (0.5, 0.5) (0, 0)
    }
    `additionalKeysP` myKeys


main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ withEasySB mySB defToggleStrutsKey $ myConfig

