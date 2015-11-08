include_ClassFilePathParse()
{
	return 1
}

;~ 描述一个路径对象的各个属性
;~ 其中:
;~ fileDirPath 属性:表示文件所在目录的完整路径
;~ fileDirName 属性:表示文件所在目录的目录名称(不包含其他路径)
;~ filePathOrg 属性:表示原始的文件完整路径
class Class_FilePathParse
{
	filePathOrg := ""
	, fileName := ""
	, fileDirPath := ""
	, fileDirName := ""
	, fileDir := ""
	, fileExt := ""
	, fileNameNoExt := ""
	, fileDrive := ""

	__New(aFilePath)
	{
		_fileName := ""
		, _fileDir := ""
		, _fileExt := ""
		, _fileNameNoExt := ""
		, _fileDrive := ""
		, _fileDirNameArr := ""

		SplitPath, aFilePath
		, _fileName
		, _fileDir
		, _fileExt
		, _fileNameNoExt
		, _fileDrive

		;~ 获取文件所在目录的完整路径
		StringReplace, _fileDirPath, % aFilePath, % "\" _fileName
		_fileDirNameArr := StrSplit(_fileDir, "`\")
		_fileDirName := _fileDirNameArr[_fileDirNameArr.MaxIndex()]
		
		this.filePathOrg := aFilePath
		, this.fileName := _fileName
		, this.fileDirPath := _fileDirPath
		, this.fileDirName := _fileDirName
		, this.fileDir := _fileDir
		, this.fileExt := _fileExt
		, this.fileNameNoExt := _fileNameNoExt
		, this.fileDrive := _fileDrive
	}
}