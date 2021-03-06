function git_info () {
    if git rev-parse --git-dir > /dev/null 2>&1; then

        git_status="$(git status 2> /dev/null)"
        git_branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"

    # Set color based on clean/staged/dirty.
    if [[ ${git_status} =~ "working tree clean" ]]; then
        state="%F{green}"
    elif [[ ${git_status} =~ "Changes to be committed" ]]; then
        state="%F{yellow}"
    else
        state="%F{red}"
    fi

    # Set arrow icon based on status against remote.
    remote=''
    if [[ ${git_status} =~ "Your branch is "(.*)" of" ]]; then
        if [[ ${match[1]} == "ahead" ]]; then
            remote+=" ↑"
        else
            remote+=" ↓"
        fi
    fi
    if [[ ${git_status} =~ "Your branch and "(.*)" have diverged" ]]; then
        remote+=" ↕"
    fi

    echo "${state}(${git_branch})${remote} "
    fi
}

function virtualenv_info () {
    if [[ -n $VIRTUAL_ENV ]]; then
        echo "($(basename $VIRTUAL_ENV)) "
    fi
}

function prompt_len () {
    local zero='%([BSUbfksu]|([FK]|){*})'
    echo ${#${(S%%)PS1//$~zero/}}
}

function set_prompt () {
    PS1="╰ $(virtualenv_info)%F{cyan}%1~ \$ $(git_info)%f"
    PS1="$(printf '\n╭%*s\n' $(( $(prompt_len) - 2 )) | sed $'s/ /\u2500/g')"$'\n'"$PS1"
}

precmd_functions=(set_prompt)
