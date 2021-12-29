@echo off
SETLOCAL 
cls

echo EC2 Instances:
call ec2\instance_status.bat

echo RDS Instances:
call rds\instance_status.bat

ENDLOCAL
