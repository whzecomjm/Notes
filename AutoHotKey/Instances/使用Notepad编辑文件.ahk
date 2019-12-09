#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;=================================使用notepad3快速打开文件=============================
; 现在使用 TC, 自带 F4 编辑.

Explorer_GetSelection(hwnd="")   ;函数
{  
    WinGet, process, processName, % "ahk_id" hwnd := hwnd? hwnd:WinExist("A")  
    WinGetClass class, ahk_id %hwnd%  
    if (process != "explorer.exe")  
        return  
    if (class ~= "Progman|WorkerW") {  
            ControlGet, files, List, Selected Col1, SysListView321, ahk_class %class%  
            Loop, Parse, files, `n, `r  
                ToReturn .= A_Desktop "\" A_LoopField "`n"  
        } else if (class ~= "(Cabinet|Explore)WClass") {  
            for window in ComObjCreate("Shell.Application").Windows 
			{
				try{
                if (window.hwnd==hwnd)  
                    sel := window.Document.SelectedItems  
				}catch e {
					continue
				}
			}
            for item in sel  
                ToReturn .= item.path "`n"  
        }  
    return Trim(ToReturn,"`n")  
}


$#n:: 
;win+n 打开文件, 如果listary 工具栏存在使用 listary 自带
;如果没有选中文件, 则新建 notpad3 窗口, 无效时关闭 explorer 窗口重新打开即可
IfWinActive ahk_class Listary_WidgetWin_0
{
Send #n
return
}
else
{
path :=% Explorer_GetSelection(hwnd) ;调用了函数
Software = D:\Program Files\TotalCMD\Tools\Notepad3.exe
Run, %Software% "%path%"
return
}