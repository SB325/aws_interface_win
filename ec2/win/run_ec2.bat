@echo off
setlocal
cls

call ec2_ids.bat

if "%~1"=="" (
    echo No parameters have been provided.
    echo
    echo Arguments:
    echo main"
    echo stock"
    exit /b 0
    )

IF "%1"=="main" (
    SET "instance=%main-ec2-id%"
    )
IF "%1"=="stock" (
    SET "instance=%stock-ec2-id%"
    )

IF "%instance%"=="" (
    echo "The instance id %instance% is empty! Exiting."
    exit /b 0) ELSE (
    echo "Starting SSM connection to: %1"
    call start_%1%.bat
    aws ssm start-session --target %instance%
    call stop_%1%.bat
    )

endlocal
