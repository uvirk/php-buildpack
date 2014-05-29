#!/bin/sh

buildpack_absolute="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd )"

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


