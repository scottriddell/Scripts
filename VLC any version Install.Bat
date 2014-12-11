IF EXIST "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" GOTO Installed
IF EXIST "C:\Program Files\VideoLAN\VLC\vlc.exe" GOTO Installed

start /wait "Installing VLC 2.1.3..." "%~dp0vlc-2.1.3-win32.exe" /S

:Installed