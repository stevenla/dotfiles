# Aether zsh prompt
# Steven La (stevenla.com)

# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)
# terminal codes:
# \e7   => save cursor position
# \e[2A => move cursor 2 lines up
# \e[1G => go to position 1 in terminal
# \e8   => restore cursor position
# \e[K  => clears everything after the cursor on the current line
# \e[2K => clear everything on the current line


function hg_root() {
  local DIR=$(pwd)
  while [[ "$DIR" != "/" ]];
  do
    if [[ -a "$DIR/.hg" ]];
    then
      echo -n "$DIR"
      break
    fi
    local DIR=$(dirname $DIR)
  done
}

function current_hg_bm() {
  local HG_ROOT=$(hg_root)
  if [[ -n "$HG_ROOT" && -a "$HG_ROOT/.hg/bookmarks.current" ]];
  then
    colorize yellow " (" no-suffix
    cat $HG_ROOT/.hg/bookmarks.current
    [[ -n "$(hg status)" ]] && colorize red "•"
    colorize yellow ")"
  fi
}

ZSH_GIT_PROMPT_SHOW_UPSTREAM="no"

ZSH_THEME_GIT_PROMPT_PREFIX=" %F{yellow}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{yellow}) "
ZSH_THEME_GIT_PROMPT_SEPARATOR="%F{yellow}|"
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[cyan]%}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%F{yellow}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL="%{$fg_bold[yellow]%}⟳ "
ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[red]%}(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX="%{$fg[red]%})"
ZSH_THEME_GIT_PROMPT_BEHIND="↓"
ZSH_THEME_GIT_PROMPT_AHEAD="↑"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✚"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{red}…"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}⚑"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}✔"

PROMPT='
%F{cyan}%n\
%F{240}@\
%F{blue}%m\
%F{240}:\
%F{green}%~\
$(gitprompt)\
%F{240}
› %f\
'

RPROMPT="%F{%(?.240.red)}%D{%-I:%M %p}"
