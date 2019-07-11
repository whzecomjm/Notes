#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
 
#IfWinActive ahk_class SDL_app,
ScrollLock::Suspend

/*
; 原版冗长的运行暂停代码
stopped = 0 ;运行状态
suspend Off
F11:: ; F11改键暂停
    suspend permit
    suspend On
    stopped = 1
    return
F12:: ; F12改键开
    suspend permit
    suspend Off
    stopped = 0
    return
*/

Lwin:: ; 杀死win键，改为一键必杀
    ;suspend permit
    ;KeyWait LButton
    ;sleep 1500
    ;send b
    ;sleep 200
    ;send {LButton}
    ;send {Numpad7}
    ;sleep 100
    ;send {LButton}
    return
        
T:: ;天火
    send eeer
    sleep 200
    send n
    return

D:: ; 陨石
    send eewr
    sleep 250
    send n
    return
B:: ; 超声波
    send qwer
    sleep 150
    send n
    return
F:: ; 火人
    send qeer
    sleep 150
    send n
    return
C:: ; 雷暴
    send wwwr
    sleep 250
    send n
    return
Y:: ; 速冻
    send qqqr
    sleep 150
    send n
    return
V:: ; 幽灵漫步
    send qqwr
    sleep 150
    send n
    return
G:: ; 冰墙
    send qqer
    sleep 150
    send n
    return
Z:: ; 灵动迅捷
    send wwer
    sleep 150
    send n
    return
X:: ; 飓风
    send wwqr
    sleep 250
    send n
    return
#IfWinActive
