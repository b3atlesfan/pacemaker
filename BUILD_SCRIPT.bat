@echo off
net sessions >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    ECHO you are Administrator
) ELSE (
    ECHO Electron needs Admin rights to build without errors.
    pause
    EXIT /B 1
)

cd /d "%~dp0" & :: This runs an admin script where its called.
pnpm run make
pause