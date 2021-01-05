# RVM settings
if [[ -s ~/.rvm/scripts/rvm ]] ; then 
  RPS1="%{$fg[yellow]%}rvm:%{$reset_color%}%{$fg[red]%}\$(~/.rvm/bin/rvm-prompt)%{$reset_color%} $EPS1"
else
  if which rbenv &> /dev/null; then
    RPS1="%{$fg[yellow]%}rbenv:%{$reset_color%}%{$fg[red]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$reset_color%} $EPS1"
  fi
fi

PREFIX=""
SUFFIX=" "

END="%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}$PREFIX"
ZSH_THEME_GIT_PROMPT_SUFFIX="$fg[green]%}$SUFFIX%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# Conda environment
#conda_env() {
#  if [ $CONDA_DEFAULT_ENV == "" ]; then
#    if [ $CONDA_DEFAULT_ENV != base  ]
#    then
#        echo "$PREFIX$CONDA_DEFAULT_ENV$SUFFIX"
#    fi
#  fi
#}

conda_env () {
  if [ -z ${CONDA_DEFAULT_ENV+x} ] 
  then 
  else
    #if [ $CONDA_DEFAULT_ENV != base  ]
    #then
        echo "$PREFIX$CONDA_DEFAULT_ENV$SUFFIX"
    #fi
  fi
}

# Hostname
get_hostname() {
  #echo "$PREFIX$(hostname)$SUFFIX"
  echo "$PREFIX wsl$SUFFIX"

}

PROMPT=''
PROMPT=$PROMPT'%{$fg[yellow]%}$(get_hostname)'
#PROMPT=$PROMPT'%{$fg[cyan]%}$PREFIX%~% $SUFFIX'
PROMPT=$PROMPT'%{$fg[cyan]%}$PREFIX%(5~|.../%2~|%~)$SUFFIX'
PROMPT=$PROMPT'%{$fg[magenta]%}$(conda_env)'
PROMPT=$PROMPT'%{$reset_color%}$(git_custom_status)'
PROMPT=$PROMPT$END
