#!/bin/sh

gitbook install
cd ..
pwd
gitbook build parsing-techniques parsing-techniques-static
cd parsing-techniques-static
sed -i 's/<\/head>/<script type="text\/javascript" src="http:\/\/tajs.qq.com\/stats?sId=66176470" charset="UTF-8"><\/script>\n<\/head>/g' index.html
tar zcvf parsing-techniques.tar.gz ./*
du -sh parsing-techniques.tar.gz
curl -X POST http://api.duguying.net/api/deploy/upload -H 'Cache-Control: no-cache' -H 'Token: '$token -H 'name: book' -F file=@parsing-techniques.tar.gz
cd ../parsing-techniques