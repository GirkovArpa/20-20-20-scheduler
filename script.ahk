global Interval := ""
global Duration := ""
global Message := "Look away from the computer and look 20 feet away for 20 seconds." 

Gui, Add, Text, x12 y9 w140 h30 , Interval (seconds):

Gui, Add, Text, x12 y39 w90 h20 , Popup Duration:

Gui, Add, Text, x12 y69 w90 h20 , Popup Message:

Gui, Add, Edit, x112 y9 w60 h20 vInterval gRefresh, 
Gui, Add, UpDown, vSpinnerInterval, 3

Gui, Add, Edit, x112 y39 w60 h20 vDuration gRefresh,
Gui, Add, UpDown, vSpinnerDuration, 3

Gui, Add, Edit, x12 y99 w160 h70 vMessage gRefresh, %Message%

Gui, Add, Button, x12 y179 w160 h20 gShowPopup, Test

Gui, Show, x470 y165 h212 w187, 20

Gui, -MaximizeBox +Owner +MinimizeBox

Menu Tray, Icon
Menu, Tray, NoStandard 
Menu, Tray, DeleteAll 
Menu Tray, Add, Settings, TrayClick
Menu Tray, Default, Settings

StartInterval()
Return

TrayClick:
  Gui, Show
return

GuiSize(GuiHwnd, EventInfo, Width, Height) {
  if (A_EventInfo = 1) { ; minimize event
    Gui, Hide
  } 
}

ShowPopup() {
  Refresh()
  duration := Duration * 1000
  SetTimer, ClosePopup, %duration%
  Gui, 2:Font, norm bold
  Gui, 2:-SysMenu +Owner
  Gui, 2:Color, FFFFFF
  Gui, 2:Add, Text, +Center, %Message%
  Gui, 2:Show
  
  SetTimer, ShowPopup, Delete
}

ClosePopup() {
  Refresh()
  Gui, 2:+SysMenu -MinimizeBox -MaximizeBox +Owner
  SetTimer, ClosePopup, Delete
}

Refresh() {
  Gui, Submit, NoHide
}

StartInterval() {
  Gui, Submit, NoHide
  SetTimer, ShowPopup, delete
  SetTimer, ClosePopup, delete
  interval := Interval * 1000
  SetTimer, ShowPopup, %interval%
}

2GuiClose:
  StartInterval()
  Gui 2:Destroy
  return

GuiClose:
ExitApp