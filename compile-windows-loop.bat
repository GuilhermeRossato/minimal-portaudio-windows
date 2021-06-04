@echo off
title Setting environment
SET "ENVSCRIPT=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
if not exist "%ENVSCRIPT%" (
	echo Error: Missing Microsoft Visual Studio 2019 enviroment 'vcvars64' script
	echo You may try to compile it but 'cl.exe' might fail
	pause
) else (
	call "%ENVSCRIPT%"
)
WHERE cl
IF %ERRORLEVEL% NEQ 0 (
	echo Error: Could not find 'cl.exe', the Microsoft C/C++ Optimizing Compiler used by this script to compile
	echo Ensure it is installed and available at the path enviroment variable
	pause
	exit
)
:start
title Compiling and Executing
cl /nologo /DPA_USE_WMME /DWIN32 /D_WINDOWS /Ob0 /O2 /I./portaudio/include /I./portaudio/src/common main.c ./portaudio/src/common/pa_allocation.c ./portaudio/src/common/pa_dither.c ./portaudio/src/common/pa_converters.c ./portaudio/src/common/pa_cpuload.c ./portaudio/src/common/pa_stream.c ./portaudio/src/common/pa_process.c ./portaudio/src/os/win/pa_win_util.c ./portaudio/src/os/win/pa_win_hostapis.c ./portaudio/src/os/win/pa_win_waveformat.c ./portaudio/src/os/win/pa_win_wdmks_utils.c ./portaudio/src/os/win/pa_win_coinitialize.c ./portaudio/src/common/pa_front.c ./portaudio/src/hostapi/wmme/pa_win_wmme.c && echo. && main.exe 1
title Waiting for key to recompile
echo.
pause
goto start