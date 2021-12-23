@echo off
setlocal
cls

call ec2_ids.bat

aws ec2 start-instances --instance-ids %stock-ec2-id%

