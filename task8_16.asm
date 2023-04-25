include console.inc
.data
    
.code
start:
    ININT eax
    mov ecx, 32
write:
    xor ebx, ebx
    shl eax, 1
    rcl ebx, 1
    add ebx, '0'
    outchar bl
    loop write
    
    exit
end start