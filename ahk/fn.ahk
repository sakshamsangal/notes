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

myFun(arr) {
    for n in arr {
        Send n		
    }
    Sleep 20
}