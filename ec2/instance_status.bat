@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
cls

call %~dp0\ec2_ids.bat

echo EC2 Instances:
aws ec2 describe-instances --query "Reservations[*].Instances[*].[State.Name,Tags[].Value]" --output table

ENDLOCAL
