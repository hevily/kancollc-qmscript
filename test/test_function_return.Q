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
MacroID=76624eb7-6742-413d-af3a-81954eb44541
Description=test_function_return
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
i = numberReturn(1000)
TracePrint i

Function numberReturn(num)
	numberReturn = num
End Function

Function returnMoreThan1
	value1 = "1"
	value2 = 2
	
	returnMoreThan1 = Array(value1,value2)
End Function

x = returnMoreThan1()
TracePrint x(0)
TracePrint x(1)

Dim MyArray(4)
MyArray(0) = "Mr."
MyArray(1) = "John "
MyArray(2) = "Doe "
MyArray(3) = "III"
MyString = Join(MyArray) 'MyString ¥]§t "Mr.John Doe III"¡C

TracePrint MyString

pic_supply_team_num = ".\supply\team_" // use for string join and loop cases
pic_supply_team_refill_filetype = "_refill.bmp" // use for string join and loop cases
pic_supply_team_1_refill = ".\supply\team_1_refill.bmp" // team 1 refill
pic_supply_team_2_refill = ".\supply\team_2_refill.bmp" // team 2 refill
pic_supply_team_3_refill = ".\supply\team_3_refill.bmp" // team 3 refill
pic_supply_team_4_refill = ".\supply\team_4_refill.bmp" // team 4 refill

For i = 0 To 3
	testArray = Array(pic_supply_team_num, CStr(1), pic_supply_team_refill_filetype)
	testString = Join(testArray)
	TracePrint testString

	testString = pic_supply_team_num & CStr(1) & pic_supply_team_refill_filetype
	TracePrint testString
	
	TracePrint StrComp(pic_supply_team_1_refill,testString,0)
	TracePrint StrComp(pic_supply_team_1_refill,testString,1)
Next