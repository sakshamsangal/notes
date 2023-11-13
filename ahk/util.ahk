; ````````````````````````````````````````````````````
;#=WINDOWS KEY
;^=CTRL
;!=ALT
;+=SHIFT
;{ } = DATA ENTRY

F1::myFun(["^c"])
F2::myFun(["^v"])
F3::myFun(["^x"])
F4::myFun(["!{Insert}"])
F5::myFun(["^s"])
F6::myFun(["^a", "^c"])
F7::myFun(["^a", "{Delete}"])
F8::myFun(["+{F6}"]) ; ^!t
F9::myFun(["^f"])  
F10::myFun(["^!l"])  ;"^+s"
F12::myFun(["!{Enter}"]) 


`::myFun(["^!t"])
!\::myFun(["!j" , "^{BackSpace}"])
!y::myFun(["^c", "^v"]) 
!.::myFun(["^d"]) 

myFun(arr) {
    for n in arr {
        Send n		
    }
    Sleep 20
}

; Shift + Wheel for horizontal scrolling
+WheelDown::WheelRight
+WheelUp::WheelLeft

#c::Run "calc.exe"
#n::Run "notepad++" 

PgUp::^f
PgDn::^r

; !\::^z
; Insert::+F6
; RShift::+F6
; ++p::^+t
; AppsKey::^d
;CapsLock::Enter
; PrintScreen::^z
; PrintScreen::^+s
;`::AltTabMenu
;insert::AltTabMenu
;#w::^Right



