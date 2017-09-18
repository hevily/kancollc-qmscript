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
MacroID=0b147108-16fb-48e7-8a13-04451b96785b
Description=test_thread_2
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
// 0 1 2 停5秒 3 4 5

執行緒ID=BeginThread(測試) //啟動“測試”執行緒，並返回執行緒ID編號
For 3 
    Delay 1000
Next 
PauseThread 執行緒ID //等待3秒後暫停“測試”執行緒的運行
For 5
    Delay 1000
Next 
ContinueThread 執行緒ID //等待5秒後繼續“測試”執行緒的運行
For 3
    Delay 1000
Next
ExitScript //等待3秒後停止並退出腳本運行
Sub 測試()
    i=0
    Do 
        Call Plugin.Msg.ShowScrTXT(0, 0, 1024, 768, "螢幕內容填寫"&i, "0000FF") 
        Delay 1000
        i=i+1
    Loop 
End Sub
