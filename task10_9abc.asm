include console.inc
.data
    n = 10
    s db 'count zero el: ',0
.code
;a
swap proc
    xchg [esp+4], ecx
    xchg [esp+8], ecx
    xchg [esp+4], ecx
    ret
swap endp
;b
countZeroEl proc
    push ecx
    xor al, al
    mov ecx, n
countZeroElFor:
    cmp dword ptr [esp][dword *ecx]+4, 0; x[0] = [esp]+8
    JNE countZeroElSkip
    inc al
countZeroElSkip:
    loop countZeroElFor    
    pop ecx
    ret
countZeroEl endp
;c
replaceOddEl proc
    push ecx
    push eax
    mov ecx, n
replaceOddElFor:
    mov eax, [esp][dword*ecx]+8
    shr eax,1
    JNC replaceOddElSkip
    mov dword ptr [esp][dword*ecx]+8, 1
replaceOddElSkip:
    loop replaceOddElFor
    
    pop eax
    pop ecx
    ret
replaceOddEl endp

start:
    mov ecx, n
read:
    ININT eax
    push eax
    loop read
    ;call a
    call swap
    ;call b
    call countZeroEl
    OUTSTR offset s
    OUTU al
    newline
    ;call c
    call replaceOddEl

    mov ecx, n
write:
    pop eax
    OUTU eax
    OUTCHAR 13
    loop write
    exit
end start