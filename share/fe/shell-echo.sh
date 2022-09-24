# -*- mode: sh; sh-shell: bash -*-

shell-echo () {
    echo "$@"
}

shell-echo-find-cmd () {
    echo -n '+ '
    local arg
    local space=''           # echo space before next argument if on same line
    local indent='  '
    local -a indentstack=()
    local dim=''
    local reset=''
    if [[ -t 1 ]] ; then
        dim=$'\e''[2m'
        reset=$'\e''[m'
    fi
    for arg ; do
        case "${arg}" in
            '(')                     __open  "\\(";;
            ')')                     __close "\\)";;
            '!')                     __arg   "\\!";;
            ';')                     __arg   "\\;";;
            '-o')                    __or    "-o";;
            '{}')                    __arg "${arg}";;
            *[^-+,./0-9:=@A-Z_a-z]*) __arg "${arg@Q}";;
            *)                       __arg "${arg}";;
        esac
    done
    echo
}

__open () {
    local arg="$1"
    indentstack+=("$indent")
    indent="${indent}  "
    echo "${space}${arg} ${dim}\\${reset}"
    echo -n "${indent}"
    space=''
}

__close () {
    local arg="$1"
    echo "${space}${dim}\\${reset}"
    if (( ${#indentstack} )) ; then
        indent="${indentstack[-1]}"
        unset 'indentstack[-1]'
    fi
    echo "${indent}${arg} ${dim}\\${reset}"
    echo -n "${indent}"
    space=''
}

__arg () {
    local arg="$1"
    echo -n "${space}${arg}"
    space=' '
}

__or () {
    local arg="$1"
    echo "${space}${arg} ${dim}\\${reset}"
    echo -n "${indent}"
    space=''
}
