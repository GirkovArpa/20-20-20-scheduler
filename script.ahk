Gui, Add, Text, x12 y9 w140 h30 , Interval (seconds):

Gui, Add, Text, x12 y39 w90 h20 , Popup Duration:

Gui, Add, Text, x12 y69 w90 h20 , Popup Message:

Gui, Add, Edit, x112 y9 w60 h20 , Edit
Gui, Add, UpDown, vSpinner1, 5

Gui, Add, Edit, x112 y39 w60 h20 , Edit
Gui, Add, UpDown, vSpinner2, 5

Gui, Add, Edit, x12 y99 w160 h70 , Edit

Gui, Add, Button, x12 y179 w160 h20 , Test

Gui, Show, x470 y165 h212 w187, New GUI Window

Gui, -MinimizeBox -MaximizeBox
Return

DisplayMessage() {
  SetTimer, closePopup, 1000
  Gui, 2:-SysMenu
  Gui, 2:Color, FFFFFF
  Gui, 2:Add, Text, x12 y9 w90 h20 , Hello World!
  Gui, 2:Show, x470 y165 h100 w200, New GUI Window
}

closePopup() {
  ;Gui 2:Destroy
  Gui, 2:+SysMenu -MinimizeBox -MaximizeBox
}

GuiClose:
ExitApp