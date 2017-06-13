#!/usr/bin/env bash

set -e

if [ "`which pod`" = "" ]; then
  echo "Please install cocoapods and re-run"
  echo "\t gem install cocoapods"
  exit 1
fi

pod lib lint --verbose
