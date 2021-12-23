@echo off
setlocal
cls

call ec2_ids.bat

aws ec2 stop-instances --instance-ids %main-ec2-id% --output table

endlocal
