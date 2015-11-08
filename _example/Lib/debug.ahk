Debug(aText = "", aTitle = "")
{
	Suspend , On
	MsgBox, 52, % A_ScriptName " " aTitle, % aText "`n`n是否继续运行`?"
	Suspend, off
	IfMsgBox  yes
	{
		return true
	}
	else
	{
		ExitApp
	}
}

Debug_ObjDump(aObj, aTitle = "")
{
	return Debug(Obj_Print(aObj), aTitle)
}

Debug_point(aTarX, aTarY, aText = "here", aSleepSec = 1)
{
	WinGetTitle, _aWinTitle, A
	_winID := WinExist(_aWinTitle)
	PixelGetColor, _clr, %aTarX%, %aTarY%

	MouseMove, aTarX, aTarY, 3
	ToolTip, % aText

	Sleep, aSleepSec * 1000
	ToolTip

	Debug(aText
	. "`n`ntitle`:`t" _aWinTitle
	. "`ncolor`:`t" _clr
	. "`nx`:`t" aTarX
	. "`ny`:`t" aTarY)
}