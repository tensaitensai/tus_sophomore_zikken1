org 0x100
call key_input ;キー入力待ち

key_input:
    ;キー入力待ち
    mov ah,0x06
    mov dl,0xff
    int 0x21
    cmp al,'q' ;"q"が入力されたらプログラム終了
    je endcode
    cmp al,'J' ;"J"が入力されたら上方向へスクロール
    je up_screen
    cmp al,'K' ;"K"が入力されたら下方向へスクロール
    je down_screen
    jmp key_input

up_screen:
   ;画面の上から1行をバッファに保存
    mov ax,0xb800
    mov ds,ax ;DS=0xb800
    mov si,0 ;1行目の先頭アドレス
    mov ax,cs
    mov es,ax ;ES=CS
    mov di,buf
    cld 
    mov cx,80 ;80*1
    rep movsw ;1行文をBUFへ保存

    ;画面を1行分上にスクロール
    mov ax,0xb800
    mov ds,ax ;DS=0xb800
    mov es,ax ;ES=0xb800
    mov si,160 ;2行目の先頭アドレス(80*1*2)
    mov di,0 ;1行目の先頭アドレス
    cld 
    mov cx,1920 ;80*24
    rep movsw ;2~25行目を1~24行目へコピー

    ;バッファへ保存した1行目を25行目へ書き戻す
    mov ax,cs
    mov ds,ax ;DS=CS
    mov si,buf
    mov ax,0xb800 
    mov es,ax ;ES=0xb800
    mov di,3840 ;25行目の先頭アドレス(80*24*2)
    cld
    mov cx,80 ;80*1
    rep movsw ;BUFから1行分をコピー
    jmp key_input

down_screen:
    ;25行目をバッファに保存
    mov ax,0xb800 ;1行目の先頭アドレス
    mov ds,ax ;DS=0xb800
    mov si,3840 ;25行目の先頭アドレス(80*24*2)
    mov ax,cs
    mov es,ax ;ES=CS
    mov di,buf
    cld 
    mov cx,80 ;80*1
    rep movsw ;1行文をBUFへ保存

    ;画面を1行分下にスクロール
    mov ax,0xb800
    mov ds,ax ;DS=0xb800
    mov es,ax ;ES=0xb800
    mov si,3839 ;24行目の最後のアドレス(80*24*2-1)
    mov di,3999 ;25行目の最後のアドレス(80*25*2-1)
    std
    mov cx,1920 ;80*24
    rep movsw ;1~24行目を2~25行目へコピー

    ;バッファへ保存した25行目を1行目へ書き戻す
    mov ax,cs
    mov ds,ax ;DS=CS
    mov si,buf
    mov ax,0xb800
    mov es,ax ;ES=0xb800
    mov di,0 ;1行目の先頭アドレス
    cld
    mov cx,80 ;80*1
    rep movsw 
    jmp key_input

endcode:
    ;プログラム終了
    mov ax,0x4c00
    int 0x21

buf times 2000 dw 0