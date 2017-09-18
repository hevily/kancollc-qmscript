[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=7dad8e13-91ca-4532-a0e0-0ececb1fce7e
Description=測試窗口的後台_截圖
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
set dm = createobject("dm.dmsoft")
dm.SetPath "C:\Users\Roger\Downloads\按鍵精靈\pic"
hwnd = dm.GetMousePointWindow()
TracePrint int(hwnd)
dm_ret = dm.BindWindow(hwnd,"gdi","dx2","normal",101)
dm_ret = dm.Capture(0,0,2000,2000,"screen.bmp")
dm_ret = dm.UnBindWindow()
EndScript
