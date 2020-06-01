org 0x100

;21~25行目をバッファに保存
mov ax,0xb800 ;1行目の先頭アドレス
mov ds,ax ;DS=0xb800
mov si,3200 ;21行目の先頭アドレス(80*20*2)
mov ax,cs
mov es,ax ;ES=CS
mov di,buf
cld 
mov cx,400 ;80*5
rep movsw ;0xb8c8:0x0000から5行文をBUFへ保存

;画面を5行分下にスクロール
mov ax,0xb800
mov ds,ax ;DS=0xb800
mov es,ax ;ES=0xb800
mov si,3199 ;20行目の最後のアドレス(80*20*2-1)
mov di,3999 ;25行目の最後のアドレス(80*25*2-1)
std
mov cx,1600 ;80*20
rep movsw ;1~20行目を6~25行目へコピー

;バッファへ保存した21~25行目を1~5行目へ書き戻す
mov ax,cs
mov ds,ax ;DS=CS
mov si,buf
mov ax,0xb800 
mov es,ax ;ES=0xb800
mov di,0 ;1行目の先頭アドレス
cld
mov cx,400 ;80*5
rep movsw ;BUFから5行分を0xb800:0x0000へコピー

;キー入力街待ち
mov ah,0x01
int 21h

;プログラム終了
mov ax,0x4c00
int 0x21

buf times 2000 dw 0

