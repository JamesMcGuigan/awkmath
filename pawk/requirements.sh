#!/usr/bin/env bash
set -x
cd $(readlink -f $(dirname $BASH_SOURCE[0]));

for OS in UNIX WINDOWS; do
    if [[ $OS == 'UNIX' ]]; then
        PYTHON3=`which python3`
        PIP3=`   which pip3`
        VENV=venv
        VENV_BIN=./$VENV/bin
        VENV_ACTIVATE=./$VENV/bin/activate
    fi;
    if [[ $OS == 'WINDOWS' ]]; then
        PYTHON3=`find /c/Users/$USER/AppData/Local/Programs/Python/Python3* -name 'python.exe' | sort -nr | head -n 1`
        PIP3=`   find /c/Users/$USER/AppData/Local/Programs/Python/Python3* -name 'pip.exe'    | sort -nr | head -n 1`
        VENV=venv_windows
        VENV_BIN=./$VENV/Scripts
        VENV_ACTIVATE=./$VENV/Scripts/activate
    fi

    # Install venv and dependencies
    if [[ ! -d ./$VENV/ ]]; then
        $PYTHON3 -m venv ./$VENV/;

        if [[ $OS == 'WINDOWS' ]]; then
            dos2unix $VENV_ACTIVATE
            perl -p -i -e "s/\"(C:.*)\"/'\$1'/g"       $VENV_ACTIVATE  # BUGFIX: syntax error near unexpected token `(' if [ "x(venv) " != x ] ; then'
        fi
        echo "export PATH=\$PATH:$VENV_BIN"                                      >> $VENV_ACTIVATE
        echo 'export PYTHONSTARTUP=./.pythonstartup.py'                          >> $VENV_ACTIVATE
        echo "PS1=\"($VENV) \$(echo \$PS1 | perl -p -e 's/^(\s*\(.*?\))+//g')\"" >> $VENV_ACTIVATE  # BUGFIX: $PS1 prompt
    fi;

    # Use pip and python from inside the virtualenv
    source $VENV_ACTIVATE
    pip install --upgrade pip
    pip install -r requirements.txt;
    pip-compile
    pip-sync
done
