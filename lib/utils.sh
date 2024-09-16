#!/bin/bash

remove_comments() {
    local file=$1
    local ext=$2
    case "$ext" in
        py) sed 's/#.*$//g' "$file" ;;
        js|ts|jsx|tsx) sed -e 's://.*$::g' -e '/\/\*/,/\*\//d' "$file" ;;
        html|php) sed 's/<!--.*-->//g' "$file" ;;
        css) sed 's/\/\*.*\*\///g' "$file" ;;
        *) cat "$file" ;;
    esac
}

minify_file() {
    local file=$1
    local ext=$2
    case "$ext" in
        css) npx csso "$file" ;;
        js|ts|jsx|tsx) npx terser "$file" ;;
        html|php) npx html-minifier --collapse-whitespace --remove-comments "$file" ;;
        py) sed 's/[[:space:]]\+/ /g' "$file" | tr -d '\n' ;;
        *) cat "$file" ;;
    esac
}

compress_output() {
    gzip -9 -c "$1" > "$1.gz"
}

generate_summary() {
    {
        echo "Project Summary:"
        echo "Total files: $(find "$2" -type f | wc -l)"
        echo "File types:"
        find "$2" -type f | sed 's/.*\.//' | sort | uniq -c | sort -rn
        echo "Total size: $(du -sh "$2" | cut -f1)"
    } > "$1"
}

txt_to_json() {
    local input_file=$1
    local output_file=$2
    awk '
    BEGIN { print "{"; first=1 }
    /^=== / {
        if (!first) print ","
        first=0
        gsub(/^=== | ===$/, "", $0)
        printf "\"%s\": \"", $0
        getline
        content=""
        next
    }
    /^$/ {
        printf "%s\"", content
        next
    }
    {
        gsub(/"/, "\\\"", $0)
        content = content $0 "\\n"
    }
    END { print "\n}" }
    ' "$input_file" > "$output_file"
}

txt_to_xml() {
    local input_file=$1
    local output_file=$2
    awk '
    BEGIN { print "<files>" }
    /^=== / {
        gsub(/^=== | ===$/, "", $0)
        filename = $0
        getline
        content=""
        next
    }
    /^$/ {
        print "<file name=\""filename"\">"
        print content
        print "</file>"
        next
    }
    {
        content = content $0 "\n"
    }
    END { print "</files>" }
    ' "$input_file" > "$output_file"
}
