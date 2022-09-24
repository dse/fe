# -*- mode: sh; sh-shell: bash -*-
fe_config_verbose=0
fe-config () {
    (( fe_config_verbose >= 2 )) && >&2 echo +fe-config+
    if (( ${FE_NO_USER_CONFIG:+$FE_NO_USER_CONFIG} )) ; then
        return
    fi
    fe-user-config
    fe-dir-config
}
fe-user-config () {
    (( fe_config_verbose >= 2 )) && >&2 echo +fe-user-config+
    if [[ -e ~/.fe/config.sh ]] ; then
        (( fe_config_verbose )) && >&2 echo . ~/.fe/config.sh
        . ~/.fe/config.sh
    fi
}
fe-dir-config () {
    (( fe_config_verbose >= 2 )) && >&2 echo +fe-dir-config+
    local fe_config_path=".fe-config.sh"
    local fe_config_dir="."
    local fe_config_root=0
    local log_prefix="${PROGNAME}: fe-dir-config:"
    local DEBUG="${DEBUG:+$DEBUG}"
    while true ; do
        (( fe_config_verbose >= 2 )) && >&2 echo \? "${fe_config_path}"
        if [[ -e "${fe_config_path}" ]] ; then
            (( DEBUG )) && >&2 echo "${log_prefix}: ${fe_config_path} found"
            (( fe_config_verbose )) && >&2 echo . "${fe_config_path}"
            . "${fe_config_path}"
        else
            (( DEBUG )) && >&2 echo "${log_prefix}: ${fe_config_path} not found"
        fi
        if (( fe_config_root )) ; then
            (( DEBUG )) && >&2 echo "${log_prefix}: fe_config_root set; terminating loop"
            break
        fi
        if [[ "${fe_config_dir}" -ef "../${fe_config_dir}" ]] ; then
            (( DEBUG )) && >&2 echo "${log_prefix}: ${fe_config_path} is at top; terminating loop"
            break
        fi
        fe_config_path="../${fe_config_path}"
        fe_config_dir="../${fe_config_dir}"
    done
}

# commands to be used in ~/.fe/config.sh and <dir>/.fe-config.sh
fefind-option () {
    (( fe_config_verbose )) && >&2 echo "add fefind options: $@"
    fefind_config_options+=("$@")
}
fegrep-option () {
    (( fe_config_verbose )) && >&2 echo "add fegrep options: $@"
    fegrep_config_options+=("$@")
}

array-includes () {
    local varname="$1"; shift
    local value="$1"; shift
    local -n var="${varname}"
    local eachvalue
    for eachvalue in "${var[@]}" ; do
        if [[ "${eachvalue}" = "${value}" ]] ; then
            return 0
        fi
    done
    return 1
}
array-exclude () {
    local varname="$1"; shift
    local value="$1"; shift
    local -n var="${varname}"
    local -a newarray=()
    for eachvalue in "${var[@]}" ; do
        if [[ "${eachvalue}" = "${value}" ]] ; then
            :
        else
            newarray+=("${eachvalue}")
        fi
    done
    var=("${newarray[@]}")
}
