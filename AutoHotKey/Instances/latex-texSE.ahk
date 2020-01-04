#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; origin 
; https://tex.stackexchange.com/questions/61547/using-autohotkey-to-streamline-latex-document-authoring

#a::Suspend, Toggle ; pause script
#Hotstring EndChars `t ; [Tab] triggers Hotstrings

; Reset Hotstring for CTRL+Backspace and CTRL+A (otherwise hostrings won't trigger)
Ctrl & Backspace::
    SendInput ^`b
    Hotstring("Reset")
    Return

Ctrl & a::
    SendInput ^a
    Hotstring("Reset")
    Return

; :o:   omit ending character
; :?:   triggers hotstring even between characters
; :c:   case sensitive
; :*:   no trigger
; ^     ctrl
; +     shift
; <!    left alt



; /// 1. BRACKETS //////////////////////////////////////////////////////////////////////////////////

; instant complete (), [], {}
:o*?:(::(){Left}
:o*?:[::[]{Left}
:o*?:{::{{}{}}{Left}

:o:abs::\left|  \right| {Left 9} ; Absolut Value: \left| \right|
:o:abs2::\left|  \right|{^}2 {Left 11} ; Absolut Value: \left| \right|
^4:: Send $${Left} ; $$

; \left* \right*
; (instruction: place the cursor between the opening and the closing symbol, then hit ctrl+7)
^7::
    SendInput, {Left}\left{Right}  \right{Left 7}
    Return

; put brackets around selection
; (warning: this might not work in some applications!)
^8::
    ClipBackup := ClipboardAll
    clipboard := ""
    SendInput, ^x
    SendInput, (){Left}
    SendInput, ^v
    SendInput, {Right}
    Sleep 1000
    Clipboard := ClipBackup
    Return

^9::
    ClipBackup := ClipboardAll
    clipboard := ""
    SendInput, ^x
    SendInput, []{Left}
    SendInput, ^v
    SendInput, {Right}
    Sleep 1000
    Clipboard := ClipBackup
    Return

^0::
    ClipBackup := ClipboardAll
    clipboard := ""
    SendInput, ^x
    SendInput, {{}{}}{Left}
    SendInput, ^v
    SendInput, {Right}
    Sleep 1000
    Clipboard := ClipBackup
    Return




; /// 2. OTHER /////////////////////////////////////////////////////////////////////////////////////

; Jump to first occurance of • in the current line. (Continues search in the next line.)
^Space::
    ClipBackup := ClipboardAll
    clipboard := ""
    SendInput, {Home}+{End}
    SendInput, ^c
    Sleep 50 ; increase this number, if it doesn't work
    SearchedText := clipboard
    ; MsgBox, %SearchedText%    
    StringGetPos, pos, SearchedText, •
    if (pos >= 0)
        ; MsgBox, %Target% was found at %pos%.
        SendInput, {Home}{Right %pos%}+{Right}
    else
        SendInput, {Down}
        SendInput, {Home}+{End}
        SendInput, ^c
        Sleep 50 ; increase this number, if it doesn't work
        SearchedText := clipboard
        ; MsgBox, %SearchedText%    
        StringGetPos, pos, SearchedText, •
        if (pos >= 0)
            ; MsgBox, %Target% was found at %pos%.
            SendInput, {Home}{Right %pos%}+{Right}
        else
            SendInput, {End}
    Clipboard := ClipBackup
    Return

; Comfort
+Backspace:: Send,{BackSpace}{Delete} ; delete surrounding characters
^Enter:: Send,{End}{Enter} ; instant create new line, even from within words.

; Shift+Space: escape to the right and insert a space
+Space::
    SendInput, {Right}{Space}
    Return

; Whitespaces
:o:qd::\quad
:o:qq::\qquad
:o?: ::\{Space}{Space}
:o?:,::\,
:o:clp::\clearpage

; Environments
:o:bg::
    InputBox, OutputVar, Environment,,, 200, 120,,,,, align
    SendInput, \begin{{}%OutputVar%{}}`r`r\end{{}%OutputVar%{}}{Up}`t
    Return

:o:bga::\begin{{}align{}}`r`r\end{{}align{}}{Up}`t ; align
:o:bgas::\begin{{}align{}}\begin{{}split{}}`r`r\end{{}split{}}\end{{}align{}}{Up}`t ; align with split

:o:itmz::\begin{{}itemize{}}`r{Home}`r\end{{}itemize{}}{Up}`t\item{Space} ; align
:o:itm::\item{Space}



; /// 3. TEXT FORMATTING ///////////////////////////////////////////////////////////////////////////

; Sections
:o:sc::\section{{}•{}}{Left}+{Left} ; \section
:o:ss::\subsection{{}•{}}{Left}+{Left} ; \subsection
:o:sss::\subsubsection*{{}•{}}{Left}+{Left} ; \subsubsection*

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



; /// 4. MATH STUFF ////////////////////////////////////////////////////////////////////////////////

; Common Operations
:o:fr::\frac{Space} ; \frac
:o:fra::\frac{{}•{}}{{}•{}}{Left 4}+{Left} ; \frac{•}{•}
:o:tfr::\tfrac{Space} ; \tfrac
:o:su::\sum{Space} ; \sum
:o:sum::\sum_{{}•{}}{^}{{}•{}}{Left 5}+{Left} ; \sum_{•}^{•}
:o:pro::\prod_{{}•{}}{^}{{}•{}}{Left 5}+{Left} ; \prod_{•}^{•}
:o:in::\int{Space} ; \int
:o:oin::\oint{Space} ; \oint
:o:int::\int_{{}•{}}{^}{{}•{}}{Left 5}+{Left} ; \int_{•}^{•}
:o:sq::\sqrt{{}•{}}{Left}+{Left} ; \sqrt{ } \sqrt{}

; alt+^ instantly yields ^{•}
<!^::
    SendInput, {^}{{}•{}}{Left}+{Left}
    Return

; Relations
:o:<=>::\Leftrightarrow ; <=>
:o:=>::\Rightarrow ; =>
:o:<=::\Leftarrow ; <=
:o?:-->::\longrightarrow ; -->
:o:->::\rightarrow ; ->
:o:!=::\overset{{}{!}{}}{{}={}}{Space} ; ! over =
:o?:=::\ =\{Space}
:o:eq::\ \equiv\{Space}
:o:~::\sim

; Other / Symbols
:o:cnc::\cancel{{}•{}}{Left}+{Left} ; \cancel{}
:o:del::\partial
:o:dell::\frac{{}\partial{}}{{}\partial •{}}{Left}+{Left}
:o:ovs::\overset{{}•{}}{{}•{}}{Left 4}+{Left}
:o:inf::\infty
:o:°::{^}\circ 
:o:cd::\cdot{Space}
:o:dg::{^}\dagger
:o:dd::\text{{}d{}}•+{Left} ; used for differentials e.g. dx



; /// 5. MATRICES //////////////////////////////////////////////////////////////////////////////////

; Matrices
:o:pm2::\begin{{}pmatrix{}}`r• & • \\`r• & • \\`r\end{{}pmatrix{}}{Left 13}{Up}`t{Left}{Up}`t+{Right}
:o:bm2::\begin{{}bmatrix{}}`r• & • \\`r• & • \\`r\end{{}bmatrix{}}{Left 13}{Up}`t{Left}{Up}`t+{Right}
:o:pm3::\begin{{}pmatrix{}}`r• & • & • \\`r• & • & • \\`r• & • & • \\`r\end{{}pmatrix{}}{Left 13}{Up}`t{Left}{Up}`t{Left}{Up}`t+{Right}
:o:bm3::\begin{{}bmatrix{}}`r• & • & • \\`r• & • & • \\`r• & • & • \\`r\end{{}bmatrix{}}{Left 13}{Up}`t{Left}{Up}`t{Left}{Up}`t+{Right}
:o:pm4::\begin{{}pmatrix{}}`r• & • & • & • \\`r• & • & • & • \\`r• & • & • & • \\`r• & • & • & • \\`r\end{{}pmatrix{}}{Left 13}{Up}`t{Left}{Up}`t{Left}{Up}`t{Left}{Up}`t+{Right}
:o:bm4::\begin{{}bmatrix{}}`r0 & 0 & 0 & 0 \\`r0 & 0 & 0 & 0 \\`r0 & 0 & 0 & 0 \\`r0 & 0 & 0 & 0 \\`r\end{{}bmatrix{}}{Left 13}{Up}`t{Left}{Up}`t{Left}{Up}`t{Left}{Up}`t+{Right}

; LGS
:o:lgs::\begin{{}matrix{}}`r• &=& • \\`r• &=& • \\`r\end{{}matrix{}}{Left 12}{Up}`t{Left}{Up}`t+{Right}

; Vectors
:o:v2::\begin{{}pmatrix{}}`r• \\`r• \\`r\end{{}pmatrix{}}{Left 13}{Up}`t{Left}{Up}`t+{Right}
:o:v3::\begin{{}pmatrix{}}`r• \\`r• \\`r• \\`r\end{{}pmatrix{}}{Left 13}{Up}`t{Left}{Up}`t{Left}{Up}`t+{Right}
:o:v4::\begin{{}pmatrix{}}`r• \\`r• \\`r• \\`r• \\`r\end{{}pmatrix{}}{Left 13}{Up}`t{Left}{Up}`t{Left}{Up}`t{Left}{Up}`t+{Right}



; /// 6. GREEK /////////////////////////////////////////////////////////////////////////////////////

:o:a::\alpha  
:o:b::\beta
:o:c::\chi
:oc:d::\delta
:oc:D::\Delta
:o:e::\epsilon
:o:ve::\varepsilon
:oc:f::\phi
:oc:F::\Phi
:o:vf::\varphi
:oc:g::\gamma
:oc:G::\Gamma
:o:h::\eta
:o:i::\iota
:o:k::\kappa
:oc:l::\lambda
:oc:L::\Lambda
:o:m::\mu
:o:n::\nu
:oc:p::\pi
:oc:P::\Pi
:oc:q::\theta
:oc:Q::\Theta
:o:vq::\vartheta
:o:r::\rho
:oc:s::\sigma
:oc:S::\Sigma
:o:t::\tau
:oc:u::\upsilon
:oc:U::\Upsilon
:o:v::\digamma
:oc:w::\omega
:oc:W::\Omega
:oc:x::\xi
:oc:X::\Xi
:oc:y::\psi
:oc:Y::\Psi
:o:z::\zeta