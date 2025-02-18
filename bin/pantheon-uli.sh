#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'deploy.sh <site-id> <env> where <env> can be: dev/test/live'
    exit 1
fi

SITE=$1
ENV=$2

echo "-------------------------------------------------------------------------"
echo "Generating ULI for $SITE.$ENV ..."
echo "-------------------------------------------------------------------------"
echo

echo "Logging in ..."
terminus auth:login --email=miquel@easytech.com.ar

echo "Generating uli ..."
URL=`terminus drush $SITE.$ENV -- uli`

open $URL
