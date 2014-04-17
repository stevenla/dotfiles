# Simple theme based on my old zsh settings.
# Customized by steven la <mrstevenla@gmail.com>

# Colors yanked from powerline
#
local C_YEL="%{$fg[yellow]%}"
local C_RED="%{$fg[red]%}"
local C_BLUE="%{$fg[blue]%}"
local C_GREEN="%{$fg[green]%}"
local C_CYAN="%{$fg[cyan]%}"
local C_D_GRAY="%F{240}"
local C_RESET="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX=" $C_YEL("
ZSH_THEME_GIT_PROMPT_SUFFIX="$C_YEL)"
ZSH_THEME_GIT_PROMPT_DIRTY="$C_RED!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX=" $C_RED<"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=">"

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

local PROMPT_USER="$C_CYAN%n$C_RESET@$C_BLUE%m"
local PROMPT_DIR="$C_GREEN%~"
local PROMPT_VIRTUALENV=""

PROMPT='
$PROMPT_USER$C_RESET:$PROMPT_DIR$(virtualenv_prompt_info)$(git_prompt_info)
$C_RESET › '
