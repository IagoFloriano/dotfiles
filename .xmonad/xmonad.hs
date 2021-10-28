-- IMPORTS

import XMonad hiding ( (|||) )
import Data.Monoid

import System.Exit
import System.IO

import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import Graphics.X11.ExtraTypes.XF86 -- function keys
import XMonad.Prompt

import XMonad.Actions.CycleWS
import XMonad.Actions.NoBorders
import XMonad.Actions.Search as S

import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Util.EZConfig (additionalKeysP, additionalMouseBindings)
import XMonad.Util.NamedScratchpad

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops

import XMonad.Layout.LayoutCombinators
import XMonad.Layout.Spacing
import XMonad.Layout.LayoutModifier
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.Magnifier
import XMonad.Layout.Grid
import XMonad.Layout.ShowWName
import XMonad.Layout.Hidden
import XMonad.Layout.SimpleFloat

-----------------------
-- Setting variables --
-----------------------

myTerminal      = "alacritty " -- Terminal emulator
myBorderWidth   = 2 -- Border Width
myModMask       = mod4Mask -- Mod mask (4 = super, 1 = lalt)
myWorkspaces    = ["sys","img","www","chat","song","dev","game","vid","**"] -- Workspaces name
-- myWorkspaces    = ["1","2","3","4","5","6","7","8","9"] -- Workspaces name
myNormalBorderColor  = "#4d4d4d" -- Unfocoused window color
myFocusedBorderColor = "#ff79c5" -- Focused window color
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset -- Number of windows opened
-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False
-- Variables for xmobar
myVisibleWS = "#ff79c6"
myHiddenWS = "#8be9fd"
myHiddenEmptyWS = "#bd93f9"
myActiveWindow = "#f8f8f2"
myUrgent = "#C45500"

------------------
-- Startup hook --
------------------

myStartupHook = do
      spawnOnce "lxqt-policykit-agent"
      spawnOnce "~/.fehbg"
      spawnOnce "volumeicon &"
      spawnOnce "nm-applet &"
      spawnOnce "~/bin/mytrayer.sh"
      spawnOnce "xinput --set-prop 13 'libinput Accel Speed' -1"
      spawnOnce "xinput --set-prop 13 'libinput Scroll Method Enabled' 0, 0, 1"
      spawnOnce "discord"
      spawnOnce "whatsdesk"
      -- spawnOnce "firefox"
      spawnOnce "telegram-desktop"
      spawnOnce "picom -D 2"
      spawnOnce "qbittorrent"
      spawnOnce "pcmanfm -d"
      -- spawnOnce "insync start"

-------------
-- Layouts --
-------------

mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw True (Border i i i i) True (Border i i i i) True

-- Show wokspce name --
myShowWNameTheme :: SWNConfig
myShowWNameTheme = def
    { swn_font              = "xft:Hack:bold:size=40"
    , swn_fade              = 0.5
    , swn_bgcolor           = "#282a36"
    , swn_color             = "#f8f8f2"
    }


tiled = renamed [Replace "[-]"]
        $ hiddenWindows
        $ mySpacing 2
        $ Tall 1 (3/100) (1/2)
mTiled = renamed [Replace "[|]"]
         $ hiddenWindows
         $ mySpacing 2
         $ Mirror
         $ Tall 1 (3/100) (1/2)
full = renamed [Replace "[ ]"]
       $ hiddenWindows
       $ noBorders
       $ Full
fulL = renamed [Replace "[F]"]
       $ hiddenWindows
       $ noBorders
       $ Full
floatLayout = renamed [Replace "[f]"]
              $ hiddenWindows
              $ simpleFloat
magnGrid = renamed [Replace "[G]"]
           $ hiddenWindows
           $ mySpacing 2
           $ GridRatio (3/2)
myLayout = avoidStruts (tiled ||| mTiled ||| full ||| magnGrid ||| floatLayout) ||| fulL
--  where
--     -- default tiling algorithm partitions the screen into two panes
--     tiled   = Tall nmaster delta ratio
--
--     -- The default number of windows in the master pane
--     nmaster = 1
--
--     -- Default proportion of screen occupied by master pane
--     ratio   = 1/2
--
--     -- Percent of screen to increment by when resizing panes
--     delta   = 3/100

------------------
-- Window rules --
------------------

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [
      resource =? "Godot_Engine"   --> doCenterFloat
    , className =? "Gimp"            --> doCenterFloat
    , className =? "leagueclientux.exe"            --> doCenterFloat
    , className =? "Gimp"            --> doShift ( myWorkspaces !! 1 )
    --, className =? "Brave-browser"   --> doShift ( myWorkspaces !! 2 )
    , className =? "discord"         --> doShift ( myWorkspaces !! 3 )
    , className =? "whatsdesk"       --> doShift ( myWorkspaces !! 3 )
    -- , className =? "firefox"         --> doShift ( myWorkspaces !! 3 )
    , className =? "TelegramDesktop" --> doShift ( myWorkspaces !! 3 )
    , className =? "Rhythmbox"       --> doShift ( myWorkspaces !! 4 )
    , className =? "Steam"           --> doShift ( myWorkspaces !! 6 )
    , className =? "Steam"           --> doCenterFloat
    , resource  =? "desktop_window"  --> doIgnore
    , resource  =? "kdesktop"        --> doIgnore
    , (className =? "Brave-browser" <&&> resource =? "Dialog") --> doFloat -- float brave dialog
    ] <+> namedScratchpadManageHook myScratchPads

------------------
-- Key bindings --
------------------
myKeys :: [(String, X ())]
myKeys = [
          -- Function keys --
            (("S-<XF86MonBrightnessUp>"), spawn "backlight_control 100") -- Max brightness
          , (("<XF86MonBrightnessUp>"), spawn "backlight_control +5") -- Increase brightness
          , (("S-<XF86MonBrightnessDown>"), spawn "backlight_control 1") -- Min brightness
          , (("<XF86MonBrightnessDown>"), spawn "backlight_control -5") -- Decrease brightness
          , (("<XF86WLAN>"), spawn "nm-connection-editor") -- Wifi configs

          -- Window control --
          , (("M-="), sendMessage ToggleStruts) -- Toggle xmobar
          , (("M-S-="), withFocused toggleBorder) -- Toggle border
          , (("M-c"), kill) -- Close window
          , (("M-n"), refresh) -- Resize windows
          , (("M-j"), windows W.focusDown) -- Move focus to next window
          , (("M-k"), windows W.focusUp  ) -- Move focus to previous window
          , (("M-m"), windows W.focusMaster  ) -- Move focus to master window
          , (("M-<Return>"), windows W.swapMaster) -- Change focused window to be master
          , (("M-S-j"), windows W.swapDown  ) -- Swap current window with next
          , (("M-S-k"), windows W.swapUp    ) -- Swap current window with previous 
          , (("M-h"), sendMessage Shrink) -- Shrink master area
          , (("M-l"), sendMessage Expand) -- Expand master area
          , (("M-,"), prevScreen) -- Switch focus to prev monitor
          , (("M-."), nextScreen) -- Switch focus to next monitor

          -- Layout control --
          , (("M-t"), withFocused $ windows . W.sink) -- Window back to tiling
          , (("M-]"), sendMessage (IncMasterN 1)) -- +1 window on master area
          , (("M-["), sendMessage (IncMasterN (-1))) -- -1 window on master area
          , (("M-<Home>"), withFocused hideWindow) -- Minimize window
          , (("M-S-<Home>"), popOldestHiddenWindow) -- Maximize last minimized  window

          , (("M-<Space> t"), sendMessage $ JumpToLayout "[-]") -- Master and stack layout
          , (("M-<Space> r"), sendMessage $ JumpToLayout "[|]") -- Mirror master and stack layout
          , (("M-<Space> f"), sendMessage $ JumpToLayout "[ ]") -- Full layout
          , (("M-<Space> S-f"), sendMessage $ JumpToLayout "[F]") -- Full layout without struts
          , (("M-<Space> C-f"), sendMessage $ JumpToLayout "[f]") -- Float layout
          , (("M-<Space> g"), sendMessage $ JumpToLayout "[G]") -- Grid layout

          -- System --
          , (("M-<Tab>"), spawn "$HOME/bin/layout_switch.sh") -- Change keyboard layout
          , (("M-S-<Tab>"), spawn "fcitx -d &") -- Turn on japanese keyboard
          , (("M-C-<Tab>"), spawn "killall fcitx") -- Turn off japanese keyboard
          , (("M-S-f"), spawn "feh --no-fehbg --bg-fill -z /home/yv/Pictures/Wallpapers") -- Set random wallpaper
          , (("M-<Escape>"), spawn "slock") -- Lockscreen
          , (("M-S-<Escape>"), spawn "~/bin/myshutdown") -- Turn computer off
          , (("<Print>"), spawn "scrot -fs -e 'mv $f ~/Pictures/shots/ && xclip -t image/png -selection c ~/Pictures/shots/$f'") -- Interactive screenshot
          , (("M-<Print>"), spawn "scrot -u -e 'mv $f ~/Pictures/shots/ && xclip -t image/png -selection c ~/Pictures/shots/$f'") -- Active window screenshot
          , (("S-<Print>"), spawn "scrot -a 1440,0,1920,1080 -m -e 'mv $f ~/Pictures/shots/ && xclip -t image/png -selection c ~/Pictures/shots/$f'") -- First monitor screenshot
          , (("C-<Print>"), spawn "scrot -a 0,480,1440,900 -m -e 'mv $f ~/Pictures/shots/ && xclip -t image/png -selection c ~/Pictures/shots/$f'") -- Second monitor screenshot
          , (("C-S-<Print>"), spawn "scrot -m -e 'mv $f ~/Pictures/shots/ && xclip -t image/png -selection c ~/Pictures/shots/$f'") -- Both monitor screenshot
          , (("M-<Scroll_lock>"), spawn "xinput --set-prop 13 'libinput Scroll Method Enabled' 0, 0, 1")
          , (("M-S-<Scroll_lock>"), spawn "xinput --set-prop 13 'libinput Scroll Method Enabled' 0, 0, 0")

          -- Launch applications --
          , (("M-S-h"), spawn (myTerminal ++ " -e htop")) -- Htop
          , (("M-b"), spawn "brave") -- Launch Brave browser
          , (("M-d"), spawn "discord") -- Launch Discord
          , (("M-S-<Return>"), spawn (myTerminal)) -- Launch terminal
          , (("M-p"), spawn "dmenu_run -c -l 15") -- Launch dmenu
          , (("M-f"), spawn "~/bin/files") -- Lauch file explorer
          , (("M-v"), spawn "~/bin/permpastebin") -- Lauch pastebin
          , (("M-<F4>"), spawn "pavucontrol") -- Sound configs
          , (("M-g"), spawn "gimp") -- Launch Gimp
          , (("M-u"), spawn "godot") -- Launch Godot
          , (("M-s r"), spawn "rhythmbox") -- Lauch RhythmBox
          , (("M-S-c"), spawn "gcolor2") -- Sound configs
          , (("M-i"), spawn "insync show") -- Insync

          -- Scratchpads
          , (("M-s <Return>"), namedScratchpadAction myScratchPads "terminal")
          , (("M-s c"), namedScratchpadAction myScratchPads "calculator")
          , (("<XF86Calculator>"), namedScratchpadAction myScratchPads "calculator")
          , (("M-s s"), namedScratchpadAction myScratchPads "spotify")
          , (("M-s d"), namedScratchpadAction myScratchPads "calendar")
          , (("M-s q"), namedScratchpadAction myScratchPads "torrent")
          , (("M-s j"), namedScratchpadAction myScratchPads "jome") --emoji input app

          -- XMonad --
          , (("M-S-q"), io (exitWith ExitSuccess)) -- Logout
          , (("M-q"), spawn "killall xmobar; xmonad --recompile; xmonad --restart") -- Restart xmonad

          ]

          -- Search Prompts --
          ++ [("M-w " ++ k, S.promptSearchBrowser myXPConfig "brave" f) | (k,f) <- searchList ]

          -- Needed for named scratchpads
--            where nonNSP         = WSIs (return (\ws -> W.tag ws /= "NSP"))
--                  nonEmptyNonNSP = WSIs (return (\ws -> isJust (W.stack ws) && W.tag ws /= "NSP"))
--------------------
-- Mouse bindings --
--------------------

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

--------------------
-- Event handling --
--------------------

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = fullscreenEventHook

----------
-- Main --
----------

main = do
  xmproc0 <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobarrc"
  xmproc1 <- spawnPipe "xmobar -x 1 $HOME/.config/xmobar/xmobarrc_notrayer"
  xmonad $ docks $ ewmh def
      { terminal           = myTerminal,
        startupHook        = myStartupHook,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
        mouseBindings      = myMouseBindings,
        layoutHook         = smartBorders . showWName' myShowWNameTheme $ myLayout,
        manageHook         = myManageHook <+> manageDocks,
        handleEventHook    = myEventHook,
        logHook = dynamicLogWithPP $ namedScratchpadFilterOutWorkspacePP $ xmobarPP {
                      ppOutput = \x -> hPutStrLn xmproc0 x
                                    >> hPutStrLn xmproc1 x
                    , ppCurrent = xmobarColor myVisibleWS "" . wrap "[" "]"         -- Current workspace
                    , ppVisible = xmobarColor myVisibleWS ""                        -- Visible but not current workspace
                    , ppHidden = xmobarColor myHiddenWS "" . wrap "*" ""            -- Hidden workspaces
                    , ppHiddenNoWindows = xmobarColor myHiddenEmptyWS ""            -- Hidden workspaces (no windows)
                    , ppTitle = xmobarColor myActiveWindow "" . shorten 60          -- Title of active window
                    , ppSep =  "<fc=#ffffff><fn=3>|</fn></fc>"                      -- Separator character
                    , ppUrgent = xmobarColor myUrgent "" . wrap "!" "!"             -- Urgent workspace
                    , ppExtras  = [windowCount]                                     -- # of windows current workspace
                    , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]                    -- order of things in xmobar
                    }
      } `additionalKeysP` myKeys

-----------------
-- ScratchPads --
-----------------

myScratchpadFloat = customFloating $ W.RationalRect l t w h
                    where
                    h = 0.9
                    w = 0.9
                    t = 0.95 -h
                    l = 0.95 -w

myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm
                , NS "calculator" spawnCalc findCalc manageCalc
                , NS "spotify" spawnSpot findSpot manageSpot
                , NS "calendar" spawnCalendar findCalendar manageCalendar
                , NS "torrent" spawnTorrent findTorrent manageTorrent
                , NS "jome" spawnJome findJome manageJome
                ]
  
  where
  spawnTerm  = myTerminal ++ " -t scratchpad"
  findTerm   = title =? "scratchpad"
  manageTerm = myScratchpadFloat

  spawnCalc  = "galculator"
  findCalc   = resource =? "galculator"
  manageCalc = myScratchpadFloat

  spawnSpot  = "spotify"
  findSpot   = className =? "Spotify"
  manageSpot = myScratchpadFloat
  
  spawnCalendar  = "korganizer"
  findCalendar   = className =? "korganizer"
  manageCalendar = myScratchpadFloat
  
  spawnTorrent  = "qbittorrent"
  findTorrent   = className =? "qBittorrent"
  manageTorrent = myScratchpadFloat

  spawnJome  = "jome | xclip -selection c"
  findJome   = className =? "jome"
  manageJome = customFloating $ W.RationalRect l t w h
               where
               h = 0.6
               w = 0.6
               t = 0.2
               l = 0.2

-------------------
-- Search prompt --
-------------------
archwiki, aur, reddit, nyaa :: S.SearchEngine

archwiki = S.searchEngine "archwiki" "https://wiki.archlinux.org/index.php?search="
aur = S.searchEngine "aur" "https://aur.archlinux.org/packages/?O=0&K="
reddit   = S.searchEngine "reddit" "https://www.reddit.com/search/?q="
nyaa   = S.searchEngine "nyaa" "https://nyaa.si/?f=0&c=0_0&q="

searchList :: [(String, S.SearchEngine)]
searchList = [ ("d", S.duckduckgo)
             , ("a", archwiki)
             , ("s", aur)
             , ("g", S.google)
             , ("y", S.youtube)
             , ("r", reddit)
             , ("n", nyaa)
             ]

myXPConfig :: XPConfig
myXPConfig = def
             { font               = "xft:Hack:bold:size=12"
             , bgColor            = "#282a36"
             , fgColor            = "#f8f8f2"
             , bgHLight           = "#44475a"
             , fgHLight           = "#f8f8f2"
             , borderColor        = "#44475a"
             , promptBorderWidth  = 1
             , position           = CenteredAt {xpCenterY = 0.3, xpWidth = 0.3}
             , height             = 20
             , maxComplRows       = Just 30
             , autoComplete       = Nothing
             }
