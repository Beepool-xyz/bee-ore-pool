#!/bin/bash

# 检查输入参数
if [ -z "$1" ]; then
  echo "Usage: $0 <mining_pool_address>"
  exit 1
fi

MINING_ADDRESS="$1"

# 获取脚本所在目录
SCRIPT_DIR=$(realpath $(dirname "$0"))

# 服务名称
SERVICE_NAME="oremine"
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}.service"
SERVER_SCRIPT="$SCRIPT_DIR/start.sh"

# 确保脚本目录存在
mkdir -p "$SCRIPT_DIR"

# 创建 start.sh 脚本
echo "Creating start.sh script..."
cat << EOF > "$SERVER_SCRIPT"
#!/bin/bash

# 从环境变量获取
MINING_ADDRESS=\$MINING_ADDRESS
SCRIPT_DIR=\$SCRIPT_DIR

COMMAND="\$SCRIPT_DIR/mine-linux --url=http://orepool.xyz:8080 --address=\$MINING_ADDRESS"
LOGFILE="\$SCRIPT_DIR/logfile.log"

# 确保日志目录存在
mkdir -p "\$(dirname "\$LOGFILE")"

echo "Starting command: \$COMMAND"
\$COMMAND 2>&1 | tee -a "\$LOGFILE"

# 打印退出状态
EXIT_STATUS=\$?
echo "Command exited with status \$EXIT_STATUS"
EOF

# 设置 start.sh 可执行权限
chmod +x "$SERVER_SCRIPT"

# 创建 systemd 服务文件
echo "Creating systemd service file..."
cat << EOF > "$SERVICE_FILE"
[Unit]
Description=Orepool server
After=network.target syslog.target
Wants=network.target

[Service]
Type=simple
Environment="MINING_ADDRESS=$MINING_ADDRESS"
Environment="SCRIPT_DIR=$SCRIPT_DIR"
ExecStart=$SERVER_SCRIPT
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# 重新加载 systemd 配置
echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

# 启用服务，使其开机自启
echo "Enabling $SERVICE_NAME service..."
sudo systemctl enable "$SERVICE_NAME"

# 启动服务
echo "Starting $SERVICE_NAME service..."
sudo systemctl start "$SERVICE_NAME"

# 检查服务状态
echo "Checking $SERVICE_NAME service status..."
sudo systemctl status "$SERVICE_NAME" --no-pager

# 输出完成信息
echo "$SERVICE_NAME service has been installed and started."

