import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Config.Gnome
import Graphics.X11.ExtraTypes.XF86

myConfig = defaultConfig { terminal           = "gnome-terminal"
                         , modMask            = mod4Mask
                         , borderWidth        = 1
                         , normalBorderColor  = "#333333"
                         , focusedBorderColor = "#d64937"
                         } `additionalKeys` myKeys

myKeys = [((noModMask,xF86XK_MonBrightnessUp)  , spawn "xbacklight +10")
         ,((noModMask,xF86XK_MonBrightnessDown), spawn "xbacklight -10")
         ,((mod4Mask.|.shiftMask,xK_o), spawn "passmenu")
         ]

myBar = "xmobar"
myPP  = xmobarPP { ppCurrent = xmobarColor "#ff00ff" "#333333" . wrap "<" ">" }

main = do
  c <- statusBar myBar myPP toggleStrutsKey myConfig
  xmonad c

toggleStrutsKey XConfig {XMonad.modMask = modMask } = (modMask, xK_b)
