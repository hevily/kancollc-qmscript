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
MacroID=ae430367-82a8-41f7-99ed-1f0710587b19
Description=input_box_test
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
Dim Input
Input = InputBox("¿é¤J¦W¦r")
MsgBox ("¿é¤J: " & Input)


TracePrint TypeName(Input)

number = int(Input)

TracePrint number

str1 = CStr(number)

TracePrint TypeName(str1)

