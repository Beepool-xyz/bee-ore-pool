@echo off

REM 检查是否传入了钱包地址参数
if "%~1"=="" (
    echo Usage: %~nx0 ^<wallet_address^>
    exit /b 1
)

set WALLET_ADDRESS=%~1
set COMMAND=mine-win.exe --url=http://orepool.xyz:8080 --address=%WALLET_ADDRESS%

REM 无限循环，除非明确退出
:loop
    REM 执行命令
    echo Starting command: %COMMAND%
    %COMMAND%

    REM 打印退出状态
    set EXIT_STATUS=%ERRORLEVEL%
    echo Command exited with status %EXIT_STATUS%

    REM 休眠几秒后重启（可选）
    timeout /t 1 /nobreak >nul

goto loop
