MOV AX,0x0b
MOV BX,0x0f
CALL sub2
CALL sub1
MOV DX,AX
HLT

sub1:
    SUB AX,BX 
    RET
sub2:
    CMP AX,BX
    JAE sub2end
    MOV DX,AX
    MOV AX,BX
    MOV BX,DX
sub2end:
    RET