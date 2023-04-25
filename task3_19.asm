include console.inc

.data
   X DB ?

.code
Start:
    INCHAR X
    ; BL -> <ECX; EBX>
    mov BL, X
    movzx EBX, BL
    mov ECX, 0

    ; AL -> <EDX, EAX>
    mov AL, X
    movsx EAX, AL
    cdq EAX
    

   exit
end Start