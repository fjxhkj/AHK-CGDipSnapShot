Include_Functions()
{
	return true
}
IfBetween(ByRef var, LowerBound, UpperBound)
{
	If var between %LowerBound% and %UpperBound%
		return true
}
IfNotBetween(ByRef var, LowerBound, UpperBound)
{
	If var not between %LowerBound% and %UpperBound%
		return true
}
IfIn(ByRef var, MatchList)
{
	If var in %MatchList%
		return true
}
IfNotIn(ByRef var, MatchList)
{
	If var not in %MatchList%
		return true
}
IfContains(ByRef var, MatchList)
{
	If var contains %MatchList%
		return true
}
IfNotContains(ByRef var, MatchList)
{
	If var not contains %MatchList%
		return true
}
IfIs(ByRef var, type)
{
	If var is %type%
		return true
}
IfIsNot(ByRef var, type)
{
	If var is not %type%
		return true
}
ControlGet(Cmd, Value = "", Control = "", WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "")
{
	_v := ""
	ControlGet, _v, %Cmd%, %Value%, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	return _v
}
ControlGetFocus(WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "")
{
	_v := ""
	ControlGetFocus, _v, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	return _v
}
ControlGetText(Control = "", WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "")
{
	_v := ""
	ControlGetText, _v, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	return _v
}
DriveGet(Cmd, Value = "")
{
	_v := ""
	DriveGet, _v, %Cmd%, %Value%
	return _v
}
DriveSpaceFree(Path)
{
	_v := ""
	DriveSpaceFree, _v, %Path%
	return _v
}
EnvGet(EnvVarName)
{
	_v := ""
	EnvGet, _v, %EnvVarName%
	return _v
}
FileGetAttrib(Filename = "")
{
	_v := ""
	FileGetAttrib, _v, %Filename%
	return _v
}
FileGetShortcut(LinkFile, ByRef OutTarget = "", ByRef OutDir = "", ByRef OutArgs = "", ByRef OutDescription = "", ByRef OutIcon = "", ByRef OutIconNum = "", ByRef OutRunState = "")
{
	FileGetShortcut, %LinkFile%, OutTarget, OutDir, OutArgs, OutDescription, OutIcon, OutIconNum, OutRunState
}
FileGetSize(Filename = "", Units = "")
{
	_v := ""
	FileGetSize, _v, %Filename%, %Units%
	return _v
}
FileGetTime(Filename = "", WhichTime = "")
{
	_v := ""
	FileGetTime, _v, %Filename%, %WhichTime%
	return _v
}
FileGetVersion(Filename = "")
{
	_v := ""
	FileGetVersion, _v, %Filename%
	return _v
}
FileRead(Filename)
{
	_v := ""
	FileRead, _v, %Filename%
	return _v
}
FileReadLine(Filename, LineNum)
{
	_v := ""
	FileReadLine, _v, %Filename%, %LineNum%
	return _v
}
FileSelectFile(Options = "", RootDir = "", Prompt = "", Filter = "")
{
	_v := ""
	FileSelectFile, _v, %Options%, %RootDir%, %Prompt%, %Filter%
	return _v
}
;~ 2015-2-15 Fonny�޸�,����2Ĭ��ֵΪ1�����ǿ�
FileSelectFolder(StartingFolder = "", Options = 1, Prompt = "")
{
	_v := ""
	FileSelectFolder, _v, %StartingFolder%, %Options%, %Prompt%
	return _v
}
FormatTime(YYYYMMDDHH24MISS = "", Format = "")
{
	_v := ""
	FormatTime, _v, %YYYYMMDDHH24MISS%, %Format%
	return _v
}
GetKeyState(WhichKey , Mode = "")
{
	_v := ""
	GetKeyState, _v, %WhichKey%, %Mode%
	return _v
}
GuiControlGet(Subcommand = "", ControlID = "", Param4 = "")
{
	_v := ""
	GuiControlGet, _v, %Subcommand%, %ControlID%, %Param4%
	return _v
}
ImageSearch(ByRef OutputVarX, ByRef OutputVarY, X1, Y1, X2, Y2, ImageFile)
{
	ImageSearch, OutputVarX, OutputVarY, %X1%, %Y1%, %X2%, %Y2%, %ImageFile%
}
IniRead(aFilename, aSection, aKey = "", aDefault = "")
{
	_v := ""
	;~ Ahk �� ini ��ȡ��֧�� key Ϊ�յ����,�������ﲻ��Ҫ�ж��Ƿ񴫵ݿ�ֵ
	IniRead, _v, %aFilename%, %aSection%, %aKey%, %aDefault%
	return _v
}
;~ Fonny Added
IniWrite(ByRef aValue, aFileName, aSection, aKey = "")
{
	if (aKey)
		IniWrite, % aValue, % aFileName, % aSection, % aKey
	else
		;~ ������,�� IniDelete ��ͬ,���ﲻ�Ǳ����,����Ϊ�˱���һ���Զ�����.
		IniWrite, % aValue, % aFileName, % aSection
	return !ErrorLevel
}
;~ Fonny Added
IniDelete(aFilename, aSection, aKey = "")
{
	if (aKey)
		IniDelete, % aFilename, % aSection, % aKey
	else
		;~ ������,�������ʡ��,�����Ǵ��ݿ��ַ���ֵ
		IniDelete, % aFilename, % aSection		
	return !ErrorLevel
}
Input(Options = "", EndKeys = "", MatchList = "")
{
	_v := ""
	Input, _v, %Options%, %EndKeys%, %MatchList%
	return _v
}
InputBox(Title = "", Prompt = "", HIDE = "", Width = "", Height = "", X = "", Y = "", Font = "", Timeout = "", Default = "")
{
	_v := ""
	InputBox, _v, %Title%, %Prompt%, %HIDE%, %Width%, %Height%, %X%, %Y%, , %Timeout%, %Default%
	return _v
}
MouseGetPos(ByRef OutputVarX = "", ByRef OutputVarY = "", ByRef OutputVarWin = "", ByRef OutputVarControl = "", Mode = "")
{
	MouseGetPos, OutputVarX, OutputVarY, OutputVarWin, OutputVarControl, %Mode%
}
PixelGetColor(X, Y, RGB = "")
{
	_v := ""
	PixelGetColor, _v, %X%, %Y%, %RGB%
	return _v
}
PixelSearch(ByRef OutputVarX, ByRef OutputVarY, X1, Y1, X2, Y2, ColorID, Variation = "", Mode = "")
{
	PixelSearch, OutputVarX, OutputVarY, %X1%, %Y1%, %X2%, %Y2%, %ColorID%, %Variation%, %Mode%
}
Random(Min = "", Max = "")
{
	_v := ""
	Random, _v, %Min%, %Max%
	return _v
}
RegRead(RootKey, SubKey, ValueName = "")
{
	_v := ""
	RegRead, _v, %RootKey%, %SubKey%, %ValueName%
	return _v
}
Run(Target, WorkingDir = "", Mode = "")
{
	_v := ""
	Run, %Target%, %WorkingDir%, %Mode%, _v
	return _v
}
SoundGet(ComponentType = "", ControlType = "", DeviceNumber = "")
{
	_v := ""
	SoundGet, _v, %ComponentType%, %ControlType%, %DeviceNumber%
	return _v
}
SoundGetWaveVolume(DeviceNumber = "")
{
	_v := ""
	SoundGetWaveVolume, _v, %DeviceNumber%
	return _v
}
StatusBarGetText(Part = "", WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "")
{
	_v := ""
	StatusBarGetText, _v, %Part%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	return _v
}
SplitPath(ByRef InputVar, ByRef OutFileName = "", ByRef OutDir = "", ByRef OutExtension = "", ByRef OutNameNoExt = "", ByRef OutDrive = "")
{
	SplitPath, InputVar, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
}
StringGetPos(ByRef InputVar, SearchText, Mode = "", Offset = "")
{
	_v := ""
	StringGetPos, _v, InputVar, %SearchText%, %Mode%, %Offset%
	return _v
}
StringLeft(ByRef InputVar, Count)
{
	_v := ""
	StringLeft, _v, InputVar, %Count%
	return _v
}
StringLen(ByRef InputVar)
{
	_v := ""
	StringLen, _v, InputVar
	return _v
}
StringLower(ByRef InputVar, T = "")
{
	StringLower, InputVar, InputVar, %T%
	return InputVar
}
StringMid(ByRef InputVar, StartChar, Count , L = "")
{
	_v := ""
	StringMid, _v, InputVar, %StartChar%, %Count%, %L%
	return _v
}
StringReplace(ByRef InputVar, SearchText, ReplaceText = "", All = "")
{
	_v := ""
	StringReplace, _v, InputVar, %SearchText%, %ReplaceText%, %All%
	return _v
}
StringRight(ByRef InputVar, Count)
{
	_v := ""
	StringRight, _v, InputVar, %Count%
	return _v
}
StringTrimLeft(ByRef InputVar, Count)
{
	_v := ""
	StringTrimLeft, _v, InputVar, %Count%
	return _v
}
StringTrimRight(ByRef InputVar, Count)
{
	_v := ""
	StringTrimRight, _v, InputVar, %Count%
	return _v
}
StringUpper(ByRef InputVar, T = "")
{
	StringUpper, InputVar, InputVar, %T%
	return InputVar
}
SysGet(Subcommand, Param3 = "")
{
	_v := ""
	SysGet, _v, %Subcommand%, %Param3%
	return _v
}
Transform(Cmd, Value1, Value2 = "")
{
	_v := ""
	Transform, _v, %Cmd%, %Value1%, %Value2%
	return _v
}
WinGet(Cmd = "", WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "")
{
	_v := ""
	WinGet, _v, %Cmd%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	return _v
}
WinGetActiveTitle()
{
	_v := ""
	WinGetActiveTitle, _v
	return _v
}
WinGetClass(WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "")
{
	_v := ""
	WinGetClass, _v, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	return _v
}
WinGetText(WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "")
{
	_v := ""
	WinGetText, _v, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	return _v
}
WinGetTitle(WinTitle = "", WinText = "", ExcludeTitle = "", ExcludeText = "")
{
	_v := ""
	WinGetTitle, _v, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	return _v
}
