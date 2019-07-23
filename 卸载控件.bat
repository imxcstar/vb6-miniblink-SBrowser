@echo off
if %PROCESSOR_ARCHITECTURE% == AMD64 (
if not exist "%windir%\Syswow64\SBrowser_G.ocx" goto ends
regsvr32 "%windir%\Syswow64\SBrowser_G.ocx" /s /u
del /f /s /q "%windir%\Syswow64\SBrowser_G.ocx"
del /f /s /q "%windir%\Syswow64\node.dll"
) else (
if not exist "%windir%\System32\SBrowser_G.ocx" goto ends
regsvr32 "%windir%\System32\SBrowser_G.ocx" /s /u
del /f /s /q "%windir%\System32\SBrowser_G.ocx"
del /f /s /q "%windir%\System32\node.dll"
)
:ends