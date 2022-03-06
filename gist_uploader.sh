#!/bin/bash

USAGE='Usage: '"$0"' "gist_ID" "commit message" "file(s)"'"\n\n"'"gist_ID" is in the gist URL: https://gist.github.com/USERNAME/gist_ID"'"\n"

parsing () {
    if [ $# -lt 3 ]; then
        echo -e "$USAGE"
        exit 1
    fi

    for file in "${@:3}"; do
        if [ ! -e "$file" ]; then
            echo "$file: File not found." >&2
            exit 2
        fi
    done
}

main () {
    GIST="$1"

    tmpdir=$(mktemp -d "${1##*/}".XXXXXXXXXX --tmpdir)

    git clone "git@gist.github.com:/$GIST.git" "$tmpdir"

    for file in "${@:3}"; do
        cp -r "$file" "$tmpdir/"
    done

    cd "$tmpdir" || exit

    git add -A

    git commit -a -m "$2"

    git push

    rm -r -f "$tmpdir"
}

parsing "$@"
main "$@"

exit 0
