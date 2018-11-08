#!/bin/bash
# Script to initialize git submodules

REPONAME=vac

cd $HOME/$REPONAME

(

git submodule init

git submodule sync

git submodule update

)&

cd $HOME
jupyterhub-singleuser
