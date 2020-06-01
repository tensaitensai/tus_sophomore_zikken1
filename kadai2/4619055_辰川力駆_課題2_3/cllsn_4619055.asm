org 0x100

; ESレジスタをテキストVRAMに設定
mov ax,0xb800
mov es,ax
call crearing_screen ;画面のクリア
mov dx, 0
loop: 
    call key_input ;キー入力待ち
    call loopfunc ;"o"と"x"を表示して色を変える関数

crearing_screen:
    ;画面のクリア
    mov cx,2000 ;80*25
    fill:
        mov bx,cx
        sub bx,1 ;0~1999文字目にアクセスするため-1する
        shl bx,1 ;2バイト毎にアクセスするため2倍にする
        mov word[es:bx],0x0000 ;色:0x00,文字:0x00を書き込む 
        loop fill ;表示エリア全て繰り返す

key_input:
    ;キー入力待ち
    mov ah,0x01
    int 21h
    cmp al, 0x71 ;"q"が入力されたらプログラム終了
    je endcode
    RET

loopfunc:
    ;"o"と"x"を表示して色を変える関数

    mov cx, 160
    fill_line:
        ;指定行の色を変える
        mov bx, cx
        sub bx, 1
        shl bx, 1
        mov word [es:bx], 0x6d00 
        loop fill_line

    mov cx, 80
    fill_screen:
        ;指定行以外の色を黒にする
        mov bx, cx
        sub bx, 1
        shl bx, 1
        mov word [es:bx], 0x0000
        loop fill_screen

    ;"o"を表示
    mov bx, 160
    add bx, dx
    mov word [es:bx], 0x6d6f

    ;"x"を表示
    mov bx, 318
    sub bx, dx
    mov word [es:bx], 0x6d78

    add dx, 2
    cmp dx,80
    je endcode ;衝突したら終了
    call loop

endcode:
    ;プログラム終了
    mov ax,0x4c00
    int 0x21