import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Config.Gnome
import Graphics.X11.ExtraTypes.XF86
import Solarized
import XMonad.Hooks.SetWMName

myConfig = defaultConfig { terminal           = "urxvt"
                         , modMask            = mod4Mask
                         , borderWidth        = 1
                         , normalBorderColor  = solarizedBase0
                         , focusedBorderColor = solarizedRed
                         , startupHook        = setWMName "LG3D"
                         } `additionalKeys` myKeys

myKeys = [((noModMask,xF86XK_MonBrightnessUp)  , spawn "xbacklight +10")
         ,((noModMask,xF86XK_MonBrightnessDown), spawn "xbacklight -10")
         ,((mod4Mask.|.shiftMask,xK_o), spawn "passmenu")
         ,((0,xF86XK_ScreenSaver), spawn "i3lock -f")
         ,((mod4Mask.|.shiftMask, xK_l), spawn "i3lock -f")
         ,((mod4Mask,xK_p), spawn "dmenu_run -nb \"#EEE8D5\" -nf \"#657B83\" -fn \"xft:Source Code Pro:pixelsize=12\"")
         ]

myBar = "xmobar"
myPP  = xmobarPP

main = do
  c <- statusBar myBar myPP toggleStrutsKey myConfig
  xmonad c

toggleStrutsKey XConfig {XMonad.modMask = modMask } = (modMask, xK_b)
