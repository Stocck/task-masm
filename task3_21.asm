include console.inc

.data
    A DD ?; со знаком
    B DD ?
.code
start:
    ININT A
    mov AX, word ptr A
    mov DX, word ptr A+2
    mov BX, 1000
    idiv BX
    imul DX
    mov word ptr B, AX
    mov word ptr B+2, DX
    OUTI B;
    exit
end start