#!/usr/bin/env bash

set -eu -o pipefail

if ! command -v golangci-lint &> /dev/null ; then
    echo "golangci-lint not installed or available in the PATH" >&2
    echo "please check https://github.com/golangci/golangci-lint" >&2
    exit 1
fi

fail() {
    err=`golangci-lint run`
    if [`echo $err | grep "no go files to analyze"` -eq ""] ; then
        echo $err
        exit 1
    fi
    exit 0
}

golangci-lint run || fail
