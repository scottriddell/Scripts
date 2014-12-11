setlocal

REM *********************************************************************
REM Environment customization begins here. Modify variables below.
REM *********************************************************************

REM Get ProductName from the Office product's core Setup.xml file.
set ProductName=Office14.PROPLUS

REM Set DeployServer to a network-accessible location containing the Office source files.
set DeployServer=\\matamatacollege.local\admininstalls$\Microsoft\Office\2013\Install

REM Set ConfigFile to the configuration file to be used for deployment REM (required)
set ConfigFile=%DeployServer%\ProPlus.WW\config.xml

REM Set LogLocation to a central directory to collect log files.
set LogLocation=%DeployServer%\Logging

set adminfile="%DeployServer%\Customizations\GeneralSettings.MSP"

REM *********************************************************************
REM Deployment code begins here. Do not modify anything below this line.
REM *********************************************************************

IF NOT "%ProgramFiles(x86)%"=="" SET WOW6432NODE=WOW6432NODE\

reg query HKEY_LOCAL_MACHINE\SOFTWARE\%WOW6432NODE%Microsoft\Windows\CurrentVersion\Uninstall\%ProductName%
REM if %errorlevel%==1 (goto DeployOffice) else (goto End)

REM If 1 returned, the product was not found. Run setup here.
:DeployOffice
xcopy "%DeployServer%\Icons\Desktop\*.*" "%ALLUSERSPROFILE%\Desktop\*.*" /y /h /r /c /k /e
start /wait %DeployServer%\setup.exe /config %ConfigFile% /adminfile %adminfile%

REM If 0 or other was returned, the product was found or another error occurred. Do nothing.
:End

Endlocal

