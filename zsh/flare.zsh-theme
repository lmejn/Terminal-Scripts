# ZSH Theme - Preview: https://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m %{$reset_color%}'
    local user_symbol='x'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n@%m %{$reset_color%}'
    local user_symbol='>'
fi

conda_env () {
  if [ -z ${CONDA_DEFAULT_ENV+x} ] 
  then 
  else
	echo "using %{$fg[magenta]%}$CONDA_DEFAULT_ENV %{$reset_color%}"
  fi
}

local current_dir='%{$terminfo[bold]$fg[blue]%}%~ %{$reset_color%}'
local git_branch='$(git_prompt_info)'
#local rvm_ruby='$(ruby_prompt_info)'
#local venv_prompt='$(virtualenv_prompt_info)'
local conda_prompt='$(conda_env)'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

PROMPT="WSL ${current_dir}${conda_prompt}${git_branch}
%B${user_symbol}%b "
RPROMPT="%B${return_code}%b"

#${rvm_ruby}${venv_prompt}

ZSH_THEME_GIT_PROMPT_PREFIX="on %{$terminfo[bold]$fg[yellow]%}\UE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}$fg[red]*"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
