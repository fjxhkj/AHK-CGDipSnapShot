include_ClassBase()
{
	return 1
}

;~ 所有类的基类.
;~ 设置了默认的调用未初始化的属性或方法时的行为.
;~ 目前通过报错的方式阻止进程继续.
class Class_Base
{
	__Get(aKey)
	{
		throw {what	: aKey " 属性未定义"}
	}

	__Call(aMethod)
	{
		if (aMethod != "_NewEnum")
		{
			throw {what	: aMethod " 方法未定义"}
		}
	}
}

/*
;~ 一个例子
test_using_class_base()
{
	;~ -------------
	;~ [Start] 全局基类的用法
	;~ -------------
	_obj := {name : "Fonny"}
	;~ 必须在脚本自动运行阶段导入 include_classBase()
	_obj.base := Class_Base
 *
	;~ 调用未定义属性时将报错
	try
	{
		if (_obj)
		{
			Trace(_obj.name " is " _obj.sex, 2)
		}
	}
	catch , _err
	{
		;~ 遍历报错对象的所有属性
		_es := ""
		for ek, ev in _err
		{
			_es .= ek ": `t" ev "`n"
		}
		Trace("Error:`n" A_LineFile "`nLineNumber: " A_LineNumber "`nFunc: " A_ThisFunc "`n`n" _es, 1)
	}
}
*/