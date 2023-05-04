include console.inc
.data
.code
SUM MACRO X
    ;X = <1,3,4,5,4...>
    xor ax, ax
    for i , <X>
        add ax, i
    endm
ENDM
Start:
    SUM <1,2,3,4,5,6,7>
    OUTI ax
    exit
end Start