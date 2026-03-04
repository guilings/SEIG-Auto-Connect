#!/bin/bash
# 安装 InterKnot Auth 1.5 所需的系统依赖

echo "正在更新软件包列表..."
sudo apt-get update

echo "正在安装 xcb 相关库..."
sudo apt-get install -y \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-render-util0 \
    libxcb-xinerama0 \
    libxcb-xkb1 \
    libxkbcommon-x11-0 \
    libxcb-cursor0 \
    libxcb-randr0 \
    libxcb-xfixes0 \
    libxcb-shape0 \
    libxcb-xinput0 \
    libxcb1 \
    libx11-6 \
    libxext6 \
    libxi6 \
    libfontconfig1 \
    libxrender1 \
    libgl1-mesa-glx

echo "系统依赖安装完成！"
echo "现在可以运行程序：.env/bin/python main.py"