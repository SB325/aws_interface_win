@echo off
setlocal 
::cls

call rds_ids.bat

aws rds start-db-instance --db-instance-identifier %rds-id% --output table

endlocal
