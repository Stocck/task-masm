include console.inc

.data
    StartText DB 'Entry a small Latin letter: ',0
    EndText DB 'The number of the letter in the alphabet: ',0
    N DB ?; N >= 1
    F DW ?
    
.code
start:
    mov AX, 1; f(n)
    mov BX, 1; f(n-1)
    mov DX, 2; number

StartLoop:
    CMP AX, 10000
    JA EndLoop

    mov CX, AX          ; CX := AX
    ADD AX, BX          ; AX := AX + BX
    mov BX, CX          ; BX := CX

    INC DX
    JMP StartLoop

EndLoop:
    movzx DX, EDX
    movzx AX, EAX
    mov F, DX

    OUTI EDX
    NEWLINE
    OUTI EAX

    exit
end start