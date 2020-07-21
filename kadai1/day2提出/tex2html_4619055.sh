#4619055 辰川力駆
cat sample.tex |
sed 's/\\documentclass.*/<!DOCTYPE html>\'$'\n/<meta charset\=\"utf\-8\"\>' |
sed 's/\\usepackage.graphicx./\<meta charset\=\"utf\-8\"\>/' | #ここまで
sed 's/\\usepackage.*/ /g' |
sed 's/\\begin.document./\<body\>/' |
sed 's/..Large .bf/\<h2\>/' |
sed '8s/\}../\<\/h2\>/' |
sed 's/.\([a-zA-Z]*\)TeX../LaTeX/' |
sed 's/.begin.itemize./\<ul style\=\"list\-style\-type\: circle\"\>/' |
sed 's/.item...circ../\<li\>/' | sed 's/.underline./ \<u\>/' | sed '13,14s/\}/\<\/u\>\<\/li\>/' |
sed 's/.item...circ../\<li\>/' | sed 's/.underline./ \<u\>/' | sed '13,14s/\}/\<\/u\>\<\/li\>/' |
sed 's/.end.itemize./\<\/ul\>/' |
sed 's/.begin.enumerate./\<ol type\=\"a\"\>/' |
sed 's/.renewcommand.*/ /' |
sed 's/.item/ \<li\>/g' |
sed 's/\([0-9]*\) \-\- \([0-9]*\)./\1 \-\- \2\)\<\/li\>/g' |
sed 's/\% \([a-zA-Z]*\) \([a-zA-Z]*\) \([a-zA-Z]*\)/\<\!\-\- \1 \2 \3 \-\-\>/' |
sed 's/.end.enumerate./\<\/ol\>/' |
sed 's/.end.document./\<\/body\>/' #最後に付ける > sample.html