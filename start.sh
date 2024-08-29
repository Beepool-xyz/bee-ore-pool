#!/bin/bash

# 检查是否传入了钱包地址参数
if [ -z "$1" ]; then
    echo "Usage: $0 <wallet_address>"
    exit 1
fi

WALLET_ADDRESS=$1

COMMAND="./mine-linux --url=http://orepool.xyz:8080 --address=$WALLET_ADDRESS"

trap "echo 'Script interrupted'; exit" SIGINT

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
