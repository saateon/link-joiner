@echo off
setlocal
rem LinkJoiner launcher. Drag a .txt file onto this file, or double-click it.
set "INPUT=%~1"
if "%INPUT%"=="" set "INPUT=%~dp0input\links.txt"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0src\Join-Links.ps1" -InputPath "%INPUT%"
echo.
pause
