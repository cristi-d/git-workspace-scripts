#!/bin/bash

# $1 = branch name, $2 = repo dir

cd $2

echo "+ $2"

git pull origin $1

cd ..
