#!/bin/bash
# InterKnot Auth 1.5 启动脚本

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# 检查 OpenCV Qt plugins 是否仍然存在
OPENCV_QT_PLUGINS="$SCRIPT_DIR/.env/lib/python3.13/site-packages/cv2/qt/plugins"
if [ -d "$OPENCV_QT_PLUGINS" ]; then
    echo "⚠️  检测到 OpenCV Qt plugins 冲突！"
    echo "请先运行: sudo ./fix_opencv_qt.sh"
    echo "或者手动运行: sudo ./install_dependencies.sh"
    exit 1
fi

# 设置环境变量
export QT_QPA_PLATFORM=xcb
export PADDLE_PDX_DISABLE_MODEL_SOURCE_CHECK=True
unset QT_PLUGIN_PATH

# 设置 PyQt5 的插件路径
PYQT5_PATH="$SCRIPT_DIR/.env/lib/python3.13/site-packages/PyQt5/Qt5/plugins"
if [ -d "$PYQT5_PATH" ]; then
    export QT_PLUGIN_PATH="$PYQT5_PATH"
fi

# 运行程序
echo "正在启动 InterKnot Auth 1.5..."
echo ""

"$SCRIPT_DIR/.env/bin/python" "$SCRIPT_DIR/main.py" "$@"
