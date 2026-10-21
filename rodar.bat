@rem Conversor PDF Office — © 2026 Heraldo Antunes — Licença MIT (ver LICENSE)
@echo off
echo Iniciando o conversor via PowerShell...
powershell.exe -ExecutionPolicy Bypass -File "%~dp0converterPDF.ps1"
pause