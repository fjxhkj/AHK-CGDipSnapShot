#NoEnv
#Warn
#Warn, LocalSameAsGlobal, Off
#Warn, UseUnsetLocal, StdOut

#include <CGdipSnapshot>

;~ Gui
;~ ������ Text ���� Picture �ؼ�������
;~ ������ 0xE ѡ��,�����ʾʲô����
;~ Gui, Add, Text, 0xE x5 y5 w600 h600 HwndMyBox
Gui, Add, Picture, 0xE w600 h600 HwndMyBox
Gui, Show

;~ Hwnd ������ȫ�ֱ���,�ں�����ʹ��Ҫע������
global MyBoxHwnd := MyBox
;~ Debug(MyBox)
main()
return

GuiClose:
	ExitApp
return

main()
{
	;~ �Գ�������ͼ
	if !(so := snapShotWin(WinExist("ahk_class XmainClass")))
		return
	
	;~ �����ͼ�������ļ�
	so.saveSnapshot("snap1.png")
	;~ ��Gui����ʾ��ͼ
	so.ShowSnapshot(MyBoxHwnd)
	;~ ��ʾ��ͼ�е�ĳ�������ɫ(�ڴ��е�ͼ��)
	;~ Debug(so.SnapshotGetColor(145,135).rgb)
}

;~ ��ȡ���򴰿ڴ�С�����ؽ�ͼ����ʵ��
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
