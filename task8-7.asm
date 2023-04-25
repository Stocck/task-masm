include console.inc
.data
    N=10
    x dq N dup(?)
    k db ?
.code
start:
    mov ecx, N
read:
    inint eax
    cdq
    mov dword ptr x[ecx*type x]-type x, eax
    mov dword ptr x[ecx*type x]-type x + dword, edx
    loop read

    mov ecx, N
    mov eax, -1 
for1:
    and eax, dword ptr x[ecx*type x]-type x + dword
    loop for1
    
    shl eax, 1  
    rcl k,1
    movzx eax, k
    OUTU eax
    exit
end start