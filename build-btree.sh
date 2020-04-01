#!/bin/bash
set -e
set -x

cd ~/Repos/daos

scons --build-deps=yes install

echo "success"
cd -

echo "I'm back"
