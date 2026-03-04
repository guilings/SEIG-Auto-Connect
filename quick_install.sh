#!/bin/bash
# InterKnot Auth 快速安装脚本

set -e

VERSION="1.5"
echo "========================================="
echo "  InterKnot Auth v$VERSION 安装向导"
echo "========================================="
echo ""

# 检查 Python 版本
echo "检查系统环境..."
if ! command -v python3 &> /dev/null; then
    echo "错误: 未找到 Python 3"
    echo "请先安装 Python 3.8 或更高版本"
    exit 1
fi

PYTHON_VERSION=$(python3 --version | awk '{print $2}')
echo "✓ Python 版本: $PYTHON_VERSION"

# 检查是否在正确的目录
if [ ! -f "main.py" ] || [ ! -f "login.jar" ]; then
    echo "错误: 请在 interknot-auth-linux 目录中运行此脚本"
    exit 1
fi

echo "✓ 找到程序文件"
echo ""

# 安装系统依赖
echo "========================================="
echo "步骤 1/4: 安装系统依赖"
echo "========================================="
echo "此操作需要 sudo 权限"
echo ""

if [ -d "scripts" ]; then
    cd scripts
    sudo ./install_dependencies.sh
    sudo ./fix_opencv_qt.sh
    cd ..
else
    echo "警告: scripts 目录不存在，跳过系统依赖安装"
fi

echo ""
echo "✓ 系统依赖安装完成"
echo ""

# 创建虚拟环境
echo "========================================="
echo "步骤 2/4: 创建 Python 虚拟环境"
echo "========================================="

if [ -d ".env" ]; then
    echo "虚拟环境已存在，跳过创建"
else
    echo "正在创建虚拟环境..."
    python3 -m venv .env
    echo "✓ 虚拟环境创建完成"
fi

# 激活虚拟环境
source .env/bin/activate
echo "✓ 虚拟环境已激活"
echo ""

# 安装 Python 依赖
echo "========================================="
echo "步骤 3/4: 安装 Python 依赖"
echo "========================================="
echo "这可能需要几分钟时间..."
echo ""

pip install --upgrade pip
pip install -r requirements.txt

echo ""
echo "✓ Python 依赖安装完成"
echo ""

# 检查 Java（可选）
echo "========================================="
echo "步骤 4/4: 检查 Java 环境"
echo "========================================="

if command -v java &> /dev/null; then
    JAVA_VERSION=$(java --version 2>&1 | head -1)
    echo "✓ 检测到 Java: $JAVA_VERSION"
    echo "Java 登录功能可用"
else
    echo "⚠️  未检测到 Java 环境"
    echo "Java 登录功能将不可用（可选）"
    echo "如需使用，请运行: sudo apt-get install default-jre"
fi

echo ""
echo "========================================="
echo "✓ 安装完成！"
echo "========================================="
echo ""
echo "启动程序:"
echo "  方法 1: source .env/bin/activate && python main.py"
echo "  方法 2: ./scripts/run.sh"
echo ""
echo "或者创建桌面快捷方式（如果使用 deb 包安装）"
echo ""

# 询问是否立即启动
read -p "是否现在启动程序? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "正在启动程序..."
    python main.py &
fi

echo ""
echo "感谢使用 InterKnot Auth!"
echo "如有问题，请查看 README.md"
