# Simple theme based on my old zsh settings.
# Customized by steven la <mrstevenla@gmail.com>

# Colors yanked from powerline
#
local C_YEL="%{$fg[yellow]%}"
local C_RED="%{$fg[red]%}"
local C_BLUE="%{$fg[blue]%}"
local C_D_GRAY="%F{240}"

local DIV="$C_D_GRAY«"

function get_left_color {
    if [ "$(whoami)" = "root" ]
    then
        echo "$C_RED"
    elif [ -n "$SSH_CLIENT" ]
    then
        echo "$C_BLUE"
    else
        echo "%f"
    fi
}

PROMPT='
$(get_left_color) › %{$reset_color%}'
RPROMPT='%3~$(virtualenv_prompt_info)$(git_prompt_info)'

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX=" $C_BLUE<"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=">"

ZSH_THEME_GIT_PROMPT_DIRTY="$C_RED*$C_YEL"
ZSH_THEME_GIT_PROMPT_PREFIX=" $C_YEL("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%f"
