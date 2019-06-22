#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;==========Puck 快速施法==========


#IfWinActive ahk_class SDL_app,
Lwin:: ; 杀死win键，改为一键必杀
    return
    
ScrollLock::Suspend
        
e:: ;puck
    send e
    sleep 80
    send w
    return

#IfWinActive
