@echo off
@set root=%~dp0
if %PROCESSOR_ARCHITECTURE% == AMD64 (
if exist "%windir%\Syswow64\SBrowser_G_202.ocx" goto ends
xcopy "%root%SBrowser_G_202.ocx" "%windir%\Syswow64\" /s/y
xcopy "%root%node.dll" "%windir%\Syswow64\" /s/y
regsvr32 %windir%\Syswow64\SBrowser_G_202.ocx /s
) else (
if exist "%windir%\System32\SBrowser_G_202.ocx" goto ends
xcopy "%root%SBrowser_G_202.ocx" "%windir%\System32\" /s/y
xcopy "%root%node.dll" "%windir%\System32\" /s/y
regsvr32 %windir%\System32\SBrowser_G_202.ocx /s)
:ends