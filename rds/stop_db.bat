@echo off
setlocal 
::cls

call rds_ids.bat

aws rds stop-db-instance --db-instance-identifier %rds-id% --query "DBInstance.DBInstanceStatus.Value" --output table

endlocal

