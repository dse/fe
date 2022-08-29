# -*- mode: sh; sh-shell: bash -*-

shell-echo () {
    local arg
    local space=0
    for arg in "$@" ; do
        (( space )) && echo -n " "
        shell-echo-arg-n "${arg}"
        space=1
    done
    echo
}

shell-echo-arg-n () {
    local arg="$1"
    case "${arg}" in
        '(')                     echo -n "\\(";;
        ')')                     echo -n "\\)";;
        '!')                     echo -n "\\!";;
        ';')                     echo -n "\\;";;
        "{}")                    echo -n "{}";;
        "+")                     echo -n "+";;
        *[^+,-./0-9:=@A-Z_a-z]*) echo -n "${arg@Q}";;
        *)                       echo -n "${arg}";;
    esac
}
