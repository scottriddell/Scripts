SET ProductName={CC25012E-F764-4340-A90D-7AB95A10C46C}
                
reg query HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432NODE\Microsoft\Windows\CurrentVersion\Uninstall\%ProductName%
IF %errorlevel%==0 GOTO Installed

reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%ProductName%
IF %errorlevel%==0 GOTO Installed

start /wait "Installing Java" "%~dp0jre-8u25-windows-i586.exe" /s

reg delete HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run /v SunJavaUpdateSched /f
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v SunJavaUpdateSched /f

:Installed