include console.inc
.data
    a dd ?; со знаком
    b dd ?
    c dd ?
.code
MAXMINr PROC
    ;eax = offset x
    ;ebx = offset y
    push ecx
    
    mov ecx, [eax]
    sub ecx, [ebx]
    shl ecx, 1
    JNC coolr
    xchg [eax], ecx
    xchg [ebx], ecx
    xchg [eax], ecx
coolr:
    
    pop ecx
    ret
MAXMINr ENDP
MAXMINs PROC
    ;offset x = [esp] + 8
    ;offset y = [esp] + 12
    push esi
    mov esi, esp
    push eax
    push ebx
    push ecx
    
    mov eax, [esi] + 8
    mov ebx, [esi] + 12
    mov eax, [eax]; eax = x
    mov ebx, [ebx]; ebx = y
    mov ecx, eax; ecx = x
    sub ecx, ebx
    shl ecx, 1
    JNC cools
    mov ecx, [esi] + 8; ecx = offset x
    mov [ecx], ebx
    mov ecx, [esi] + 12; ecx = offset y
    mov [ecx], eax
cools:    
    pop ecx
    pop ebx
    pop eax
    pop esi
    ret 2*dword
MAXMINs ENDP
start:
    ININT a
    ININT b
    ININT c
    
    ;regist
;    mov eax, offset a
;    mov ebx, offset b
;    call MAXMINr
;    mov eax, ebx
;    mov ebx, offset c
;    call MAXMINr
;    mov ebx, eax
;    mov eax, offset a
;    call MAXMINr
    
    ;stack
    push offset b
    push offset a 
    push offset c
    push offset b
    push offset b
    push offset a 
    call MAXMINs
    call MAXMINs
    call MAXMINs
     
    
    OUTI a
    OUTI b
    OUTI c
    exit
end start