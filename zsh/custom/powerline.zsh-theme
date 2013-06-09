# Colors yanked from powerline
local C_DARKBLUE=31
local C_DARKCYAN=74
local C_DARKRED=88
local C_BRIGHTYELLOW=220
local C_MEDIUMORANGE=166
local C_GRAY2=236
local C_GRAY4=240
local C_GRAY9=250
local C_WHITE=255

# Get user color
if [ "$(whoami)" = "root" ]
  then local USERCOLOR=$C_DARKRED
  else local USERCOLOR=$C_DARKBLUE
fi

# Constant special characters
local PL_HARD=
local PL_SOFT= 
local PL_BRANCH=
local PL_SECURE=
local PL_VENV=❖

# Set up git prompt
ZSH_THEME_GIT_PROMPT_PREFIX="%K{$C_GRAY2}$PL_HARD %F{$C_GRAY9}$PL_BRANCH "
ZSH_THEME_GIT_PROMPT_SUFFIX=" %F{$C_GRAY2}"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{$C_BRIGHTYELLOW}*%F{$C_GRAY9}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Set up virtualenv prompt
ZSH_THEME_VIRTUALENV_PROMPT_PREFIX="%K{$C_DARKCYAN}$PL_HARD %F{$C_WHITE}$PL_VENV "
ZSH_THEME_VIRTUALENV_PROMPT_SUFFIX=" %F{$C_DARKCYAN}"

# Only show hostname when not home
if [ -z "$SSH_CLIENT" ]
then
  local PROMPT_HOST=""
  local PROMPT_USER="%K{$USERCOLOR}%F{$C_WHITE} %B%n %b%F{$USERCOLOR}"
else
  local PROMPT_HOST="%K{$C_MEDIUMORANGE}%F{$C_BRIGHTYELLOW} $PL_SECURE %m %F{$C_MEDIUMORANGE}"
  local PROMPT_USER="%K{$USERCOLOR}$PL_HARD%F{$C_WHITE} %B%n %b%F{$USERCOLOR}"
fi

local PROMPT_DIR="%K{$C_GRAY4}$PL_HARD %F{$C_GRAY9}%c %F{$C_GRAY4}"

local PROMPT_END="%k$PL_HARD %f%k"

PROMPT='$PROMPT_HOST$PROMPT_USER$(virtualenv_prompt_info)$PROMPT_DIR$(git_prompt_info)$PROMPT_END'

