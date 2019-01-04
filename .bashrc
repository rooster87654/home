#!/bin/sh

alias ll='ls -alF'
alias pd=pushd
alias po=popd

set -o vi

export PS1="\h:\W \u $ "

ulimit -n 2048

export ANT_OPS="-Xmx2048m -XX:MaxPermSize=1024m"

export PATH=/usr/local/bin:/tools/bin:$PATH

# export EDITOR="/usr/local/bin/mate -w"
