<div align="center">
# SEIG-Auto-Connect

</div>

> [!WARNING]
> 为了保证项目的安全，请不要在大型公共平台分享，低调使用即可

> [!TIP]
> 原则上适用于所有广东的网页版esurfing<br>
> 提示：打包参数：nuitka --standalone --lto=yes --msvc=latest --disable-ccache --windows-console-mode=disable --windows-uac-admin --enable-plugin=pyqt5,upx --upx-binary=F:\Programs\upx\upx.exe  --output-dir=SAC --windows-icon-from-ico=yish.ico --nofollow-import-to=unittest main.py<br>打包完后需要将仓库中的Pyqt5(可能需要)、ddddocr文件夹覆盖进去(必须)，(因为UPX完Pyqt5会损坏，ddddocr没被打包进去)
## 感谢
> 教师账号验证码获取和自动获取登陆参数参考了前辈的代码[ESurfingPy-CLI](https://github.com/Pandaft/ESurfingPy-CLI)，自己原本搞得验证码一直过不了服务器<br><br>
> 学生端登录方式来自[ESurfingDialer](https://github.com/Rsplwe/ESurfingDialer)，用unidbg直接将加密函数为我所用，前辈的实现实在高明！我在此基础上添加了指定登录ip功能(虽然JVAV零基础，代码混乱不堪555)
>
> 两位前辈做得已经很棒了，或许我所做的只是把他们的代码弄得凌乱不堪吧 :)
## 使用方式

**开袋即食**<br><br>
*学生账号*：只需要输入账号密码登录即可<br>
*教师账号*：只需要输入账号密码登录即可<br><br>
**看门狗**：两种账号实现方式不一样，学生账号需要发心跳包，就已经是一种自带看门狗，不过关机后没发包了会断网<br>
教师账号可使用本程序的看门狗，每300s ping一次百度，不通就重连<br><br>
**指定登录ip**：指定需要登录账号上网的ip，可用于路由器多拨，也可以给你朋友临时隔空联网。需要注意：如果使用学生账号指定ip，会看到心跳包报错，因为你本机不会收到服务器发给指定ip的响应，但这不影响，只是报个错给你看<br><br>
**多拨**：你需要有刷了带多拨插件的路由器，利用单线多拨获取多个ip，然后使用此工具的指定ip功能登录上网，教师账号能拨两次，学生账号目前此工具实现的方式只能拨一次(也可以把舍友的抢过来)，通过多拨实现网速翻倍。<br><br>
**自动登录**：开启自动登录按钮，即可同时开启开机自启和启动后自动登录，*在当前版本1.0中，开机自启应该是不可用的，等待修复*

## 特色
- [x] !此工具不会收集您的任何账号密码信息!
- [x] 支持一键登录校园网账号，也可随意开热点
- [x] 支持自动获取登录参数
- [x] 自动登录功能，在启动软件时自动登录保存的账号
- [x] 教师账号自动识别验证码，如果失败5次，需要手动输入验证码
- [x] 看门狗，默认每300秒检测一次网络状态，若网络不通，自动重连
- [x] 对保存的密码低级加密
- [x] 按下最小化按钮可以隐藏进托盘 
- [x] 多拨功能实现网速翻倍

## TODO
- [x] 支持更多类型账号登录(1.0已实现...) 
      
## 下载链接
> https://github.com/Yish1/SEIG-Auto-Connect/releases
## 界面图片
> 主界面<br>
![49c00fe212deeb7918d62e90cdda5415](https://github.com/user-attachments/assets/6b11042f-811d-4aae-a2d0-822faccc5daa)<br>
> 最小化<br>
![image](https://github.com/user-attachments/assets/4785e962-ed25-4ec3-b13e-a39f6ac465db)


