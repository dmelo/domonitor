#!/bin/bash

PATH=`pwd`/helpers:$PATH

for FILE in `ls services`
do
    source ./services/$FILE
    echo -n "$DOMONITOR_SERVICE_NANE "
    if [ 0 -eq $DOMONITOR_SERVICE_RETURN_CODE ]
    then
        echo -en "\E[33;32m\033[1mOK\033[0m"
    else
        if [ 1 -eq $DOMONITOR_SERVICE_RETURN_CODE ]
        then
            echo -en "\E[33;33m\033[1m$DOMONITOR_SERVICE_RETURN_MESSAGE\033[0m"
        else
            echo -en "\E[33;31m\033[1m$DOMONITOR_SERVICE_RETURN_MESSAGE\033[0m"
        fi
    fi
    echo
done
