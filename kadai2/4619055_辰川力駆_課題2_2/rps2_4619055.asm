org	0x100
mov bx,0 ;アドレステーブル参照のオフセットを示す変数

call firstmsg ;最初のメッセージを表示
call inputfunc ;文字列入力
call rsltuser ;userの結果を表示
call keywait ;キー入力が入るとCPUのじゃんけんがきまる
call rsltcpu ;CPUの結果を表示

;プログラムの終了
mov ax,0x4c00
int 0x21

keywait:
	add bx,2
    cmp bx,4
    jle skip
    mov bx,0
skip:
    ;キーボードの状態のチェック
    mov ah,0x06
    mov dl,0xff
    int 0x21
    jz keywait ;キー入力がなければkeywaitへ戻る
    RET
    
firstmsg:
    ;最初のメッセージを表示
    mov ah,0x09
    mov dx,msg 
    int 0x21
    RET

rsltuser:
    ;userの結果を表示
    add bx,ax
    add bx,ax
    and bx,0x0f
    mov ah,0x09
    mov dx,usrmsg 
    int 0x21
    mov dx,[handsign+bx]
    int 0x21
    mov bx,0
    RET

rsltcpu:
    ;CPUの結果を表示
    mov ah,0x09
    mov dx,cpumsg 
    int 0x21
    mov dx,[handsign+bx]
    int 0x21
    RET
    
inputfunc:
    ;文字列入力
    mov ah,0x09
    mov dx,input ;inputメッセージを表示
    int 0x21
    mov ah,0x01 ;文字列入力
    int 0x21
    mov ah,0x09
    mov dx,crlf ;改行を表示
    int 0x21
    RET

msg db 'Please Input Handsign (Rock->0, Paper->1, Scissors->2)',0x0d,0x0a,'$'
input db 'INPUT:',0x0d,0x0a,'$'
usrmsg db 'User: ','$'
cpumsg db 'CPU: ','$'

handsign dw rock,paper,scissors ;アドレステーブル（ポインタが入った配列）
rock db 'Rock',0x0d,0x0a,'$'
paper db 'Paper',0x0d,0x0a,'$'
scissors db 'Scissors',0x0d,0x0a,'$'
crlf db 0x0d,0x0a,'$'
