include console.inc
.data
    MAXLEN = 100
    x db MAXLEN dup(?)
.code
;cf = error flag(1 = error)
READ PROC
    ;offset x
    ;MAXLEN
    push ebp
    mov ebp, esp
    push eax
    push ecx
    mov eax, [ebp+8]
    mov ecx, [ebp+12]
READ_for:
    inchar byte ptr [eax]
    cmp byte ptr [eax], '.'
    JE READ_break
    inc eax
    loop READ_for
    
    mov eax, 1
    jmp READ_ENDP
READ_break:
    mov eax, 0
READ_ENDP:
    shr eax, 1
    pop ecx
    pop eax
    pop ebp
    ret 2*dword
READ ENDP
IS_PROPERTY PROC    ;4
    push ebp
    mov ebp, esp
    push eax
    push ebx
    
    mov eax, [ebp+8]
    xor ebx, ebx
    
    
IS_PROPERTY_for:
    
    
    ;ascii ... A ... Z ... a ... z ...
    cmp byte ptr [eax], 'A'
    JB IS_PROPERTY_not_latin_litter
    cmp byte ptr [eax], 'Z'
    JBE IS_PROPERTY_latin_litter
    cmp byte ptr [eax], 'z'
    JA IS_PROPERTY_not_latin_litter
    cmp  byte ptr [eax], 'a'
    JAE IS_PROPERTY_latin_litter
    JMP IS_PROPERTY_not_latin_litter
IS_PROPERTY_latin_litter:
    inc ebx
    
IS_PROPERTY_not_latin_litter:
    inc eax
    cmp byte ptr [eax], '.'
    JNE IS_PROPERTY_for
    
    sub ebx, 3
    not ebx
    shl ebx, 1
    pop ebx
    pop eax
    pop ebp
    ret 1*dword
IS_PROPERTY ENDP
RULE1 proc          ;5
    push ebp
    mov ebp, esp
    push eax
    push ebx
    mov eax, [ebp+8]
    mov ebx, [ebp+12]
RULE1_for:
    mov bl, [eax]
    cmp bl, 'A'
    JB RULE1_not_REPLACE
    cmp bl, 'Z'
    JA RULE1_not_REPLACE
    
    add bl, 'a'-'A'
    mov [eax], bl
RULE1_not_REPLACE:
    inc eax
    cmp byte ptr [eax], '.'
    JNE RULE1_for   
    
    pop ebx
    pop eax
    pop ebp
    ret 1*dword
RULE1 endp
RULE2 proc          ;6
    push ebp
    mov ebp, esp
    push eax
    push ebx
    push ecx
    mov ecx, [ebp+8]
    mov eax, ecx
    mov bl, [eax] 
    
RULE2_for:
    mov bl, [eax]
    cmp bl, [ecx]
    JE RULE2_skip
    inc ecx
    mov [ecx], bl
RULE2_skip:
    inc eax
    cmp bl, '.'
    JNE RULE2_for
    
    mov [ecx], bl
    pop ecx
    pop ebx
    pop eax
    pop ebp
    ret 1*dword
RULE2 endp
;cf - error flag
WRITE PROC
    ;offset x
    ;MAXLEN
    push ebp
    mov ebp, esp
    push eax
    push ecx
    mov eax, [ebp+8]
    mov ecx, [ebp+12]
WRITE_for:
    cmp byte ptr [eax], '.'
    JE WRITE_break
    OUTCHAR byte ptr [eax]
    inc eax
    loop WRITE_for
            
    mov eax, 1
    jmp WRITE_ENDP
WRITE_break:
    mov eax, 0
WRITE_ENDP:
    shr eax, 1
    
    pop ecx
    pop eax
    pop ebp
    ret 2*dword
WRITE ENDP
Start:
    push MAXLEN
    push offset x
    call READ
    JC ERROR
    
    push MAXLEN
    push offset x
    call WRITE
    NEWLINE
    JC ERROR
    
    push offset x
    call IS_PROPERTY
    JNC is_RULE2
    
;    OUTCHAR '1'
;    jmp ENDPROG
    push offset x
    call RULE1  
    jmp step_write
is_RULE2:
;    OUTCHAR '2'
;    jmp ENDPROG
    push offset x
    call RULE2

step_write:
    push MAXLEN
    push offset x
    call WRITE
    JMP ENDPROG
ERROR:

ENDPROG:
    exit
end Start