#!/bin/bash

set -eu
shopt -s nullglob

cd "$(dirname "$0")"

REVEALMD_FLAGS="--scripts https://cdn.tonycrane.cc/heti/heti.js,heti_worker.js --template template.html"
DIST_DIR=${DIST_DIR:-dist}

help() {
    echo "Usage: $0 <file>.md        # to live preview"
    echo "       $0 build <file>.md  # to build a document"
    echo "   or  $0 build.sh         # to build all documents"
    exit 1
}

file_check() {
    # Check if file exists
    if [ ! -f "$1" ]; then
        echo "File not found: $1"
        help
    fi
}

live() {
    echo "Live preview of $1"

    reveal-md "$1" -w $REVEALMD_FLAGS
}

build() {
    echo "Building $1"

    docname="$(basename "$1" .md)"

    reveal-md "$1" $REVEALMD_FLAGS --static "$DIST_DIR/$docname" --assets-dir assets
    rm "$DIST_DIR/$docname/$docname.html"
    cp -r "$docname" "$DIST_DIR/$docname"
}

if [ "$1" == "build" ]; then
    if [ $# -lt 2 ]; then
        echo "Building all documents"
        for f in *.md; do
            build $f
        done
    else
        file_check $2
        build $2
    fi
else
    file_check $1
    live $1
fi