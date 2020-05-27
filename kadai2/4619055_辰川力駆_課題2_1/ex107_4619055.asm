MOV AX,0x05
MOV BX,0x05
CMP AX,BX
HLT 
;(a)のときCFは0,ZFは0
;(b)のときCFは1,ZFは0
;(c)のときCFは0,ZFは1