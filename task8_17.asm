include console.inc
.data
   sYes db 'Yes',0
   sNo db 'No',0
.code
start:
    inint eax
    
    mov ecx, 32
for1:
    shr eax, 1
    jz YES
    jc NO
    loop for1
YES:
    OUTSTR offset sYes
    jmp pend
NO:
    OUTSTR offset sNo
pend:
    exit
end start