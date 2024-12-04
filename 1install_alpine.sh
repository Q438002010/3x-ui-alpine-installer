#!/bin/bash

# 检查是否是 Alpine Linux
if ! grep -q "Alpine" /etc/os-release; then
  echo "此脚本仅支持 Alpine Linux！"
  exit 1
fi

# 更新包管理器
echo "更新系统包列表..."
apk update

# 安装必要依赖
echo "安装必要的依赖..."
apk add --no-cache bash curl wget

# 定义安装路径
INSTALL_PATH="/usr/local/x-ui"

# 创建安装目录
echo "创建安装目录..."
mkdir -p "$INSTALL_PATH"

# 下载主安装脚本
echo "下载主安装脚本..."
curl -Ls https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install.sh -o "$INSTALL_PATH/install.sh"

# 给下载的脚本赋予执行权限
chmod +x "$INSTALL_PATH/install.sh"

# 执行安装脚本
echo "执行安装脚本..."
bash "$INSTALL_PATH/install.sh"

# 清理安装临时文件
echo "清理临时文件..."
rm -rf "$INSTALL_PATH/install.sh"

echo "安装完成！"
