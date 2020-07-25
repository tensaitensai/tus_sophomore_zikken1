#4619055 辰川力駆
if [ $# -lt 3 ] ; then 
    if [ $# -eq 0 ] ; then #引数がないときのエラーハンドリング
        echo "エラー：グループ名を第1引数に，学籍番号の開始番号を第2引数に，終了番号を第3引数に指定してください．"
    else #引数が少ないときのエラーハンドリング
        echo "エラー：引数が足りません．"
    fi
elif [ $# -gt 3 ] ; then #引数が多いときのエラーハンドリング
    echo "エラー：引数が多すぎます．"
elif [ $# -eq 3 ] ; then
    if [ $2 -gt $3 ] ; then #数字の番号の前後がおかしいときのエラーハンドリング
        echo "エラー：終了番号より開始番号の方が大きいです. "
    elif [ $2 -lt 100 -a $3 -lt 100 ] ; then #両方が2桁なら両方に0を付け加える
        sed -i 's/<!-- End of ol -->/   <li> '$1' (学籍番号0'$2' -- 0'$3')<\/li>\n <!-- End of ol --> /g' sample.html
    elif [ $2 -lt 100 ] ; then #開始番号が2桁なら0を付け加える
        sed -i 's/<!-- End of ol -->/   <li> '$1' (学籍番号0'$2' -- '$3')<\/li>\n <!-- End of ol --> /g' sample.html
    else
        sed -i 's/<!-- End of ol -->/   <li> '$1' (学籍番号'$2' -- '$3')<\/li>\n <!-- End of ol --> /g' sample.html
    fi
fi  