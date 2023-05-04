include console.inc
.data

DEF MACRO X,T,N,V
    X d&T N dup(V)
endm
    K EQU 4
    DEF C,B,10,'*'
    DEF W,W,K+1,<TYPE C>
    DEF ,D,%K+1,%(TYPE W)
    DEF A,B,1,<1,2,3>
    
.code

Start:
    outu type C
    outu type W
    outu type A
    exit
end Start