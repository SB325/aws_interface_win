@echo off
SETLOCAL 
::cls

call %~dp0\rds_ids.bat

echo Database Status:
aws rds describe-db-instances --query "DBInstances[*].[DBInstanceIdentifier,DBInstanceStatus]" --output table

ENDLOCAL
