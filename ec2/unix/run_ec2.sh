@echo off
setlocal
cls

if "%~1"=="" (
    echo No parameters have been provided.
    echo
    echo Arguments:
    echo main"
    echo stock"
    exit /b 0
    )

IF "%1"=="main" (
    ::echo "Starting main EC2 Instance"
    SET "instance=i-0cd2a955830fb3aae"
    )
IF "%1"=="stock" (
    ::echo "Starting stock EC2 Instance"
    SET "instance=i-0318bdd3d94e05756"
    )

IF "%instance%"=="" (
    echo "The instance id %instance% is empty! Exiting."
    exit /b 0) ELSE (
    echo "The instance id %instance% (%1) is starting!"
    aws ssm start-session --target %instance%
    )
    
endlocal
