include_ClassBase()
{
	return 1
}

;~ ������Ļ���.
;~ ������Ĭ�ϵĵ���δ��ʼ�������Ի򷽷�ʱ����Ϊ.
;~ Ŀǰͨ������ķ�ʽ��ֹ���̼���.
class Class_Base
{
	__Get(aKey)
	{
		throw {what	: aKey " ����δ����"}
	}

	__Call(aMethod)
	{
		if (aMethod != "_NewEnum")
		{
			throw {what	: aMethod " ����δ����"}
		}
	}
}

/*
;~ һ������
test_using_class_base()
{
	;~ -------------
	;~ [Start] ȫ�ֻ�����÷�
	;~ -------------
	_obj := {name : "Fonny"}
	;~ �����ڽű��Զ����н׶ε��� include_classBase()
	_obj.base := Class_Base
 *
	;~ ����δ��������ʱ������
	try
	{
		if (_obj)
		{
			Trace(_obj.name " is " _obj.sex, 2)
		}
	}
	catch , _err
	{
		;~ ��������������������
		_es := ""
		for ek, ev in _err
		{
			_es .= ek ": `t" ev "`n"
		}
		Trace("Error:`n" A_LineFile "`nLineNumber: " A_LineNumber "`nFunc: " A_ThisFunc "`n`n" _es, 1)
	}
}
*/