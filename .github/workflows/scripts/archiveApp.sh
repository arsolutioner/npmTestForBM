#!/bin/bash

set -eo pipefail

xcodebuild -workspace AppsFlyerExample.xcworkspace \
            -scheme AppsFlyerExample \
            -sdk iphoneos \
            -archivePath $PWD/build/AppsFlyerExample.xcarchive \
            clean archive | xcpretty