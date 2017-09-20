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
MacroID=33bb2f1e-6904-43fc-8106-2730672d5916
Description=test_select_case
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
//自訂變數is at the right panel

//標準型自訂變數
//格式: UserVar {變數}={預設值} {注釋}
//解釋:這個命令主要用於使用者自訂的設置功能
UserVar var1=30 "當HP＜多少％時，使用紅藥"
UserVar var2=30 "當MP＜多少％時，使用藍藥"
//當使用者使用這個腳本的時候，可以對這var1和var2這兩個變數的取值進行設置
//下拉型自訂變數
//格式: UserVar 變數=DropList{選項0:值0|選項1:值1|選項2:值2}=預設顯示的選項編號 {注釋}
//解釋:這個命令預先設定多個變數值，使用者可在基面通過下拉方式進行選擇
UserVar Var1=DropList{"低於10%時補血":0.1|"低於20%時補血":0.2|"低於30%時補血":0.3}=2 "自動補血設置"
//特別提醒：預設顯示的選項編號從0開始

//不支援判斷語句 如：Case a>0
num = 1
//<>---------------------------------------------以下是選擇條件結結構判斷
Select Case num
Case 0
    Msgbox "你輸入的數位為：0"
Case 1
    Msgbox "你輸入的數位為：1"
    num = 2
    // a invisible exit case here
Case 2
    Msgbox "你輸入的數位為：2"
Case 3
    Msgbox "你輸入的數位為：3"
Case 4
    Msgbox "你輸入的數位為：4"
Case 5
Case 6
    Msgbox "你輸入的數位為：6"
Case 7
    Msgbox "你輸入的數位為：7" 
Case 8
    Msgbox "你輸入的數位為：8" 
Case 9
    Msgbox "你輸入的數位為：9" 
Case Else
    Msgbox "你輸入的數位不正確，請輸入（0~9）數位！"
End Select