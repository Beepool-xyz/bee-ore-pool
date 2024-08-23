#!/bin/bash

COMMAND="./mine --url=http://orepool.xyz:8080 --address=钱包地址"


# 无限循环，除非明确退出
while true; do
    # 执行命令
    echo "Starting command: $COMMAND"
    $COMMAND

    # 打印退出状态
    EXIT_STATUS=$?
    echo "Command exited with status $EXIT_STATUS"

    # 休眠几秒后重启（可选）
    sleep 1
done
