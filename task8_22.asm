include console.inc
.data
    x dd ?
    y dd ?
.code
start:
    inint x
    ; (x + 52) div 16 + x*32 == 3 + x div 2^4 + x*2^5
    mov eax, x
    mov ebx, eax
    shr eax, 4
    shl ebx, 5
    add eax, ebx
    add eax,3
    mov y, eax
    OUTU y
    exit
end start