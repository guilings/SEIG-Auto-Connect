# InterKnot Auth Linux 版本安装指南

## 快速安装

### 1. 安装系统依赖

```bash
cd scripts
sudo ./install_dependencies.sh
cd ..
```

### 2. 修复 OpenCV Qt plugins 冲突

```bash
cd scripts
sudo ./fix_opencv_qt.sh
cd ..
```

### 3. 创建 Python 虚拟环境并安装依赖

```bash
python3 -m venv .env
source .env/bin/activate
pip install -r requirements.txt
```

### 4. 启动程序

```bash
source .env/bin/activate
python main.py
```

或者使用启动脚本：

```bash
cd scripts
./run.sh
```

## 自动安装脚本

创建一个自动安装脚本 `install.sh`：

```bash
#!/bin/bash
set -e

echo "正在安装 InterKnot Auth..."

# 安装系统依赖
cd scripts
sudo ./install_dependencies.sh
sudo ./fix_opencv_qt.sh
cd ..

# 创建虚拟环境
python3 -m venv .env
source .env/bin/activate

# 安装 Python 依赖
pip install -r requirements.txt

echo "安装完成！"
echo "运行 'source .env/bin/activate && python main.py' 启动程序"
```

## 卸载

```bash
deactivate  # 退出虚拟环境
rm -rf .env interknot-auth-linux  # 删除文件
```

## 系统要求

- Ubuntu 20.04+ 或其他 Linux 发行版
- Python 3.8+
- Java 运行环境（可选，用于 jar 登录）

## 故障排除

详见 README.md 中的故障排除部分。
