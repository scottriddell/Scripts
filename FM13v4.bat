SETLOCAL

SET ProductName={EA92821A-03A5-4B00-85F4-834BBD8ABC24}
SET VersionNum=13.0.4.0
SET WOW6432NODE =



IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" Set WOW6432NODE=WOW6432NODE\

REG query HKEY_LOCAL_MACHINE\SOFTWARE\%WOW6432NODE%Microsoft\Windows\CurrentVersion\Uninstall\%ProductName% | find "%VersionNum%"
IF %errorlevel%==0 GOTO Installed



:InstallFilemaker
start /wait "Installing Filemaker 13.0.4" "%~dp0Install\Setup.exe" /S /v/qn

rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Bonjour"
del /F /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\FileMaker Pro.lnk"

:Installed

ENDLOCAL