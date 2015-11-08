;~ ��¼��Ϣ������log�ļ���
;~ ����:
;~ aLogType
;~ ��¼����(�����ڲ�ͬ��log�ļ���)
;~ 0=�޺�׺��log�ļ���(); 1=err��׺��log�ļ���
;~ aLogStr
;~ ����ɱ����,������������ֵ�� | ���ŷָ��.
;~ ע��:
;~ ���ܳ��ִ����޷�д���������
log_toFile(aLogType = 0, aLogStr*)
{
	;~ ����Ŀ¼
	IfNotExist, log
	{
		FileCreateDir, log
	}

	;~ log����Ŀ¼
	_logDir := A_ScriptDir "\log\"

	;~ ����log�ļ�·��
	_fileName := _logDir "log" "`_" A_YYYY "-" A_MM "-" A_DD ".txt"

;~ -------------
;~ [Start] log����
;~ -------------
	;~ ��ǰʱ��
	_logTime := A_YYYY "-" A_MM "-" A_DD " " A_Hour ":" A_Min ":" A_Sec

	_logStr := ""
	;~ ����Ϊ -1,��ʾ������¼��־,��д��ʱ��
	if (aLogType > -1)
	{
		_logStr .= _logTime "`��"
		;~ ����Error������ǰ׺
		if (aLogType > 0)
		{
			_logStr .= "`(E`)`��"
		}
	}

	;~ �ָ�aLogStr����
	if (aLogStr)
	{
		;~ ��������λ��ӷָ���
		Loop, % aLogStr.MaxIndex()
		{
			_logItem := Trim(aLogStr[A_Index])
			if (_logItem != "")
			{
				_logStr .= _logItem
				if (A_Index < aLogStr.MaxIndex())
					_logStr .= "`��"
			}
		}
	}

	;~ ȥ����λ�ո�
	_logStr := _logStr
	;~ ÿ�н�β�Ļ��з�
	_logStr .=  "`r`n"

	;~ д������
	try
	{
		;~ ʹ�ü��������ַ�����
		FileAppend, %_logStr%, %_fileName%, CP936
		;~ UTF-8 ����д�����ݿ�,�ҿ��÷ǳ���ָ���
		;~ FileAppend, %_logStr%, %_fileName%, UTF-8
	}
	catch
	{
		;~ SplitPath, A_LineFile, fName, fDir, fExt, FName_no_ext, fDrive
		;~ throw { what: "SYS_LogToLocal `nд��Log�ļ�ʧ��", file: fName, line: A_LineNumber }
		;~ trace("funcLog_Write ʧ��",2)
		return 0
	}
	return 1
}