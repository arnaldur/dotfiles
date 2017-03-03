# ~/.bash_profile

[[ -s ~/.bashrc ]] && source ~/.bashrc

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias ls='ls -GFh'
alias ll='ls -l'

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

function username {
  if [ "$(whoami)" = "arnaldurhilmisson" ]; then echo "👻"
    else echo "$(whoami)"
  fi
}

function auto_virtualenv {
    local current_pwd="$(pwd -P)"
    if [ -n "$VENV_ROOT" ] && [[ $current_pwd != *"$VENV_ROOT"* ]]; then
	local env=$(basename $VENV_ROOT)	
        echo "Deactivating virtualenv $env"
	unset "VENV_ROOT"
	deactivate
	prompt
    fi

    if [ -e ".venv" ]; then
        # Check to see if already activated to avoid redundant activating
        if [ "$VIRTUAL_ENV" != "$current_pwd/.venv" ]; then
            local base_name=$(basename $current_pwd)
            echo "Activating virtualenv $base_name".
            VIRTUAL_ENV_DISABLE_PROMPT=1
            source .venv/bin/activate
            export "VENV_ROOT=$current_pwd"
            prompt "($base_name) "
	    echo -ne "\033]0;"$base_name"\007"	 
        fi
    fi
}

# This function is to create the prompt
function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  local RESETCOLOR="\[\e[00m\]"


  export PS1="$WHITEBOLD $1$RED$(username) $PURPLE@ $GREEN\w$RESETCOLOR$GREEN → $RESETCOLOR"
  export PS2=" | → $RESETCOLOR"
}

PROMPT_COMMAND="node /usr/local/lib/node_modules/git-aware-terminal/bin/gat.js; auto_virtualenv"

# Activate the prompt this is only run once, during the loading of the shell
prompt
