include console.inc
.data
    n = 7
    m = 3
    a db n dup(?)
    b db m dup(?)
    k db 0
.code

readArr PROC
    push esi
    mov esi, esp
    push eax
    push ebx
    push ecx
    
    mov eax, [esi]+8
    xor ebx, ebx
    mov ecx, [esi]+12
loopRead:
    ININT byte ptr [eax][ebx]
    inc ebx
    cmp ebx, ecx
    JNE loopRead
    
    pop ecx
    pop ebx
    pop eax
    pop esi
    ret dword*2
readArr ENDP

Fregistr PROC
    ;eax = offset x
    ;ebx = n
    ;cl = p
    push edx
    mov edx, eax
    xor eax, eax
    xchg ecx, ebx
lr:
    cmp bl, [edx][ecx]-byte
    jne nextr
    inc al
nextr:
    loop lr
    
    pop edx
    ret
Fregistr ENDP
Fstack PROC
   ;offset x = [esi]+8
   ;n = [esi]+12
   ;p = [esi]+16
    push esi
    mov esi, esp
    push ebx
    push ecx
    push edx
    
    xor eax, eax
    mov edx, [esi]+8
    mov ecx, [esi]+12
    mov ebx, [esi]+16
ls:
    cmp bl, [edx][ecx]-byte
    jne nexts
    inc al
nexts:
    loop ls
   
    pop edx
    pop ecx
    pop ebx
    pop esi
    ret 3*dword
Fstack ENDP
start:
    push n
    push offset a
    call readArr
    
    push m
    push offset b
    call readArr

;registr    
;    mov eax, offset b
;    mov ebx, m
;    mov cl, k
;    call Fregistr
;    
;    mov cl, al
;    mov eax, offset a
;    mov ebx, n
;    call Fregistr

;stack
    movzx eax,k
    push eax
    push m
    push offset b
    call Fstack

    movzx eax,al
    push eax
    push n
    push offset a
    call Fstack

    mov k, al
    OUTU k
    
    exit
end start