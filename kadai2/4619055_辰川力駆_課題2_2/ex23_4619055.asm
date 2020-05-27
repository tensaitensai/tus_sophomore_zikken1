org 0x100

;文字列入力
mov ah,0x0a
mov dx,bufstruct
int 0x21

;入力された文字列の最後に終端文字'$'を追加
mov bl, [LEN]
mov bh,0
mov byte [BUF+BX],'$'

;文字列出力
mov ah,0x09
mov dx,CRLF ;改行を表示
int 0x21
mov dx,BUF ;入力された文字列を表示
int 0x21
mov dx,CRLF ;改行を表示
int 0x21
mov ax,0x4c00
int 0x21

bufstruct:
SIZE db 10
LEN db 0
BUF times 11 db 0
CRLF db 0x0d,0x0a,'$'