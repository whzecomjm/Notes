#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force  ;脚本正在运行时, 启动该脚本时会跳过对话框并自动替换旧实例.
;#NoTrayIcon  ;不显示托盘图标


;===================LateX 环境的快捷输入=======================
#If WinActive("ahk_exe Typora.exe")
$::Send {$}{$}{Left}
#IfWinActive

#If WinActive("ahk_exe Typora.exe") or WinActive("ahk_exe Chrome.exe")

; 常用符号 
:?*:=>::\implies{Space} ;隐含
:?*:->::\to{Space} ;→
:?*:>=::\geq{Space} ;大于等于
:?*:<=::\leq{Space} ;小于等于
:?*:\frac::\frac{{}*{}}{{}{}}{left 3}+{Left} ;除号
:?*:\mod::\equiv * \pmod *{Left 8}+{Left} ;同余
:o:\sum::\sum_{{}*{}}{^}{{}*{}}{Left 5}+{Left} ; sum 求和
:o:\prod::\prod_{{}*{}}{^}{{}*{}}{Left 5}+{Left} ; prod 求积
:?*:\{::\{{}*\{}}{Left 2}+{Left}  ;补全大括号
:?*:\(::\left(*\right){Left 7}+{Left} ;补全小括号
:?*:[[::[\{!}[]\{!}]{Left 4} ;双中括号

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

; 数学字体 `反引号`
:?*:mrm::\mathrm{{}{}}{left}
:?*:mbb::\mathbb{{}{}}{left}
:?*:mcal::\mathcal{{}{}}{left}


; Matrices 矩阵 `pm#`
:o:pm2::\begin{{}pmatrix{}}`r0 & 0 \\`r0 & 0 \\`r\end{{}pmatrix{}}{Left 13}{Up}`t{Left}{Up}`t
:o:bm2::\begin{{}bmatrix{}}`r0 & 0 \\`r0 & 0 \\`r\end{{}bmatrix{}}{Left 13}{Up}`t{Left}{Up}`t
:o:pm3::\begin{{}pmatrix{}}`r0 & 0 & 0 \\`r0 & 0 & 0 \\`r0 & 0 & 0 \\`r\end{{}pmatrix{}}{Left 13}{Up}`t{Left}{Up}`t{Left}{Up}`t
:o:bm3::\begin{{}bmatrix{}}`r0 & 0 & 0 \\`r0 & 0 & 0 \\`r0 & 0 & 0 \\`r\end{{}bmatrix{}}{Left 13}{Up}`t{Left}{Up}`t{Left}{Up}`t

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


#IfWinActive 
;=================== LaTeX 环境结束 ==========================