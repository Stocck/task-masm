include console.inc

.data
    N DB ?; без знака
    K DW ?
.code
start:
    ININT N
    mov AL, N
    mov CL, AL
    inc AL
    mul CL
    mov DX, 0
    mov CX, 2
    div CX
    mov K, AX
    OUTI K
    exit
end start