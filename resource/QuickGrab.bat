@echo off
setlocal

set "outputFolder=%~dp0Outputs"

if not exist "%outputFolder%" (
    mkdir "%outputFolder%"
)

:loop
if "%1"=="" goto end

if "%1"=="-a" (
    wmic baseboard get product,manufacturer,version,serialnumber > "%outputFolder%\MBoutput.txt"
) else if "%1"=="-b" (
    wmic csproduct get UUID > "%outputFolder%\HWIDout.txt"
) else if "%1"=="-c" (
    echo Option C detected - Debug
) else (
	echo Unrecognized Option: %1, Available options are -a and -b.
)

shift
goto loop

:end

echo Done.
endlocal
