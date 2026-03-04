# InterKnot Auth 1.5 - Deb 打包完成

## 🎉 构建成功

**包文件**: `interknot-auth_1.5_amd64.deb` (54 MB)

---

## 📦 包内容

### 应用程序文件
- 所有源代码和资源
- login.jar (38 MB)
- 配置文件和文档

### 安装位置
```
/opt/interknot-auth/          # 应用程序主目录
/usr/bin/interknot-auth       # 启动脚本
/usr/share/applications/      # 桌面快捷方式
/etc/xdg/autostart/          # 自动启动
```

### 自动化安装
- 创建 Python 虚拟环境
- 安装所有依赖
- 修复 OpenCV Qt plugins 冲突
- 设置桌面集成

---

## 🚀 快速开始

### 安装
```bash
sudo dpkg -i interknot-auth_1.5_amd64.deb
sudo apt-get install -f  # 如果有依赖问题
```

### 测试安装
```bash
./test_install.sh
```

### 运行
```bash
interknot-auth
```

### 卸载
```bash
sudo apt-get remove interknot-auth      # 删除程序
sudo apt-get purge interknot-auth       # 删除配置
```

---

## 🔧 构建脚本

| 脚本 | 说明 |
|------|------|
| `simple_build_deb.sh` | **主构建脚本** - 创建 deb 包 |
| `test_install.sh` | 测试安装和卸载 |
| `build_deb.sh` | 官方 dpkg-buildpackage 方式（备用） |

---

## 📋 包依赖

### 必需
- python3 (>= 3.8)
- python3-pyqt5
- python3-pip
- default-jre 或 java-runtime

### 推荐
- python3-paddleocr
- python3-paddlepaddle

---

## ✅ 已修复的问题

1. ✅ 跨平台兼容性（Linux/Windows/macOS）
2. ✅ OCR 库替换（ddddocr → paddleocr）
3. ✅ Java 运行环境检测
4. ✅ OpenCV Qt plugins 冲突
5. ✅ Wayland 显示协议支持
6. ✅ 自动化依赖安装

---

## 📁 项目文件结构

```
InterKnot_Auth-1.5/
├── interknot-auth_1.5_amd64.deb  ⭐ 打包好的 deb 文件
├── simple_build_deb.sh            ⭐ 构建脚本
├── test_install.sh                ⭐ 测试脚本
├── main.py                        # 主程序
├── modules/                       # 功能模块
│   ├── State.py                   # 全局状态（已修复跨平台）
│   ├── Login_Thread.py            # 登录线程（已替换 OCR）
│   └── Jar_Thread.py              # Java 登录（已修复检测）
├── requirements.txt               # Python 依赖
├── install_dependencies.sh        # 系统依赖安装
├── fix_opencv_qt.sh              # OpenCV 修复脚本
├── run.sh                        # 启动脚本
├── DEB_README.md                 # Deb 包使用说明
└── debian/                       # Debian 打包配置
    ├── control
    ├── postinst
    ├── prerm
    ├── postrm
    └── rules
```

---

## 🎯 下一步

### 分发
- 将 `interknot-auth_1.5_amd64.deb` 上传到服务器
- 创建 APT 仓库（可选）
- 发布到 GitHub Releases

### 测试
```bash
# 在干净的 Ubuntu 系统上测试
sudo dpkg -i interknot-auth_1.5_amd64.deb
interknot-auth
```

### 维护
- 更新版本号：修改 `simple_build_deb.sh` 中的 `VERSION`
- 重新构建：`./simple_build_deb.sh`

---

## 📞 文档

- `DEB_README.md` - Deb 包详细说明
- `README_CN.md` - 项目总体说明
- `LINUX_MIGRATION.md` - Linux 迁移指南
- `build.log` - 构建日志

---

**构建时间**: 2026-03-04
**版本**: 1.5-1
**维护者**: coffeedou
