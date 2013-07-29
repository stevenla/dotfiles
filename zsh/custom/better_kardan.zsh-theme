# Simple theme based on my old zsh settings.
# Customized by steven la <mrstevenla@gmail.com>

# Colors yanked from powerline

function get_left_color {
    if [ "$(whoami)" = "root" ]
    then
        echo "%F{160}"
    else
        echo "%F{244}"
    fi
}

function get_host {
    if [ -n "$SSH_CLIENT" ]
    then
        echo " « @"`hostname`''
    fi
}

PROMPT='$(get_left_color)› %{$reset_color%}'
RPROMPT='%F{244}%~$(git_prompt_info)$(virtualenv_prompt_info)$(get_host)'

ZSH_THEME_VIRTUALENV_PROMPT_PREFIX=" « "
ZSH_THEME_VIRTUALENV_PROMPT_SUFFIX=""

ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_PREFIX=" « "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
