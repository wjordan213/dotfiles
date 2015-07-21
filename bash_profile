[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export PATH=/usr/local/bin:$PATH:$HOME/Applications/Firefox.app/Contents/MacOS
# export FIREFOX_BINARY_PATH=/Applications/Firefox.app/Contents/MacOS/firefox-bin

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export PATH=/usr/local/bin/pip:$PATH

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

export PS1="\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# git aliases
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Add git completion to my custom 'g' alias.
__git_complete gck _git_checkout
__git_complete gm _git_merge
__git_complete gd _git_diff
__git_complete gp _git_push

set editing-mode vi
set keymap vi-command

alias gr='git commit --amend'
alias gs='git status'
alias gd='git diff'
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
alias gfr="git fetch origin master;git rebase origin/master"
alias gpl="git pull"
alias gkb="git checkout -b"
alias gl="git log"
alias gsh="git show"

alias pl="pipenv run lint"
alias pb="pipenv run blacken"
alias pw="pipenv run worker"
alias psc="pipenv run scheduler"

alias da="dnote add"
alias dv="dnote view"

alias ct='ctags -R --exclude=node_modules'
alias vim="mvim -v"
alias pvim="pipenv run mvim -v"

alias psh="pipenv shell"
alias prun="pipenv run"
alias ppython="pipenv run python"
alias pmanage="pipenv run python manage.py"
alias runserver="pipenv run python manage.py runserver"
alias migrate="pipenv run python manage.py migrate"
alias makemigrations="pipenv run python manage.py makemigrations"
alias djc="pipenv run python manage.py shell"
alias ptb="pipenv run pytest --pdb -s"
alias pt="pipenv run pytest"
alias ppt="pipenv run python manage.py test"
alias pps="pipenv run python manage.py shell"
alias runcelery="pipenv run celery -E -A bhs worker -l debug"
alias ctvp="ctags --exclude=*.js -R -f ~/workspace/blink/pot/.git/tags ~/.local/share/virtualenvs/pot-Viq7dMz1/"
alias dn="dnote"
alias emacs="/usr/local/Cellar/emacs/26.1_1/Emacs.app/Contents/MacOS/Emacs -nw"

export EDITOR='vim'

set -o vi

_value_for() {
  local key
  key=$1
  awk -F "=" "/$key/ {print \$2}" | tr -d ' '
}

assume_role () {
  local role mfa args token prompt
  role=$1
  mfa=$2
  args=(
    --role-arn "${role}"
    --role-session-name aws-creds-session
    --duration-seconds "${AWS_SESSION_LENGTH:-900}"
  )

  if [[ -n "$mfa" ]]; then
    prompt="Enter your MFA token for ${role}: "
    if [[ $SHELL == "zsh" ]]; then
      read -r "?${prompt}" token
    else
      read -rp "${prompt}" token
    fi

    args+=(
      --serial-number "${mfa}"
      --token-code "${token}"
    )
  fi

  data=$(aws sts assume-role "${args[@]}")
  if [[ -z "${data}" ]]; then
    >&2 echo "Could not assume the role!"
    exit 2
  fi

  export AWS_ACCESS_KEY_ID=$(echo "$data" | jq -r ".Credentials.AccessKeyId")
  export AWS_SECRET_ACCESS_KEY=$(echo "$data" | jq -r ".Credentials.SecretAccessKey")
  export AWS_SESSION_TOKEN=$(echo "$data" | jq -r ".Credentials.SessionToken")
}

aws-creds() {
  local label profile region
  label="aws.ifyll-${AWS_ENV:-dev}.aws_access_key"
  (
    export AWS_ACCESS_KEY_ID=$(security find-generic-password -l "$label" | grep acct | awk -F'"' '$0=$4');
    export AWS_SECRET_ACCESS_KEY=$(security find-generic-password -l "$label" -w);

    if [[ -n "${AWS_PROFILE}" ]]; then
      profile=$(sed -n -e "/profile $AWS_PROFILE/,/^\s*$/ p" ~/.aws/config)

      if [[ -z "${profile}" ]]; then
        >&2 echo "Could not find the specified profile in ~/.aws/config"
        exit 2
      fi

      region=$(echo "$profile" | _value_for region)

      assume_role "$(echo "$profile" | _value_for role_arn)" "$(echo "$profile" | _value_for mfa_serial)"
      [[ -n "$region" ]] && export AWS_DEFAULT_REGION="$region"
    fi

    "$@";
  )
}
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh" # This loads nvm
export PIP_EXTRA_INDEX_URL="https://harris.jordan:AP6LGtiZPd9ey81hB7mQSU7xBGZccUDHVqLQes@blink.jfrog.io/blink/api/pypi/pypi/simple"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
eval "$(pyenv init -)"
