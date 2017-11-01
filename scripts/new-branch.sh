#!/bin/bash

# Expects 
#   $1 = branch name
#   $2 = project directory

cd $2

echo "+ $2"
git checkout -b $1
echo ""

cd ..
