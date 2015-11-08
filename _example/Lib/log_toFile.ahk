;~ 记录信息到本地log文件中
;~ 参数:
;~ aLogType
;~ 记录类型(保存在不同的log文件中)
;~ 0=无后缀的log文件名(); 1=err后缀的log文件名
;~ aLogStr
;~ 任意可变参数,多个参数传入的值用 | 符号分割保存.
;~ 注意:
;~ 可能出现磁盘无法写的意外错误
log_toFile(aLogType = 0, aLogStr*)
{
	;~ 创建目录
	IfNotExist, log
	{
		FileCreateDir, log
	}

	;~ log保存目录
	_logDir := A_ScriptDir "\log\"

	;~ 完整log文件路径
	_fileName := _logDir "log" "`_" A_YYYY "-" A_MM "-" A_DD ".txt"

;~ -------------
;~ [Start] log内容
;~ -------------
	;~ 当前时间
	_logTime := A_YYYY "-" A_MM "-" A_DD " " A_Hour ":" A_Min ":" A_Sec

	_logStr := ""
	;~ 类型为 -1,表示完整记录日志,不写入时间
	if (aLogType > -1)
	{
		_logStr .= _logTime "`§"
		;~ 增加Error的内容前缀
		if (aLogType > 0)
		{
			_logStr .= "`(E`)`§"
		}
	}

	;~ 分割aLogStr参数
	if (aLogStr)
	{
		;~ 避免在首位添加分隔符
		Loop, % aLogStr.MaxIndex()
		{
			_logItem := Trim(aLogStr[A_Index])
			if (_logItem != "")
			{
				_logStr .= _logItem
				if (A_Index < aLogStr.MaxIndex())
					_logStr .= "`§"
			}
		}
	}

	;~ 去掉首位空格
	_logStr := _logStr
	;~ 每行结尾的换行符
	_logStr .=  "`r`n"

	;~ 写入内容
	try
	{
		;~ 使用简体中文字符编码
		FileAppend, %_logStr%, %_fileName%, CP936
		;~ UTF-8 方便写入数据库,且可用非常规分隔符
		;~ FileAppend, %_logStr%, %_fileName%, UTF-8
	}
	catch
	{
		;~ SplitPath, A_LineFile, fName, fDir, fExt, FName_no_ext, fDrive
		;~ throw { what: "SYS_LogToLocal `n写入Log文件失败", file: fName, line: A_LineNumber }
		;~ trace("funcLog_Write 失败",2)
		return 0
	}
	return 1
}