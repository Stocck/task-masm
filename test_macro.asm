include console.inc
.data
    X dw ?
    Y dw ?
.code
; Procedure
;имя PROC
;
;ret
;имя ENDP
start:
    mov esi, 11
    mov si, 10
    OUTU si
    exit
end start
