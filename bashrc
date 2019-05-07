export NVM_DIR="/Users/williamjordan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
alias ctags='/usr/local/bin/ctags'
set editing-mode vi
set keymap vi-command

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
alias gs='git status'
alias gcm='git commit -m '

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

alias ee="echo 'the things'"

# Added by `blink setup profile` 2019-04-18T15:22:32
# See https://github.com/blinkhealth/blink-cli for more info
source "${HOME}/.blink-profile"
