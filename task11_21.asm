include console.inc
.data
.code
printdigit proc
    xor edx, edx
    div ebx
    add edx, '0'
    cmp eax, 0
    JE printdigitEND
    push edx
    call printdigit
    pop edx
printdigitEND:
    outchar dl
    ret
printdigit endp
printu proc
    push edx
    push ebx
    mov ebx, 10
    call printdigit 
    pop ebx
    pop edx
    ret
printu endp
printi proc
    ;print eax
    push ebx
    mov ebx, eax
    shl ebx, 1
    jnc printiP 
    outchar '-'
    neg eax
printiP:
    pop ebx
    call printu
    ret
printi endp
start:
    inint eax
    call printi
    exit
end start