org 0x100

; ESレジスタをテキストVRAMに設定
mov ax,0xb800
mov es,ax

;画面のクリア
mov cx,2000 ;80*25
fill:
    mov bx,cx
    sub bx,1 ;0~1999文字目にアクセスするため-1する
    shl bx,1 ;2バイト毎にアクセスするため2倍にする
    mov word[es:bx],0x1900 ;色:0x00,文字:0x00を書き込む 
    loop fill ;表示エリア全て繰り返す

;プログラム終了
mov ax,0x4c00
int 0x21

;0x0000を0x1900(2進数で00011001)にしたら、背景色は青、文字色も青(文字は強調されている）