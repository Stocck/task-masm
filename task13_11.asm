include console.inc
.data
    forc i, <mabc>
        i db ?
    endm
.code
MAX2proc PROC
    push ebp
    mov ebp, esp
    push eax
    push ebx
    mov ebx, [ebp+8];offset M
    mov ah, [ebp+12];x
    mov al, ah
    sub ah, [ebp+16];y
    shl ah, 1
    jnc MAX2procEND
    mov al, [ebp+16];y
MAX2procEND:
    
    mov [ebx], al
    pop ebx
    pop eax
    pop ebp
    ret 3*dword
MAX2proc ENDP

MAX2 MACRO M,X,Y
    push eax
    for i, <Y, X>
        movzx eax, i
        push eax
    endm
    push offset M
    call MAX2proc
    pop eax
ENDM

MAX3 MACRO M,X,Y,Z
    MAX2 M,X,Y
    MAX2 M,M,Z
ENDM
Start:
    inint a
    inint b
    inint c
    MAX3 m,a,b,c
    outi m
    exit
end Start