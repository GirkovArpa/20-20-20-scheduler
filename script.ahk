Gui, Add, Edit, x12 y9 w90 h20 , Edit
Gui, Add, Edit, x12 y39 w150 h80 , Edit
Gui, Add, Edit, x112 y9 w90 h20 , Edit
Gui, Add, Button, x12 y129 w150 h30 gDisplayMessage, Test
Gui, Show, x470 y165 h177 w390, New GUI Window
Return

DisplayMessage() {
  Gui, 2: -MinimizeBox -Resize -MaximizeBox -SysMenu
  Gui, 2:Color, FFFFFF
  Gui, 2:Add, Text, x12 y9 w90 h20 , Hello World!
  Gui, 2:Show, x470 y165 h100 w200, New GUI Window
}

GuiClose:
ExitApp