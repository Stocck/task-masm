include console.inc

.data
   X DQ ?
   Y DQ ?
   Z DQ ?

.code
Start:
   ININT dword ptr X
   ININT dword ptr Y
   mov EAX, dword ptr X
   add EAX, dword ptr Y
   mov dword ptr Z, EAX
   mov EAX, dword ptr X + 4
   adc EAX, dword ptr Y + 4
   mov dword ptr Z + 4, EAX
   OUTU Z
   NEWLINE

   exit
end Start