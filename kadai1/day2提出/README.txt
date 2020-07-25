ダウンロードありがとうございます！

解凍したファイルは
sample.tex
tex2html_4619055.sh
update_html_4619055.sh
update_html_ver2_4619055.sh
update_html_ver3_4619055.sh
があります！

tex2html_4619055.shは、sample.texをhtml形式(sample.html)に変換します
使い方: bash tex2html_4619055.sh

update_html_4619055.shは、sample.htmlのグループリストを追加できるシェルスクリプトです！
使い方: bash update_html_4619055.sh (グループ) (学籍番号の開始番号) (学籍番号の終了番号)

update_html_ver2_4619055.shは、update_html_4619055.shと同様のことができる上に毎回バックアップが実行した時刻で作られます
使い方: update_html_4619055.shと同じ
update_html_ver3_4619055.shは、update_html_ver2_4619055.shと同様のことができる上にundoコマンドでバックアップを使って元に戻すことができます
使い方: bash update_html_ver3_4619055.sh undo