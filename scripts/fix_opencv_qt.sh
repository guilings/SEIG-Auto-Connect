#!/bin/bash
# 修复 OpenCV Qt plugins 冲突
# 此脚本需要 sudo 权限

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "正在修复 OpenCV Qt plugins 冲突问题..."
echo "此操作需要 sudo 权限"

# 方案 1: 备份并移除 OpenCV 的 Qt plugins
OPENCV_QT_PLUGINS="$SCRIPT_DIR/.env/lib/python3.13/site-packages/cv2/qt/plugins"
OPENCV_QT_BACKUP="$SCRIPT_DIR/.env/lib/python3.13/site-packages/cv2/qt/plugins.disabled"

if [ -d "$OPENCV_QT_PLUGINS" ]; then
    echo "正在备份 OpenCV Qt plugins 到 plugins.disabled..."
    sudo mv "$OPENCV_QT_PLUGINS" "$OPENCV_QT_BACKUP"
    echo "✓ OpenCV Qt plugins 已被禁用"
else
    echo "! OpenCV Qt plugins 目录不存在或已被禁用"
fi

# 方案 2: 检查 PyQt5 的 plugins 是否存在
PYQT5_PLUGINS="$SCRIPT_DIR/.env/lib/python3.13/site-packages/PyQt5/Qt5/plugins/platforms"
if [ -d "$PYQT5_PLUGINS" ]; then
    echo "✓ PyQt5 plugins 存在"
else
    echo "! PyQt5 plugins 不存在，可能需要重新安装 PyQt5"
    echo "  运行: .env/bin/pip install --force-reinstall PyQt5"
fi

echo ""
echo "修复完成！现在可以运行: ./run.sh"
