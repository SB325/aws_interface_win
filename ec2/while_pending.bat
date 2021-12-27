@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

call ec2_ids.bat

:: Wait for ec2 state to go from pending to running
set command_="aws ec2 describe-instances --query Reservations[*].Instances[*].[State.Name,Tags[].Value] --output text"

call :get_output var1
if NOT %var1% == running (
        echo Waiting for status to go from %var1% to running...
) else (
exit /b 0
)

:while_loop
call :get_output var1
if NOT %var1% == running (
        goto :while_loop
)
echo %main-ec2-id% has successfully STARTED.
exit /b 0

:get_output
SET count=1
FOR /F "tokens=* USEBACKQ" %%F IN (`%command_%`) DO (
  SET var!count!=%%F
  SET /a count=!count!+1
)

endlocal
