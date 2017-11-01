#!/bin/bash

cd $1

echo "+ $1"
git branch -l | grep \*
echo ""

cd ..
