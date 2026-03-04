# InterKnot Auth 1.5 安装和运行指南

## 修复内容

### 1. 跨平台兼容性修复
- `modules/State.py`: 修复了 `APPDATA` 环境变量在 Linux 上不存在的问题
  - Windows: 使用 `APPDATA` 环境变量
  - Linux/macOS: 使用 `~/.config` 目录

### 2. OCR 库替换
- 从 `ddddocr` 替换为 `paddleocr`
- `modules/Login_Thread.py`: 更新了 OCR 调用方式以适配 PaddleOCR API
- `requirements.txt`: 更新了依赖包

### 3. Qt 平台兼容性
- `main.py`: 添加了 Wayland 会话支持和 Qt 平台配置

## 安装步骤

### 1. 安装系统依赖

```bash
sudo ./install_dependencies.sh
```

### 2. 修复 OpenCV Qt plugins 冲突

由于 `opencv-contrib-python` 包含的 Qt plugins 与 PyQt5 冲突，需要禁用它们：

```bash
sudo ./fix_opencv_qt.sh
```

### 3. 运行程序

```bash
./run.sh
```

## 故障排除

### 问题：程序无法启动，提示 "Could not load the Qt platform plugin"

**解决方案 1：** 运行修复脚本
```bash
sudo ./fix_opencv_qt.sh
```

**解决方案 2：** 手动安装系统依赖
```bash
sudo ./install_dependencies.sh
```

**解决方案 3：** 检查 PyQt5 是否正确安装
```bash
.env/bin/pip install --force-reinstall PyQt5
```

### 问题：权限不足

某些操作需要 sudo 权限，请使用：
```bash
sudo ./install_dependencies.sh
sudo ./fix_opencv_qt.sh
```

### 问题：PaddleOCR 模型下载慢

PaddleOCR 首次运行会下载模型文件，可能需要一些时间。如果网络连接有问题，可以设置代理：
```bash
export http_proxy=http://your-proxy:port
export https_proxy=http://your-proxy:port
./run.sh
```

## 文件说明

- `install_dependencies.sh`: 安装系统 xcb 相关库
- `fix_opencv_qt.sh`: 修复 OpenCV Qt plugins 冲突
- `run.sh`: 启动程序
- `requirements.txt`: Python 依赖包列表

## 更新日志

### v1.5
- 修复 Linux 平台兼容性问题
- 替换 OCR 库为 PaddleOCR
- 添加 Wayland 支持
- 提供自动化安装脚本
