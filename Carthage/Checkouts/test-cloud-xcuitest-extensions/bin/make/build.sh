#!/usr/bin/env bash

set -e

if [ ! -z "${VERBOSE}" ]; then
  set -x
fi

if [ "`which xcpretty`" != '' ]; then
  xcodebuild -configuration Release -sdk iphoneos | xcpretty
else
  xcodebuild -configuration Release -sdk iphoneos
fi

