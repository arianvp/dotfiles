import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Hooks.SetWMName

import XMonad.Hooks.Place

import XMonad.Util.Scratchpad
import Data.Monoid

myConfig = defaultConfig { terminal           = "urxvt"
                         , modMask            = mod4Mask
                         , borderWidth        = 1
                         , startupHook        = setWMName "LG3D"
                         , manageHook         = myPlaceHook <>
                                manageHook defaultConfig <> myManageHook
                         } `additionalKeysP` myKeys

myPlaceHook = placeHook $ smart (0.5, 0.5)
myManageHook = scratchpadManageHookDefault <> (mconcat . concat $
  [ [ className =? c --> doFloat | c <- myFloats ]])

myFloats = ["arandr", "Arandr"]


myKeys = [ ("M-o",  scratchpadSpawnAction myConfig) ]

myBar = "xmobar"
myPP = xmobarPP { ppCurrent = xmobarColor "#dc322f" "" . wrap "[" "]"

                }
main :: IO ()
main = do
  c <- statusBar myBar myPP toggleStrutsKey myConfig
  xmonad c

toggleStrutsKey XConfig {XMonad.modMask = modMask } = (modMask, xK_b)
