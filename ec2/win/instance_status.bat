@echo off
setlocal
cls

call ec2_ids.bat
aws ec2 describe-instances --query "Reservations[*].Instances[*].[Tags[].Value,State.Name]" --output table

::echo *****Stopped Instances*****
:: Get set of stoppped ec2 instances
::aws ec2 describe-instances --filters Name=instance-state-name,Values=stopped --query "Reservations[*].Instances[*].[Tags[].Value[],InstanceId]" --output text 

::echo *****Running Instances*****
:: Get set of running ec2 instances
::aws ec2 describe-instances --filters Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].[Tags[].Value[],InstanceId]" --output text 

::echo *****Stopping Instances*****
:: Get set of pending ec2 instances
::aws ec2 describe-instances --filters Name=instance-state-name,Values=stopping --query "Reservations[*].Instances[*].[Tags[].Value[],InstanceId]" --output text 

::echo *****Pending Instances*****
:: Get set of pending ec2 instances
::aws ec2 describe-instances --filters Name=instance-state-name,Values=pending --query "Reservations[*].Instances[*].[Tags[].Value[],InstanceId]" --output text 

endlocal
