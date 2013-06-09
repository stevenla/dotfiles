# Get root color
if [ "$(whoami)" = "root" ]
  then HOSTCOLOR="red"
  else HOSTCOLOR="blue"
fi


#PROMPT='%{$bg_bold[black]%}%{$fg[blue]%}%n%{$fg[white]%}@%{$fg[$HOSTCOLOR]%}%m%{$fg[white]%}:%{$fg[yellow]%}%~$(git_prompt_info) %{$fg[white]%}➜ %{$reset_color%} '
PROMPT='%{$bg_bold[black]%}%{$fg[red]%}@%{$fg[$HOSTCOLOR]%}%m%{$fg[red]%}:%{$fg[green]%}%c%{$fg[white]%}$(git_prompt_info) %{$fg[white]%}➔ %{$reset_color%} '
RPROMPT='%{$fg[black]%}%D{%L:%M:%S %p}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$bg_bold[black]%}%{$fg[red]%}|%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

