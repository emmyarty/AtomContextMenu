@ECHO OFF
SET T=ATOM CONTEXT MENU  -  (forked from https://github.com/Zren/atom-windows-context-menu; no longer working)
SET I=SUCCESSFULLY INSTALLED
SET R=SUCCESSFULLY REMOVED
SET S=  
COLOR 97
CLS
ECHO %T%
ECHO.
ECHO.
IF EXIST %LOCALAPPDATA%\atom\atom.exe GOTO MENU
ECHO FAILED TO DETECT ATOM INSTALLATION AT %LOCALAPPDATA%\atom\
ECHO.
ECHO ABORTING SETUP
ECHO.
PAUSE
GOTO END

:MENU
ECHO %S%...........................................................
ECHO %S%Type 1, 2, or 0 to select option and then ENTER to confirm
ECHO %S%...........................................................
ECHO.
ECHO %S%1 - Install Context Menu Shortcuts
ECHO %S%2 - Remove Context Menu Shortcuts
ECHO %S%0 - EXIT
ECHO.
ECHO.
SET /P M="ENTER CHOICE:  "
IF %M%==1 GOTO INSTALL
IF %M%==2 GOTO UNINSTALL
IF %M%==0 GOTO END

:INSTALL
REG ADD "HKCU\SOFTWARE\Classes\*\shell\AtomContextMenu" /v "" /t REG_SZ /d "Open File with Atom" /f >nul 2>nul
REG ADD "HKCU\SOFTWARE\Classes\*\shell\AtomContextMenu" /v "Icon" /t REG_SZ /d "%LOCALAPPDATA%\atom\atom.exe" /f >nul 2>nul
REG ADD "HKCU\SOFTWARE\Classes\*\shell\AtomContextMenu\command" /v "" /t REG_SZ /d "%LOCALAPPDATA%\atom\atom.exe \"%%1\"" /f >nul 2>nul
REG ADD "HKCU\SOFTWARE\Classes\Directory\shell\AtomContextMenu" /v "" /t REG_SZ /d "Open Folder with Atom" /f >nul 2>nul
REG ADD "HKCU\SOFTWARE\Classes\Directory\shell\AtomContextMenu" /v "Icon" /t REG_SZ /d "%LOCALAPPDATA%\atom\atom.exe" /f >nul 2>nul
REG ADD "HKCU\SOFTWARE\Classes\Directory\shell\AtomContextMenu\command" /v "" /t REG_SZ /d "%LOCALAPPDATA%\atom\atom.exe \"%%1\"" /f >nul 2>nul
REG ADD "HKCU\SOFTWARE\Classes\Directory\Background\shell\AtomContextMenu" /v "" /t REG_SZ /d "Open Folder with Atom" /f >nul 2>nul
REG ADD "HKCU\SOFTWARE\Classes\Directory\Background\shell\AtomContextMenu" /v "Icon" /t REG_SZ /d "%LOCALAPPDATA%\atom\atom.exe" /f >nul 2>nul
REG ADD "HKCU\SOFTWARE\Classes\Directory\Background\shell\AtomContextMenu\command" /v "" /t REG_SZ /d "%LOCALAPPDATA%\atom\atom.exe \"%%V\"" /f >nul 2>nul
REG ADD "HKCU\SOFTWARE\Classes\LibraryFolder\Background\shell\AtomContextMenu" /v "" /t REG_SZ /d "Open Folder with Atom" /f >nul 2>nul
REG ADD "HKCU\SOFTWARE\Classes\LibraryFolder\Background\shell\AtomContextMenu" /v "Icon" /t REG_SZ /d "%LOCALAPPDATA%\atom\atom.exe" /f >nul 2>nul
REG ADD "HKCU\SOFTWARE\Classes\LibraryFolder\Background\shell\AtomContextMenu\command" /v "" /t REG_SZ /d "%LOCALAPPDATA%\atom\atom.exe \"%%V\"" /f >nul 2>nul
CLS
ECHO %T%
ECHO %S%%I%
ECHO.
PAUSE
CLS
ECHO %T%
ECHO %S%%I%
ECHO.
GOTO MENU

:UNINSTALL
REG DELETE "HKCU\SOFTWARE\Classes\*\shell\AtomContextMenu" /f >nul 2>nul
REG DELETE "HKCU\SOFTWARE\Classes\Directory\shell\AtomContextMenu" /f >nul 2>nul
REG DELETE "HKCU\SOFTWARE\Classes\Directory\Background\shell\AtomContextMenu" /f >nul 2>nul
REG DELETE "HKCU\SOFTWARE\Classes\LibraryFolder\Background\shell\AtomContextMenu" /f >nul 2>nul
CLS
ECHO %T%
ECHO %S%%R%
ECHO.
PAUSE
CLS
ECHO %T%
ECHO %S%%R%
ECHO.
GOTO MENU

:END
