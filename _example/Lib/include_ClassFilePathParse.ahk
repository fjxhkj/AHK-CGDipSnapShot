include_ClassFilePathParse()
{
	return 1
}

;~ ����һ��·������ĸ�������
;~ ����:
;~ fileDirPath ����:��ʾ�ļ�����Ŀ¼������·��
;~ fileDirName ����:��ʾ�ļ�����Ŀ¼��Ŀ¼����(����������·��)
;~ filePathOrg ����:��ʾԭʼ���ļ�����·��
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

		;~ ��ȡ�ļ�����Ŀ¼������·��
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