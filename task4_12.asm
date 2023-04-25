include console.inc

.data
    StartText DB 'Entry a small Latin letter: ',0
    EndText DB 'The number of the letter in the alphabet: ',0
.code
start:
    OUTSTR offset StartText; Ввод 
    INCHAR AL
    SUB AL, 'a'-1; 'a' - 97
    OUTSTR offset EndText; Вывод
    movzx EAX, AL
    OUTI EAX
    NEWLINE
    exit
end start