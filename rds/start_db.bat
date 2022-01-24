@echo off
setlocal 
::cls

call rds_ids.bat

::call pg_ctl -D "C:\Program Files\PostgreSQL\13\data" start

aws rds start-db-instance --db-instance-identifier %rds-id% --query "DBInstance.DBInstanceStatus.Value" --output table

endlocal
