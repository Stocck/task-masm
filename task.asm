include console.inc

.data
    N DB ?
.code
start:
    mov N, 'O'
    mov N + 1, 'n'
    mov N + 2, 'i'
    mov N + 3, 'i'
    mov N + 4, '-'
    mov N + 5, 's'
    mov N + 6, 'a'
    mov N + 7, 'n'
    mov N + 8, 0
    OUTSTR offset N
    exit
end start