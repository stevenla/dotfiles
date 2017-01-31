# Aether zsh prompt
# Steven La (stevenla.com)

function colorize {
  # colorize red hello
  # colorize red hello no-suffix
  echo -n "%F{$1}$2"
  [[ -z $3 ]] && echo -n "%{$reset_color%}"
}

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
    colorize yellow ")"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=$(colorize yellow " (" no-suffix)
ZSH_THEME_GIT_PROMPT_SUFFIX=$(colorize yellow ")")
ZSH_THEME_GIT_PROMPT_DIRTY=$(colorize red "•")
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='
$(colorize cyan "%n")\
$(colorize 240 "@")\
$(colorize blue "%m")\
$(colorize 240 ":")\
$(colorize green "%~")\
$(git_prompt_info)\
$(current_hg_bm)\
$(colorize 240 "\n› ")\
'

RPROMPT=$(colorize "%(?.240.red)" "%D{%-I:%M %p}")
