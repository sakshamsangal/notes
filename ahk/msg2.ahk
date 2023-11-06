
; :*b0:<em>::</em>{left 5}




; :*:btw::by the way`s

; #Hotstring B  ; Turn back on automatic backspacing for all subsequent hotstrings.
; :?:ign::ing

; ::ws::was, www.example.ws

var1 := ""
var2 := ""
var3 := ""
c := 0
OnClipboardChange ClipChanged

ClipChanged(x) {
    global c
    global var1
    global var2
    global var3
    If (c = 0){
        var1 := A_Clipboard
    } else if (c = 1){
        var2 := A_Clipboard
    }else{
        var3 := A_Clipboard
    }
    c := Mod(c + 1, 3)
}

!q::{
    global c
    global var1
    global var2
    global var3
    If (c = 0){
        c := Mod(c + 1, 3)
        Send var1
    } else if (c = 1){
        c := Mod(c + 1, 3)
        Send var2
    }else{
        c := Mod(c + 1, 3)
        Send var3
    }
}

