#!/bin/sh

export buildpack=$(dirname $(dirname $0))
buildpack_absolute="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd )"

install_python() {
    cache=$(cd "$1/" && pwd)
    export PYTHONHOME=$cache/python
    export PATH=$PYTHONHOME/bin:$PATH

    if test -d $PYTHONHOME
    then
        echo "-----> Python 2.7.6 already installed"
    else
        echo -n "-----> Installing Python 2.7.6..."
        $buildpack/builds/runtimes/python-2.7.6 $PYTHONHOME > /dev/null 2>&1
        mv $PYTHONHOME/bin/python2.7 $PYTHONHOME/bin/python
        echo "done"
    fi
}

can_connect() {
    curl_exit_code=$(`which curl` --connect-timeout 5 $1 &> /dev/null; echo $?)
    if [[ $curl_exit_code -eq 0 ]]
    then
        return 0
    fi

    return 1
}

if test -d $buildpack_absolute/dependencies
then
    notice_inline 'Use locally cached dependencies where possible'

    curl() {
        name=$(echo $@ | rev | cut -d/ -f1 | rev)

        if test -f $buildpack_absolute/dependencies/$name; then
            cat $buildpack_absolute/dependencies/$name
        else
            `which curl` $@
        fi
    }
fi


