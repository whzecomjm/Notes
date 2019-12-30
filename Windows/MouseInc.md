# MouseInc 教程和注意事项

MouseInc是一款小巧好用的鼠标手势软件。便携化设计，单文件，无依赖，放在哪里都能运行。首次运行时会在当前目录释放MouseInc.json配置文件。

MouseInc 的官方教程和配置方法见 [MouseInc 手册](https://docs.shuax.com/MouseInc/#/)。在json设置里每个地址要加双引号，且本身内部的双引号和斜杠都要转义，**文件路径中需要使用`\\`而不是`\`，双引号应该使用`\"`而不是`"`。**参见下面打开TIM的方式。

- 常用的配置是：↑ = 复制，↓=粘贴，↖=剪切， ↘=粘贴加回车，←=后退，→=前进。

- Google 搜索选中内容： 

  ```json
  [ [ "SendKeys", "Ctrl+C" ], [ "Execute", "https://www.google.com/search?q=%clipboard%" ] ]
  [ [ "SendKeys", "Ctrl+C" ], [ "Execute", "https://translate.google.com/?source=osdd#auto|auto|%clipboard%" ] ]	
  ```
  
- 截图参考+复制：`[ [ "Screenshot", "ToClipboard" ], [ "Screenshot", "Reference" ] ]`.

- 打开系统属性：`[ [ "Execute", "rundll32 shell32.dll,Control_RunDLL sysdm.cpl,,1" ] ]`

- 锁屏：`[["Execute", "rundll32 user32.dll,LockWorkStation"]]` 

- 控制面板：`[["Execute", "rundll32 shell32.dll,Control_RunDLL"]]`

- Everything搜索选中内容：`[["SendKeys", "Ctrl+C"], ["Execute", "Everything.exe -s %clipboard%"]]`

- 打开TIM：`[["Execute", "\"C:\\Program Files (x86)\\Tencent\\TIM\\Bin\\TIM.exe\""]]`



另外，使用系统截屏键可以自动高清截屏当前窗口。



whzecomjm
2019-12-30 21:43



