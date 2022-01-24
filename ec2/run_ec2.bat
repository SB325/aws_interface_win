@echo off
setlocal 
cls

call ec2_ids.bat

aws ssm start-session --target %main-ec2-id%
stop_main.bat

endlocal
