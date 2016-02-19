#!/bin/bash

set -e

if [[ -z "$1" ]]; then
    echo "Missing Ceylon version argument"
    exit
fi

if [[ -f /output/.novolume ]]; then
    echo "Missing -v /your/output/path:/output argument to docker, output will be lost!"
    sleep 3
fi

if [[ -f /home/ceylon/.gnupg/.novolume ]]; then
    echo "WARING: Missing -v /your/gnupg/path:/gnupg argument to docker, packages won't be signed!"
    sleep 3
fi

CEYLON_VERSION=$1
wget https://github.com/ceylon/ceylon-debian-repo/archive/${CEYLON_VERSION}.zip
unzip ${CEYLON_VERSION}.zip
cd /output
/home/ceylon/ceylon-debian-repo-${CEYLON_VERSION}/repo/build.sh

