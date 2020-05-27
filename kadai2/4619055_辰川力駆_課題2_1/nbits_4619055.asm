MOV AX,80 ;学籍番号は4619055なので55+25=80です。
loop:
    MOV BX,AX
    AND BX,1 ;2進数表記で1の位が1ならばBXを1に、0ならばBXを0にします
    ADD DX,BX
    SHR AX,1
    CMP AX,0
    JE loopend
    CALL loop
loopend: 
    HLT