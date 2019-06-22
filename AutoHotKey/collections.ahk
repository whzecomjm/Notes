
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;~~~~~~~~~~~~~~~~~~~~~~~现在不用的学习代码~~~~~~~~~~~~~~~~~~~~~
/*---------------------更改中文符号---------------------
;双倍标点 或者 加一个句号 切换为中文标点
:*?:..::。   ;两个句号变成中文句号，?表示就算前面继续输入也要变换。
:*?:,,::，   ;两个逗号变成中文逗号
:*?:??::？ ;两个问号变成中文问号
:*?::.::：   ;英文冒号加上句号变成中文冒号;
:*?:;.::；   ;英文分号加上句号变成中文分号;
:*?:/.::、   ;英文斜杠号加上句号变成中文顿号;
:*?:'.::‘’{left}   ;英文单引号加上句号变成中文单引号;
:*?:`".::“”{left}   ;英文双引号加上句号变成中文双引号，此处需要用到反引号转义，更多参见http://ahkcn.sourceforge.net/docs/commands/_EscapeChar.htm。
*/

;---------------------快速输入当前时间---------------------
/*::@sj::
d = %A_YYYY%年%A_MM%月%A_DD%日%A_Hour%:%A_Min% ;:%A_Sec%
        ;获得系统时间比如今天的时间：2007-10-21。如果需要“年”的话请替换上面的“-”。
clipboard = %d% ;把 d 的值发送到剪贴板，变量是不用声明的，想引用变量的值，就在变量的前后加“%”。第二行的变量是 AHK 自带的变量。
Send ^v
return
*/

;---------------------显示时间/输入日期---------------------
/*
;使用win+t显示当前时间
;#t::
;MsgBox %A_YYYY%年%A_MM%月%A_DD%日%A_Hour%时%A_Min%分%A_Sec%秒
;return
*/

;---------------------修改CapsLock键---------------------
/*;修改CapsLock为enter键，CapsLock改为Alt+CapsLock
$CapsLock::Enter
LAlt & Capslock::SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"

;---------------------修改右边Appskey为鼠标左键，ctrl为右键---------------------
RAlt::LButton ;右边Alt修改为鼠标左键
$RAlt::Click ;只能使用点击，不能拖拽
#MaxHotKeysPerInterval	200000000
$AppsKey::RButton ; 
$RCtrl::!^Tab
;修改Fn为Numlk是不可能的，Fn见是写在硬件上的，无法通过软件改变
*/

; ---------------------将删除改为永久删除---------------------
/*Del::
send +{delete}
sleep, 500
Send {Enter}
return
*/

;---------------------隐藏windows任务栏功能---------------------
/*^`::
IfWinExist,ahk_class Shell_TrayWnd
{
WinHide ahk_class Shell_TrayWnd ;隐藏任务栏
}
Else
{
WinShow ahk_class Shell_TrayWnd ;显示任务栏
}
return
*/

;---------------------一键拷贝文件路径 Ctrl+win+c ---------------------
/*; 该功能已被Listary的功能替换
^#c::
; null= 
send ^c
sleep,200
clipboard=%clipboard% ;%null%
tooltip,%clipboard%
sleep,500
tooltip,
return
*/

;---------------------计时器---------------------
/*#t::
InputBox, time, 简单计时器, 请输入一个时间（单位是秒）
; 弹出一个输入框，标题是“煎蛋牌泡面专用计时器”，内容是“请输入一个时间（单位是秒）”
time := time*1000
; 如果一个变量要做计算的话，一定要像这样写，和平常的算式相比，多了一个冒号。sleep 的时间是按照千分之一秒算的，这里乘以 1000 就变成秒了。
Sleep,%time%
MsgBox 时间到了
return
*/

;下面的内容放在长注释也有问题，所以就单独（使用Emeditor）注释了。

;---------------------code comment 代码注释---------------------
;::ccmt::
;Send,/**`n  * 功能：  `n* 作者：whzecomjm `n* 时间：%A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% `n*/
;return


;----------------------更换分号和冒号，问号和斜杠---------------------
;$*/::
;    if GetKeyState("Shift")
;        Send {/ DownTemp}
;    else
;        Send {? DownTemp}
;    return
;$*/ up::
;    if GetKeyState("Shift")
;        Send {/ up}
;    else
;        Send {? up}
;    return

/*; -----------------一些不用的中文符号替换英文符号-----------------
; 参考<http://weishu.me/2016/02/01/avoid-switching-keyboard-in-markdown/>
(:: Send % "{ASC 0" . Asc("(") . "}" ;小括号
):: Send % "{ASC 0" . Asc(")") . "}" ;小括号
[:: Send % "{ASC 0" . Asc("[") . "}" ;中括号
]:: Send % "{ASC 0" . Asc("]") . "}" ;中括号
$:: Send % "{ASC 0" . Asc("$") . "}" ;美元符号
`:: Send % "{ASC 0" . Asc("``") . "}" ;反引号
^:: Send % "{ASC 0" . Asc("^") . "}" ;美元符号
*/


; =================5. 颜色神偷,颜色抓取====================
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

;=====================6. 热字串助手~win+H自动添加==================
#h::  ; Win+H 热键
; 获取当前选择的文本. 使用剪贴板代替
; "ControlGet Selected", 是因为它可以工作于更大范围的编辑器
; (即文字处理软件). 保存剪贴板当前的内容
; 以便在后面恢复. 尽管这里只能处理纯文本,
; 但总比没有好:
AutoTrim Off  ; 保留剪贴板中任何前导和尾随空白字符.
ClipboardOld := ClipboardAll
Clipboard := ""  ; 必须清空, 才能检测是否有效.
Send ^c
ClipWait 1
if ErrorLevel  ; ClipWait 超时.
    return
; 替换 CRLF 和/或 LF 为 `n 以便用于 "发送原始模式的" 热字串:
; 对其他任何在原始模式下可能出现问题
; 的字符进行相同的处理:
StringReplace, Hotstring, Clipboard, ``, ````, All  ; 首先进行此替换以避免和后面的操作冲突.
StringReplace, Hotstring, Hotstring, `r`n, ``r, All  ; 在 MS Word 等软件中中使用 `r 会比 `n 工作的更好.
StringReplace, Hotstring, Hotstring, `n, ``r, All
StringReplace, Hotstring, Hotstring, %A_Tab%, ``t, All
StringReplace, Hotstring, Hotstring, `;, ```;, All
Clipboard := ClipboardOld  ; 恢复剪贴板之前的内容.
; 这里会移动 InputBox 的光标到更人性化的位置:
SetTimer, MoveCaret, 10
; 显示 InputBox, 提供默认的热字串:
InputBox, Hotstring, New Hotstring, Type your abreviation at the indicated insertion point. You can also edit the replacement text if you wish.`n`nExample entry: :R:btw`::by the way,,,,,,,, :R:`::%Hotstring%
if ErrorLevel  ; 用户选择了取消.
    return
if InStr(Hotstring, ":R`:::")
{
    MsgBox You didn't provide an abbreviation. The hotstring has not been added.
    return
}
; 否则添加热字串并重新加载脚本:
FileAppend, `n%Hotstring%, %A_ScriptFullPath%  ; 在开始处放置 `n 以防文件末尾没有空行.
Reload
Sleep 200 ; 如果加载成功, reload 会在 Sleep 期间关闭当前实例, 所以永远不会执行到下面的语句.
MsgBox, 4,, The hotstring just added appears to be improperly formatted. Would you like to open the script for editing? Note that the bad hotstring is at the bottom of the script.
IfMsgBox, Yes, Edit
return

MoveCaret:
IfWinNotActive, New Hotstring
    return
; 否则移动 InputBox 中的光标到用户输入缩写的位置.
Send {Home}{Right 3}
SetTimer, MoveCaret, Off
return

