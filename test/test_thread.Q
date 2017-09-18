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
MacroID=65e6ece1-6638-4162-baff-91558c09e6f7
Description=test_thread
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
//

//對多執行緒返回的執行緒ID號，需要定義環境變數
DimEnv 執行緒ID1, 執行緒ID2
執行緒ID1 = BeginThread(副程式1)
執行緒ID2 = BeginThread(副程式2)


// 1  11111     1s    1st 1dddd f
//  2 2s    2st 22222 2dddd f

//以下是【測試用】副程式例子
Dim i
Sub 副程式1()
	PauseThread 執行緒ID2
    i=1
    TracePrint "副程式被執行緒啟動！" & i
    Delay 500 // process time
    ContinueThread 執行緒ID2
    Delay 1000
End Sub
Sub 副程式2()
	PauseThread 執行緒ID1
    i=2
    TracePrint "副程式被執行緒啟動！" & i
    Delay 500 // process time
    ContinueThread 執行緒ID1
    Delay 1000
End Sub


/*
// 1  11111 f
//  2 2s    2st 22222 2ddddd f

//以下是【測試用】副程式例子
Dim i
Sub 副程式1()
	PauseThread 執行緒ID2
    i=1
    TracePrint "副程式被執行緒啟動！" & i
    ContinueThread 執行緒ID2
End Sub
Sub 副程式2()
	PauseThread 執行緒ID1
    i=2
    TracePrint "副程式被執行緒啟動！" & i
    ContinueThread 執行緒ID1
    Delay 1000
End Sub
*/

/*
// 1 1 s st 1 f
//  2 2  2dddddddd f

//以下是【測試用】副程式例子
Dim i
Sub 副程式1()
    i=1
    TracePrint "副程式被執行緒啟動！" & i
End Sub
Sub 副程式2()
	PauseThread 執行緒ID1
    i=2
    TracePrint "副程式被執行緒啟動！" & i
    ContinueThread 執行緒ID1
    Delay 1000
End Sub
*/

/*
// 1 1 s st 1 f
//  2 2  2dddddddd f

//以下是【測試用】副程式例子
Dim i
Sub 副程式1()
    i=1
    TracePrint "副程式被執行緒啟動！" & i
End Sub
Sub 副程式2()
	PauseThread 執行緒ID1
    i=2
    TracePrint "副程式被執行緒啟動！" & i
    ContinueThread 執行緒ID1
End Sub
*/

//以下是【無限迴圈】防止全部腳本停止。
Do
    Delay 1000
Loop

//在啟動腳本時自動載入配置資訊
Sub OnScriptLoad()
    //MessageBox "腳本配置完成！"
End Sub

//以下是只對【多執行緒停止時】產生的事件
Sub OnThreadExit()
    Dim ThreadID
    ThreadID = GetThreadID() //得到當前執行緒的ID
    Select Case ThreadID
    Case 執行緒ID1
        //這樣就可以針對某個執行緒進行操作
 //比如： 釋放大漠外掛程式物件
 TracePrint i & " 當前執行緒(" & ThreadID & ")已經停止！" & 執行緒ID1  
    Case 執行緒ID2
        //這樣就可以針對某個執行緒進行操作
 //比如：釋放361外掛程式物件
 TracePrint i & " 當前執行緒(" & ThreadID & ")已經停止！" & 執行緒ID2
    End Select
End Sub

//以下是當腳本【全部停止時】產生的事件   
Sub OnScriptExit()
    MessageBox "腳本已經停止！"
End Sub
