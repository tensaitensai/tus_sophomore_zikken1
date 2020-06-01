org 0x100

;画面の上から5行をバッファに保存
mov ax,0xb800
mov ds,ax ;DS=0xb800
mov si,0 ;1行目の先頭アドレス
mov ax,cs
mov es,ax ;ES=CS
mov di,buf
cld 
mov cx,400 ;80*5
rep movsw ;0xb800:0x0000から5行文をBUFへ保存

;画面を5行分スクロール
mov ax,0xb800
mov ds,ax ;DS=0xb800
mov es,ax ;ES=0xb800
mov si,800 ;6行目の先頭アドレス(80*5*2)
mov di,0 ;1行目の先頭アドレス
cld 
mov cx,1600 ;80*20
rep movsw ;6~25行目を1~20行目へコピー

;バッファへ保存した1~5行目を21~25行目へ書き戻す
mov ax,cs
mov ds,ax ;DS=CS
mov si,buf
mov ax,0xb800 
mov es,ax ;ES=0xb800
mov di,3200 ;21行目の先頭アドレス(80*20*2)
cld
mov cx,400 ;80*5
rep movsw ;BUFから5行分を0xb800:0x0c80へコピー

;キー入力街待ち
mov ah,0x01
int 21h

;プログラム終了
mov ax,0x4c00
int 0x21

buf times 2000 dw 0

