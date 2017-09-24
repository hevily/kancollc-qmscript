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
MacroID=1c76c9e3-5559-4cc3-a50e-1e1e51a57ef2
Description=test_array
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
Dim A
A = Array(10,20,20)
A(2) = 30

arrCount = uBound(A)
TracePrint arrCount

For i=0 to arrCount
	TracePrint A(i)
Next
