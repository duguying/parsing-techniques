#!/bin/bash

WORKSPACE=$(cd $(dirname $0)/; pwd)
cd $WORKSPACE

function help() {
    echo "$0 compile|deploy"
}

function compile() {
    gitbook install
    cd ..
    pwd
    gitbook build parsing-techniques parsing-techniques-static
    cd parsing-techniques-static
    tar zcvf parsing-techniques.tar.gz ./*
    du -sh parsing-techniques.tar.gz
}

function deploy() {
    curl -X POST http://api.duguying.net/api/deploy/upload -H 'Cache-Control: no-cache' -H 'Token: '$token -H 'name: book' -F file=@parsing-techniques.tar.gz
    cd ../parsing-techniques
}

if [ "$1" == "" ]; then
    help
elif [ "$1" == "compile" ];then
    compile
elif [ "$1" == "deploy" ];then
    compile
    deploy
else
    help
fi