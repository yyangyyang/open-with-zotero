@echo off
setlocal enabledelayedexpansion

:: Set paths
set WHICH_TO_REGISTER=open_with_zotero.exe
set SCRIPT_DIR=%~dp0
set EXE_PATH=%SCRIPT_DIR%%WHICH_TO_REGISTER%

:: Check if EXE exists
if not exist "%EXE_PATH%" (
    echo [ERROR] %WHICH_TO_REGISTER% not found in the same directory.
    echo [INFO] Program execution completed. Exiting now.
    pause
    exit /b 1
)

:: Check if registry key exists
reg query "HKEY_CLASSES_ROOT\SystemFileAssociations\.pdf\shell\Open with Zotero\command" >nul 2>&1

if %errorlevel% == 0 (
    echo [INFO] Registry already contains 'Open with Zotero' command.
    set /p "USER_INPUT=>>>>>> Do you want to re-register it with the current path? (Y/N):"
    echo [INFO] User input: !USER_INPUT!
    if /i not "!USER_INPUT!"=="Y" (
        echo [INFO] Skipping re-registration.
        echo [INFO] Program execution completed. Exiting now.
        pause
        exit /b 0
    )
) else (
    echo [INFO] "Open with Zotero" not found in the registry. Proceeding to add it...
)
    :: Add command with EXE path and %1
reg add "HKEY_CLASSES_ROOT\SystemFileAssociations\.pdf\shell\Open with Zotero\command" /ve /d "\"%EXE_PATH%\" \"%%1\"" /f >nul
reg add "HKEY_CLASSES_ROOT\SystemFileAssociations\.pdf\shell\Open with Zotero" /v Icon /d "%EXE_PATH%,0" /f >nul

if %errorlevel% == 0 (
    echo [INFO] Registry key added successfully.
) else (
    echo [ERROR] Failed to add registry key.
    echo [HINT] Try running this script as an administrator.
    echo [INFO] Program execution completed. Exiting now.
    pause
    exit /b 1
)

endlocal
echo [INFO] Program execution completed. Exiting now.
pause
exit /b 0
