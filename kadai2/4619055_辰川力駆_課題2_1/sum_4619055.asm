MOV AX,0
MOV CX,10
label:
    ADD AX,CX
    LOOP label
HLT