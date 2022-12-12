alias cd="cl"
function cl {
    if [ "$#" -eq 0 ]; then
        "cd" || return
    else
        "cd" "$1" || return
    fi
    ls -lah --color=auto
}
