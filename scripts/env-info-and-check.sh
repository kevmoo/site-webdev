#!/usr/bin/env bash

set -e -o pipefail

[[ -z "$NGIO_ENV_DEFS" ]] && . ./scripts/env-set.sh

travis_fold start env_info
echo ENVIRONMENT INFO
travis_fold start env_info.path
echo Path:
echo $PATH | tr : '\n'
echo
travis_fold end env_info.path
travis_fold start env_info.home
echo Home: $HOME
ls -la ~
echo 
travis_fold end env_info.home
travis_fold start env_info.pwd
echo Pwd: `pwd`
ls -la
echo
echo ENVIRONMENT CONFIG CHECK:
if [[ -z "$NGIO_ENV_DEFS" ]]; then
    echo Environment variables are not being set. Aborting.
    exit 1;
else
    echo Environment variables successfully set.
fi
