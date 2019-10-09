#!/bin/bash -e

APP_PATH=bin/Exponent.app

if [ -d $APP_PATH ]
then
	echo "$APP_PATH found. Skipping download"
else
	echo "$APP_PATH not found. Downloading app."
  # query expo.io to find most recent ipaUrl
  IPA_URL=`curl https://expo.io/--/api/v2/versions |  python -c 'import sys, json; print json.load(sys.stdin)["iosUrl"]'`

  # download tar.gz
  TMP_PATH=/tmp/exponent.tar.gz
  curl -o $TMP_PATH $IPA_URL

  # recursively make app dir
  mkdir -p $APP_PATH

  # unzip tar.gz into APP_PATH
  tar -C $APP_PATH -xzf $TMP_PATH

fi