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
}

function get_right_prompt {
}

ZSH_THEME_GIT_PROMPT_PREFIX=$(colorize yellow " (" no-suffix)
ZSH_THEME_GIT_PROMPT_SUFFIX=$(colorize yellow ")")
ZSH_THEME_GIT_PROMPT_DIRTY=$(colorize red "•")
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='
$(colorize cyan "%n")\
$(colorize 240 "@")\
$(colorize blue "%m")\
$(colorize 240 " ")\
$(colorize green "%~")\
$(git_prompt_info)\
$(colorize 240 "\n› ")\
'

RPROMPT=$(colorize "%(?.240.red)" "%D{%k:%M}")
