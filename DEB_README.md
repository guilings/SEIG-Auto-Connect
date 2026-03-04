# InterKnot Auth Debian 包

## 📦 包信息

- **包名**: interknot-auth
- **版本**: 1.5
- **架构**: amd64
- **大小**: 54 MB
- **文件**: `interknot-auth_1.5_amd64.deb`

## 🚀 安装方法

### 方式 1: 使用 dpkg 安装

```bash
sudo dpkg -i interknot-auth_1.5_amd64.deb
```

如果有依赖问题，运行：

```bash
sudo apt-get install -f
```

### 方式 2: 使用 gdebi 安装（推荐）

```bash
sudo gdebi interknot-auth_1.5_amd64.deb
```

gdebi 会自动处理依赖关系。

## 📋 系统要求

### 必需依赖
- Python 3 (>= 3.8)
- python3-pyqt5
- python3-pip
- Java 运行环境 (default-jre 或 java-runtime)

### 推荐依赖
- python3-paddleocr
- python3-paddlepaddle

## 📂 安装位置

- **应用程序**: `/opt/interknot-auth/`
- **启动脚本**: `/usr/bin/interknot-auth`
- **桌面文件**: `/usr/share/applications/interknot-auth.desktop`
- **自动启动**: `/etc/xdg/autostart/interknot-auth.desktop`

## 🎯 使用方法

### 从应用程序菜单启动

在桌面环境中搜索 "InterKnot Auth" 或 "SEIG虚空终端"

### 从命令行启动

```bash
interknot-auth
```

### 自动登录

程序会在首次启动时自动配置 Python 虚拟环境并安装依赖。

## 🔧 首次安装后的配置

首次安装时，postinst 脚本会自动：

1. 创建 Python 虚拟环境
2. 安装所有 Python 依赖
3. 修复 OpenCV Qt plugins 冲突
4. 创建桌面快捷方式

## 🗑️ 卸载方法

### 仅删除程序，保留配置

```bash
sudo apt-get remove interknot-auth
```

### 完全删除（包括配置）

```bash
sudo apt-get purge interknot-auth
```

### 清理依赖包

```bash
sudo apt-get autoremove
```

## 📝 更新日志

### Version 1.5-1
- 初始 Debian 包发布
- 修复跨平台兼容性问题
- 替换 OCR 库为 PaddleOCR
- 添加 Java 运行环境检测
- 支持 Wayland 显示协议
- 修复 OpenCV Qt plugins 冲突

## ⚠️ 已知问题

1. **Wayland 警告**: 在 Wayland 会话上可能显示警告，但程序可以正常运行（使用 xcb 后端）

2. **OpenCV Qt plugins**: 安装脚本会自动禁用 OpenCV 的 Qt plugins 以避免与 PyQt5 冲突

3. **PaddleOCR 首次运行**: 首次运行 PaddleOCR 会下载模型文件，可能需要一些时间

## 🐛 故障排除

### 问题：程序无法启动

**解决方案 1**: 检查虚拟环境
```bash
ls -la /opt/interknot-auth/.env
```

**解决方案 2**: 重新安装
```bash
sudo apt-get install --reinstall interknot-auth
```

### 问题：依赖安装失败

**解决方案**: 手动安装依赖
```bash
cd /opt/interknot-auth
sudo python3 -m venv .env
.env/bin/pip install -r requirements.txt
```

### 问题：Qt platform plugin 错误

**解决方案**: 检查 OpenCV Qt plugins 是否被禁用
```bash
ls -la /opt/interknot-auth/.env/lib/python3*/site-packages/cv2/qt/
```

应该看到 `plugins.disabled` 目录。

## 📞 技术支持

如有问题，请查看：
- 项目 README
- LINUX_MIGRATION.md
- 构建日志: `build.log`
