# -*- mode: sh; sh-shell: bash -*-

declare -i shell_echo_column=0
declare -i shell_echo_space=0
declare -i shell_echo_first=1
declare -i shell_echo_next_newline=0
declare -i shell_echo_comment=0

shell-echo-find () {
    local -i indent=0
    local indentation=''
    local indentone='    '
    local space=''
    local -i returnatend=0
    addindent () {
        indent=$((indent + 1))
        indentation="${indentation}${indentone}"
    }
    unindent () {
        if (( indent > 0 )) ; then
            indent=$((indent - 1))
        fi
        if [[ "${indentation}" =~ . ]] ; then
            indentation="${indentation%${indentone}}"
        fi
    }
    for i ; do
        case "${i}" in
            '(')
                echo "${space}\\("
                addindent
                returnatend=0
                space="${indentation}"
                ;;
            ')')
                echo "${space}\\) \\"
                unindent
                space="${indentation}"
                returnatend=0
                ;;
            '-o')
                echo "${space}-o \\"
                space="${indentation}"
                returnatend=0
                ;;
            '')
                echo -n "${space}''"
                space=' '
                returnatend=1
                ;;
            *[^-A-Za-z0-9+,./:=@_]*)
                echo -n "${space}${i@Q}"
                space=' '
                returnatend=1
                ;;
            *)
                echo -n "${space}$i"
                space=' '
                returnatend=1
                ;;
        esac
    done
    if (( returnatend )) ; then
        echo
    fi
}

shell-echo-raw () {
    local i
    local -i next_column
    local -i length
    local -i newline
    for i ; do
        length="${#i}"
        next_column=$(( shell_echo_column + length + shell_echo_space ))
        newline=0

        if (( shell_echo_next_newline )) ; then
            newline=1
        elif (( !shell_echo_first && next_column > 76 )) ; then
            newline=1
        elif (( as_flat )) && [[ "${i}" = "\\!" ]] ; then
            newline=1
        elif (( as_flat )) && [[ "${i}" = "-exec" ]] ; then
            newline=1
        fi

        if (( newline )) ; then
            echo " \\"
            shell_echo_column=0
            if (( shell_echo_comment )) ; then
                echo -n "# "
                shell_echo_column+=2
            fi
            echo -n "    ${i}"
            shell_echo_column+=$(( 4 + length ))
            shell_echo_space=1
            shell_echo_first=0
            shell_echo_next_newline=0
        else
            if (( shell_echo_space )) ; then
                echo -n " ${i}"
            else
                if (( shell_echo_comment )) ; then
                    echo -n "# "
                    shell_echo_column+=2
                fi
                echo -n "${i}"
            fi
            shell_echo_column+=$(( length + shell_echo_space ))
            shell_echo_space=1
            shell_echo_first=0
            shell_echo_next_newline=0
        fi
        if (( as_flat )) && [[ "${i}" = "\\)" ]] ; then
            shell_echo_next_newline=1
        fi
    done
}

shell-echo () {
    local i ii
    for i ; do
        ii="${i}"
        case "${i}" in
            '('|')'|'*'|'!')
                ii="\\${i}";;
            '{}')
                ii="${i}";;
            *[^-+,./:=@_A-Za-z0-9]*) # anything with a character not in that set, i.e., a character that needs to be quoted or escaped
                ii="${i@Q}";;
        esac
        shell-echo-raw "${ii}"
    done
}

shell-echo-nl () {
    shell_echo_column=0
    shell_echo_first=1
    shell_echo_space=0
    echo
}
