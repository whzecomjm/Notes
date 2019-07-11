; Copyright (C) 2018  Jan Wollschläger <janmwoll@gmail.com>
; This file is part of libms.
;
; latex-to-utf8 is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <http://www.gnu.org/licenses/>.


; Turn off caps lock
SetCapsLockState AlwaysOff

~Capslock Up:: Send, {Capslock Up}

; The #If directive creates context-sensitive hotkeys and hotstrings:
#If (A_PriorHotkey = "~Capslock Up" and A_TimeSincePriorHotkey < 10000) 
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
#If




