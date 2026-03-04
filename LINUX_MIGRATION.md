# Linux 跨平台迁移说明

本项目已从Windows专用版本修改为支持Windows和Linux的跨平台版本。

## 主要修改内容

### 1. main.py 文件修改

#### 导入模块修改
- **原代码**: 使用Windows特定的 `win32com.client` 和 `msvcrt`
- **新代码**: 使用 `platform` 模块检测操作系统,并根据系统类型导入相应模块
  - Windows: `win32com.client`, `msvcrt`, `ctypes`
  - Linux: `fcntl` (用于文件锁定)

#### 开机自启功能 (`add_to_startup` 方法)
- **Windows**: 使用 `win32com.client` 创建快捷方式到启动文件夹
  ```python
  # 路径: %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
  ```
- **Linux**: 创建 `.desktop` 文件到 `~/.config/autostart/`
  ```python
  # 路径: ~/.config/autostart/seig-auto-connect.desktop
  ```

#### URL打开方式
- **原代码**: `os.system("start https://cmxz.top/SAC")` (Windows特定)
- **新代码**: `web.open("https://cmxz.top/SAC")` (跨平台)

#### 文件锁定机制 (防止重复运行)
- **Windows**: 使用 `msvcrt.locking()`
- **Linux**: 使用 `fcntl.flock()`

#### 错误提示框
- **Windows**: 使用 `ctypes.windll.user32.MessageBoxW()`
- **Linux**: 使用 `QMessageBox` (Qt组件)

### 2. modules/Watch_dog.py 文件修改

#### 网络状态检测
- **Windows**: 使用 `NetworkListManager` (NLM) COM组件
  ```python
  win32com.client.Dispatch("{DCB00C01-570F-4A9B-8D69-199FDBA5723B}")
  ```
- **Linux**: 使用系统命令和网络接口文件
  ```python
  # 方法1: 使用 ip 命令
  subprocess.run(['ip', 'link', 'show'])

  # 方法2: 读取 /proc/net/dev 文件
  # 检查网络接口状态和数据传输
  ```

#### COM组件清理
- 仅在Windows系统上调用 `pythoncom.CoUninitialize()`

### 3. modules/Jar_Thread.py 文件修改

#### Java可执行文件名
- **原代码**: 硬编码 `java.exe`
- **新代码**: 根据操作系统选择
  - Windows: `java.exe`
  - Linux: `java`

### 4. requirements.txt 文件修改

添加了条件依赖说明:
```txt
# Windows特定依赖 (仅在Windows系统上需要安装)
# pywin32; sys.platform == 'win32'
```

## Linux系统使用说明

### 1. 安装依赖

```bash
pip install -r requirements.txt
```

注意: Linux系统不需要安装 `pywin32`

### 2. 准备Java运行环境

确保项目目录中包含:
- `jre/bin/java` (Linux版本)
- `login.jar`

如果缺少Linux版本的JRE,可以从以下方式获取:
```bash
# 检查系统Java版本
java -version

# 或者使用OpenJDK
sudo apt-get install openjdk-11-jre  # Ubuntu/Debian
```

### 3. 运行程序

```bash
python main.py
```

### 4. 开机自启

在Linux上启用开机自启会创建以下文件:
- 文件位置: `~/.config/autostart/seig-auto-connect.desktop`
- 需要确保main.py有执行权限: `chmod +x main.py`

### 5. 网络检测

Linux版本使用以下方式进行网络检测:
- `ip link show` 命令检查网络接口状态
- `/proc/net/dev` 文件检查网络接口数据传输

确保系统已安装 `ip` 命令:
```bash
# Debian/Ubuntu
sudo apt-get install iproute2

# RHEL/CentOS
sudo yum install iproute
```

## Windows系统使用说明

Windows系统的使用方式不变,但需要安装额外的依赖:

```bash
pip install -r requirements.txt
pip install pywin32
```

## 兼容性说明

### 完全支持的功能
- ✅ 账号登录/登出
- ✅ 自动重连
- ✅ 多拨登录
- ✅ 看门狗功能
- ✅ 开机自启
- ✅ 密码保存
- ✅ 托盘最小化

### 平台差异
- **Windows**: 使用原生Windows API和组件
- **Linux**: 使用系统命令和Qt组件

### 已知限制
1. Linux版本的网络检测依赖系统命令,不同发行版可能略有差异
2. Linux版本的开机自启依赖于桌面环境的 `.desktop` 文件支持
3. 某些图形界面特性在不同桌面环境下表现可能不同

## 故障排除

### Linux系统问题

#### 1. 提示找不到Java
```bash
# 检查Java路径
ls -l jre/bin/java

# 或修改Jar_Thread.py中的路径
java_executable = "/usr/bin/java"  # 使用系统Java
```

#### 2. 网络检测失败
```bash
# 检查ip命令是否可用
ip link show

# 检查网络接口
cat /proc/net/dev
```

#### 3. 开机自启不工作
```bash
# 检查.desktop文件
cat ~/.config/autostart/seig-auto-connect.desktop

# 检查文件权限
chmod +x main.py
```

#### 4. 文件锁定警告
如果看到"另一个程序正在运行"的警告,但实际上没有运行:
```bash
# 删除锁文件
rm ~/.Seig-auto-connect.lock
```

## 开发者注意事项

1. **测试**: 在两个平台上都进行充分测试
2. **依赖**: 使用条件导入处理平台特定模块
3. **路径**: 使用 `os.path` 和 `platform` 模块处理跨平台路径
4. **API**: 优先使用跨平台的Python标准库和第三方库
5. **错误处理**: 为不同平台提供适当的错误处理机制

## 更新日期
2026-03-04