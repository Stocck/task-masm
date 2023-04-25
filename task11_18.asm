include console.inc
.data
    a dd ?
    b dd ? 
    c dd ?
    tmp db ?
.code
MD PROC
    push ebp
    mov ebp, esp
    push eax; арифметический регистр
    push ebx; хранение константы 10
    push ecx; min
    push edx; арифметический регистр
    
    mov eax, [ebp + 8]; eax = n
    mov ecx, 10
    mov ebx, 10
for1:
    
    xor edx, edx
    div ebx; edx = mod 10 eax = div 10
    cmp edx, ecx
    JAE skip
    mov ecx, edx
skip:
    cmp eax, 0
    JNE for1
    
    mov eax, [ebp+12]; eax = offset x
    mov [eax], cl
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop ebp
    ret dword*2
MD ENDP
minmax PROC
    push esi
    mov esi, esp
    push eax
    push ebx
    push ecx
    mov eax, [esi] + 8; eax = offset x
    mov ebx, [esi] + 12; ebx = offset y
    push [eax]
    
    push eax
    push [eax]
    call MD
    mov ch, [eax]
    
    push eax
    push [ebx]
    call MD
    mov cl, [eax]
    
    mov eax, [esi] + 8
    pop [eax]; Востановление X
    
   
    sub cl, ch
    shl cl, 1
    JNC cools
    mov ecx, [eax]
    mov ebx, [ebx]
    mov [eax], ebx
    mov ebx, [esi] + 12
    mov [ebx], ecx
    
cools:
    pop ecx
    pop ebx
    pop eax
    pop esi
    ret 2*dword
minmax ENDP

start:
    ININT a
    ININT b
    ININT c

    push offset b
    push offset a 
    push offset c
    push offset b
    push offset b
    push offset a 
    call minmax
    call minmax
    call minmax
        
    OUTU a
    newline
    OUTU b
    newline
    OUTU c
    exit
end start