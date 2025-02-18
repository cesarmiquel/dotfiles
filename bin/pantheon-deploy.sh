#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'deploy.sh <site-id> <env> where <env> can be: dev/test/live'
    exit 1
fi

SITE=$1
ENV=$2

echo "-------------------------------------------------------------------------"
echo "Deploying code to $SITE.$ENV ..."
echo "-------------------------------------------------------------------------"
echo

echo "Logging in ..."
terminus auth:login --email=miquel@easytech.com.ar

echo "Running updates ..."
terminus drush $SITE.$ENV -- updb -y

echo "Importing configuration ..."
terminus drush $SITE.$ENV -- cim

echo "Clearing Drupal cache ..."
terminus drush $SITE.$ENV cr

echo "Clearing Varnish cache for site ..."
terminus env:clear-cache $SITE.$ENV

