#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;---------------------修改CapsLock键---------------------
;修改CapsLock为enter键，CapsLock改为Alt+CapsLock
$CapsLock::Enter
LAlt & Capslock::SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"

;---------------------修改右边Appskey为鼠标左键，ctrl为右键---------------------
RAlt::LButton ;右边Alt修改为鼠标左键
$RAlt::Click ;只能使用点击，不能拖拽
#MaxHotKeysPerInterval	200000000
$AppsKey::RButton ; 
$RCtrl::!^Tab
;修改Fn为Numlk是不可能的，Fn见是写在硬件上的，无法通过软件改变

; ---------------------将删除改为永久删除---------------------
Del::
send +{delete}
sleep, 500
Send {Enter}
return


;---------------------隐藏windows任务栏功能---------------------
^`::
IfWinExist,ahk_class Shell_TrayWnd
{
WinHide ahk_class Shell_TrayWnd ;隐藏任务栏
}
Else
{
WinShow ahk_class Shell_TrayWnd ;显示任务栏
}
return


