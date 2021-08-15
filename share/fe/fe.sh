# -*- mode: sh; sh-shell: bash -*-
fe-config () {
    if (( ${FE_NO_USER_CONFIG:+$FE_NO_USER_CONFIG} )) ; then
        return
    fi
    fe-user-config
    fe-dir-config
}
fe-user-config () {
    if [[ -e ~/.fe/config.sh ]] ; then
        . ~/.fe/config.sh
    fi
}
fe-dir-config () {
    local fe_config_path=".fe-config.sh"
    local fe_config_dir="."
    local fe_config_root=0
    local log_prefix="${PROGNAME}: fe-dir-config:"
    local DEBUG="${DEBUG:+$DEBUG}"
    while true ; do
        if [[ -e "${fe_config_path}" ]] ; then
            (( DEBUG )) && >&2 echo "${log_prefix}: ${fe_config_path} found"
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
    fefind_config_options+=("$@")
}
fegrep-option () {
    fegrep_config_options+=("$@")
}
