#!/bin/bash

# Minify functions

minify() {
    local file=$1
    local ext=$2
    case "$ext" in
        css|js)
            sed 's/\/\*[^*]*\*\/\|\/\/.*$//g' "$file" | tr -d '\n' | sed 's/[[:space:]]\+/ /g'
            ;;
        html|php)
            sed 's/<!--.*-->//g' "$file" | tr -d '\n' | sed 's/[[:space:]]\+/ /g'
            ;;
        sql)
            sed 's/--.*$//g' "$file" | tr -d '\n' | sed 's/[[:space:]]\+/ /g'
            ;;
        *)
            cat "$file"
            ;;
    esac
}
