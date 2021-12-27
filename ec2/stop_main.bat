@echo off
setlocal ENABLEDELAYEDEXPANSION
::cls

call ec2_ids.bat

aws ec2 stop-instances --instance-ids %main-ec2-id% --output table

:: Wait for ec2 state to go from pending to running
call while_stopping.bat

endlocal
