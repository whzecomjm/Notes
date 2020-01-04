#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force  ;脚本正在运行时, 启动该脚本时会跳过对话框并自动替换旧实例.
;#NoTrayIcon  ;不显示托盘图标

^+w::Suspend, Toggle ;ctrl+shift+w暂停脚本

^Enter:: Send,{End}{Enter} ;在本行内任意位置创建新行. ctrl+enter

;===================LateX 环境的快捷输入=======================
; 自动完成 $$ (), [], {}
:o*?:$::$${Left} 
:o*?:(::(){Left}
:o*?:[::[]{Left}
:o*?:{::{{}{}}{Left}

; 常用符号 
:?*:=>::\implies{Space} ;隐含
:?*:->::\to{Space} ;→
:?*:>=::\geq{Space} ;大于等于
:?*:<=::\leq{Space} ;小于等于
:?*:\frac::\frac{{}*{}}{{}{}}{left 3}+{Left} ;除号
:?*:\mod::\equiv * \pmod *{Left 8}+{Left} ;同余
:?*:\{::\{{}*\{}}{Left 2}+{Left}  ;补全大括号
:?*:\(::\left(*\right){Left 7}+{Left} ;补全小括号
:?*:[[::[\{!}[]\{!}]{Left 4} ;双中括号

:o:fr::\frac{Space} ; \frac
:o:fra::\frac{{}•{}}{{}•{}}{Left 4}+{Left} ; \frac{•}{•}
:o:tfr::\tfrac{Space} ; \tfrac
:o:su::\sum{Space} ; \sum
:o:sum::\sum_{{}•{}}{^}{{}•{}}{Left 5}+{Left} ; \sum_{•}^{•}
:o:prod::\prod_{{}•{}}{^}{{}•{}}{Left 5}+{Left} ; \prod_{•}^{•}
:o:in::\int{Space} ; \int
:o:oin::\oint{Space} ; \oint
:o:int::\int_{{}•{}}{^}{{}•{}}{Left 5}+{Left} ; \int_{•}^{•}
:o:sq::\sqrt{{}•{}}{Left}+{Left} ; \sqrt{ } \sqrt{}


; 添加 \left* \right*
; 把光标置于左右括号之间, 使用 ctrl+7 即可
^7::
SendInput, {Left}\left{Right}  \right{Left 7}
Return

; put brackets around selection
; (warning: this might not work in some applications!)
^8::   ;()
    ClipBackup := ClipboardAll
    clipboard := ""
    SendInput, ^x
    SendInput, (){Left}
    SendInput, ^v
    SendInput, {Right}
    Sleep 1000
    Clipboard := ClipBackup
    Return

^9::   ;[]
    ClipBackup := ClipboardAll
    clipboard := ""
    SendInput, ^x
    SendInput, []{Left}
    SendInput, ^v
    SendInput, {Right}
    Sleep 1000
    Clipboard := ClipBackup
    Return

^0::    ;{}
    ClipBackup := ClipboardAll
    clipboard := ""
    SendInput, ^x
    SendInput, {{}{}}{Left}
    SendInput, ^v
    SendInput, {Right}
    Sleep 1000
    Clipboard := ClipBackup
    Return

; Whitespaces 空白\clearpage
:o:qd::\quad
:o:qqd::\qquad


; 希腊字母 `双写`
:*:aa::\alpha
:*:bb::\beta
:*:ee::\epsilon
:*:dd::\delta
:*:ll::\lambda
:*:ff::\phi
:*:vff::\varphi
:*:oo::\omega
:*:\gg::\gamma
:*:\ss::\sigma
:*:\gth::\theta
:*:\kk::\kappa

; 特殊公式
:*:k<x>::k\langle X\rangle

; Sections
:o:sc::\section{{}•{}}{Left}+{Left} ; \section
:o:ss::\subsection{{}•{}}{Left}+{Left} ; \subsection
:o:sss::\subsubsection*{{}•{}}{Left}+{Left} ; \subsubsection*

; TEXT FORMATTING ================
; Text
:o:tx::\text{{}•{}}{Left}+{Left} ; \text
:o:tbf::\textbf{{}•{}}{Left}+{Left} ; \textbf
:o:tit::\textit{{}•{}}{Left}+{Left} ; \textit
:o:em::\emph{{}•{}}{Left}+{Left} ; \emph
:o:sf::\textsf{{}•{}}{Left}+{Left} ; sans serif
:o:sc::\textsc{{}•{}}{Left}+{Left} ; small caps

:o:bf::\mathbf{{}•{}}{Left}+{Left} ; \mathbf
:o:cal::\mathcal{{}•{}}{Left}+{Left} ; \mathcal
:o:scr::\mathscr{{}•{}}{Left}+{Left} ; \mathscr
:o:bb::\mathbb{{}•{}}{Left}+{Left} ; \mathbb
:o:bbm::\mathbbm{{}•{}}{Left}+{Left} ; \mathbbm

; 数学字体 `反引号`
:?*:mrm::\mathrm{{}{}}{left}
:?*:mbb::\mathbb{{}{}}{left}
:?*:mcal::\mathcal{{}{}}{left}


; Matrices 矩阵 `pm#`
:o:pm2::\begin{{}pmatrix{}}`r0 & 0 \\`r0 & 0 \\`r\end{{}pmatrix{}}{Left 13}{Up}`t{Left}{Up}`t
:o:bm2::\begin{{}bmatrix{}}`r0 & 0 \\`r0 & 0 \\`r\end{{}bmatrix{}}{Left 13}{Up}`t{Left}{Up}`t
:o:pm3::\begin{{}pmatrix{}}`r0 & 0 & 0 \\`r0 & 0 & 0 \\`r0 & 0 & 0 \\`r\end{{}pmatrix{}}{Left 13}{Up}`t{Left}{Up}`t{Left}{Up}`t
:o:bm3::\begin{{}bmatrix{}}`r0 & 0 & 0 \\`r0 & 0 & 0 \\`r0 & 0 & 0 \\`r\end{{}bmatrix{}}{Left 13}{Up}`t{Left}{Up}`t{Left}{Up}`t

; Environments 环境
:o:bg::
    InputBox, OutputVar, Environment,,, 200, 120,,,,, align
    SendInput, \begin{{}%OutputVar%{}}`r`r\end{{}%OutputVar%{}}{Up}`t
    Return

:o:bga::\begin{{}align{}}`r`r\end{{}align{}}{Up}`t ; align



; ----------------单词替换-------------------
:*:endm::endomorphism
:*:homm::homomorphism
:*:isoc::isomorphic
:*:isom::isomorphism
:*:symm::symplectomorphism
:?0:asso::associative
:?0:comm::commutative
::noncom::noncommutative
:*c:Kont::Kontsevich
:*:misc::miscellaneous
::quant::quantization
:*:wlog::Without loss of generality,
:*:btw::by the way
