MOV AX,0x0b
MOV BX,0x0f
CMP AX,BX
JAE sub1
JB sub2
HLT
sub1:
    SUB AX,BX
    MOV DX,AX
    HLT
sub2:
    SUB BX,AX
    MOV DX,BX
    HLT