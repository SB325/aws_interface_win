@echo off
setlocal
cls

call ec2_ids.bat
aws ec2 start-instances --instance-ids %main-ec2-id% --output table 

:: Wait for ec2 state to go from pending to running
:: aws ec2 describe-instances --filters Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].[Tags[].Value[],InstanceId]" --output table 

endlocal
