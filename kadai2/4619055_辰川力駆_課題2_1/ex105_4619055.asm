MOV AX,0x06
MOV BX,0x02
SUB BX,AX ;なぜFFFCか、マイナスの概念がないから
HLT ;AXは16進数で2(10進数で2),BXは16進数でFFFC(10進数で65532)である