include console.inc
.data
    x dd 1
    y dd 7
.code
P PROC
    ;
    ;
P ENDP


start:
;1
    ;a
    mov eax, 5
    mov ebx, y
    call P
    ;b
    push y
    push 5
    call P
;2
    ;a
    mov eax, x
    mov ebx, y
    call P
    ;b
    push y
    push x
    call P
;3 
    ;a
    mov eax, x
    add eax, 2
    mov ebx, y
    call P
    ;b
    push y
    push x
    add dword ptr [esp], 2
    call P
;4
    ;a
    mov eax, x
    mov ebx, x
    call P
    ;b
    push x
    push x
    call P  
    exit
end start