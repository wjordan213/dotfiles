export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH="/usr/local/opt/ruby/bin:$PATH"

export PATH=/usr/local/bin/pip:$PATH

export PATH=/usr/local/bin:$PATH:$HOME/Applications/Firefox.app/Contents/MacOS

export PATH=~/scripts:$PATH


export TF_PRECOMMIT_HOOK_WRITE=true

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

export PS1="\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# git aliases
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

alias gs='git status'

# Add git completion to my custom 'g' alias.
__git_complete gck _git_checkout
__git_complete gm _git_merge
__git_complete gd _git_diff
__git_complete gp _git_push

set editing-mode vi
set keymap vi-command

alias gca='git commit --amend'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdn='git diff origin/master --name-only'
alias gcm='git commit -m'
alias gck='git checkout'
alias gm='git merge'
alias gb='git branch'
alias ga='git add'
alias gp='git push'
alias gps='git push --set-upstream origin'
alias gst="git stash"
alias gsp="git stash pop"
alias gsl="git stash list"
alias gfr="dmypy kill;git fetch origin master;git rebase origin/master"
alias gpl="git pull"
alias gkb="git checkout -b"
alias gl="git log --color=always | less -r"
alias gsh="git show"
alias grc="git rebase --continue"
alias gdl="git diff --color=always | less -r"
alias grb="git rebase"
alias gr="git reset"
alias grs="git reset --soft"
alias gcvm="git commit --no-verify -m "

alias pl="pipenv run lint"
alias pb="pipenv run blacken"
alias pw="pipenv run worker"
alias psc="pipenv run scheduler"

alias da="dnote add"
alias dv="dnote view"

alias ct='ctags -R --exclude=node_modules'
alias vim="/usr/local/opt/vim/bin/vim"
alias pvim="pipenv run vim"

alias psh="pipenv shell"
alias prun="pipenv run"
alias ppython="pipenv run python"
alias pmanage="pipenv run python manage.py"
alias runserver="pipenv run python manage.py runserver"
alias makemigrations="pipenv run python manage.py makemigrations"
alias djc="pipenv run python manage.py shell"
alias ptb="pipenv run pytest --pdb -s"
alias pt="pipenv run pytest"
alias ppt="pipenv run python manage.py test"
alias pps="pipenv run python manage.py shell"
alias runcelery="pipenv run celery -E -A bhs worker -l debug"
alias dn="dnote"
alias emacs="/usr/local/Cellar/emacs/26.1_1/Emacs.app/Contents/MacOS/Emacs -nw"
alias gtcfg="cd ~/dotfiles"
alias dup="docker-compose up -d"

export EDITOR='vim'

set -o vi

export NVM_DIR="$HOME/.nvm"
source ~/.nvm/nvm.sh
export PATH
eval "$(pyenv init -)"
export PATH="/Applications/Postgres.app/Contents/Versions/9.5/bin:$PATH"
echo "HELLOOOOO"

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
# export FZF_DEFAULT_OPTS='--extended'
export COMPOSE_HTTP_TIMEOUT=120

function setup_venv_activate() {
    echo 'sup dude'
    if [[ -n $VIRTUAL_ENV ]]; then
        if [[  ! -e "${VIRTUAL_ENV}/bin/activate_this.py" ]]; then
            echo "Writing \"activate_this.py\" script"
            echo "$(curl -s https://raw.githubusercontent.com/pypa/virtualenv/master/virtualenv_embedded/activate_this.py)" \
                >> "${VIRTUAL_ENV}/bin/activate_this.py"
            echo "Finished"
        else
            echo "Virtual environment already has a \"activate_this.py\" script"
        fi
    else
        echo "You must be in a virtual environment to use \"setup_venv_activate\""
    fi
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export LDFLAGS="-I/usr/local/opt/openssl/include -L/usr/local/opt/openssl/lib"
alias ctags="`brew --prefix`/bin/ctags"


export OP_HOME="${OP_HOME:-$HOME/.op}"
export OP_SESSION_FILE="${OP_HOME}/session-token"
function op_auth_aptible
{
    local -r item_name="$1"
    local -r username="$(op get item "$item_name" --fields username)"
    local -r password="$(op get item "$item_name" --fields password)"
    local -r otp_token="$(op get totp "$item_name")"

    aptible login --email="$username" --password="$password" --otp-token="$otp_token" --lifetime=24h
}

function op_auth_aws
{
    local -r item_name="$1"
    local -r username="$(op get item "$item_name" --fields username)"
    local -r mfa_token="$(op get totp "$item_name")"

    cd "$HOME/workspace/trialSpark/spark"

    pipenv run python ./scripts/get_aws_session_credentials.py --user "$username" --mfa "$mfa_token"
    cd -
}

function op
{
    local -a op_flags=("--cache" "--session" "$(cat "$OP_SESSION_FILE")")
    local -r command="$1"
    case "$command" in
        "auth")
            local -r target="$2"
            case "$target" in
                "aptible")  op_auth_aptible "Aptible" ;;
                "aws") op_auth_aws "AWS" ;;
            esac
            ;;
        "signin")
            shift
            local -r token="$(command op ${op_flags[*]} signin "$@" --raw)"
            echo "${token:-INVALID_SESSION}" > "$OP_HOME/session-token"
            ;;
        *)
            command op ${op_flags[*]} $@
            ;;
    esac
}

export PYTHONPATH=.

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Avoid duplicates
HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
