Obj_Print(aObj, aIndent = 0)
{
	static _sLevel := A_Tab
	
	_tabs := "", _reStr := ""
	
	Loop % aIndent
		_tabs .= _sLevel

	if !IsObject(aObj)
	{
		if aObj is number
			return _tabs . aObj
		return _tabs . """" . aObj . """"
	}

	if (Obj_IsPureArray(aObj))
	{
		_reStr .= _tabs . "[`n"

		for _kEach, _vValue in aObj
			_reStr .= Obj_Print(_vValue, aIndent + 1) . ",`n"

		_reStr := RTrim(_reStr, ",`n")

		_reStr .= "`n" _tabs . "]"
	}
	else
	{
		_reStr .= _tabs . "{`n"

		for _kk, _vValue in aObj
		{
			if _kk is not number
				_kk := """" . _kk . """"
			_reStr .= _tabs . _sLevel . _kk " : " Trim(Obj_Print(_vValue, aIndent + 1)) . ",`n"
		}

		_reStr := RTrim(_reStr, ",")

		_reStr .= "`n" _tabs . "}"
	}
	return _reStr
}

Obj_FindValue(aObj, aValue, aIsCaseSensitive = false)
{
	for _kk, _vv in aObj
	{
		if (!aIsCaseSensitive && _vv = aValue)
			return _kk
		else if (aIsCaseSensitive && _vv == aValue)
			return _kk
	}
}

Obj_IsPureArray(aObj, aIsZeroBased = false)
{
	for _kk in aObj
	{
		if (!aIsZeroBased && _kk != A_Index)
		{
			return false
		}
		else if (aIsZeroBased && _kk != (A_Index - 1))
		{
			return false
		}
	}
	return true
}

/*!
  - Function: Obj_Copy
  - Parameters: 
        - aObj 要复制的对象
  - Returns: 
        - Object aObj的完整副本
 */
Obj_Copy(aObj)
{
    if not IsObject(aObj)
        return ""
	
    _objRe := {}
	
    for _kk , _vv in aObj
    {
        if IsObject(_vv)
            _objRe[_kk] := Obj_Copy(_vv)
        else
            _objRe[_kk] := _vv
    }
    return _objRe
}


;~ 从数组中寻找是否存在某个key
Obj_isInKey(aObj, aStr, aSub=0)
{
	for k,v in aObj
	{
		if (IsObject(v) && (aSub))
		{
			sub_res := Obj_isInKey(aObj[k],aStr,1)
			if (sub_res = 1)
				return 1
		}
		else if (!IsObject(v) && (k=aStr))
			return 1
	}
	Return 0
}

;~ 从数组中寻找是否存在某个value
Obj_isInValue(aObj, aStr, aSub=0)
{
	for k,v in aObj
	{
		if (IsObject(v) && (aSub))
		{
			sub_res := Obj_isInValue(aObj[k],aStr,aSub)
			if (sub_res = 1)
				return 1
		}
		else if (!IsObject(v) && (v=aStr))
			return 1
	}
}