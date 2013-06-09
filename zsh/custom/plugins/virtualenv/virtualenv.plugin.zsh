function virtualenv_prompt_info(){
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path ]]; then
    local virtualenv_name=`basename $virtualenv_path`
    printf "${ZSH_THEME_VIRTUALENV_PROMPT_PREFIX//\%/%%}$virtualenv_name${ZSH_THEME_VIRTUALENV_PROMPT_SUFFIX//\%/%%}"
  fi
}

