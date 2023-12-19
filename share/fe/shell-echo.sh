# -*- mode: sh; sh-shell: bash -*-

shell-echo () {
    echo "$@"
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
