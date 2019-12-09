#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force  ;脚本正在运行时, 启动该脚本时会跳过对话框并自动替换旧实例.
#NoTrayIcon  ;不显示托盘图标


; ======================== 程序快速切换===================
;指定程序之间 的 快捷键切换，如果没打开则打开
;链接：https://www.zhihu.com/question/19645501/answer/637425288
RunOrActivateProgram(Program, WorkingDir="", WindowSize=""){ 
    SplitPath Program, ExeFile 
    Process, Exist, %ExeFile% 
    PID = %ErrorLevel% 
    if (PID = 0) { 
    Run, %Program%, %WorkingDir%, %WindowSize% 
    }else{ 
    WinActivate, ahk_pid %PID% 
    } 
}

!z:: ;打开or切换Chrome浏览器  Alt+Z
RunOrActivateProgram("C:\Users\whzec\Documents\Cent\App\chrome.exe")
return 

!x:: ;打开or切换pdf Alt+X
RunOrActivateProgram("D:\Program Files\PDF-XChange Editor Plus\PDFXEdit.exe")
return

;打开or切换notepad3 Alt+N
!n::
RunOrActivateProgram("D:\Program Files\NotePad3\Notepad3\Notepad3.exe")
return 

;打开or切换Typora
;之前只有Typora不灵，这种方式就可以诶
!c::   ;Alt+C
DetectHiddenWindows, On
SetTitleMatchMode, 2
WinGet, winid, ID, Typora
;MsgBox,%winid%
SetTitleMatchMode, 1
If (winid) {
WinWait, ahk_id %winid%
WinShow
WinActivate
ControlFocus, EditComponent2, A
ControlSetText, EditComponent2,, A
}else{
RunOrActivateProgram("D:\Program Files\Typora\Typora.exe")
}
DetectHiddenWindows, Off
return




