@echo off
REM RedNorte Platform - One-Click Startup
REM Ejecuta el script completo en una nueva ventana PowerShell

echo Iniciando RedNorte Platform...
echo.

REM Ejecutar el script PowerShell completo
powershell -NoProfile -ExecutionPolicy Bypass -Command "& '%~dp0start-complete.ps1'"

pause
