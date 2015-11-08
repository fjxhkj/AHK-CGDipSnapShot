;~ 要获取某个 Section 的文本内容,应该使用内置函数 IniRead 将 KeyName 留空即可:
;~ IniRead, _sectionContent, %iniFileName%, %SectionName%

;~ 本函数使用的例子:
;~ ini aIniFile -----
;~ [myobj]
;~ key1=key1 value
;~ key2=key2 settings
;~ [myobj2]
;~ key1=obj2 key1 value
;~ key2=obj2 key2 settings

;~ 获取所有内容为键值对象
;~ trace("myobj1"
;~ . "`n" Ini2Object(iniFilePath).myobj.key1
;~ . "`n" Ini2Object(iniFilePath).myobj.key2
;~ , 3)

;~ Fonny edited 2015-8-25
;~ 仅获取某个 Section 的内容:
;~ trace("myobj2"
;~ . "`n" Ini2Object(iniFilePath,"myobj2").key1
;~ . "`n" Ini2Object(iniFilePath,"myobj2").key2
;~ , 3)

Ini2Object(aIniFile, aSection = "")
{
	_obj := {}, _curSect := aSection, _isSectEnd := 0, _iniContent := ""

	If !FileExist(aIniFile)
		return
		
	if (aSection)
	{
		IniRead, _iniContent, %aIniFile%, %aSection%
	}
	else
	{
		FileRead, _iniContent, %aIniFile%
	}
	
	;~ Loop, Read, %aIniFile%
	loop, Parse, _iniContent , `n, `r
	{
		_line := Trim(A_LoopField)
		_fc := SubStr(_line, 1, 1)
		
		if (!_line) || (_fc = ";")
		{
			continue
		}

		;~ section start with '['
		if (_fc = "[")
		{
			; invalid
			if (SubStr(_line, 0) != "]")
				return

			_curSect := SubStr(_line, 2, -1)
		}
		else
		{
			if !(_p := InStr(_line, "="))
				return ; invalid
			_k := RTrim(SubStr(_line, 1, _p - 1))
			_v := LTrim(SubStr(_line, _p + 1))
			
			if (aSection)
			{
				_obj[_k] := _v
			}
			else
			{
				_obj[_curSect, _k] := _v
			}
		}
	}
	return _obj
}
