#!/bin/bash

# Expects 
#   $1 = branch name
#   $2 = project directory

cd $2

echo "+ $2"
git checkout $1
echo ""

cd ..
