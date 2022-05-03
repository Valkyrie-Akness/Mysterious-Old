#!/bin/bash -e
cd src || ( echo "Directory src not found" && exit 1)
git reset --hard HEAD || ( echo "git reset error" && exit 1)
git checkout dev
git pull
sed -i 's/git@github.com:/https:\/\/github.com\//' .gitmodules
git submodule sync
git submodule update --init --recursive
./gradlew -Dorg.gradle.daemon=false build || ( echo -e "\033[31mBuild failed. Stopping\033[m" && exit 100 )
cd ../srcRuntime
git stash
git pull
./gradlew -Dorg.gradle.daemon=false build || ( echo -e "\033[31mBuild failed. Stopping\033[m" && exit 100 )
git stash apply
cd ..
