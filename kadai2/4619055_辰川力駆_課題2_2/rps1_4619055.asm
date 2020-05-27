org	0x100
mov bx,0 ;アドレステーブル参照のオフセットを示す変数
keywait:
	add bx,2
    cmp bx,4
    jle skip1
    mov bx,0
skip1:
    ;キーボードの状態のチェック
    mov ah,0x06
    mov dl,0xff
    int 0x21
    jz keywait ;キー入力がなければkeywaitへ戻る

    ;じゃんけんの表示
    mov ah,0x09
    mov dx,[handsign+bx] ;表示する文字列のアドレスを取得
    int 0x21

    ;プログラムの終了
    mov ax,0x4c00
    int 0x21

    handsign dw rock,paper,scissors ;アドレステーブル（ポインタが入った配列）
    rock db 'Rock',0x0d,0x0a,'$'
    paper db 'Paper',0x0d,0x0a,'$'
    scissors db 'Scissors',0x0d,0x0a,'$'
