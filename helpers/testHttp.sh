#!/bin/bash

# Usage:
#   testHttp.sh http://test.com
#
# Will test the http response correctness. If something is wrong with the 
# respose headers then it will fill the DOMONITOR_SERVICE_RETURN_CODE and 
# DOMONITOR_SERVICE_RETURN_MESSAGE variables and exit 2. Otherwise it will 
# just return 0 and let this two variables untouched.

FILE=/tmp/testHttp-`rand`

curl -s --head $1 > $FILE
grep "HTTP/1.1 200 OK" $FILE >& /dev/null
RESP=$?
rm $FILE
if [ 0 -ne $RESP ]
then
    DOMONITOR_SERVICE_RETURN_MESSAGE="Error on http resquest `head -n 1 ${FILE}`"
    DOMONITOR_SERVICE_RETURN_CODE="2"
    exit 2
fi
