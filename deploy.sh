#!/bin/sh

gitbook install
cd ..
pwd
gitbook build parsing-techniques parsing-techniques-static
tar zcvf parsing-techniques.tar.gz parsing-techniques-static/*
du -sh parsing-techniques.tar.gz
curl -X POST http://api.duguying.net/api/deploy/upload -H 'Cache-Control: no-cache' -H 'Token: '$token -H 'name: book' -F file=@parsing-techniques.tar.gz
cd parsing-techniques