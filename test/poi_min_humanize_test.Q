[General]
SyntaxVersion=2
BeginHotkey=113
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=355cf5f1-c8e0-42f8-9884-27fe66b21427
Description=poi_min_humanize_test
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
// setup program window initial starting point
Hwnd = Plugin.Window.Find(0, "poi")
// minmize range: 1140,5 to 1177,5 to 1140,23 to 1177,23

// initial Randomize
Randomize

// get the Randomize numbers within the range
// range_x = Int((37 * Rnd)+1)
// range_y = Int((18 * Rnd)+1)

// click the position with corrisponding random point to minimize
Call Plugin.Bkgnd.LeftClick(Hwnd, (1140+Int((37*Rnd)+1)), (5+Int((18*Rnd)+1)))
