#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force  ;脚本正在运行时, 启动该脚本时会跳过对话框并自动替换旧实例.
#NoTrayIcon  ;不显示托盘图标


; ========================脚本的修改===============
F1:: ;用于使用Notepad3修改脚本, 保存后点击右上角运行即可
run "D:\Program Files\NotePad3\Notepad3\Notepad3.exe" "E:\Program Docs\AutoHotKey\whz.ahk"
return

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


;====================使用notepad3快速打开文件========================
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

;[Win] + Z ;一键拷贝文件路径 ;
#z::
clipboard := % Explorer_GetSelection(hwnd) ;调用了函数
Tooltip,%clipboard%	;在鼠标右侧显示【拷贝的文件路径】
Sleep,800
Tooltip,
return

$+^e:: ;ctrl+shift+e 打开文件, 如果listary 工具栏存在使用 listary 自带
IfWinActive ahk_class Listary_WidgetWin_0
{
Send +^e
return
}
else
{
path :=% Explorer_GetSelection(hwnd) ;调用了函数
Software = D:\Program Files\NotePad3\Notepad3\Notepad3.exe 
Run, %Software% "%path%"
return
}


;====================右键滚轮控制 Alt+Tab==========
; ~ 防止与 mouseInc 冲突
~RButton & WheelDown::AltTab
~RButton & WheelUp::ShiftAltTab

;========================程序快捷键====================
; 修饰符 win #, shift +, ctrl ^, alt !, 
; ~: 原有的功能不会被屏蔽 , 
; $: 只在脚本使用 Send 命令发送包含了热键自身的按键时才需要使用此符号 
; ================================================

;~LWin::Send {Bind}{vk07} ;禁用 Win 键, 已被 listarywin 替代.


#f:: ;打开 Everything
IfWinExist "Everything"
WinActivate
else
run "D:\Shortcuts\Everything.lnk"
Return

#m:: ;打开 Minipad2
IfWinNotExist ahk_exe minipad2.exe
run "D:\Shortcuts\minipad2.lnk"
Else IfWinExist 
WinActivate
Return

#k:: ;打开 KeePass
IfWinNotExist ahk_exe KeePass.exe
run "D:\Shortcuts\KeePass.lnk"
Else IfWinExist 
WinActivate
Return

^+a:: ;使用微信时用微信截图, 否则使用系统自带截图
IfWinActive, ahk_exe WeChat.exe
Send !a
else
Send #+s
return

;使用MouseInc的窗口截图并保存
PrintScreen::^PrintScreen 

$F4:: ;使用 f4 打开 ocr，如果已经打开则开始使用ocr
; $的使用参考 http://ahkcn.net/thread-816-post-10513.html#pid10513
; DetectHiddenWindows的使用参考 https://www.zhihu.com/question/19645501/answer/14383561
DetectHiddenWindows, on 
IfWinNotExist ahk_exe 天若OCR文字识别.exe
Run "D:\Program Files\Tianruo OCR\天若OCR文字识别.exe"
Else
Send {F4}
Return
DetectHiddenWindows, Off
return

#n::run "D:\Program Files\NotePad3\Notepad3\Notepad3.exe"



;================在编辑器内的特定符号自动替换和自动输入=============
; 邮箱替代
:*:@yeah::whzecomjm@yeah.net


::wend:: ; 个人签名戳
Send,`nwhzecomjm `n%A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec%`n
return


; ===========keepass===========
#IfWinActive ahk_exe KeePass.exe
:*:``mm:: 
net = ThisismyKeePassPassWord ; 替换则符号里的加号要使用 {+}
clipboard = %net%  
Send {BackSpace 2}^v{Enter} ;Send之后使用回退键解决有时候地址栏第一个字母没有被替换的bug
Return
#IfWinActive


;========================书写环境========================

#If WinActive("ahk_exe Typora.exe") or WinActive("ahk_exe Notepad3.exe") or WinActive("ahk_exe miktex-texworks.exe") or WinActive("ahk_exe texstudio.exe") or WinActive("ahk_exe Chrome.exe")
; 在Typora 和 Notepad3 中使用数学快捷键
; 我们将在本地输入好 latex 文件再放到在线预览编译

CapsLock:: Send {$}{$}{Left}

; 常用符号 `反引号`
:?*:``/::\frac{{}*{}}{{}{}}{left 3}+{Left} ;除号
:?*:``=>::\implies{Space} ;隐含
:?*:``|-::\mapsto{Space} ;映射箭头
:?*:``->::\to{Space} ;→
:?*:``>=::\geq{Space} ;大于等于
:?*:``<=::\leq{Space} ;小于等于
:?*:``zj::\subseteq{Space} ;子集
:?*:``mod::\equiv * \pmod *{Left 8}+{Left} ;同余
:o?:``~::\sim{Space} ; 相似
:?*:``sb::{^}{{}{}}{Left} ; 上标
:?*:``xb::_{{}{}}{Left} ;下标
:o:``sum::\sum_{{}*{}}{^}{{}*{}}{Left 5}+{Left} ; sum 求和
:o:``pro::\prod_{{}*{}}{^}{{}*{}}{Left 5}+{Left} ; prod 求积
:o:``int::\int_{{}*{}}{^}{{}*{}}{Left 5}+{Left} ; int 积分
:*:``-::\overline{{}*{}}{Left 1}+{Left}  ; bar或者上划线
:?*:\{::\{{}*\{}}{Left 2}+{Left}  ;补全大括号

; 特殊字母 `反引号`
::``a::\alpha
::``b::\beta
::``g::\gamma
::``l::\lambda
::``f::\phi
::``vf::\varphi
:C:``s::\sigma
:C:``S::\Sigma
:C:``th::\theta
:C:``Th::\Theta
::``k::\kappa
::``o::\omega
::``al::\aleph

; 其他公式 反引号
:*:``kx::k\langle X\rangle

; 数学字体 `反引号`
:*:``rm::\mathrm{{}{}}{left}
:*:``bb::\mathbb{{}{}}{left}
:*:``tx::\text{{}{}}{left}
:*:``it::\textit{{}{}}{left}
:*:``bf::\textbf{{}{}}{left}
:*:``cal::\mathcal{{}{}}{left}

; 章节分段 `#`
:*:ch#::\chapter{{}{}}{LEFT}
:*:s#::\section{{}{}}{LEFT}
:*:ss#::\subsection{{}{}}{LEFT}
:*:sss#::\subsubsection{{}{}}{LEFT}
:*:med#::\medskip


; Matrices 矩阵 `pm#`
:o:pm2::\begin{{}pmatrix{}}`r0 & 0 \\`r0 & 0 \\`r\end{{}pmatrix{}}{Left 13}{Up}`t{Left}{Up}`t
:o:bm2::\begin{{}bmatrix{}}`r0 & 0 \\`r0 & 0 \\`r\end{{}bmatrix{}}{Left 13}{Up}`t{Left}{Up}`t
:o:pm3::\begin{{}pmatrix{}}`r0 & 0 & 0 \\`r0 & 0 & 0 \\`r0 & 0 & 0 \\`r\end{{}pmatrix{}}{Left 13}{Up}`t{Left}{Up}`t{Left}{Up}`t
:o:bm3::\begin{{}bmatrix{}}`r0 & 0 & 0 \\`r0 & 0 & 0 \\`r0 & 0 & 0 \\`r\end{{}bmatrix{}}{Left 13}{Up}`t{Left}{Up}`t{Left}{Up}`t
:o:pm4::\begin{{}pmatrix{}}`r0 & 0 & 0 & 0 \\`r0 & 0 & 0 & 0 \\`r0 & 0 & 0 & 0 \\`r0 & 0 & 0 & 0 \\`r\end{{}pmatrix{}}{Left 13}{Up}`t{Left}{Up}`t{Left}{Up}`t{Left}{Up}`t
:o:bm4::\begin{{}bmatrix{}}`r0 & 0 & 0 & 0 \\`r0 & 0 & 0 & 0 \\`r0 & 0 & 0 & 0 \\`r0 & 0 & 0 & 0 \\`r\end{{}bmatrix{}}{Left 13}{Up}`t{Left}{Up}`t{Left}{Up}`t{Left}{Up}`t

; Vectors 向量(矩阵表达) `v#`
:o:v2::\begin{{}pmatrix{}}`r0 \\`r0 \\`r\end{{}pmatrix{}}{Left 13}{Up}`t{Left}{Up}`t
:o:v3::\begin{{}pmatrix{}}`r0 \\`r0 \\`r0 \\`r\end{{}pmatrix{}}{Left 13}{Up}`t{Left}{Up}`t{Left}{Up}`t
:o:v4::\begin{{}pmatrix{}}`r0 \\`r0 \\`r0 \\`r0 \\`r\end{{}pmatrix{}}{Left 13}{Up}`t{Left}{Up}`t{Left}{Up}`t{Left}{Up}`t


!e:: ;公式和其他latex环境
InputBox, UserEnv, Environment, Please enter an environment!, , 240, 120
If ErrorLevel
    return
Else 
if( RegExMatch(UserEnv, "(.*?)(\d+)$", splitted) ) {
    Send \begin{{}%splitted1%{}}{Enter}
        Loop %splitted2% {
            Send \item {Enter}
        }
    Send \end{{}%splitted1%{}}{Up}
    count2 := splitted2 - 1 
    Loop %count2% {
        Send {Up}
    }           
} 
Else 
    Send \begin{{}%UserEnv%{}}{Enter 2}\end{{}%UserEnv%{}}{Up}
return

; ----------------typora 以及notepad 里单词替换-------------------

:?0:asso::associative
:*:autom::automorphism
:?0:centr::centralizer
:?0:comm::commutative
::don't::do not
:*:endm::endomorphism
:*:homm::homomorphism
:*:instead of::in lieu of  ;数学课本常用的内容。
:*:isoc::isomorphic
:*:isom::isomorphism
:c:Kont::Kontsevich
:*:misc::miscellaneous
:*:quant::quantization
:*:what's::what is
:*:wlog::Without loss of generality,
:*:btw::by the way

#IfWinActive 
;=================== LaTeX 环境结束 ==========================

#IfWinActive ahk_exe AutoHotkey.exe
:*:thm::theorem{Enter}
:*:def::definition{Enter}
:*:lem::lemma{Enter}
:*:pro::proposition{Enter}
:*:ali::align{Enter}
:*:cas::cases{Enter} ;在公式内
:*:det::vmatrix{Enter}
#IfWinActive

;========================== pdf 注释 latex2utf8 ============================
#IfWinActive ahk_exe PDFXEdit.exe 
; misc math symbols
:*?C:\pm::±
:*?C:\ldots::…
:*?C:\times::×
:*?C:\forall::∀
:*?C:\partial::∂
:*?C:\exists::∃
:*?C:\nexists::∄
:*?C:\varnothing::∅
:*?C:\varnabla::∇
:*?C:\In::∈
:*?C:\notin::∉
:*?C:\ni::∋
:*?C:\nni::∌
:*?C:\prod::Π
:*?C:\coprod::∐
:*?C:\sum::Σ
:*?C:\sqrt::√
:*?C:\infty::∞
:*?C:\propto::∝
:*?C:\angle::∠
:*?C:\measuredangle::∡
:*?C:\sphericalangle::∢
:*?C:\rightangle::∟
:*?C:\wedge::∧
:*?C:\vee::∨
:*?C:\cap::∩
:*?C:\cup::∪
:*?C:\int::∫
:*?C:\iint::∬
:*?C:\iiint::∭
:*?C:\oint::∮
:*?C:\oiint::∯
:*?C:\oiiint::∰
; equal signs
:*?C:\Approx::≈
:*?C:\approxeq::≊
:*?C:\neq::≠
:*?C:\equiv::≡
:*?C:\Nequiv::≢
:*?C:\leq::≤
:*?C:\geq::≥
:*?C:\Leqq::≦
:*?C:\Geqq::≧
:*?C:\lneqq::≨
:*?C:\gneqq::≩
:*?C:\ll::≪
:*?C:\gg::≫
:*?C:\subset::⊂
:*?C:\supset::⊃
:*?C:\nsubset::⊄
:*?C:\nsupset::⊅
:*?C:\Subseteq::⊆
:*?C:\Supseteq::⊇
:*?C:\oplus::⊕
:*?C:\ominus::⊖
:*?C:\otimes::⊗
:*?C:\odot::⊙
:*?C:\cdot::⋅
:*?C:\diamond::⋄
:*?C:\star::⋆

; common enumeration marks
:*?C:\dagger::†
:*?C:\ddager::‡
:*?C:\bullet::•


; mathematical sets
:*?C:\mathbbC::ℂ
:*?C:\mathbbH::ℍ
:*?C:\mathbbR::ℝ
:*?C:\mathbbZ::ℤ

; arrows
:*?C:\leftarrow::←
:*?C:\uparrow::↑
:*?C:\rightarrow::→
:*?C:\leftrightarrow::↓
:*?C:\leftrightarrow!::↔
:*?C:\updownarrow!::↕
:*?C:\mapsto::↦
:*?C:\mapsfrom::↤
:*?C:\mapsup::↥
:*?C:\mapsdown::↧
:*?C:\leftarrowtail::↢
:*?C:\rightarrowtail::↣
:*?C:\nleftarrow::↚
:*?C:\nrightarrow::↛
; double arrows
:*?C:\rightleftarrows::⇄
:*?C:\updownarrows::⇅
:*?C:\leftrightarrows::⇆
:*?C:\leftleftarrows::⇇
:*?C:\rightrightarrows::⇉
:*?C:\downdownsarrows::⇊
:*?C:\upuparrows::⇈
; bold arrows
:*?C:\Leftarrow::⇐
:*?C:\Rightarrow::⇒
:*?C:\Uparrow::⇑
:*?C:\Downarrow::⇓
:*?C:\Leftrightarrow::⇔
; dashed arrows
:*?C:\dashrightarrow::⇢
:*?C:\dashleftarrow::⇠
:*?C:\dashuparrow::⇡
:*?C:\dashdownarrow::⇣
;big arrows
:*?C:\bigarrowleft::⇦
:*?C:\bigarrowright::⇨
:*?C:\bigarrowup::⇧
:*?C:\bigarrowdown::⇩
:*?C:\longleftrightarrow::⟷
:*?C:\Longleftarrow::⟸
:*?C:\Longrightarrow::⟹
:*?C:\Longleftrightarrow::⟺


; units
:*?C:\Micro::μ

; greek symbols
:*?C:\alpha::α
:*?C:\Alpha::Α
:*?C:\beta::β
:*?C:\Beta::Β
:*?C:\Gamma::Γ
:*?C:\gamma::γ
:*?C:\Delta::Δ
:*?C:\delta::δ
:*?C:\Epsilon::Ε
:*?C:\epsilon::ε
:*?C:\digamma::ϛ
:*?C:\stigma::ϛ
:*?C:\Zeta::Ζ
:*?C:\zeta::ζ
:*?C:\Eta::Η
:*?C:\eta::η
:*?C:\Theta::Θ
:*?C:\theta::θ
:*?C:\Iota::Ι
:*?C:\iota::ι
:*?C:\Kappa::Κ
:*?C:\kappa::κ
:*?C:\Lambda::Λ
:*?C:\lambda::λ
:*?C:\Mu::Μ
:*?C:\mu::μ
:*?C:\Nu::Ν
:*?C:\nu::ν
:*?C:\Xi::Ξ
:*?C:\xi::ξ
:*?C:\Omicron::Ο
:*?C:\omicron::ο
:*?C:\Pi::Π
:*?C:\pi::π
:*?C:\koppa::ϟ
:*?C:\rho::ρ
:*?C:\Rho::Ρ
:*?C:\Sigma::Σ
:*?C:\sigma::σ
:*?C:\Tau::Τ
:*?C:\tau::τ
:*?C:\Upsilon::Υ
:*?C:\upsilon::υ
:*?C:\Phi::Φ
:*?C:\phi::φ
:*?C:\Chi::Χ
:*?C:\chi::χ
:*?C:\Psi::Ψ
:*?C:\psi::ψ
:*?C:\Omega::Ω
:*?C:\omega::ω
#IfWinActive
; =================================================================


;update time 2019-07-11 11:47:44

; 字符替换
:*:noncom::noncommutative


