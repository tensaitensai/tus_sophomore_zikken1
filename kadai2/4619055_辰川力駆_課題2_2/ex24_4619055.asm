org	0x100
mov bx,0 ;アドレステーブル参照のオフセットを示す変数
keywait:
	add bx,2
    cmp bx,2
    jle skip1
    mov bx,0
skip1:
    ;キーボードの状態のチェック
    mov ah,0x06
    mov dl,0xff
    int 0x21
    jz keywait ;キー入力がなければkeywaitへ戻る

    ;表裏の表示
    mov ah,0x09
    mov dx,[coin+bx] ;表示する文字列のアドレスを取得
    int 0x21

    ;プログラムの終了
    mov ax,0x4c00
    int 0x21

    coin dw front,back ;アドレステーブル（ポインタが入った配列）
    front db 'Front',0x0d,0x0a,'$'
    back db 'Back',0x0d,0x0a,'$'