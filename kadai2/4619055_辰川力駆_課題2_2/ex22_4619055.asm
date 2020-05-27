keywait:
    mov ah,0x06 ;AH=0x06 直接コンソールI/O
    mov dl,0xff ;DL=0xff キーボードの状態チェック
    int 0x21 ;システムコール呼び出し
    jz keywait ;キー入力がなければkeywaitへ戻る
    mov ah,0x4c ;AH=0x4c プログラムの終了
    int 0x21 ;システムコール呼び出し