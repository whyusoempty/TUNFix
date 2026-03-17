@echo off
setlocal
chcp 65001 >nul

set "SCRIPT_DIR=%~dp0"
set "PS_SCRIPT=%SCRIPT_DIR%TunDoctor.ps1"

net session >nul 2>&1
if not "%errorlevel%"=="0" (
    powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell -Verb RunAs -ArgumentList '-NoLogo -NoProfile -ExecutionPolicy Bypass -File ""%PS_SCRIPT%"" %*'"
    exit /b
)

powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%" %*
exit /b %errorlevel%
