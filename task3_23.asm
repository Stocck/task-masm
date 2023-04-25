include console.inc

.data
    N DW ?; 0 <= N <= 999
    ;N = (d3,d2,d1)
    d1 DB ?
    d2 DB ?
    d3 DB ?
.code
start:
    ININT N
    mov AX, N
    mov CL, 10
    div CL
    mov d1, AH
    mov AH, 0
    div CL
    mov d2, AH
    mov AH, 0
    div CL
    mov d3, AH
    OUTI d3
    OUTCHAR ' '
    OUTI d2
    OUTCHAR ' '
    OUTI d1
    OUTCHAR ' '
    exit
end start