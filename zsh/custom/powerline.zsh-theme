C_DARKBLUE=31
C_DARKCYAN=74
C_DARKRED=88
C_BRIGHTYELLOW=220
C_MEDIUMORANGE=166

C_GRAY2=236
C_GRAY4=240
C_GRAY9=250
C_WHITE=255

# Get user color
if [ "$(whoami)" = "root" ]
  then USERCOLOR=$C_DARKRED
  else USERCOLOR=$C_DARKBLUE
fi


PL_HARD=
PL_SOFT= 
PL_BRANCH=
PL_SECURE=
PL_VENV=❖

ZSH_THEME_GIT_PROMPT_PREFIX="%K{$C_GRAY2}$PL_HARD %F{$C_GRAY9}$PL_BRANCH "
ZSH_THEME_GIT_PROMPT_SUFFIX=" %F{$C_GRAY2}"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{$C_BRIGHTYELLOW}*%F{$C_GRAY9}"
ZSH_THEME_GIT_PROMPT_CLEAN=""


# Only show hostname when not home
if [ -z "$SSH_CLIENT" ]
then
  PROMPT_HOST=""
  PROMPT_USER="%K{$USERCOLOR}%F{$C_WHITE} %B%n %b%F{$USERCOLOR}"
else
  PROMPT_HOST="%K{$C_MEDIUMORANGE}%F{$C_BRIGHTYELLOW} $PL_SECURE %m %F{$C_MEDIUMORANGE}"
  PROMPT_USER="%K{$USERCOLOR}$PL_HARD %F{$C_WHITE} %B%n %b%F{$USERCOLOR}"
fi


PROMPT_DIR="%K{$C_GRAY4}$PL_HARD %F{$C_GRAY9}%c %F{$C_GRAY4}"

# Get virtual env only when active
VENV=${VIRTUAL_ENV##*/}
if [ ! -z "$VENV" ]
then
  PROMPT_VENV="%K{$C_DARKCYAN}$PL_HARD %F{$C_WHITE}$PL_VENV $VENV %F{$C_DARKCYAN}"
fi

# GIT

PROMPT_GIT="$(git_prompt_info)"

PROMPT_END="%k$PL_HARD %f%k"
PROMPT="%f%k$PROMPT_HOST$PROMPT_USER$PROMPT_VENV$PROMPT_DIR$PROMPT_GIT$PROMPT_END"

#RPROMPT=$PL_COLOR_FG_WHITE$'\u2b82'"%f$PL_COLOR_BG_WHITE $PL_COLOR_FG_GRAY%D{%H:%M:%S} "

