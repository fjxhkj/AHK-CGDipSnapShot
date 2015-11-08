#NoEnv
#Warn
#Warn, LocalSameAsGlobal, Off
#Warn, UseUnsetLocal, StdOut

#include <CGdipSnapshot>

;~ Gui
;~ 这里用 Text 或者 Picture 控件都可以
;~ 必须有 0xE 选项,具体表示什么待查
;~ Gui, Add, Text, 0xE x5 y5 w600 h600 HwndMyBox
Gui, Add, Picture, 0xE w600 h600 HwndMyBox
Gui, Show

;~ Hwnd 变量是全局变量,在函数中使用要注意引用
global MyBoxHwnd := MyBox
;~ Debug(MyBox)
main()
return

GuiClose:
	ExitApp
return

main()
{
	;~ 对程序界面截图
	if !(so := snapShotWin(WinExist("ahk_class XmainClass")))
		return
	
	;~ 保存截图到本地文件
	so.saveSnapshot("snap1.png")
	;~ 在Gui中显示截图
	so.ShowSnapshot(MyBoxHwnd)
	;~ 显示截图中的某个点的颜色(内存中的图像)
	;~ Debug(so.SnapshotGetColor(145,135).rgb)
}

;~ 获取程序窗口大小并返回截图对象实例
snapShotWin(aWinID)
{
	IfWinExist, ahk_id %aWinID%
	{
		WinActivate, ahk_id %aWinID%
		WinGetPos, x, y, w, h, ahk_id %aWinID%
		snap := new CGdipSnapshot(x,y,w,h)
		snap.TakeSnapshot()
		return snap
	}
}
