#!/bin/bash

WORKSPACE=$(cd $(dirname $0)/; pwd)
cd $WORKSPACE

function help() {
    echo "$0 compile|deploy"
}

function compile() {
    gitbook install
    WORKDIR=$(pwd)
    cd ..
    pwd
    echo 'WORKDIR: '$WORKDIR
    gitbook build $WORKDIR parsing-techniques-static
    cd parsing-techniques-static
    tar zcvf parsing-techniques.tar.gz ./*
    du -sh parsing-techniques.tar.gz
}

function deploy() {
    curl -X POST https://api.duguying.net/api/deploy/upload -H 'Cache-Control: no-cache' -H 'Token: '$token -H 'name: book' -F file=@parsing-techniques.tar.gz -k
    cd $WORKSPACE
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
