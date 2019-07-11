
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



;---------------------一键拷贝文件路径 Ctrl+Shift+c ---------------------
; 该功能已被Listary的功能替换
^+c::
; null= 
send ^c
sleep,200
clipboard=%clipboard% ;%null%
tooltip,%clipboard%
sleep,500
tooltip,
return


;---------------------计时器---------------------
#t::
InputBox, time, 简单计时器, 请输入一个时间（单位是秒）
; 弹出一个输入框，标题是“煎蛋牌泡面专用计时器”，内容是“请输入一个时间（单位是秒）”
time := time*1000
; 如果一个变量要做计算的话，一定要像这样写，和平常的算式相比，多了一个冒号。sleep 的时间是按照千分之一秒算的，这里乘以 1000 就变成秒了。
Sleep,%time%
MsgBox 时间到了
return


;下面的内容放在长注释也有问题，所以就单独（使用Emeditor）注释了。


; ================= 颜色抓取====================
#c::
;配置Alt+Win+c按键
MouseGetPos, mouseX, mouseY
; 获得鼠标所在坐标，把鼠标的 X 坐标赋值给变量 mouseX ，同理 mouseY
PixelGetColor, color, %mouseX%, %mouseY%, RGB
; 调用 PixelGetColor 函数，获得鼠标所在坐标的 RGB 值，并赋值给 color
StringRight color,color,6
; 截取 color（第二个 color）右边的6个字符，因为获得的值是这样的：#RRGGBB，一般我们只需要 RRGGBB 部分。把截取到的值再赋给 color（第一个 color）。
clipboard = %color%
; 把 color 的值发送到剪贴板
tooltip, 鼠标所在颜色值已发送到剪贴板。
; tooltip 弹出鼠标提示的命令，后面加上要显示的语句。中间的 `n 表示回车
sleep 2000
; 时间暂停 两秒
tooltip,
; 关闭鼠标提示
return

