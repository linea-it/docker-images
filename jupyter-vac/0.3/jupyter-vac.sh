#!/bin/bash
# Script to initialize git submodules

if [ -n "${REPO_NAME}" ]; then
    cd $HOME/$REPO_NAME

    (

    git submodule init

    git submodule sync

    git submodule update

    )&

fi

cd $HOME
jupyterhub-singleuser
