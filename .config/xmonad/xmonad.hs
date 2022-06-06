import XMonad
import XMonad.Config

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
import XMonad.Layout.NoBorders -- (lessBorders, Never)

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks

import XMonad.Actions.CycleWS
import XMonad.Actions.UpdatePointer

-- import XMonad.Actions.Workscreen


myLayout = lessBorders Never $ onWorkspace "<fn=1>\xf7b3</fn>" simpleFloat $  tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled    = gaps [(U,5), (R,5), (L,5), (D,5)] $ spacing 5 $ Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

myStartupHook = do
    spawnOnce "/usr/bin/picom -b"
    spawnOnce "/usr/bin/nitrogen --restore" 
    spawnOnce "/usr/bin/touchegg"
    spawnOnce "/usr/bin/xsetroot -cursor_name left_ptr"
    spawnOnce "trayer --edge top --align right --widthtype request --margin 15 --SetDockType true --SetPartialStrut true --expand true --monitor 0 --transparent true --alpha 0 --tint 0x292d3e --height 25 --distance 13"

myManageHook = composeAll
    [ -- Shift Firefox to Workspace 2
      className =? "firefox" --> doShift "<fn=1>\xfa9e</fn>"
      -- Shift Steam to Workspace 8
    , className =? "Steam" --> doShift "<fn=1>\xf7b3</fn>"
    ]

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

myKeys =
    [ ("M-S-z", spawn "xscreensaver-command -lock")
    , ("M-C-s", unGrab *> spawn "scrot -s"        )
    , ("M-w"  , spawn "firefox"                   )
    , ("M-d"  , spawn "rofi -modi 'combi,window,run,drun,ssh' -combi-modi 'window,run,ssh' -show combi")
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
myWorkspaces = ["<fn=1>\xe795</fn>", "<fn=1>\xfa9e</fn>", "<fn=1>\xf713</fn>", "<fn=1>\xf126</fn>", "<fn=1>\xe5ff</fn>", "<fn=1>\xf001</fn>", "<fn=1>\xf086</fn>", "<fn=1>\xf7b3</fn>", "<fn=1>\xf1f8</fn>"]

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""

main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ withEasySB mySB defToggleStrutsKey $ myConfig


