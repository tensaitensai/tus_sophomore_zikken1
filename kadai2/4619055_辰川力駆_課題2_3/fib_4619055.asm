;; フィボナッチ数列を求める
org 0x100
 
;; 1つめのフィボナッチ数を計算 (5)
mov ah, 2
mov al, 3
add ah, al
loop:   ;2つめ~9つめのフィボナッチ数を計算
    cmp al,128 ;２つ前の数が128を超えたとき終了する
    jae end
    mov bl, ah
    mov ah, al
    mov al, bl
    add ah, al
    call loop
 
end:
    mov dh, 0
    mov dl, ah          ; 結果をDLレジスタに保存
    ;; プログラム終了
    mov ah, 0x4c
    int 0x21