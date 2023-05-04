include console.inc
.data
    a dq ?
    b dq ?
    c dq ?
.code
QADD MACRO X,Y,Z
    push eax
    ;('c'-'d')*(-4) = 4
    ;('d'-'d')*(-4) = 0
    forc i, <dc>
        mov eax, dword ptr Z+('&i'-'d')*(-4)
        ad&i eax, dword ptr Y+('&i'-'d')*(-4)
        mov dword ptr X+('&i'-'d')*(-4), eax
    endm
    
    ;result forc
;    mov eax, dword ptr Z
;    add eax, dword ptr Y
;    mov dword ptr X, eax
;    mov eax, dword ptr Z+4
;    adc eax, dword ptr Y+4
;    mov dword ptr X+4, eax
    
    pop eax
endm
QSUB MACRO X,Y,Z
    push eax
    ;'u'-'b' = 19
    ;('u'-'u')/(-4) = 0
    ;('b'-'u')/(-4) = 4
    
    forc i, <ub>
        mov eax, dword ptr Y+('&i'-'u')/(-4)
        sib eax, dword ptr Z+('&i'-'u')/(-4)
        mov dword ptr X+('&i'-'u')/(-4), eax
    endm
    
;    mov eax, dword ptr Y
;    sub eax, dword ptr Z
;    mov dword ptr X, eax
;    mov eax, dword ptr Y+4
;    sbb eax, dword ptr Z+4
;    mov dword ptr X+4, eax

    pop eax
endm
Start:
    inint dword ptr a
    inint dword ptr b
    QADD c,b,a
    OUTI c
    NEWLINE
    mov edx, dword ptr a+4
    mov eax, dword ptr a
    mov ebx, 10
    mul ebx
    mov dword ptr a+4, edx
    mov dword ptr a, eax
    OUTI a
    NEWLINE
    QSUB c,a,b
    OUTI c
    NEWLINE
    exit
end Start