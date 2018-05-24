#!/bin/bash

set -e

./mvnw install --batch-mode --show-version --settings .travis/settings.xml

if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    if [ "$TRAVIS_TAG" != "" ]; then
        ./mvnw site-deploy -P site-deploy --batch-mode --show-version --settings .travis/settings.xml
    fi
fi
