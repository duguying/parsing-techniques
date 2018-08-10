#!bin/sh

pwd
gitbook build parsing-techniques parsing-techniques-static
tar zcvf parsing-techniques.tar.gz parsing-techniques-static/*
curl -X POST http://api.duguying.net/api/deploy/upload -H 'Cache-Control: no-cache' -H 'Token: '$token -H 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' -H 'name: book' -F file=@parsing-techniques.tar.gz
