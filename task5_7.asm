include console.inc

.data
    StartText DB 'Entry a small Latin letter: ',0
    TextNO DB 'No ',0
    TextYES DB 'Yes ',0

    C DB ?
    K DB ?
.code
start:
    OUTSTR offset StartText
    INCHAR C
    MOV AL, C
    CMP AL, '9'
    JA Letter           ;if c <= 9 then goto Letter
    
    ;else
    CMP AL, '0'
    JAE Yes             ; if c >= 0  then goto Yes
    JMP Nah             ; else goto Nah

Letter: 
    CMP AL, 'A'
    JB Nah              ; if c < 'A' then goto Nah
    CMP AL, 'F'
    JBE Yes             ; if c <= 'F' then goto Yes

Nah: 
    OUTSTR offset TextNO
    MOV K, 0
    JMP EndMain

Yes:
    OUTSTR offset TextYES
    MOV K, 1

EndMain:
    OUTU K
    exit
end start