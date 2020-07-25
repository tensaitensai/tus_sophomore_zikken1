#4619055 辰川力駆
cat sample.tex |
sed 's/\\documentclass.*/\<\!DOCTYPE html\>\
\<meta charset\=\"utf\-8\"\>/' | #最初の文章を出力
sed 's/\\usepackage.*//g' | #usepackageはいらないから消す
sed 's/\\begin.document./\<body\>/g' | #ここから本文なので<body>にする
sed 's/..Large .bf/\<h2\>/' | 
sed 's/\\TeX../TeX/' |
sed 's/\}../\<\/h2\>/' |
sed 's/\\begin.itemize./\<ul style\=\"list\-style\-type\: circle\"\>/' |
sed '14,15s/\\item...circ..\(.*\)/\<li\>\1\<\/li\>/' | #必要なものを\(\)で囲んで取り出している
sed 's/\\end.itemize./\<\/ul\>/' |
sed '18s/\\underline./\<u\>/' |
sed '18s/\}/\<\/u\>/' |
sed 's/\\begin.enumerate./\<ol type\=\"a\"\>/' |
sed 's/\\item/\<li\>/g' |
sed 's/0)/0)\<\/li\>/' |
sed 's/        ...End of enumerate/<!-- End of ol -->/' |
sed 's/\\end.enumerate./\<\/ol\>/' |
sed 3,5d | #いらない空白行をけす
sed 25d | #いらない空白行をけす
sed 's/\\end.document./\<\/body\>/' > sample.html #sample.htmlに出力