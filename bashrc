export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
alias gs='git status'

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

export LDFLAGS="-I/usr/local/opt/openssl/include -L/usr/local/opt/openssl/lib"
