include console.inc
.data
    for i ,<A,B,C>
        i dd 0
    endm
    for i ,<D,E,F>
        i db 0
    endm
.code
Start:
    for i, <A,B,C,D,E,F>
        if type i EQ byte
            mov i, -1
        endif
    endm
    
    for i, <A,B,C,D,E,F>
        OUTI i
        NEWLINE
    endm
    exit
end Start