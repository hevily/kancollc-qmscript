[General]
SyntaxVersion=2
BeginHotkey=115
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=b0c025da-5d43-418c-8cb7-3cd9fbab6fd7
Description=ready_exp_21
Enable=1
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
// initial setup for add-on
Plugin.RegDll.Reg "C:\Users\Roger\Downloads\按鍵精靈\大漠插件3.1233\dm.dll"
set dm = createobject("dm.dmsoft")
ver = dm.Ver()
If len(ver) = 0 Then
    MessageBox "創建對象失敗,檢查系統是否禁用了vbs腳本權限"
    EndScript
End If
dm_ret = dm.SetPath("C:\Users\Roger\Downloads\按鍵精靈\pic")

// find poi window
Hwnd = Plugin.Window.Find(0, "poi")
HwndEx = Plugin.Window.FindEx(Hwnd, 0, "Chrome_RenderWidgetHostHWND", "Chrome Legacy Window")
//dm.FindWindow("", "poi")
//HwndEx = dm.FindWindowByProcess("poi.exe","","poi") 
//TracePrint Hwnd
//TracePrint HwndEx

// bind thewindow
dm_ret = dm.BindWindow(Hwnd, "dx2", "normal", "normal", 0)
Delay 1000 // delay for long process time
// check for sucessful bind
//dm_ret = dm.Capture(0,0,2000,2000,"screen.bmp")

//--------------------------------------------------------
// picture used
pic_1 = "1.bmp" // att button
pic_2 = "2.bmp" // exp button
pic_exp_menu_3 = ".\expedition\17_24.bmp" // expedition 17 to 24 (page 3)
pic_exp_21 = ".\expedition\21.bmp" // exp 21 button
pic_exp_det = ".\expedition\determine.bmp" // determine button
//--------------------------------------------------------

//--------------------------------------------------------
// main program
findPicWithRandomClick (pic_1)

// Delay for loading till see expedition button
Delay 500 // Delay at least 0.5 sec

findPicWithRandomClick (pic_2)

// Delay for loading till see menu page 1
Delay 1700 // Delay at least 1.7 sec

findPicWithRandomClick (pic_exp_menu_3)

// Delay for loading till see menu page 3
Delay 500 // Delay at least 0.5 sec

findPicWithRandomClick (pic_exp_21)

// Delay for loading till see determine button
Delay 500 // Delay at least 0.5 sec

findPicWithRandomClick (pic_exp_det)
//--------------------------------------------------------

Function findPicWithRandomClick(filePath)
	//--------------------------------------------------------
    // Randomizer for click (148,243 to 242,339) where pic (95x97 pixiel)
    // initial Randomize
    Randomize
    // get pic size
    pic_size = dm.GetPicSize(filePath)
    //TracePrint pic_size // [width],[height]
    pic_size = split(pic_size,",")
    w = int(pic_size(0))
    h = int(pic_size(1))
    //TracePrint "寬度:"&w
    //TracePrint "高度:"&h
    // get the Randomize numbers within the range (dont add 1 because -1 for 1 overlap pixiel)
    range_x = Int(w * Rnd)
    range_y = Int(h * Rnd)
    //TracePrint range_x
    //TracePrint range_y
    //--------------------------------------------------------
    
    //--------------------------------------------------------
    Rem recheck
    // check for right Delay
    //dm_ret = dm.Capture(0,0,2000,2000,"screen.bmp")
    // find attack button pic
    dm_ret = dm.FindPic(0, 0, 2000, 2000, filePath, "000000", 0.9, 0, intX, intY)
    //TracePrint intX
    //TracePrint intY
    If intX >= 0 and intY >= 0 Then
        //MessageBox "找到"
        // Random Delay
		Delay 100*Int((25*Rnd)+1)
        Call Plugin.Bkgnd.LeftClick(HwndEx, intX+range_x, intY+range_y)
        //TracePrint intX+range_x
        //TracePrint intY+range_y
        //dm.MoveTo intX,intY
        //dm.LeftClick
    Else 
        MessageBox "沒找到"
        // not found then Delay 1 sec and check again
        Delay 1000
		Goto recheck
    End If
    //--------------------------------------------------------
End Function

Sub OnScriptExit()
    dm_ret = dm.UnBindWindow()
End Sub
Hwnd = 0
HwndEx = 0
