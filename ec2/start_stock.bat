@echo off
setlocal
cls

call ec2_ids.bat

aws ec2 start-instances --instance-ids %stock-ec2-id% --output table

:::: Wait for ec2 state to go from pending to running
call while_pending.bat

endlocal
