#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force  ;脚本正在运行时, 启动该脚本时会跳过对话框并自动替换旧实例.
;#NoTrayIcon  ;不显示托盘图标

;===========================原始latex-to-uft8的调用方式==============
; Turn off caps lock
;SetCapsLockState AlwaysOff

;~Capslock Up:: Send, {Capslock Up}

; The #If directive creates context-sensitive hotkeys and hotstrings:
;#If (A_PriorHotkey = "~Capslock Up" and A_TimeSincePriorHotkey < 10000) 
;#If


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