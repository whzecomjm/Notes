#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;---------------------更改中文符号---------------------
;双倍标点 或者 加一个句号 切换为中文标点
:*?:..::。   ;两个句号变成中文句号，?表示就算前面继续输入也要变换。
:*?:,,::，   ;两个逗号变成中文逗号
:*?:??::？ ;两个问号变成中文问号
:*?::.::：   ;英文冒号加上句号变成中文冒号;
:*?:;.::；   ;英文分号加上句号变成中文分号;
:*?:/.::、   ;英文斜杠号加上句号变成中文顿号;
:*?:'.::‘’{left}   ;英文单引号加上句号变成中文单引号;
:*?:`".::“”{left}   ;英文双引号加上句号变成中文双引号，此处需要用到反引号转义，更多参见http://ahkcn.sourceforge.net/docs/commands/_EscapeChar.htm。


;----------------------更换分号和冒号，问号和斜杠---------------------
$*/::
    if GetKeyState("Shift")
        Send {/ DownTemp}
    else
        Send {? DownTemp}
    return
$*/ up::
    if GetKeyState("Shift")
        Send {/ up}
    else
        Send {? up}
    return
    
    
; -----------------一些不用的中文符号替换英文符号-----------------
; 参考<http://weishu.me/2016/02/01/avoid-switching-keyboard-in-markdown/>
(:: Send % "{ASC 0" . Asc("(") . "}" ;小括号
):: Send % "{ASC 0" . Asc(")") . "}" ;小括号
[:: Send % "{ASC 0" . Asc("[") . "}" ;中括号
]:: Send % "{ASC 0" . Asc("]") . "}" ;中括号
$:: Send % "{ASC 0" . Asc("$") . "}" ;美元符号
`:: Send % "{ASC 0" . Asc("``") . "}" ;反引号
^:: Send % "{ASC 0" . Asc("^") . "}" ;美元符号

