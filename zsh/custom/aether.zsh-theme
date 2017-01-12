# Aether zsh prompt
# Steven La (stevenla.com)
#
function colorize {
    # colorize red hello
    # colorize red hello no-suffix
    echo -n "%F{$1}$2"
    [[ -z $3 ]] && echo -n "%{$reset_color%}"
}

function get_left_prompt {
    echo -n '\n'
    colorize cyan "%n"
    echo -n '@'
    colorize blue "%m"
    echo -n ':'
    colorize green "%~"
    git_prompt_info
    echo -n "\n › "
}

function get_right_prompt {
    colorize '%(?.240.red)' $(date "+%H:%M")
}

ZSH_THEME_GIT_PROMPT_PREFIX=$(colorize yellow " (" skip)
ZSH_THEME_GIT_PROMPT_SUFFIX=$(colorize yellow ")")
ZSH_THEME_GIT_PROMPT_DIRTY=$(colorize red "•")
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT=$(get_left_prompt)
RPROMPT=$(get_right_prompt)
