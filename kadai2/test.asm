ORG 0x100
scan:
    MOV    AH, 0x06
    MOV    DL, 0xff
    INT    0x21
    CMP    AL, 'J'
    JE    up
    CMP    AL, 'K'
    JE    down
    CMP    AL, 'q'
    JE    end
    JMP    scan
up:
  MOV AX, 0xb800
  MOV DS, AX
  MOV SI, 0
  MOV AX, CS
  MOV ES, AX
  MOV DI, BUF
  CLD
  MOV CX, 80
  REP MOVSW

  MOV AX, 0xb800
  MOV DS, AX
  MOV ES, AX
  MOV SI, 160
  MOV DI, 0
  CLD
  MOV CX, 1920
  REP MOVSW

  MOV AX, CS
  MOV DS, AX
  MOV SI, BUF
  MOV AX, 0xb800
  MOV ES, AX
  MOV DI, 3840
  CLD
  MOV CX, 80
  REP MOVSW
  JMP scan

down:
  MOV AX, 0xb8c8
  MOV DS, AX
  MOV SI, 0
  MOV AX, CS
  MOV ES, AX
  MOV DI, BUF
  CLD
  MOV CX, 80
  REP MOVSW

  MOV AX, 0xb800
  MOV DS, AX
  MOV ES, AX
  MOV SI, 3839
  MOV DI, 3999
  STD
  MOV CX, 1920
  REP MOVSW

  MOV AX, CS
  MOV DS, AX
  MOV SI, BUF
  MOV AX, 0xb800
  MOV ES, AX
  MOV DI, 0
  CLD
  MOV CX, 80
  REP MOVSW
  JMP scan
end:
  MOV AX, 0x4c00
  INT 0x21

BUF times 2000 DW 0